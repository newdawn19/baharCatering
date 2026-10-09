-- =============================================================
-- 演示数据：会员「付费升级等级」种子（四库通用，幂等）
--
-- 为什么需要它：
--   会员中心「会员升级」那三张金色卡渲染条件是 v-if="memberGrade.length > 0"，
--   而后端 getPayUserGradeList() 只取 CATCH_TYPE='pay' 的等级。
--   演示库里原本只有 init / amount 两类（普通/银卡/金卡/钻石），
--   没有 pay，导致 memberGrade 恒为空 → 金色升级卡在演示站上永远看不到。
--
-- 字段口径（别填错）：
--   CATCH_VALUE  付费金额（卡片上显示 ￥99 / ￥269 / ￥999）
--   VALID_DAY    有效期天数（>0 时角标显示「N天有效期」，=0 显示「永久有效期」）
--   DISCOUNT     **「折」值**，不是小数比率：填 9.5 显示「买单9.5折」；
--                填 0.95 会显示成「买单0.95折」（模板直接打印该值）
--   SPEED_POINT  积分倍数，显示「积分翻N倍」
--   GRADE        用 5/6/7 避开已有的 1~4（普通/银卡/金卡/钻石）
--   MERCHANT_ID  1（演示商户）
--
-- 幂等：按 (CATCH_TYPE='pay' AND GRADE=n) 逐条判空，可重复执行。
--       注意：判空必须带上 GRADE——只按 CATCH_TYPE 判的话，
--       第一条插进去后后两条会被自己挡住，一个库只会落一条。
-- 注意：四库 schema 略有差异，rebate 列只有零售库有，这里一律不写该列。
--
-- 用法： mysql -uroot -p < bahar-demo-user-grade-pay.sql
-- =============================================================

-- ---------------- 零售（bahar-db / 8081）----------------
INSERT INTO `bahar-db`.mt_user_grade
  (MERCHANT_ID, GRADE, NAME, CATCH_CONDITION, CATCH_TYPE, CATCH_VALUE, USER_PRIVILEGE, VALID_DAY, DISCOUNT, SPEED_POINT, STATUS)
SELECT 1, 5, '优选月卡', 'pay', 'pay', 99.00,
       '买单9.5折，积分1.2倍，生日当月双倍积分', 30, 9.50, 1.20, 'A'
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `bahar-db`.mt_user_grade WHERE CATCH_TYPE = 'pay' AND GRADE = 5);

INSERT INTO `bahar-db`.mt_user_grade
  (MERCHANT_ID, GRADE, NAME, CATCH_CONDITION, CATCH_TYPE, CATCH_VALUE, USER_PRIVILEGE, VALID_DAY, DISCOUNT, SPEED_POINT, STATUS)
SELECT 1, 6, '优选季卡', 'pay', 'pay', 269.00,
       '买单9.0折，积分1.5倍，每月赠1张满减券', 90, 9.00, 1.50, 'A'
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `bahar-db`.mt_user_grade WHERE CATCH_TYPE = 'pay' AND GRADE = 6);

INSERT INTO `bahar-db`.mt_user_grade
  (MERCHANT_ID, GRADE, NAME, CATCH_CONDITION, CATCH_TYPE, CATCH_VALUE, USER_PRIVILEGE, VALID_DAY, DISCOUNT, SPEED_POINT, STATUS)
SELECT 1, 7, '优选年卡', 'pay', 'pay', 999.00,
       '买单8.5折，积分2倍，全年免配送费', 365, 8.50, 2.00, 'A'
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `bahar-db`.mt_user_grade WHERE CATCH_TYPE = 'pay' AND GRADE = 7);

-- ---------------- 汽车（bahar-car / 8082）----------------
INSERT INTO `bahar-car`.mt_user_grade
  (MERCHANT_ID, GRADE, NAME, CATCH_CONDITION, CATCH_TYPE, CATCH_VALUE, USER_PRIVILEGE, VALID_DAY, DISCOUNT, SPEED_POINT, STATUS)
SELECT 1, 5, '洗车月卡', 'pay', 'pay', 99.00,
       '洗车9.5折，积分1.2倍，每月赠1次车内除尘', 30, 9.50, 1.20, 'A'
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `bahar-car`.mt_user_grade WHERE CATCH_TYPE = 'pay' AND GRADE = 5);

INSERT INTO `bahar-car`.mt_user_grade
  (MERCHANT_ID, GRADE, NAME, CATCH_CONDITION, CATCH_TYPE, CATCH_VALUE, USER_PRIVILEGE, VALID_DAY, DISCOUNT, SPEED_POINT, STATUS)
SELECT 1, 6, '养护季卡', 'pay', 'pay', 269.00,
       '保养工时9折，积分1.5倍，赠全车检测1次', 90, 9.00, 1.50, 'A'
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `bahar-car`.mt_user_grade WHERE CATCH_TYPE = 'pay' AND GRADE = 6);

INSERT INTO `bahar-car`.mt_user_grade
  (MERCHANT_ID, GRADE, NAME, CATCH_CONDITION, CATCH_TYPE, CATCH_VALUE, USER_PRIVILEGE, VALID_DAY, DISCOUNT, SPEED_POINT, STATUS)
