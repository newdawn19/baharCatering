-- =====================================================================
-- 演示数据：把会员 U00000001（张伟）串联为「演示商户 / 演示门店」的员工
-- ---------------------------------------------------------------------
-- 四张表的关系（这是门店管理 / 员工管理 / 商户信息的关联骨架）：
--
--   mt_merchant (商户)  ID=1
--        │ 1:N   mt_store.MERCHANT_ID
--        ▼
--   mt_store    (门店)  ID=1 (IS_DEFAULT=Y 即演示总店)
--        │ 1:N   mt_staff.STORE_ID
--        ▼
--   mt_staff    (员工)  MERCHANT_ID + STORE_ID + USER_ID + CATEGORY
--        │              CATEGORY: 1店长 2收银人员 3销售人员 4服务人员
--        ▼ USER_ID
--   mt_user     (会员)  ID=1 / U00000001 / 张伟  → is_staff = 'Y'
--
--   t_account   (后台登录账号) merchant_id + store_id + staff_id
--
-- 原来演示数据里 mt_staff 六条记录的 USER_ID 全是 0（SQL 直接灌的，没走
-- StaffServiceImpl.saveStaff），所以「员工 ↔ 会员」这一环是断的；
-- t_account 的 staff_id / store_id 也都是 0，「账号 ↔ 员工/门店」同样断。
-- 本脚本把张伟这条链路补完整。
--
-- 适用范围：四个行业库结构一致，均可执行
--   bahar-catering(餐饮 8083) / bahar-db(零售 8081)
--   bahar-car(汽车 8082) / bahar-health(康养 8084)
-- 执行方式：
--   mysql -uroot -p bahar-catering < bahar-demo-staff-link.sql
--
-- 幂等：可重复执行，不会重复插入。
-- =====================================================================

-- ---------------------------------------------------------------------
-- 1) 会员侧：张伟标记为员工，并归属到演示商户 / 演示总店
--    （is_staff='Y' 会让该会员下单不再享受会员折扣与积分，属预期行为）
-- ---------------------------------------------------------------------
UPDATE mt_user u
   SET u.is_staff    = 'Y',
       u.merchant_id = (SELECT m.ID FROM mt_merchant m WHERE m.ID = 1),
       u.store_id    = (SELECT s.ID FROM mt_store s WHERE s.IS_DEFAULT = 'Y' ORDER BY s.ID LIMIT 1),
       u.update_time = NOW()
 WHERE u.user_no = 'U00000001';

-- ---------------------------------------------------------------------
-- 2) 员工侧：新增一条员工记录，把张伟挂到演示商户 + 演示总店，类别=店长
-- ---------------------------------------------------------------------
INSERT INTO mt_staff
    (MERCHANT_ID, STORE_ID, USER_ID, CATEGORY, MOBILE, REAL_NAME, WECHAT,
     CREATE_TIME, UPDATE_TIME, AUDITED_STATUS, AUDITED_TIME, DESCRIPTION)
SELECT s.MERCHANT_ID,
       s.ID,
       u.ID,
       1,                       -- 1：店长
       u.MOBILE,
       u.NAME,
       NULL,
       NOW(), NOW(), 'A', NOW(),
       '演示数据：会员 U00000001 张伟，演示总店店长'
  FROM mt_user u
  JOIN mt_store s ON s.IS_DEFAULT = 'Y'
 WHERE u.USER_NO = 'U00000001'
   AND NOT EXISTS (SELECT 1 FROM mt_staff x WHERE x.USER_ID = u.ID);

-- 已存在则刷新（保证商户/门店/类别/审核状态正确）
UPDATE mt_staff st
  JOIN mt_user  u ON u.ID = st.USER_ID
  JOIN mt_store s ON s.IS_DEFAULT = 'Y'
   SET st.MERCHANT_ID    = s.MERCHANT_ID,
       st.STORE_ID       = s.ID,
       st.CATEGORY       = 1,
       st.MOBILE         = u.MOBILE,
       st.REAL_NAME      = u.NAME,
       st.AUDITED_STATUS = 'A',
       st.AUDITED_TIME   = NOW(),
       st.UPDATE_TIME    = NOW(),
       st.DESCRIPTION    = '演示数据：会员 U00000001 张伟，演示总店店长'
 WHERE u.USER_NO = 'U00000001'
   AND st.AUDITED_STATUS <> 'D';

-- ---------------------------------------------------------------------
-- 3) 账号侧：给张伟开一个后台/商户端登录账号，并绑到 merchant/store/staff
--    密码沿用演示账号统一的初始口令（与 t_account 现有演示账号一致）
-- ---------------------------------------------------------------------
INSERT INTO t_account
    (account_key, account_name, password, account_status, is_active,
     create_date, modify_date, salt, role_ids, locked, owner_id,
     real_name, merchant_id, store_id, staff_id)
SELECT CONCAT('demo-key-zhw-', st.ID),
       'zhangwei',
       'b380f7a1afe140f323a3528a0fd709c65e65e2a1',
       1, 1, NOW(), NOW(),
       '1a2b3c4d5e6f7a8b',
       '1', 0, 1,
       u.NAME,
       st.MERCHANT_ID,
       st.STORE_ID,
       st.ID
  FROM mt_user  u
  JOIN mt_staff st ON st.USER_ID = u.ID
 WHERE u.USER_NO = 'U00000001'
   AND NOT EXISTS (SELECT 1 FROM t_account a WHERE a.staff_id = st.ID);

-- ---------------------------------------------------------------------
-- 4) 校验：四张表应能 join 出张伟这一条完整链路
-- ---------------------------------------------------------------------
SELECT u.ID        AS user_id,
       u.USER_NO   AS user_no,
       u.NAME      AS user_name,
       u.is_staff  AS is_staff,
       st.ID       AS staff_id,
       st.CATEGORY AS category,
       st.AUDITED_STATUS AS audited,
       s.ID        AS store_id,
       s.NAME      AS store_name,
       m.ID        AS merchant_id,
       m.NAME      AS merchant_name,
       a.acct_id   AS acct_id,
       a.account_name AS acct_name
  FROM mt_user u
  LEFT JOIN mt_staff    st ON st.USER_ID    = u.ID
  LEFT JOIN mt_store    s  ON s.ID          = st.STORE_ID
  LEFT JOIN mt_merchant m  ON m.ID          = st.MERCHANT_ID
  LEFT JOIN t_account   a  ON a.staff_id    = st.ID
 WHERE u.USER_NO = 'U00000001';

-- ---------------------------------------------------------------------
-- 回滚（如需撤销本脚本的改动，取消注释执行）
-- ---------------------------------------------------------------------
-- DELETE FROM t_account WHERE account_key LIKE 'demo-key-zhw-%';
-- DELETE FROM mt_staff  WHERE USER_ID = (SELECT ID FROM mt_user WHERE USER_NO='U00000001');
-- UPDATE mt_user SET is_staff='N' WHERE USER_NO='U00000001';
