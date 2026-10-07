-- =====================================================================
-- 演示数据：把「商户 → 门店 → 员工 → 会员」这条链路在四个行业库里全部串起来
-- ---------------------------------------------------------------------
-- 关联骨架（后台的 商户信息 / 门店管理 / 员工管理 三个菜单就是这四张表）：
--
--   mt_merchant (商户)  ID=1
--        │ 1:N   mt_store.MERCHANT_ID
--        ▼
--   mt_store    (门店)  ID=1（IS_DEFAULT=Y 即演示总店）
--        │ 1:N   mt_staff.STORE_ID
--        ▼
--   mt_staff    (员工)  MERCHANT_ID + STORE_ID + USER_ID + CATEGORY
--        │              CATEGORY: 1店长 2收银 3销售 4服务
--        │ USER_ID
--        ▼
--   mt_user     (会员)  USER_NO / MOBILE / is_staff='Y'
--
--   t_account   (后台登录账号) merchant_id + store_id + staff_id
--
-- 断链原因：演示数据是 SQL 直接灌进去的，没走 StaffServiceImpl.saveStaff，
--   所以 mt_staff.USER_ID 全是 0（员工 ↔ 会员断），
--   t_account.staff_id / store_id 也是 0（账号 ↔ 员工/门店断）。
-- 本脚本按「员工手机号」这一个关键字，把会员账号补出来并回填 USER_ID，
-- 让后台三个列表都能看到完整的关联关系。
--
-- 适用范围：四个行业库结构一致，均可执行
--   bahar-db(零售 8081) / bahar-car(汽车 8082)
--   bahar-catering(餐饮 8083) / bahar-health(康养 8084)
-- 执行方式：
--   mysql -uroot -p bahar-catering < bahar-demo-staff-link.sql
--
-- 幂等：可反复执行，不会重复插入、不会覆盖已绑定关系。
-- =====================================================================

-- ---------------------------------------------------------------------
-- 1) 给「还没绑会员」的员工补一个会员账号
--    关键字 = 员工手机号（与 saveStaff 自动注册会员的逻辑一致：用户名即手机号）
--    密码沿用演示会员统一口令；会员号用 U9 + 员工ID（U9000001…），一眼能认出是员工
-- ---------------------------------------------------------------------
INSERT INTO mt_user
    (MOBILE, NAME, USER_NO, MERCHANT_ID, STORE_ID, GRADE_ID,
     PASSWORD, SALT, BALANCE, POINT, SEX, STATUS,
     CREATE_TIME, UPDATE_TIME, DESCRIPTION, is_staff, OPERATOR)
SELECT x.MOBILE,
       x.REAL_NAME,
       CONCAT('U9', LPAD(x.staff_id, 6, '0')),
       x.MERCHANT_ID,
       x.STORE_ID,
       1,                                   -- 1：普通会员
       'sZbejahexJx8f1vB9Z/YiQ==',         -- 与现有演示会员同一口令
       'a1b2',
       0, 0, 1, 'A',
       NOW(), NOW(),
       CONCAT('演示数据：员工 ', x.REAL_NAME, ' 关联的会员账号'),
       'Y',
       'bahar'
  FROM (
        SELECT s.ID AS staff_id, s.MOBILE, s.REAL_NAME, s.MERCHANT_ID, s.STORE_ID
          FROM mt_staff s
         WHERE (s.USER_ID IS NULL OR s.USER_ID = 0)
           AND s.AUDITED_STATUS <> 'D'
           AND NOT EXISTS (SELECT 1 FROM mt_user u WHERE u.MOBILE = s.MOBILE)
       ) x;

-- ---------------------------------------------------------------------
-- 2) 回填员工 → 会员（按手机号匹配；已绑定的不动）
-- ---------------------------------------------------------------------
UPDATE mt_staff s
  JOIN mt_user u ON u.MOBILE = s.MOBILE
   SET s.USER_ID      = u.ID,
       s.UPDATE_TIME  = NOW()
 WHERE (s.USER_ID IS NULL OR s.USER_ID = 0)
   AND s.AUDITED_STATUS <> 'D';