SELECT 1, 7, '尊享年卡', 'pay', 'pay', 999.00,
       '全店服务8.5折，积分2倍，全年免费补胎', 365, 8.50, 2.00, 'A'
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `bahar-car`.mt_user_grade WHERE CATCH_TYPE = 'pay' AND GRADE = 7);

-- ---------------- 餐饮（bahar-catering / 8083）----------------
INSERT INTO `bahar-catering`.mt_user_grade
  (MERCHANT_ID, GRADE, NAME, CATCH_CONDITION, CATCH_TYPE, CATCH_VALUE, USER_PRIVILEGE, VALID_DAY, DISCOUNT, SPEED_POINT, STATUS)
SELECT 1, 5, '美味月卡', 'pay', 'pay', 99.00,
       '买单9.5折，积分1.2倍，每月赠招牌菜1份', 30, 9.50, 1.20, 'A'
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `bahar-catering`.mt_user_grade WHERE CATCH_TYPE = 'pay' AND GRADE = 5);

INSERT INTO `bahar-catering`.mt_user_grade
  (MERCHANT_ID, GRADE, NAME, CATCH_CONDITION, CATCH_TYPE, CATCH_VALUE, USER_PRIVILEGE, VALID_DAY, DISCOUNT, SPEED_POINT, STATUS)
SELECT 1, 6, '畅享季卡', 'pay', 'pay', 269.00,
       '买单9折，积分1.5倍，优先订座免排队', 90, 9.00, 1.50, 'A'
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `bahar-catering`.mt_user_grade WHERE CATCH_TYPE = 'pay' AND GRADE = 6);

INSERT INTO `bahar-catering`.mt_user_grade
  (MERCHANT_ID, GRADE, NAME, CATCH_CONDITION, CATCH_TYPE, CATCH_VALUE, USER_PRIVILEGE, VALID_DAY, DISCOUNT, SPEED_POINT, STATUS)
SELECT 1, 7, '至尊年卡', 'pay', 'pay', 999.00,
       '买单8.5折，积分2倍，生日送长寿面与蛋糕', 365, 8.50, 2.00, 'A'
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `bahar-catering`.mt_user_grade WHERE CATCH_TYPE = 'pay' AND GRADE = 7);

-- ---------------- 康养（bahar-health / 8084）----------------
INSERT INTO `bahar-health`.mt_user_grade
  (MERCHANT_ID, GRADE, NAME, CATCH_CONDITION, CATCH_TYPE, CATCH_VALUE, USER_PRIVILEGE, VALID_DAY, DISCOUNT, SPEED_POINT, STATUS)
SELECT 1, 5, '养生月卡', 'pay', 'pay', 99.00,
       '理疗9.5折，积分1.2倍，每月赠足浴1次', 30, 9.50, 1.20, 'A'
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `bahar-health`.mt_user_grade WHERE CATCH_TYPE = 'pay' AND GRADE = 5);

INSERT INTO `bahar-health`.mt_user_grade
  (MERCHANT_ID, GRADE, NAME, CATCH_CONDITION, CATCH_TYPE, CATCH_VALUE, USER_PRIVILEGE, VALID_DAY, DISCOUNT, SPEED_POINT, STATUS)
SELECT 1, 6, '理疗季卡', 'pay', 'pay', 269.00,
       '全项目9折，积分1.5倍，赠体质检测1次', 90, 9.00, 1.50, 'A'
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `bahar-health`.mt_user_grade WHERE CATCH_TYPE = 'pay' AND GRADE = 6);

INSERT INTO `bahar-health`.mt_user_grade
  (MERCHANT_ID, GRADE, NAME, CATCH_CONDITION, CATCH_TYPE, CATCH_VALUE, USER_PRIVILEGE, VALID_DAY, DISCOUNT, SPEED_POINT, STATUS)
SELECT 1, 7, '尊享年卡', 'pay', 'pay', 999.00,
       '全项目8.5折，积分2倍，全年免费健康顾问', 365, 8.50, 2.00, 'A'
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `bahar-health`.mt_user_grade WHERE CATCH_TYPE = 'pay' AND GRADE = 7);

-- ---------------- 校验（应每库 3 条）----------------
SELECT 'bahar-db' AS 库, GRADE, NAME, CATCH_VALUE, VALID_DAY, DISCOUNT, SPEED_POINT FROM `bahar-db`.mt_user_grade WHERE CATCH_TYPE='pay' ORDER BY GRADE;
SELECT 'bahar-car' AS 库, GRADE, NAME, CATCH_VALUE, VALID_DAY, DISCOUNT, SPEED_POINT FROM `bahar-car`.mt_user_grade WHERE CATCH_TYPE='pay' ORDER BY GRADE;
SELECT 'bahar-catering' AS 库, GRADE, NAME, CATCH_VALUE, VALID_DAY, DISCOUNT, SPEED_POINT FROM `bahar-catering`.mt_user_grade WHERE CATCH_TYPE='pay' ORDER BY GRADE;
SELECT 'bahar-health' AS 库, GRADE, NAME, CATCH_VALUE, VALID_DAY, DISCOUNT, SPEED_POINT FROM `bahar-health`.mt_user_grade WHERE CATCH_TYPE='pay' ORDER BY GRADE;
