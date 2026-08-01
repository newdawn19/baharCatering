-- ===========================================================
-- bahar-db「真实库缺口」最小差异化迁移脚本（只加真实库实际缺失项，幂等可重复执行）
-- 目标库: bahar-db
-- 数据来源：真实库 information_schema 导出 + baharCatering @TableName 实体类 精确比对
-- 运行前建议先备份： mysqldump -uroot -p bahar-db > bahar-db.bak.sql
-- 运行方式：           mysql -uroot -p bahar-db < bahar-db-real-diff.sql
-- 仅包含：A.实体映射但库缺失的表(建表) + B.实体有但库缺失的字段(加列)。C/D 类未映射/多余列不处理。
-- ===========================================================

DELIMITER $$
DROP PROCEDURE IF EXISTS bahardb_real_diff $$
CREATE PROCEDURE bahardb_real_diff()
BEGIN
  -- [A] 缺失的表 mt_invoice（建表，22 列）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_invoice` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `user_id` INT NULL,
  `order_id` INT NULL,
  `order_sn` VARCHAR(255) NULL,
  `invoice_time` DATETIME NULL,
  `invoice_amount` DECIMAL(12,2) NULL,
  `title` VARCHAR(255) NULL,
  `download_url` VARCHAR(255) NULL,
  `type` VARCHAR(255) NULL,
  `tax_code` VARCHAR(255) NULL,
  `bank_name` VARCHAR(255) NULL,
  `bank_card_no` VARCHAR(255) NULL,
  `bank_card_name` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  `mobile` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `operator` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  -- [A] 缺失的表 mt_rider（建表，13 列）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_rider` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `rider_no` VARCHAR(255) NULL,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `id_card` VARCHAR(255) NULL,
  `id_card_front` VARCHAR(255) NULL,
  `id_card_back` VARCHAR(255) NULL,
  `health_cert` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  -- [A] 缺失的表 mt_rider_order（建表，14 列）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_rider_order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NULL,
  `rider_id` INT NULL,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `status` VARCHAR(255) NULL,
  `accept_time` DATETIME NULL,
  `pickup_time` DATETIME NULL,
  `deliver_time` DATETIME NULL,
  `complete_time` DATETIME NULL,
  `delivery_fee` DECIMAL(12,2) NULL,
  `remark` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  -- [A] 缺失的表 mt_table（建表，14 列）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_table` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(255) NULL,
  `area_id` INT NULL,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `max_people` INT NULL,
  `description` VARCHAR(255) NULL,
  `use_status` VARCHAR(255) NULL,
  `use_time` DATETIME NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `operator` VARCHAR(255) NULL,
  `sort` INT NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  -- [A] 缺失的表 mt_table_area（建表，10 列）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_table_area` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `description` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `operator` VARCHAR(255) NULL,
  `sort` INT NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  -- [B] 表 mt_cart 缺失字段 1 个
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_cart') AND UPPER(COLUMN_NAME) = UPPER('TABLE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_cart` ADD COLUMN `table_id` INT NULL;
  END IF;
  -- [B] 表 mt_coupon 缺失字段 1 个
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('CONTENT')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `content` INT NULL;
  END IF;
  -- [B] 表 mt_goods_sku 缺失字段 1 个
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_sku') AND UPPER(COLUMN_NAME) = UPPER('COUPON_IDS')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_sku` ADD COLUMN `coupon_ids` VARCHAR(255) NULL;
  END IF;
  -- [B] 表 mt_merchant 缺失字段 1 个
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_merchant') AND UPPER(COLUMN_NAME) = UPPER('SETTLE_RATE')) THEN
    ALTER TABLE `bahar-db`.`mt_merchant` ADD COLUMN `settle_rate` DECIMAL(12,2) NULL;
  END IF;
  -- [B] 表 mt_order 缺失字段 6 个
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('PICKUP_NO')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `pickup_no` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('TABLE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `table_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('TAKEN_TABLE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `taken_table_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('PEOPLE_NUM')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `people_num` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('DELIVER_METHOD')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `deliver_method` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('RIDER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `rider_id` INT NULL;
  END IF;
  -- [B] 表 mt_printer 缺失字段 3 个
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_printer') AND UPPER(COLUMN_NAME) = UPPER('TYPE')) THEN
    ALTER TABLE `bahar-db`.`mt_printer` ADD COLUMN `type` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_printer') AND UPPER(COLUMN_NAME) = UPPER('BEFORE_PAY')) THEN
    ALTER TABLE `bahar-db`.`mt_printer` ADD COLUMN `before_pay` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_printer') AND UPPER(COLUMN_NAME) = UPPER('AFTER_PAY')) THEN
    ALTER TABLE `bahar-db`.`mt_printer` ADD COLUMN `after_pay` VARCHAR(255) NULL;
  END IF;
  -- [B] 表 mt_settlement 缺失字段 1 个
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_settlement') AND UPPER(COLUMN_NAME) = UPPER('SETTLE_RATE')) THEN
    ALTER TABLE `bahar-db`.`mt_settlement` ADD COLUMN `settle_rate` DECIMAL(12,2) NULL;
  END IF;
  -- [B] 表 mt_user 缺失字段 2 个
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('PROFILE_COMPLETED')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `profile_completed` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('IS_RIDER')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `is_rider` VARCHAR(255) NULL;
  END IF;
END $$
DELIMITER ;
CALL bahardb_real_diff();
DROP PROCEDURE IF EXISTS bahardb_real_diff;