-- ---------------------------------------------------------------------
-- 3) 会员侧回写：标记为员工，并归属到员工所属的商户 / 门店
--    （is_staff='Y' 会让该会员下单不再享受会员折扣与积分，属预期业务规则）
-- ---------------------------------------------------------------------
UPDATE mt_user u
  JOIN mt_staff s ON s.USER_ID = u.ID
   SET u.is_staff     = 'Y',
       u.MERCHANT_ID  = s.MERCHANT_ID,
       u.STORE_ID     = s.STORE_ID,
       u.UPDATE_TIME  = NOW()
 WHERE s.AUDITED_STATUS <> 'D';

-- ---------------------------------------------------------------------
-- 4) 账号侧：给每名员工开一个后台/商户端登录账号，并绑到 merchant/store/staff
--    口令沿用演示账号统一口令（与 t_account 现有演示账号一致）
-- ---------------------------------------------------------------------
INSERT INTO t_account
    (account_key, account_name, password, account_status, is_active,
     create_date, modify_date, salt, role_ids, locked, owner_id,
     real_name, merchant_id, store_id, staff_id)
SELECT CONCAT('demo-key-staff-', x.staff_id),
       CONCAT('staff', x.staff_id),
       'b380f7a1afe140f323a3528a0fd709c65e65e2a1',
       1, 1, NOW(), NOW(),
       '1a2b3c4d5e6f7a8b',
       '1', 0, 1,
       x.REAL_NAME,
       x.MERCHANT_ID,
       x.STORE_ID,
       x.staff_id
  FROM (
        SELECT s.ID AS staff_id, s.REAL_NAME, s.MERCHANT_ID, s.STORE_ID
          FROM mt_staff s
         WHERE s.AUDITED_STATUS <> 'D'
           AND NOT EXISTS (SELECT 1 FROM t_account a WHERE a.staff_id = s.ID)
       ) x;

-- ---------------------------------------------------------------------
-- 5) 校验：每条员工都应能 join 出「门店 + 商户 + 会员 + 账号」
--    关联会员列显示「未绑定」的行数应为 0
-- ---------------------------------------------------------------------
SELECT st.ID            AS staff_id,
       st.REAL_NAME     AS staff_name,
       st.CATEGORY      AS category,
       st.USER_ID       AS user_id,
       u.USER_NO        AS user_no,
       u.NAME           AS user_name,
       u.is_staff       AS is_staff,
       s.ID             AS store_id,
       s.NAME           AS store_name,
       m.ID             AS merchant_id,
       m.NAME           AS merchant_name,
       a.acct_id        AS acct_id,
       a.account_name   AS acct_name
  FROM mt_staff st
  LEFT JOIN mt_user    u  ON u.ID           = st.USER_ID
  LEFT JOIN mt_store   s  ON s.ID           = st.STORE_ID
  LEFT JOIN mt_merchant m ON m.ID           = st.MERCHANT_ID
  LEFT JOIN t_account  a  ON a.staff_id     = st.ID
 WHERE st.AUDITED_STATUS <> 'D'
 ORDER BY st.ID;

-- ---------------------------------------------------------------------
-- 回滚（如需撤销本脚本的改动，取消注释执行）
-- ---------------------------------------------------------------------
-- DELETE FROM t_account WHERE account_key LIKE 'demo-key-staff-%';
-- UPDATE mt_user u JOIN mt_staff s ON s.USER_ID = u.ID
--    SET u.is_staff = 'N' WHERE u.USER_NO LIKE 'U9%';
-- DELETE FROM mt_user WHERE USER_NO LIKE 'U9%';
-- UPDATE mt_staff SET USER_ID = 0 WHERE USER_ID IN (SELECT ID FROM mt_user WHERE USER_NO LIKE 'U9%');
