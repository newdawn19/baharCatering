-- ===========================================================
-- bahar-db「实体类 → 库」差异化字段迁移脚本（只加不删，幂等可重复执行）
-- 目标库: bahar-db
-- 运行前建议先备份：  mysqldump -uroot -p bahar-db > bahar-db.bak.sql
-- 运行方式：          mysql -uroot -p bahar-db < bahar-db-entities-sync.sql
-- 说明：本脚本依据 baharCatering 的 @TableName 实体类生成。
--   1) 实体映射的表不存在 → CREATE TABLE IF NOT EXISTS（含全部列，主键 AUTO_INCREMENT）
--   2) 实体映射的字段不存在 → ALTER TABLE ... ADD COLUMN（information_schema 守卫，已存在跳过）
--   3) 不会删除任何表/字段；在已存在的表上只补缺失列，列类型按 Java 类型推断，请运行前复核。
-- ===========================================================

DELIMITER $$
DROP PROCEDURE IF EXISTS bahardb_entity_sync $$
CREATE PROCEDURE bahardb_entity_sync()
BEGIN
  -- 表 mt_address（12 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `name` VARCHAR(255) NULL,
  `mobile` VARCHAR(255) NULL,
  `province_id` INT NULL,
  `city_id` INT NULL,
  `region_id` INT NULL,
  `detail` VARCHAR(255) NULL,
  `is_default` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_address') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_address` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_address') AND UPPER(COLUMN_NAME) = UPPER('USER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_address` ADD COLUMN `user_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_address') AND UPPER(COLUMN_NAME) = UPPER('NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_address` ADD COLUMN `name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_address') AND UPPER(COLUMN_NAME) = UPPER('MOBILE')) THEN
    ALTER TABLE `bahar-db`.`mt_address` ADD COLUMN `mobile` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_address') AND UPPER(COLUMN_NAME) = UPPER('PROVINCE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_address` ADD COLUMN `province_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_address') AND UPPER(COLUMN_NAME) = UPPER('CITY_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_address` ADD COLUMN `city_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_address') AND UPPER(COLUMN_NAME) = UPPER('REGION_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_address` ADD COLUMN `region_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_address') AND UPPER(COLUMN_NAME) = UPPER('DETAIL')) THEN
    ALTER TABLE `bahar-db`.`mt_address` ADD COLUMN `detail` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_address') AND UPPER(COLUMN_NAME) = UPPER('IS_DEFAULT')) THEN
    ALTER TABLE `bahar-db`.`mt_address` ADD COLUMN `is_default` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_address') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_address` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_address') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_address` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_address') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_address` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_article（14 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_article` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL,
  `brief` VARCHAR(255) NULL,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `url` VARCHAR(255) NULL,
  `image` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `click` BIGINT NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `operator` VARCHAR(255) NULL,
  `sort` INT NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_article') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_article` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_article') AND UPPER(COLUMN_NAME) = UPPER('TITLE')) THEN
    ALTER TABLE `bahar-db`.`mt_article` ADD COLUMN `title` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_article') AND UPPER(COLUMN_NAME) = UPPER('BRIEF')) THEN
    ALTER TABLE `bahar-db`.`mt_article` ADD COLUMN `brief` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_article') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_article` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_article') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_article` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_article') AND UPPER(COLUMN_NAME) = UPPER('URL')) THEN
    ALTER TABLE `bahar-db`.`mt_article` ADD COLUMN `url` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_article') AND UPPER(COLUMN_NAME) = UPPER('IMAGE')) THEN
    ALTER TABLE `bahar-db`.`mt_article` ADD COLUMN `image` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_article') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_article` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_article') AND UPPER(COLUMN_NAME) = UPPER('CLICK')) THEN
    ALTER TABLE `bahar-db`.`mt_article` ADD COLUMN `click` BIGINT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_article') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_article` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_article') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_article` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_article') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_article` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_article') AND UPPER(COLUMN_NAME) = UPPER('SORT')) THEN
    ALTER TABLE `bahar-db`.`mt_article` ADD COLUMN `sort` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_article') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_article` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_balance（12 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_balance` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `mobile` VARCHAR(255) NULL,
  `user_id` INT NULL,
  `order_sn` VARCHAR(255) NULL,
  `amount` DECIMAL(12,2) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `description` VARCHAR(255) NULL,
  `operator` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_balance') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_balance` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_balance') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_balance` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_balance') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_balance` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_balance') AND UPPER(COLUMN_NAME) = UPPER('MOBILE')) THEN
    ALTER TABLE `bahar-db`.`mt_balance` ADD COLUMN `mobile` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_balance') AND UPPER(COLUMN_NAME) = UPPER('USER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_balance` ADD COLUMN `user_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_balance') AND UPPER(COLUMN_NAME) = UPPER('ORDER_SN')) THEN
    ALTER TABLE `bahar-db`.`mt_balance` ADD COLUMN `order_sn` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_balance') AND UPPER(COLUMN_NAME) = UPPER('AMOUNT')) THEN
    ALTER TABLE `bahar-db`.`mt_balance` ADD COLUMN `amount` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_balance') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_balance` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_balance') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_balance` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_balance') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_balance` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_balance') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_balance` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_balance') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_balance` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_banner（12 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_banner` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `url` VARCHAR(255) NULL,
  `image` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `operator` VARCHAR(255) NULL,
  `sort` INT NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_banner') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_banner` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_banner') AND UPPER(COLUMN_NAME) = UPPER('TITLE')) THEN
    ALTER TABLE `bahar-db`.`mt_banner` ADD COLUMN `title` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_banner') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_banner` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_banner') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_banner` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_banner') AND UPPER(COLUMN_NAME) = UPPER('URL')) THEN
    ALTER TABLE `bahar-db`.`mt_banner` ADD COLUMN `url` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_banner') AND UPPER(COLUMN_NAME) = UPPER('IMAGE')) THEN
    ALTER TABLE `bahar-db`.`mt_banner` ADD COLUMN `image` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_banner') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_banner` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_banner') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_banner` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_banner') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_banner` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_banner') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_banner` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_banner') AND UPPER(COLUMN_NAME) = UPPER('SORT')) THEN
    ALTER TABLE `bahar-db`.`mt_banner` ADD COLUMN `sort` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_banner') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_banner` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_book（17 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_book` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `type` VARCHAR(255) NULL,
  `logo` VARCHAR(255) NULL,
  `goods_id` INT NULL,
  `cate_id` INT NULL,
  `service_dates` VARCHAR(255) NULL,
  `service_times` VARCHAR(255) NULL,
  `service_staff_ids` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `operator` VARCHAR(255) NULL,
  `sort` INT NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_book` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book') AND UPPER(COLUMN_NAME) = UPPER('NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_book` ADD COLUMN `name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_book` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_book` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book') AND UPPER(COLUMN_NAME) = UPPER('TYPE')) THEN
    ALTER TABLE `bahar-db`.`mt_book` ADD COLUMN `type` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book') AND UPPER(COLUMN_NAME) = UPPER('LOGO')) THEN
    ALTER TABLE `bahar-db`.`mt_book` ADD COLUMN `logo` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book') AND UPPER(COLUMN_NAME) = UPPER('GOODS_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_book` ADD COLUMN `goods_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book') AND UPPER(COLUMN_NAME) = UPPER('CATE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_book` ADD COLUMN `cate_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book') AND UPPER(COLUMN_NAME) = UPPER('SERVICE_DATES')) THEN
    ALTER TABLE `bahar-db`.`mt_book` ADD COLUMN `service_dates` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book') AND UPPER(COLUMN_NAME) = UPPER('SERVICE_TIMES')) THEN
    ALTER TABLE `bahar-db`.`mt_book` ADD COLUMN `service_times` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book') AND UPPER(COLUMN_NAME) = UPPER('SERVICE_STAFF_IDS')) THEN
    ALTER TABLE `bahar-db`.`mt_book` ADD COLUMN `service_staff_ids` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_book` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_book` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_book` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_book` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book') AND UPPER(COLUMN_NAME) = UPPER('SORT')) THEN
    ALTER TABLE `bahar-db`.`mt_book` ADD COLUMN `sort` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_book` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_book_cate（11 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_book_cate` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `logo` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `operator` VARCHAR(255) NULL,
  `sort` INT NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_cate') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_book_cate` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_cate') AND UPPER(COLUMN_NAME) = UPPER('NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_book_cate` ADD COLUMN `name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_cate') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_book_cate` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_cate') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_book_cate` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_cate') AND UPPER(COLUMN_NAME) = UPPER('LOGO')) THEN
    ALTER TABLE `bahar-db`.`mt_book_cate` ADD COLUMN `logo` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_cate') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_book_cate` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_cate') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_book_cate` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_cate') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_book_cate` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_cate') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_book_cate` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_cate') AND UPPER(COLUMN_NAME) = UPPER('SORT')) THEN
    ALTER TABLE `bahar-db`.`mt_book_cate` ADD COLUMN `sort` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_cate') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_book_cate` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_book_item（18 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_book_item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `cate_id` INT NULL,
  `book_id` INT NULL,
  `user_id` INT NULL,
  `goods_id` INT NULL,
  `verify_code` VARCHAR(255) NULL,
  `contact` VARCHAR(255) NULL,
  `mobile` VARCHAR(255) NULL,
  `service_date` VARCHAR(255) NULL,
  `service_time` VARCHAR(255) NULL,
  `remark` VARCHAR(255) NULL,
  `service_staff_id` INT NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `operator` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_item') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_book_item` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_item') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_book_item` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_item') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_book_item` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_item') AND UPPER(COLUMN_NAME) = UPPER('CATE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_book_item` ADD COLUMN `cate_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_item') AND UPPER(COLUMN_NAME) = UPPER('BOOK_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_book_item` ADD COLUMN `book_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_item') AND UPPER(COLUMN_NAME) = UPPER('USER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_book_item` ADD COLUMN `user_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_item') AND UPPER(COLUMN_NAME) = UPPER('GOODS_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_book_item` ADD COLUMN `goods_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_item') AND UPPER(COLUMN_NAME) = UPPER('VERIFY_CODE')) THEN
    ALTER TABLE `bahar-db`.`mt_book_item` ADD COLUMN `verify_code` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_item') AND UPPER(COLUMN_NAME) = UPPER('CONTACT')) THEN
    ALTER TABLE `bahar-db`.`mt_book_item` ADD COLUMN `contact` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_item') AND UPPER(COLUMN_NAME) = UPPER('MOBILE')) THEN
    ALTER TABLE `bahar-db`.`mt_book_item` ADD COLUMN `mobile` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_item') AND UPPER(COLUMN_NAME) = UPPER('SERVICE_DATE')) THEN
    ALTER TABLE `bahar-db`.`mt_book_item` ADD COLUMN `service_date` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_item') AND UPPER(COLUMN_NAME) = UPPER('SERVICE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_book_item` ADD COLUMN `service_time` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_item') AND UPPER(COLUMN_NAME) = UPPER('REMARK')) THEN
    ALTER TABLE `bahar-db`.`mt_book_item` ADD COLUMN `remark` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_item') AND UPPER(COLUMN_NAME) = UPPER('SERVICE_STAFF_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_book_item` ADD COLUMN `service_staff_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_item') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_book_item` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_item') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_book_item` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_item') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_book_item` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_book_item') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_book_item` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_cart（12 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_cart` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `table_id` INT NULL,
  `is_visitor` VARCHAR(255) NULL,
  `sku_id` INT NULL,
  `goods_id` INT NULL,
  `num` DECIMAL(20,6) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_cart') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_cart` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_cart') AND UPPER(COLUMN_NAME) = UPPER('USER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_cart` ADD COLUMN `user_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_cart') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_cart` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_cart') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_cart` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_cart') AND UPPER(COLUMN_NAME) = UPPER('TABLE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_cart` ADD COLUMN `table_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_cart') AND UPPER(COLUMN_NAME) = UPPER('IS_VISITOR')) THEN
    ALTER TABLE `bahar-db`.`mt_cart` ADD COLUMN `is_visitor` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_cart') AND UPPER(COLUMN_NAME) = UPPER('SKU_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_cart` ADD COLUMN `sku_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_cart') AND UPPER(COLUMN_NAME) = UPPER('GOODS_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_cart` ADD COLUMN `goods_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_cart') AND UPPER(COLUMN_NAME) = UPPER('NUM')) THEN
    ALTER TABLE `bahar-db`.`mt_cart` ADD COLUMN `num` DECIMAL(20,6) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_cart') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_cart` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_cart') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_cart` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_cart') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_cart` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_commission_cash（13 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_commission_cash` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `settle_no` VARCHAR(255) NULL,
  `uuid` VARCHAR(255) NULL,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `user_id` INT NULL,
  `staff_id` INT NULL,
  `amount` DECIMAL(12,2) NULL,
  `description` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `operator` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_cash') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_cash` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_cash') AND UPPER(COLUMN_NAME) = UPPER('SETTLE_NO')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_cash` ADD COLUMN `settle_no` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_cash') AND UPPER(COLUMN_NAME) = UPPER('UUID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_cash` ADD COLUMN `uuid` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_cash') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_cash` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_cash') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_cash` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_cash') AND UPPER(COLUMN_NAME) = UPPER('USER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_cash` ADD COLUMN `user_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_cash') AND UPPER(COLUMN_NAME) = UPPER('STAFF_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_cash` ADD COLUMN `staff_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_cash') AND UPPER(COLUMN_NAME) = UPPER('AMOUNT')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_cash` ADD COLUMN `amount` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_cash') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_cash` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_cash') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_cash` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_cash') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_cash` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_cash') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_cash` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_cash') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_cash` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_commission_log（21 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_commission_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `target` VARCHAR(255) NULL,
  `type` VARCHAR(255) NULL,
  `level` INT NULL,
  `user_id` INT NULL,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `staff_id` INT NULL,
  `order_id` INT NULL,
  `amount` DECIMAL(12,2) NULL,
  `rule_id` INT NULL,
  `rule_item_id` INT NULL,
  `description` VARCHAR(255) NULL,
  `settle_uuid` VARCHAR(255) NULL,
  `cash_id` INT NULL,
  `is_cash` VARCHAR(255) NULL,
  `cash_time` DATETIME NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `operator` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_log') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_log` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_log') AND UPPER(COLUMN_NAME) = UPPER('TARGET')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_log` ADD COLUMN `target` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_log') AND UPPER(COLUMN_NAME) = UPPER('TYPE')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_log` ADD COLUMN `type` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_log') AND UPPER(COLUMN_NAME) = UPPER('LEVEL')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_log` ADD COLUMN `level` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_log') AND UPPER(COLUMN_NAME) = UPPER('USER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_log` ADD COLUMN `user_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_log') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_log` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_log') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_log` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_log') AND UPPER(COLUMN_NAME) = UPPER('STAFF_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_log` ADD COLUMN `staff_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_log') AND UPPER(COLUMN_NAME) = UPPER('ORDER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_log` ADD COLUMN `order_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_log') AND UPPER(COLUMN_NAME) = UPPER('AMOUNT')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_log` ADD COLUMN `amount` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_log') AND UPPER(COLUMN_NAME) = UPPER('RULE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_log` ADD COLUMN `rule_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_log') AND UPPER(COLUMN_NAME) = UPPER('RULE_ITEM_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_log` ADD COLUMN `rule_item_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_log') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_log` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_log') AND UPPER(COLUMN_NAME) = UPPER('SETTLE_UUID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_log` ADD COLUMN `settle_uuid` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_log') AND UPPER(COLUMN_NAME) = UPPER('CASH_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_log` ADD COLUMN `cash_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_log') AND UPPER(COLUMN_NAME) = UPPER('IS_CASH')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_log` ADD COLUMN `is_cash` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_log') AND UPPER(COLUMN_NAME) = UPPER('CASH_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_log` ADD COLUMN `cash_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_log') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_log` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_log') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_log` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_log') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_log` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_log') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_log` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_commission_relation（11 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_commission_relation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `merchant_id` INT NULL,
  `user_id` INT NULL,
  `invite_code` VARCHAR(255) NULL,
  `sub_user_id` INT NULL,
  `level` INT NULL,
  `description` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `operator` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_relation') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_relation` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_relation') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_relation` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_relation') AND UPPER(COLUMN_NAME) = UPPER('USER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_relation` ADD COLUMN `user_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_relation') AND UPPER(COLUMN_NAME) = UPPER('INVITE_CODE')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_relation` ADD COLUMN `invite_code` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_relation') AND UPPER(COLUMN_NAME) = UPPER('SUB_USER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_relation` ADD COLUMN `sub_user_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_relation') AND UPPER(COLUMN_NAME) = UPPER('LEVEL')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_relation` ADD COLUMN `level` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_relation') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_relation` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_relation') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_relation` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_relation') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_relation` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_relation') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_relation` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_relation') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_relation` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_commission_rule（12 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_commission_rule` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `type` VARCHAR(255) NULL,
  `target` VARCHAR(255) NULL,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `store_ids` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `description` VARCHAR(255) NULL,
  `operator` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule') AND UPPER(COLUMN_NAME) = UPPER('NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule` ADD COLUMN `name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule') AND UPPER(COLUMN_NAME) = UPPER('TYPE')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule` ADD COLUMN `type` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule') AND UPPER(COLUMN_NAME) = UPPER('TARGET')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule` ADD COLUMN `target` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule') AND UPPER(COLUMN_NAME) = UPPER('STORE_IDS')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule` ADD COLUMN `store_ids` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_commission_rule_item（17 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_commission_rule_item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(255) NULL,
  `target` VARCHAR(255) NULL,
  `rule_id` INT NULL,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `target_id` INT NULL,
  `method` VARCHAR(255) NULL,
  `store_ids` VARCHAR(255) NULL,
  `guest` DECIMAL(12,2) NULL,
  `sub_guest` DECIMAL(12,2) NULL,
  `member` DECIMAL(12,2) NULL,
  `sub_member` DECIMAL(12,2) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `operator` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule_item') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule_item` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule_item') AND UPPER(COLUMN_NAME) = UPPER('TYPE')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule_item` ADD COLUMN `type` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule_item') AND UPPER(COLUMN_NAME) = UPPER('TARGET')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule_item` ADD COLUMN `target` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule_item') AND UPPER(COLUMN_NAME) = UPPER('RULE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule_item` ADD COLUMN `rule_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule_item') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule_item` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule_item') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule_item` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule_item') AND UPPER(COLUMN_NAME) = UPPER('TARGET_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule_item` ADD COLUMN `target_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule_item') AND UPPER(COLUMN_NAME) = UPPER('METHOD')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule_item` ADD COLUMN `method` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule_item') AND UPPER(COLUMN_NAME) = UPPER('STORE_IDS')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule_item` ADD COLUMN `store_ids` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule_item') AND UPPER(COLUMN_NAME) = UPPER('GUEST')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule_item` ADD COLUMN `guest` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule_item') AND UPPER(COLUMN_NAME) = UPPER('SUB_GUEST')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule_item` ADD COLUMN `sub_guest` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule_item') AND UPPER(COLUMN_NAME) = UPPER('MEMBER')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule_item` ADD COLUMN `member` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule_item') AND UPPER(COLUMN_NAME) = UPPER('SUB_MEMBER')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule_item` ADD COLUMN `sub_member` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule_item') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule_item` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule_item') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule_item` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule_item') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule_item` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_commission_rule_item') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_commission_rule_item` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_confirm_log（17 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_confirm_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(255) NULL,
  `amount` DECIMAL(12,2) NULL,
  `coupon_id` INT NULL,
  `merchant_id` INT NULL,
  `user_coupon_id` INT NULL,
  `order_id` INT NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `user_id` INT NULL,
  `operator_user_id` INT NULL,
  `store_id` INT NULL,
  `status` VARCHAR(255) NULL,
  `cancel_time` DATETIME NULL,
  `operator` VARCHAR(255) NULL,
  `operator_from` VARCHAR(255) NULL,
  `remark` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_confirm_log') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_confirm_log` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_confirm_log') AND UPPER(COLUMN_NAME) = UPPER('CODE')) THEN
    ALTER TABLE `bahar-db`.`mt_confirm_log` ADD COLUMN `code` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_confirm_log') AND UPPER(COLUMN_NAME) = UPPER('AMOUNT')) THEN
    ALTER TABLE `bahar-db`.`mt_confirm_log` ADD COLUMN `amount` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_confirm_log') AND UPPER(COLUMN_NAME) = UPPER('COUPON_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_confirm_log` ADD COLUMN `coupon_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_confirm_log') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_confirm_log` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_confirm_log') AND UPPER(COLUMN_NAME) = UPPER('USER_COUPON_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_confirm_log` ADD COLUMN `user_coupon_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_confirm_log') AND UPPER(COLUMN_NAME) = UPPER('ORDER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_confirm_log` ADD COLUMN `order_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_confirm_log') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_confirm_log` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_confirm_log') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_confirm_log` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_confirm_log') AND UPPER(COLUMN_NAME) = UPPER('USER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_confirm_log` ADD COLUMN `user_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_confirm_log') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR_USER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_confirm_log` ADD COLUMN `operator_user_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_confirm_log') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_confirm_log` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_confirm_log') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_confirm_log` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_confirm_log') AND UPPER(COLUMN_NAME) = UPPER('CANCEL_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_confirm_log` ADD COLUMN `cancel_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_confirm_log') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_confirm_log` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_confirm_log') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR_FROM')) THEN
    ALTER TABLE `bahar-db`.`mt_confirm_log` ADD COLUMN `operator_from` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_confirm_log') AND UPPER(COLUMN_NAME) = UPPER('REMARK')) THEN
    ALTER TABLE `bahar-db`.`mt_confirm_log` ADD COLUMN `remark` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_coupon（33 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_coupon` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `group_id` INT NULL,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `type` VARCHAR(255) NULL,
  `content` INT NULL,
  `name` VARCHAR(255) NULL,
  `is_give` TINYINT(1) NULL,
  `point` INT NULL,
  `apply_goods` VARCHAR(255) NULL,
  `receive_code` VARCHAR(255) NULL,
  `use_for` VARCHAR(255) NULL,
  `expire_type` VARCHAR(255) NULL,
  `expire_time` INT NULL,
  `begin_time` DATETIME NULL,
  `end_time` DATETIME NULL,
  `amount` DECIMAL(12,2) NULL,
  `send_way` VARCHAR(255) NULL,
  `send_num` INT NULL,
  `total` INT NULL,
  `limit_num` INT NULL,
  `except_time` VARCHAR(255) NULL,
  `store_ids` VARCHAR(255) NULL,
  `grade_ids` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `image` VARCHAR(255) NULL,
  `remarks` VARCHAR(255) NULL,
  `in_rule` VARCHAR(255) NULL,
  `out_rule` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `operator` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('GROUP_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `group_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('TYPE')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `type` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('CONTENT')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `content` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('IS_GIVE')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `is_give` TINYINT(1) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('POINT')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `point` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('APPLY_GOODS')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `apply_goods` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('RECEIVE_CODE')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `receive_code` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('USE_FOR')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `use_for` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('EXPIRE_TYPE')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `expire_type` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('EXPIRE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `expire_time` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('BEGIN_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `begin_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('END_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `end_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('AMOUNT')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `amount` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('SEND_WAY')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `send_way` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('SEND_NUM')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `send_num` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('TOTAL')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `total` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('LIMIT_NUM')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `limit_num` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('EXCEPT_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `except_time` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('STORE_IDS')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `store_ids` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('GRADE_IDS')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `grade_ids` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('IMAGE')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `image` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('REMARKS')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `remarks` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('IN_RULE')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `in_rule` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('OUT_RULE')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `out_rule` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_coupon_goods（6 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_coupon_goods` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `coupon_id` INT NULL,
  `goods_id` INT NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon_goods') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon_goods` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon_goods') AND UPPER(COLUMN_NAME) = UPPER('COUPON_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon_goods` ADD COLUMN `coupon_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon_goods') AND UPPER(COLUMN_NAME) = UPPER('GOODS_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon_goods` ADD COLUMN `goods_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon_goods') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon_goods` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon_goods') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon_goods` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon_goods') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon_goods` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_coupon_group（12 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_coupon_group` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `name` VARCHAR(255) NULL,
  `money` DECIMAL(12,2) NULL,
  `num` INT NULL,
  `total` INT NULL,
  `description` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `operator` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon_group') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon_group` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon_group') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon_group` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon_group') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon_group` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon_group') AND UPPER(COLUMN_NAME) = UPPER('NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon_group` ADD COLUMN `name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon_group') AND UPPER(COLUMN_NAME) = UPPER('MONEY')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon_group` ADD COLUMN `money` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon_group') AND UPPER(COLUMN_NAME) = UPPER('NUM')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon_group` ADD COLUMN `num` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon_group') AND UPPER(COLUMN_NAME) = UPPER('TOTAL')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon_group` ADD COLUMN `total` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon_group') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon_group` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon_group') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon_group` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon_group') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon_group` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon_group') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon_group` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_coupon_group') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_coupon_group` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_give（18 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_give` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `give_user_id` INT NULL,
  `mobile` VARCHAR(255) NULL,
  `user_mobile` VARCHAR(255) NULL,
  `group_ids` VARCHAR(255) NULL,
  `group_names` VARCHAR(255) NULL,
  `coupon_ids` VARCHAR(255) NULL,
  `coupon_names` VARCHAR(255) NULL,
  `num` INT NULL,
  `money` DECIMAL(12,2) NULL,
  `note` VARCHAR(255) NULL,
  `message` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_give') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_give` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_give') AND UPPER(COLUMN_NAME) = UPPER('USER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_give` ADD COLUMN `user_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_give') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_give` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_give') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_give` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_give') AND UPPER(COLUMN_NAME) = UPPER('GIVE_USER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_give` ADD COLUMN `give_user_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_give') AND UPPER(COLUMN_NAME) = UPPER('MOBILE')) THEN
    ALTER TABLE `bahar-db`.`mt_give` ADD COLUMN `mobile` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_give') AND UPPER(COLUMN_NAME) = UPPER('USER_MOBILE')) THEN
    ALTER TABLE `bahar-db`.`mt_give` ADD COLUMN `user_mobile` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_give') AND UPPER(COLUMN_NAME) = UPPER('GROUP_IDS')) THEN
    ALTER TABLE `bahar-db`.`mt_give` ADD COLUMN `group_ids` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_give') AND UPPER(COLUMN_NAME) = UPPER('GROUP_NAMES')) THEN
    ALTER TABLE `bahar-db`.`mt_give` ADD COLUMN `group_names` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_give') AND UPPER(COLUMN_NAME) = UPPER('COUPON_IDS')) THEN
    ALTER TABLE `bahar-db`.`mt_give` ADD COLUMN `coupon_ids` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_give') AND UPPER(COLUMN_NAME) = UPPER('COUPON_NAMES')) THEN
    ALTER TABLE `bahar-db`.`mt_give` ADD COLUMN `coupon_names` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_give') AND UPPER(COLUMN_NAME) = UPPER('NUM')) THEN
    ALTER TABLE `bahar-db`.`mt_give` ADD COLUMN `num` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_give') AND UPPER(COLUMN_NAME) = UPPER('MONEY')) THEN
    ALTER TABLE `bahar-db`.`mt_give` ADD COLUMN `money` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_give') AND UPPER(COLUMN_NAME) = UPPER('NOTE')) THEN
    ALTER TABLE `bahar-db`.`mt_give` ADD COLUMN `note` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_give') AND UPPER(COLUMN_NAME) = UPPER('MESSAGE')) THEN
    ALTER TABLE `bahar-db`.`mt_give` ADD COLUMN `message` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_give') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_give` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_give') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_give` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_give') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_give` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_give_item（6 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_give_item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `give_id` INT NULL,
  `user_coupon_id` INT NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_give_item') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_give_item` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_give_item') AND UPPER(COLUMN_NAME) = UPPER('GIVE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_give_item` ADD COLUMN `give_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_give_item') AND UPPER(COLUMN_NAME) = UPPER('USER_COUPON_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_give_item` ADD COLUMN `user_coupon_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_give_item') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_give_item` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_give_item') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_give_item` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_give_item') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_give_item` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_goods（29 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_goods` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `name` VARCHAR(255) NULL,
  `type` VARCHAR(255) NULL,
  `cate_id` INT NULL,
  `goods_no` VARCHAR(255) NULL,
  `platform` INT NULL,
  `is_single_spec` VARCHAR(255) NULL,
  `logo` VARCHAR(255) NULL,
  `images` VARCHAR(255) NULL,
  `price` DECIMAL(12,2) NULL,
  `line_price` DECIMAL(12,2) NULL,
  `cost_price` DECIMAL(12,2) NULL,
  `stock` DECIMAL(20,6) NULL,
  `coupon_ids` VARCHAR(255) NULL,
  `service_time` INT NULL,
  `weight` DECIMAL(12,2) NULL,
  `init_sale` DECIMAL(20,6) NULL,
  `sale_point` VARCHAR(255) NULL,
  `can_use_point` VARCHAR(255) NULL,
  `is_member_discount` VARCHAR(255) NULL,
  `grade_ids` VARCHAR(255) NULL,
  `sort` INT NULL,
  `description` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `operator` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('TYPE')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `type` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('CATE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `cate_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('GOODS_NO')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `goods_no` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('PLATFORM')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `platform` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('IS_SINGLE_SPEC')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `is_single_spec` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('LOGO')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `logo` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('IMAGES')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `images` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('PRICE')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `price` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('LINE_PRICE')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `line_price` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('COST_PRICE')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `cost_price` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('STOCK')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `stock` DECIMAL(20,6) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('COUPON_IDS')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `coupon_ids` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('SERVICE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `service_time` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('WEIGHT')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `weight` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('INIT_SALE')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `init_sale` DECIMAL(20,6) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('SALE_POINT')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `sale_point` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('CAN_USE_POINT')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `can_use_point` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('IS_MEMBER_DISCOUNT')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `is_member_discount` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('GRADE_IDS')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `grade_ids` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('SORT')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `sort` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_goods` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_goods_cate（11 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_goods_cate` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `name` VARCHAR(255) NULL,
  `logo` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `operator` VARCHAR(255) NULL,
  `sort` INT NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_cate') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_cate` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_cate') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_cate` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_cate') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_cate` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_cate') AND UPPER(COLUMN_NAME) = UPPER('NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_cate` ADD COLUMN `name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_cate') AND UPPER(COLUMN_NAME) = UPPER('LOGO')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_cate` ADD COLUMN `logo` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_cate') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_cate` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_cate') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_cate` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_cate') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_cate` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_cate') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_cate` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_cate') AND UPPER(COLUMN_NAME) = UPPER('SORT')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_cate` ADD COLUMN `sort` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_cate') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_cate` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_goods_sku（12 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_goods_sku` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sku_no` VARCHAR(255) NULL,
  `logo` VARCHAR(255) NULL,
  `goods_id` INT NULL,
  `spec_ids` VARCHAR(255) NULL,
  `stock` DECIMAL(20,6) NULL,
  `price` DECIMAL(12,2) NULL,
  `line_price` DECIMAL(12,2) NULL,
  `cost_price` DECIMAL(12,2) NULL,
  `weight` DECIMAL(12,2) NULL,
  `coupon_ids` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_sku') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_sku` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_sku') AND UPPER(COLUMN_NAME) = UPPER('SKU_NO')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_sku` ADD COLUMN `sku_no` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_sku') AND UPPER(COLUMN_NAME) = UPPER('LOGO')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_sku` ADD COLUMN `logo` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_sku') AND UPPER(COLUMN_NAME) = UPPER('GOODS_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_sku` ADD COLUMN `goods_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_sku') AND UPPER(COLUMN_NAME) = UPPER('SPEC_IDS')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_sku` ADD COLUMN `spec_ids` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_sku') AND UPPER(COLUMN_NAME) = UPPER('STOCK')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_sku` ADD COLUMN `stock` DECIMAL(20,6) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_sku') AND UPPER(COLUMN_NAME) = UPPER('PRICE')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_sku` ADD COLUMN `price` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_sku') AND UPPER(COLUMN_NAME) = UPPER('LINE_PRICE')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_sku` ADD COLUMN `line_price` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_sku') AND UPPER(COLUMN_NAME) = UPPER('COST_PRICE')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_sku` ADD COLUMN `cost_price` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_sku') AND UPPER(COLUMN_NAME) = UPPER('WEIGHT')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_sku` ADD COLUMN `weight` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_sku') AND UPPER(COLUMN_NAME) = UPPER('COUPON_IDS')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_sku` ADD COLUMN `coupon_ids` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_sku') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_sku` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_goods_spec（5 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_goods_spec` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `goods_id` INT NULL,
  `name` VARCHAR(255) NULL,
  `value` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_spec') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_spec` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_spec') AND UPPER(COLUMN_NAME) = UPPER('GOODS_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_spec` ADD COLUMN `goods_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_spec') AND UPPER(COLUMN_NAME) = UPPER('NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_spec` ADD COLUMN `name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_spec') AND UPPER(COLUMN_NAME) = UPPER('VALUE')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_spec` ADD COLUMN `value` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_goods_spec') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_goods_spec` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_invoice（22 列，缺失则建表）
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
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_invoice') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_invoice` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_invoice') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_invoice` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_invoice') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_invoice` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_invoice') AND UPPER(COLUMN_NAME) = UPPER('USER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_invoice` ADD COLUMN `user_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_invoice') AND UPPER(COLUMN_NAME) = UPPER('ORDER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_invoice` ADD COLUMN `order_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_invoice') AND UPPER(COLUMN_NAME) = UPPER('ORDER_SN')) THEN
    ALTER TABLE `bahar-db`.`mt_invoice` ADD COLUMN `order_sn` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_invoice') AND UPPER(COLUMN_NAME) = UPPER('INVOICE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_invoice` ADD COLUMN `invoice_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_invoice') AND UPPER(COLUMN_NAME) = UPPER('INVOICE_AMOUNT')) THEN
    ALTER TABLE `bahar-db`.`mt_invoice` ADD COLUMN `invoice_amount` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_invoice') AND UPPER(COLUMN_NAME) = UPPER('TITLE')) THEN
    ALTER TABLE `bahar-db`.`mt_invoice` ADD COLUMN `title` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_invoice') AND UPPER(COLUMN_NAME) = UPPER('DOWNLOAD_URL')) THEN
    ALTER TABLE `bahar-db`.`mt_invoice` ADD COLUMN `download_url` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_invoice') AND UPPER(COLUMN_NAME) = UPPER('TYPE')) THEN
    ALTER TABLE `bahar-db`.`mt_invoice` ADD COLUMN `type` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_invoice') AND UPPER(COLUMN_NAME) = UPPER('TAX_CODE')) THEN
    ALTER TABLE `bahar-db`.`mt_invoice` ADD COLUMN `tax_code` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_invoice') AND UPPER(COLUMN_NAME) = UPPER('BANK_NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_invoice` ADD COLUMN `bank_name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_invoice') AND UPPER(COLUMN_NAME) = UPPER('BANK_CARD_NO')) THEN
    ALTER TABLE `bahar-db`.`mt_invoice` ADD COLUMN `bank_card_no` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_invoice') AND UPPER(COLUMN_NAME) = UPPER('BANK_CARD_NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_invoice` ADD COLUMN `bank_card_name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_invoice') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_invoice` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_invoice') AND UPPER(COLUMN_NAME) = UPPER('EMAIL')) THEN
    ALTER TABLE `bahar-db`.`mt_invoice` ADD COLUMN `email` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_invoice') AND UPPER(COLUMN_NAME) = UPPER('MOBILE')) THEN
    ALTER TABLE `bahar-db`.`mt_invoice` ADD COLUMN `mobile` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_invoice') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_invoice` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_invoice') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_invoice` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_invoice') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_invoice` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_invoice') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_invoice` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_merchant（20 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_merchant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(255) NULL,
  `wx_app_id` VARCHAR(255) NULL,
  `wx_app_secret` VARCHAR(255) NULL,
  `wx_official_app_id` VARCHAR(255) NULL,
  `wx_official_app_secret` VARCHAR(255) NULL,
  `settle_rate` DECIMAL(12,2) NULL,
  `no` VARCHAR(255) NULL,
  `name` VARCHAR(255) NULL,
  `logo` VARCHAR(255) NULL,
  `contact` VARCHAR(255) NULL,
  `phone` VARCHAR(255) NULL,
  `address` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `start_time` DATETIME NULL,
  `end_time` DATETIME NULL,
  `status` VARCHAR(255) NULL,
  `operator` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_merchant') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_merchant` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_merchant') AND UPPER(COLUMN_NAME) = UPPER('TYPE')) THEN
    ALTER TABLE `bahar-db`.`mt_merchant` ADD COLUMN `type` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_merchant') AND UPPER(COLUMN_NAME) = UPPER('WX_APP_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_merchant` ADD COLUMN `wx_app_id` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_merchant') AND UPPER(COLUMN_NAME) = UPPER('WX_APP_SECRET')) THEN
    ALTER TABLE `bahar-db`.`mt_merchant` ADD COLUMN `wx_app_secret` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_merchant') AND UPPER(COLUMN_NAME) = UPPER('WX_OFFICIAL_APP_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_merchant` ADD COLUMN `wx_official_app_id` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_merchant') AND UPPER(COLUMN_NAME) = UPPER('WX_OFFICIAL_APP_SECRET')) THEN
    ALTER TABLE `bahar-db`.`mt_merchant` ADD COLUMN `wx_official_app_secret` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_merchant') AND UPPER(COLUMN_NAME) = UPPER('SETTLE_RATE')) THEN
    ALTER TABLE `bahar-db`.`mt_merchant` ADD COLUMN `settle_rate` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_merchant') AND UPPER(COLUMN_NAME) = UPPER('NO')) THEN
    ALTER TABLE `bahar-db`.`mt_merchant` ADD COLUMN `no` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_merchant') AND UPPER(COLUMN_NAME) = UPPER('NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_merchant` ADD COLUMN `name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_merchant') AND UPPER(COLUMN_NAME) = UPPER('LOGO')) THEN
    ALTER TABLE `bahar-db`.`mt_merchant` ADD COLUMN `logo` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_merchant') AND UPPER(COLUMN_NAME) = UPPER('CONTACT')) THEN
    ALTER TABLE `bahar-db`.`mt_merchant` ADD COLUMN `contact` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_merchant') AND UPPER(COLUMN_NAME) = UPPER('PHONE')) THEN
    ALTER TABLE `bahar-db`.`mt_merchant` ADD COLUMN `phone` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_merchant') AND UPPER(COLUMN_NAME) = UPPER('ADDRESS')) THEN
    ALTER TABLE `bahar-db`.`mt_merchant` ADD COLUMN `address` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_merchant') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_merchant` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_merchant') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_merchant` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_merchant') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_merchant` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_merchant') AND UPPER(COLUMN_NAME) = UPPER('START_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_merchant` ADD COLUMN `start_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_merchant') AND UPPER(COLUMN_NAME) = UPPER('END_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_merchant` ADD COLUMN `end_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_merchant') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_merchant` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_merchant') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_merchant` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_message（13 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_message` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `merchant_id` INT NULL,
  `user_id` INT NULL,
  `type` VARCHAR(255) NULL,
  `title` VARCHAR(255) NULL,
  `content` VARCHAR(255) NULL,
  `is_read` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `params` VARCHAR(255) NULL,
  `is_send` VARCHAR(255) NULL,
  `send_time` DATETIME NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_message') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_message` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_message') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_message` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_message') AND UPPER(COLUMN_NAME) = UPPER('USER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_message` ADD COLUMN `user_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_message') AND UPPER(COLUMN_NAME) = UPPER('TYPE')) THEN
    ALTER TABLE `bahar-db`.`mt_message` ADD COLUMN `type` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_message') AND UPPER(COLUMN_NAME) = UPPER('TITLE')) THEN
    ALTER TABLE `bahar-db`.`mt_message` ADD COLUMN `title` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_message') AND UPPER(COLUMN_NAME) = UPPER('CONTENT')) THEN
    ALTER TABLE `bahar-db`.`mt_message` ADD COLUMN `content` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_message') AND UPPER(COLUMN_NAME) = UPPER('IS_READ')) THEN
    ALTER TABLE `bahar-db`.`mt_message` ADD COLUMN `is_read` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_message') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_message` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_message') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_message` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_message') AND UPPER(COLUMN_NAME) = UPPER('PARAMS')) THEN
    ALTER TABLE `bahar-db`.`mt_message` ADD COLUMN `params` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_message') AND UPPER(COLUMN_NAME) = UPPER('IS_SEND')) THEN
    ALTER TABLE `bahar-db`.`mt_message` ADD COLUMN `is_send` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_message') AND UPPER(COLUMN_NAME) = UPPER('SEND_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_message` ADD COLUMN `send_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_message') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_message` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_open_gift（11 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_open_gift` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `grade_id` INT NULL,
  `point` INT NULL,
  `coupon_id` INT NULL,
  `coupon_num` INT NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `status` VARCHAR(255) NULL,
  `operator` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_open_gift') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_open_gift` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_open_gift') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_open_gift` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_open_gift') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_open_gift` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_open_gift') AND UPPER(COLUMN_NAME) = UPPER('GRADE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_open_gift` ADD COLUMN `grade_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_open_gift') AND UPPER(COLUMN_NAME) = UPPER('POINT')) THEN
    ALTER TABLE `bahar-db`.`mt_open_gift` ADD COLUMN `point` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_open_gift') AND UPPER(COLUMN_NAME) = UPPER('COUPON_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_open_gift` ADD COLUMN `coupon_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_open_gift') AND UPPER(COLUMN_NAME) = UPPER('COUPON_NUM')) THEN
    ALTER TABLE `bahar-db`.`mt_open_gift` ADD COLUMN `coupon_num` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_open_gift') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_open_gift` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_open_gift') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_open_gift` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_open_gift') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_open_gift` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_open_gift') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_open_gift` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_open_gift_item（5 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_open_gift_item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `open_gift_id` INT NULL,
  `create_time` DATETIME NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_open_gift_item') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_open_gift_item` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_open_gift_item') AND UPPER(COLUMN_NAME) = UPPER('USER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_open_gift_item` ADD COLUMN `user_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_open_gift_item') AND UPPER(COLUMN_NAME) = UPPER('OPEN_GIFT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_open_gift_item` ADD COLUMN `open_gift_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_open_gift_item') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_open_gift_item` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_open_gift_item') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_open_gift_item` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_order（40 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(255) NULL,
  `pay_type` VARCHAR(255) NULL,
  `order_mode` VARCHAR(255) NULL,
  `platform` VARCHAR(255) NULL,
  `order_sn` VARCHAR(255) NULL,
  `pickup_no` INT NULL,
  `coupon_id` INT NULL,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `table_id` INT NULL,
  `taken_table_id` INT NULL,
  `people_num` INT NULL,
  `user_id` INT NULL,
  `verify_code` VARCHAR(255) NULL,
  `is_visitor` VARCHAR(255) NULL,
  `amount` DECIMAL(12,2) NULL,
  `pay_amount` DECIMAL(12,2) NULL,
  `settle_status` VARCHAR(255) NULL,
  `use_point` INT NULL,
  `point_amount` DECIMAL(12,2) NULL,
  `discount` DECIMAL(12,2) NULL,
  `delivery_fee` DECIMAL(12,2) NULL,
  `param` VARCHAR(255) NULL,
  `express_info` VARCHAR(255) NULL,
  `remark` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `status` VARCHAR(255) NULL,
  `pay_time` DATETIME NULL,
  `pay_status` VARCHAR(255) NULL,
  `staff_id` INT NULL,
  `confirm_status` VARCHAR(255) NULL,
  `confirm_time` DATETIME NULL,
  `confirm_remark` VARCHAR(255) NULL,
  `operator` VARCHAR(255) NULL,
  `commission_status` VARCHAR(255) NULL,
  `commission_user_id` INT NULL,
  `deliver_method` VARCHAR(255) NULL,
  `rider_id` INT NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('TYPE')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `type` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('PAY_TYPE')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `pay_type` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('ORDER_MODE')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `order_mode` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('PLATFORM')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `platform` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('ORDER_SN')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `order_sn` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('PICKUP_NO')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `pickup_no` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('COUPON_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `coupon_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `store_id` INT NULL;
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
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('USER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `user_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('VERIFY_CODE')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `verify_code` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('IS_VISITOR')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `is_visitor` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('AMOUNT')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `amount` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('PAY_AMOUNT')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `pay_amount` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('SETTLE_STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `settle_status` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('USE_POINT')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `use_point` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('POINT_AMOUNT')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `point_amount` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('DISCOUNT')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `discount` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('DELIVERY_FEE')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `delivery_fee` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('PARAM')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `param` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('EXPRESS_INFO')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `express_info` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('REMARK')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `remark` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('PAY_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `pay_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('PAY_STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `pay_status` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('STAFF_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `staff_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('CONFIRM_STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `confirm_status` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('CONFIRM_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `confirm_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('CONFIRM_REMARK')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `confirm_remark` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('COMMISSION_STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `commission_status` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('COMMISSION_USER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `commission_user_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('DELIVER_METHOD')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `deliver_method` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order') AND UPPER(COLUMN_NAME) = UPPER('RIDER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_order` ADD COLUMN `rider_id` INT NULL;
  END IF;
  -- 表 mt_order_address（10 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_order_address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `mobile` VARCHAR(255) NULL,
  `province_id` INT NULL,
  `city_id` INT NULL,
  `region_id` INT NULL,
  `detail` VARCHAR(255) NULL,
  `order_id` INT NULL,
  `user_id` INT NULL,
  `create_time` DATETIME NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order_address') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_order_address` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order_address') AND UPPER(COLUMN_NAME) = UPPER('NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_order_address` ADD COLUMN `name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order_address') AND UPPER(COLUMN_NAME) = UPPER('MOBILE')) THEN
    ALTER TABLE `bahar-db`.`mt_order_address` ADD COLUMN `mobile` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order_address') AND UPPER(COLUMN_NAME) = UPPER('PROVINCE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_order_address` ADD COLUMN `province_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order_address') AND UPPER(COLUMN_NAME) = UPPER('CITY_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_order_address` ADD COLUMN `city_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order_address') AND UPPER(COLUMN_NAME) = UPPER('REGION_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_order_address` ADD COLUMN `region_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order_address') AND UPPER(COLUMN_NAME) = UPPER('DETAIL')) THEN
    ALTER TABLE `bahar-db`.`mt_order_address` ADD COLUMN `detail` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order_address') AND UPPER(COLUMN_NAME) = UPPER('ORDER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_order_address` ADD COLUMN `order_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order_address') AND UPPER(COLUMN_NAME) = UPPER('USER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_order_address` ADD COLUMN `user_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order_address') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_order_address` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  -- 表 mt_order_goods（10 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_order_goods` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NULL,
  `goods_id` INT NULL,
  `sku_id` INT NULL,
  `price` DECIMAL(12,2) NULL,
  `discount` DECIMAL(12,2) NULL,
  `num` DECIMAL(20,6) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order_goods') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_order_goods` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order_goods') AND UPPER(COLUMN_NAME) = UPPER('ORDER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_order_goods` ADD COLUMN `order_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order_goods') AND UPPER(COLUMN_NAME) = UPPER('GOODS_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_order_goods` ADD COLUMN `goods_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order_goods') AND UPPER(COLUMN_NAME) = UPPER('SKU_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_order_goods` ADD COLUMN `sku_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order_goods') AND UPPER(COLUMN_NAME) = UPPER('PRICE')) THEN
    ALTER TABLE `bahar-db`.`mt_order_goods` ADD COLUMN `price` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order_goods') AND UPPER(COLUMN_NAME) = UPPER('DISCOUNT')) THEN
    ALTER TABLE `bahar-db`.`mt_order_goods` ADD COLUMN `discount` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order_goods') AND UPPER(COLUMN_NAME) = UPPER('NUM')) THEN
    ALTER TABLE `bahar-db`.`mt_order_goods` ADD COLUMN `num` DECIMAL(20,6) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order_goods') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_order_goods` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order_goods') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_order_goods` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_order_goods') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_order_goods` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_point（11 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_point` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `user_id` INT NULL,
  `order_sn` VARCHAR(255) NULL,
  `amount` INT NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `description` VARCHAR(255) NULL,
  `operator` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_point') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_point` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_point') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_point` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_point') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_point` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_point') AND UPPER(COLUMN_NAME) = UPPER('USER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_point` ADD COLUMN `user_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_point') AND UPPER(COLUMN_NAME) = UPPER('ORDER_SN')) THEN
    ALTER TABLE `bahar-db`.`mt_point` ADD COLUMN `order_sn` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_point') AND UPPER(COLUMN_NAME) = UPPER('AMOUNT')) THEN
    ALTER TABLE `bahar-db`.`mt_point` ADD COLUMN `amount` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_point') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_point` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_point') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_point` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_point') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_point` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_point') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_point` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_point') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_point` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_printer（14 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_printer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `sn` VARCHAR(255) NULL,
  `type` VARCHAR(255) NULL,
  `name` VARCHAR(255) NULL,
  `auto_print` VARCHAR(255) NULL,
  `before_pay` VARCHAR(255) NULL,
  `after_pay` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `description` VARCHAR(255) NULL,
  `operator` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_printer') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_printer` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_printer') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_printer` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_printer') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_printer` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_printer') AND UPPER(COLUMN_NAME) = UPPER('SN')) THEN
    ALTER TABLE `bahar-db`.`mt_printer` ADD COLUMN `sn` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_printer') AND UPPER(COLUMN_NAME) = UPPER('TYPE')) THEN
    ALTER TABLE `bahar-db`.`mt_printer` ADD COLUMN `type` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_printer') AND UPPER(COLUMN_NAME) = UPPER('NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_printer` ADD COLUMN `name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_printer') AND UPPER(COLUMN_NAME) = UPPER('AUTO_PRINT')) THEN
    ALTER TABLE `bahar-db`.`mt_printer` ADD COLUMN `auto_print` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_printer') AND UPPER(COLUMN_NAME) = UPPER('BEFORE_PAY')) THEN
    ALTER TABLE `bahar-db`.`mt_printer` ADD COLUMN `before_pay` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_printer') AND UPPER(COLUMN_NAME) = UPPER('AFTER_PAY')) THEN
    ALTER TABLE `bahar-db`.`mt_printer` ADD COLUMN `after_pay` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_printer') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_printer` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_printer') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_printer` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_printer') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_printer` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_printer') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_printer` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_printer') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_printer` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_refund（16 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_refund` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NULL,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `user_id` INT NULL,
  `amount` DECIMAL(12,2) NULL,
  `type` VARCHAR(255) NULL,
  `remark` VARCHAR(255) NULL,
  `express_name` VARCHAR(255) NULL,
  `express_no` VARCHAR(255) NULL,
  `reject_reason` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `status` VARCHAR(255) NULL,
  `images` VARCHAR(255) NULL,
  `operator` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_refund') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_refund` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_refund') AND UPPER(COLUMN_NAME) = UPPER('ORDER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_refund` ADD COLUMN `order_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_refund') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_refund` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_refund') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_refund` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_refund') AND UPPER(COLUMN_NAME) = UPPER('USER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_refund` ADD COLUMN `user_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_refund') AND UPPER(COLUMN_NAME) = UPPER('AMOUNT')) THEN
    ALTER TABLE `bahar-db`.`mt_refund` ADD COLUMN `amount` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_refund') AND UPPER(COLUMN_NAME) = UPPER('TYPE')) THEN
    ALTER TABLE `bahar-db`.`mt_refund` ADD COLUMN `type` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_refund') AND UPPER(COLUMN_NAME) = UPPER('REMARK')) THEN
    ALTER TABLE `bahar-db`.`mt_refund` ADD COLUMN `remark` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_refund') AND UPPER(COLUMN_NAME) = UPPER('EXPRESS_NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_refund` ADD COLUMN `express_name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_refund') AND UPPER(COLUMN_NAME) = UPPER('EXPRESS_NO')) THEN
    ALTER TABLE `bahar-db`.`mt_refund` ADD COLUMN `express_no` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_refund') AND UPPER(COLUMN_NAME) = UPPER('REJECT_REASON')) THEN
    ALTER TABLE `bahar-db`.`mt_refund` ADD COLUMN `reject_reason` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_refund') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_refund` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_refund') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_refund` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_refund') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_refund` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_refund') AND UPPER(COLUMN_NAME) = UPPER('IMAGES')) THEN
    ALTER TABLE `bahar-db`.`mt_refund` ADD COLUMN `images` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_refund') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_refund` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_region（5 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_region` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `pid` INT NULL,
  `code` VARCHAR(255) NULL,
  `level` INT NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_region') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_region` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_region') AND UPPER(COLUMN_NAME) = UPPER('NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_region` ADD COLUMN `name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_region') AND UPPER(COLUMN_NAME) = UPPER('PID')) THEN
    ALTER TABLE `bahar-db`.`mt_region` ADD COLUMN `pid` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_region') AND UPPER(COLUMN_NAME) = UPPER('CODE')) THEN
    ALTER TABLE `bahar-db`.`mt_region` ADD COLUMN `code` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_region') AND UPPER(COLUMN_NAME) = UPPER('LEVEL')) THEN
    ALTER TABLE `bahar-db`.`mt_region` ADD COLUMN `level` INT NULL;
  END IF;
  -- 表 mt_rider（13 列，缺失则建表）
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
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_rider` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider') AND UPPER(COLUMN_NAME) = UPPER('USER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_rider` ADD COLUMN `user_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider') AND UPPER(COLUMN_NAME) = UPPER('RIDER_NO')) THEN
    ALTER TABLE `bahar-db`.`mt_rider` ADD COLUMN `rider_no` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_rider` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_rider` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider') AND UPPER(COLUMN_NAME) = UPPER('ID_CARD')) THEN
    ALTER TABLE `bahar-db`.`mt_rider` ADD COLUMN `id_card` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider') AND UPPER(COLUMN_NAME) = UPPER('ID_CARD_FRONT')) THEN
    ALTER TABLE `bahar-db`.`mt_rider` ADD COLUMN `id_card_front` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider') AND UPPER(COLUMN_NAME) = UPPER('ID_CARD_BACK')) THEN
    ALTER TABLE `bahar-db`.`mt_rider` ADD COLUMN `id_card_back` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider') AND UPPER(COLUMN_NAME) = UPPER('HEALTH_CERT')) THEN
    ALTER TABLE `bahar-db`.`mt_rider` ADD COLUMN `health_cert` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_rider` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_rider` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_rider` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_rider` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  -- 表 mt_rider_order（14 列，缺失则建表）
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
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider_order') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_rider_order` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider_order') AND UPPER(COLUMN_NAME) = UPPER('ORDER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_rider_order` ADD COLUMN `order_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider_order') AND UPPER(COLUMN_NAME) = UPPER('RIDER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_rider_order` ADD COLUMN `rider_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider_order') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_rider_order` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider_order') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_rider_order` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider_order') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_rider_order` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider_order') AND UPPER(COLUMN_NAME) = UPPER('ACCEPT_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_rider_order` ADD COLUMN `accept_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider_order') AND UPPER(COLUMN_NAME) = UPPER('PICKUP_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_rider_order` ADD COLUMN `pickup_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider_order') AND UPPER(COLUMN_NAME) = UPPER('DELIVER_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_rider_order` ADD COLUMN `deliver_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider_order') AND UPPER(COLUMN_NAME) = UPPER('COMPLETE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_rider_order` ADD COLUMN `complete_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider_order') AND UPPER(COLUMN_NAME) = UPPER('DELIVERY_FEE')) THEN
    ALTER TABLE `bahar-db`.`mt_rider_order` ADD COLUMN `delivery_fee` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider_order') AND UPPER(COLUMN_NAME) = UPPER('REMARK')) THEN
    ALTER TABLE `bahar-db`.`mt_rider_order` ADD COLUMN `remark` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider_order') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_rider_order` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_rider_order') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_rider_order` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  -- 表 mt_send_log（18 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_send_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `type` INT NULL,
  `user_id` INT NULL,
  `file_name` VARCHAR(255) NULL,
  `file_path` VARCHAR(255) NULL,
  `mobile` VARCHAR(255) NULL,
  `group_id` INT NULL,
  `group_name` VARCHAR(255) NULL,
  `coupon_id` INT NULL,
  `send_num` INT NULL,
  `create_time` DATETIME NULL,
  `operator` VARCHAR(255) NULL,
  `uuid` VARCHAR(255) NULL,
  `remove_success_num` INT NULL,
  `remove_fail_num` INT NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_send_log') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_send_log` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_send_log') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_send_log` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_send_log') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_send_log` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_send_log') AND UPPER(COLUMN_NAME) = UPPER('TYPE')) THEN
    ALTER TABLE `bahar-db`.`mt_send_log` ADD COLUMN `type` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_send_log') AND UPPER(COLUMN_NAME) = UPPER('USER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_send_log` ADD COLUMN `user_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_send_log') AND UPPER(COLUMN_NAME) = UPPER('FILE_NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_send_log` ADD COLUMN `file_name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_send_log') AND UPPER(COLUMN_NAME) = UPPER('FILE_PATH')) THEN
    ALTER TABLE `bahar-db`.`mt_send_log` ADD COLUMN `file_path` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_send_log') AND UPPER(COLUMN_NAME) = UPPER('MOBILE')) THEN
    ALTER TABLE `bahar-db`.`mt_send_log` ADD COLUMN `mobile` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_send_log') AND UPPER(COLUMN_NAME) = UPPER('GROUP_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_send_log` ADD COLUMN `group_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_send_log') AND UPPER(COLUMN_NAME) = UPPER('GROUP_NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_send_log` ADD COLUMN `group_name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_send_log') AND UPPER(COLUMN_NAME) = UPPER('COUPON_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_send_log` ADD COLUMN `coupon_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_send_log') AND UPPER(COLUMN_NAME) = UPPER('SEND_NUM')) THEN
    ALTER TABLE `bahar-db`.`mt_send_log` ADD COLUMN `send_num` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_send_log') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_send_log` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_send_log') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_send_log` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_send_log') AND UPPER(COLUMN_NAME) = UPPER('UUID')) THEN
    ALTER TABLE `bahar-db`.`mt_send_log` ADD COLUMN `uuid` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_send_log') AND UPPER(COLUMN_NAME) = UPPER('REMOVE_SUCCESS_NUM')) THEN
    ALTER TABLE `bahar-db`.`mt_send_log` ADD COLUMN `remove_success_num` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_send_log') AND UPPER(COLUMN_NAME) = UPPER('REMOVE_FAIL_NUM')) THEN
    ALTER TABLE `bahar-db`.`mt_send_log` ADD COLUMN `remove_fail_num` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_send_log') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_send_log` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_setting（11 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_setting` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `type` VARCHAR(255) NULL,
  `name` VARCHAR(255) NULL,
  `value` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `operator` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_setting') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_setting` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_setting') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_setting` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_setting') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_setting` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_setting') AND UPPER(COLUMN_NAME) = UPPER('TYPE')) THEN
    ALTER TABLE `bahar-db`.`mt_setting` ADD COLUMN `type` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_setting') AND UPPER(COLUMN_NAME) = UPPER('NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_setting` ADD COLUMN `name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_setting') AND UPPER(COLUMN_NAME) = UPPER('VALUE')) THEN
    ALTER TABLE `bahar-db`.`mt_setting` ADD COLUMN `value` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_setting') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_setting` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_setting') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_setting` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_setting') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_setting` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_setting') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_setting` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_setting') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_setting` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_settlement（13 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_settlement` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `settlement_no` VARCHAR(255) NULL,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `settle_rate` DECIMAL(12,2) NULL,
  `total_order_amount` DECIMAL(12,2) NULL,
  `amount` DECIMAL(12,2) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `description` VARCHAR(255) NULL,
  `operator` VARCHAR(255) NULL,
  `pay_status` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_settlement') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_settlement` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_settlement') AND UPPER(COLUMN_NAME) = UPPER('SETTLEMENT_NO')) THEN
    ALTER TABLE `bahar-db`.`mt_settlement` ADD COLUMN `settlement_no` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_settlement') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_settlement` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_settlement') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_settlement` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_settlement') AND UPPER(COLUMN_NAME) = UPPER('SETTLE_RATE')) THEN
    ALTER TABLE `bahar-db`.`mt_settlement` ADD COLUMN `settle_rate` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_settlement') AND UPPER(COLUMN_NAME) = UPPER('TOTAL_ORDER_AMOUNT')) THEN
    ALTER TABLE `bahar-db`.`mt_settlement` ADD COLUMN `total_order_amount` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_settlement') AND UPPER(COLUMN_NAME) = UPPER('AMOUNT')) THEN
    ALTER TABLE `bahar-db`.`mt_settlement` ADD COLUMN `amount` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_settlement') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_settlement` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_settlement') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_settlement` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_settlement') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_settlement` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_settlement') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_settlement` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_settlement') AND UPPER(COLUMN_NAME) = UPPER('PAY_STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_settlement` ADD COLUMN `pay_status` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_settlement') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_settlement` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_settlement_order（8 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_settlement_order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `settlement_id` INT NULL,
  `order_id` INT NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `description` VARCHAR(255) NULL,
  `operator` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_settlement_order') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_settlement_order` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_settlement_order') AND UPPER(COLUMN_NAME) = UPPER('SETTLEMENT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_settlement_order` ADD COLUMN `settlement_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_settlement_order') AND UPPER(COLUMN_NAME) = UPPER('ORDER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_settlement_order` ADD COLUMN `order_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_settlement_order') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_settlement_order` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_settlement_order') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_settlement_order` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_settlement_order') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_settlement_order` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_settlement_order') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_settlement_order` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_settlement_order') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_settlement_order` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_sms_sended_log（8 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_sms_sended_log` (
  `log_id` INT NOT NULL AUTO_INCREMENT,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `mobile_phone` VARCHAR(255) NULL,
  `content` VARCHAR(255) NULL,
  `send_time` DATETIME NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  PRIMARY KEY (`log_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_sms_sended_log') AND UPPER(COLUMN_NAME) = UPPER('LOG_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_sms_sended_log` ADD COLUMN `log_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_sms_sended_log') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_sms_sended_log` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_sms_sended_log') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_sms_sended_log` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_sms_sended_log') AND UPPER(COLUMN_NAME) = UPPER('MOBILE_PHONE')) THEN
    ALTER TABLE `bahar-db`.`mt_sms_sended_log` ADD COLUMN `mobile_phone` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_sms_sended_log') AND UPPER(COLUMN_NAME) = UPPER('CONTENT')) THEN
    ALTER TABLE `bahar-db`.`mt_sms_sended_log` ADD COLUMN `content` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_sms_sended_log') AND UPPER(COLUMN_NAME) = UPPER('SEND_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_sms_sended_log` ADD COLUMN `send_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_sms_sended_log') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_sms_sended_log` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_sms_sended_log') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_sms_sended_log` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  -- 表 mt_sms_template（11 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_sms_template` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `name` VARCHAR(255) NULL,
  `uname` VARCHAR(255) NULL,
  `code` VARCHAR(255) NULL,
  `content` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `operator` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_sms_template') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_sms_template` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_sms_template') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_sms_template` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_sms_template') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_sms_template` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_sms_template') AND UPPER(COLUMN_NAME) = UPPER('NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_sms_template` ADD COLUMN `name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_sms_template') AND UPPER(COLUMN_NAME) = UPPER('UNAME')) THEN
    ALTER TABLE `bahar-db`.`mt_sms_template` ADD COLUMN `uname` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_sms_template') AND UPPER(COLUMN_NAME) = UPPER('CODE')) THEN
    ALTER TABLE `bahar-db`.`mt_sms_template` ADD COLUMN `code` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_sms_template') AND UPPER(COLUMN_NAME) = UPPER('CONTENT')) THEN
    ALTER TABLE `bahar-db`.`mt_sms_template` ADD COLUMN `content` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_sms_template') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_sms_template` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_sms_template') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_sms_template` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_sms_template') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_sms_template` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_sms_template') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_sms_template` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_staff（13 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_staff` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category` INT NULL,
  `user_id` INT NULL,
  `mobile` VARCHAR(255) NULL,
  `real_name` VARCHAR(255) NULL,
  `wechat` VARCHAR(255) NULL,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `audited_status` VARCHAR(255) NULL,
  `audited_time` DATETIME NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_staff') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_staff` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_staff') AND UPPER(COLUMN_NAME) = UPPER('CATEGORY')) THEN
    ALTER TABLE `bahar-db`.`mt_staff` ADD COLUMN `category` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_staff') AND UPPER(COLUMN_NAME) = UPPER('USER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_staff` ADD COLUMN `user_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_staff') AND UPPER(COLUMN_NAME) = UPPER('MOBILE')) THEN
    ALTER TABLE `bahar-db`.`mt_staff` ADD COLUMN `mobile` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_staff') AND UPPER(COLUMN_NAME) = UPPER('REAL_NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_staff` ADD COLUMN `real_name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_staff') AND UPPER(COLUMN_NAME) = UPPER('WECHAT')) THEN
    ALTER TABLE `bahar-db`.`mt_staff` ADD COLUMN `wechat` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_staff') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_staff` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_staff') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_staff` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_staff') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_staff` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_staff') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_staff` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_staff') AND UPPER(COLUMN_NAME) = UPPER('AUDITED_STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_staff` ADD COLUMN `audited_status` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_staff') AND UPPER(COLUMN_NAME) = UPPER('AUDITED_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_staff` ADD COLUMN `audited_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_staff') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_staff` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_stock（9 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_stock` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `type` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `operator` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_stock') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_stock` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_stock') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_stock` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_stock') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_stock` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_stock') AND UPPER(COLUMN_NAME) = UPPER('TYPE')) THEN
    ALTER TABLE `bahar-db`.`mt_stock` ADD COLUMN `type` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_stock') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_stock` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_stock') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_stock` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_stock') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_stock` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_stock') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_stock` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_stock') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_stock` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_stock_item（9 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_stock_item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `stock_id` INT NULL,
  `goods_id` INT NULL,
  `sku_id` INT NULL,
  `num` DECIMAL(20,6) NULL,
  `description` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_stock_item') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_stock_item` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_stock_item') AND UPPER(COLUMN_NAME) = UPPER('STOCK_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_stock_item` ADD COLUMN `stock_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_stock_item') AND UPPER(COLUMN_NAME) = UPPER('GOODS_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_stock_item` ADD COLUMN `goods_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_stock_item') AND UPPER(COLUMN_NAME) = UPPER('SKU_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_stock_item` ADD COLUMN `sku_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_stock_item') AND UPPER(COLUMN_NAME) = UPPER('NUM')) THEN
    ALTER TABLE `bahar-db`.`mt_stock_item` ADD COLUMN `num` DECIMAL(20,6) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_stock_item') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_stock_item` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_stock_item') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_stock_item` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_stock_item') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_stock_item` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_stock_item') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_stock_item` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_store（29 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_store` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `merchant_id` INT NULL,
  `name` VARCHAR(255) NULL,
  `logo` VARCHAR(255) NULL,
  `qr_code` VARCHAR(255) NULL,
  `is_default` VARCHAR(255) NULL,
  `contact` VARCHAR(255) NULL,
  `wx_mch_id` VARCHAR(255) NULL,
  `wx_api_v2` VARCHAR(255) NULL,
  `wx_cert_path` VARCHAR(255) NULL,
  `alipay_app_id` VARCHAR(255) NULL,
  `alipay_private_key` VARCHAR(255) NULL,
  `alipay_public_key` VARCHAR(255) NULL,
  `phone` VARCHAR(255) NULL,
  `address` VARCHAR(255) NULL,
  `latitude` VARCHAR(255) NULL,
  `longitude` VARCHAR(255) NULL,
  `distance` DECIMAL(12,2) NULL,
  `hours` VARCHAR(255) NULL,
  `license` VARCHAR(255) NULL,
  `credit_code` VARCHAR(255) NULL,
  `bank_name` VARCHAR(255) NULL,
  `bank_card_name` VARCHAR(255) NULL,
  `bank_card_no` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `status` VARCHAR(255) NULL,
  `operator` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('LOGO')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `logo` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('QR_CODE')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `qr_code` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('IS_DEFAULT')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `is_default` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('CONTACT')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `contact` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('WX_MCH_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `wx_mch_id` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('WX_API_V2')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `wx_api_v2` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('WX_CERT_PATH')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `wx_cert_path` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('ALIPAY_APP_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `alipay_app_id` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('ALIPAY_PRIVATE_KEY')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `alipay_private_key` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('ALIPAY_PUBLIC_KEY')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `alipay_public_key` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('PHONE')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `phone` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('ADDRESS')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `address` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('LATITUDE')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `latitude` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('LONGITUDE')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `longitude` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('DISTANCE')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `distance` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('HOURS')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `hours` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('LICENSE')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `license` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('CREDIT_CODE')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `credit_code` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('BANK_NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `bank_name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('BANK_CARD_NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `bank_card_name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('BANK_CARD_NO')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `bank_card_no` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_store` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_store_goods（8 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_store_goods` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `goods_id` INT NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `status` VARCHAR(255) NULL,
  `operator` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store_goods') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_store_goods` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store_goods') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_store_goods` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store_goods') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_store_goods` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store_goods') AND UPPER(COLUMN_NAME) = UPPER('GOODS_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_store_goods` ADD COLUMN `goods_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store_goods') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_store_goods` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store_goods') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_store_goods` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store_goods') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_store_goods` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_store_goods') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_store_goods` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_table（14 列，缺失则建表）
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
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_table') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_table` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_table') AND UPPER(COLUMN_NAME) = UPPER('CODE')) THEN
    ALTER TABLE `bahar-db`.`mt_table` ADD COLUMN `code` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_table') AND UPPER(COLUMN_NAME) = UPPER('AREA_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_table` ADD COLUMN `area_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_table') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_table` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_table') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_table` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_table') AND UPPER(COLUMN_NAME) = UPPER('MAX_PEOPLE')) THEN
    ALTER TABLE `bahar-db`.`mt_table` ADD COLUMN `max_people` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_table') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_table` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_table') AND UPPER(COLUMN_NAME) = UPPER('USE_STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_table` ADD COLUMN `use_status` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_table') AND UPPER(COLUMN_NAME) = UPPER('USE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_table` ADD COLUMN `use_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_table') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_table` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_table') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_table` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_table') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_table` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_table') AND UPPER(COLUMN_NAME) = UPPER('SORT')) THEN
    ALTER TABLE `bahar-db`.`mt_table` ADD COLUMN `sort` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_table') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_table` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_table_area（10 列，缺失则建表）
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
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_table_area') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_table_area` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_table_area') AND UPPER(COLUMN_NAME) = UPPER('NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_table_area` ADD COLUMN `name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_table_area') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_table_area` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_table_area') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_table_area` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_table_area') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_table_area` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_table_area') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_table_area` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_table_area') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_table_area` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_table_area') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_table_area` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_table_area') AND UPPER(COLUMN_NAME) = UPPER('SORT')) THEN
    ALTER TABLE `bahar-db`.`mt_table_area` ADD COLUMN `sort` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_table_area') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_table_area` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_upload_shipping_log（10 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_upload_shipping_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `order_id` INT NULL,
  `order_sn` VARCHAR(255) NULL,
  `mobile` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `operator` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_upload_shipping_log') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_upload_shipping_log` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_upload_shipping_log') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_upload_shipping_log` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_upload_shipping_log') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_upload_shipping_log` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_upload_shipping_log') AND UPPER(COLUMN_NAME) = UPPER('ORDER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_upload_shipping_log` ADD COLUMN `order_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_upload_shipping_log') AND UPPER(COLUMN_NAME) = UPPER('ORDER_SN')) THEN
    ALTER TABLE `bahar-db`.`mt_upload_shipping_log` ADD COLUMN `order_sn` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_upload_shipping_log') AND UPPER(COLUMN_NAME) = UPPER('MOBILE')) THEN
    ALTER TABLE `bahar-db`.`mt_upload_shipping_log` ADD COLUMN `mobile` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_upload_shipping_log') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_upload_shipping_log` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_upload_shipping_log') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_upload_shipping_log` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_upload_shipping_log') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_upload_shipping_log` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_upload_shipping_log') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_upload_shipping_log` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_user（30 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_no` VARCHAR(255) NULL,
  `avatar` VARCHAR(255) NULL,
  `group_id` INT NULL,
  `name` VARCHAR(255) NULL,
  `open_id` VARCHAR(255) NULL,
  `mobile` VARCHAR(255) NULL,
  `idcard` VARCHAR(255) NULL,
  `grade_id` INT NULL,
  `start_time` DATETIME NULL,
  `end_time` DATETIME NULL,
  `balance` DECIMAL(12,2) NULL,
  `point` INT NULL,
  `sex` INT NULL,
  `birthday` VARCHAR(255) NULL,
  `car_no` VARCHAR(255) NULL,
  `source` VARCHAR(255) NULL,
  `password` VARCHAR(255) NULL,
  `salt` VARCHAR(255) NULL,
  `address` VARCHAR(255) NULL,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `is_staff` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `status` VARCHAR(255) NULL,
  `profile_completed` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `operator` VARCHAR(255) NULL,
  `is_rider` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('USER_NO')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `user_no` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('AVATAR')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `avatar` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('GROUP_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `group_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('OPEN_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `open_id` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('MOBILE')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `mobile` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('IDCARD')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `idcard` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('GRADE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `grade_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('START_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `start_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('END_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `end_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('BALANCE')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `balance` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('POINT')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `point` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('SEX')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `sex` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('BIRTHDAY')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `birthday` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('CAR_NO')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `car_no` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('SOURCE')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `source` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('PASSWORD')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `password` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('SALT')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `salt` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('ADDRESS')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `address` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('IS_STAFF')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `is_staff` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('PROFILE_COMPLETED')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `profile_completed` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user') AND UPPER(COLUMN_NAME) = UPPER('IS_RIDER')) THEN
    ALTER TABLE `bahar-db`.`mt_user` ADD COLUMN `is_rider` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_user_action（11 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_user_action` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `action` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `param` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `status` VARCHAR(255) NULL,
  `operator` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_action') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user_action` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_action') AND UPPER(COLUMN_NAME) = UPPER('USER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user_action` ADD COLUMN `user_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_action') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user_action` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_action') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user_action` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_action') AND UPPER(COLUMN_NAME) = UPPER('ACTION')) THEN
    ALTER TABLE `bahar-db`.`mt_user_action` ADD COLUMN `action` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_action') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_user_action` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_action') AND UPPER(COLUMN_NAME) = UPPER('PARAM')) THEN
    ALTER TABLE `bahar-db`.`mt_user_action` ADD COLUMN `param` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_action') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_user_action` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_action') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_user_action` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_action') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_user_action` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_action') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_user_action` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_user_coupon（20 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_user_coupon` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(255) NULL,
  `type` VARCHAR(255) NULL,
  `image` VARCHAR(255) NULL,
  `group_id` INT NULL,
  `coupon_id` INT NULL,
  `mobile` VARCHAR(255) NULL,
  `user_id` INT NULL,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `amount` DECIMAL(12,2) NULL,
  `balance` DECIMAL(12,2) NULL,
  `status` VARCHAR(255) NULL,
  `used_time` DATETIME NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `expire_time` DATETIME NULL,
  `operator` VARCHAR(255) NULL,
  `uuid` VARCHAR(255) NULL,
  `order_id` INT NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_coupon') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user_coupon` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_coupon') AND UPPER(COLUMN_NAME) = UPPER('CODE')) THEN
    ALTER TABLE `bahar-db`.`mt_user_coupon` ADD COLUMN `code` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_coupon') AND UPPER(COLUMN_NAME) = UPPER('TYPE')) THEN
    ALTER TABLE `bahar-db`.`mt_user_coupon` ADD COLUMN `type` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_coupon') AND UPPER(COLUMN_NAME) = UPPER('IMAGE')) THEN
    ALTER TABLE `bahar-db`.`mt_user_coupon` ADD COLUMN `image` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_coupon') AND UPPER(COLUMN_NAME) = UPPER('GROUP_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user_coupon` ADD COLUMN `group_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_coupon') AND UPPER(COLUMN_NAME) = UPPER('COUPON_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user_coupon` ADD COLUMN `coupon_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_coupon') AND UPPER(COLUMN_NAME) = UPPER('MOBILE')) THEN
    ALTER TABLE `bahar-db`.`mt_user_coupon` ADD COLUMN `mobile` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_coupon') AND UPPER(COLUMN_NAME) = UPPER('USER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user_coupon` ADD COLUMN `user_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_coupon') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user_coupon` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_coupon') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user_coupon` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_coupon') AND UPPER(COLUMN_NAME) = UPPER('AMOUNT')) THEN
    ALTER TABLE `bahar-db`.`mt_user_coupon` ADD COLUMN `amount` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_coupon') AND UPPER(COLUMN_NAME) = UPPER('BALANCE')) THEN
    ALTER TABLE `bahar-db`.`mt_user_coupon` ADD COLUMN `balance` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_coupon') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_user_coupon` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_coupon') AND UPPER(COLUMN_NAME) = UPPER('USED_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_user_coupon` ADD COLUMN `used_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_coupon') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_user_coupon` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_coupon') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_user_coupon` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_coupon') AND UPPER(COLUMN_NAME) = UPPER('EXPIRE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_user_coupon` ADD COLUMN `expire_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_coupon') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_user_coupon` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_coupon') AND UPPER(COLUMN_NAME) = UPPER('UUID')) THEN
    ALTER TABLE `bahar-db`.`mt_user_coupon` ADD COLUMN `uuid` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_coupon') AND UPPER(COLUMN_NAME) = UPPER('ORDER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user_coupon` ADD COLUMN `order_id` INT NULL;
  END IF;
  -- 表 mt_user_grade（12 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_user_grade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `merchant_id` INT NULL,
  `grade` INT NULL,
  `name` VARCHAR(255) NULL,
  `catch_condition` VARCHAR(255) NULL,
  `catch_type` VARCHAR(255) NULL,
  `catch_value` DECIMAL(12,2) NULL,
  `user_privilege` VARCHAR(255) NULL,
  `valid_day` INT NULL,
  `discount` DECIMAL(12,4) NULL,
  `speed_point` DECIMAL(12,4) NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_grade') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user_grade` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_grade') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user_grade` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_grade') AND UPPER(COLUMN_NAME) = UPPER('GRADE')) THEN
    ALTER TABLE `bahar-db`.`mt_user_grade` ADD COLUMN `grade` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_grade') AND UPPER(COLUMN_NAME) = UPPER('NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_user_grade` ADD COLUMN `name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_grade') AND UPPER(COLUMN_NAME) = UPPER('CATCH_CONDITION')) THEN
    ALTER TABLE `bahar-db`.`mt_user_grade` ADD COLUMN `catch_condition` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_grade') AND UPPER(COLUMN_NAME) = UPPER('CATCH_TYPE')) THEN
    ALTER TABLE `bahar-db`.`mt_user_grade` ADD COLUMN `catch_type` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_grade') AND UPPER(COLUMN_NAME) = UPPER('CATCH_VALUE')) THEN
    ALTER TABLE `bahar-db`.`mt_user_grade` ADD COLUMN `catch_value` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_grade') AND UPPER(COLUMN_NAME) = UPPER('USER_PRIVILEGE')) THEN
    ALTER TABLE `bahar-db`.`mt_user_grade` ADD COLUMN `user_privilege` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_grade') AND UPPER(COLUMN_NAME) = UPPER('VALID_DAY')) THEN
    ALTER TABLE `bahar-db`.`mt_user_grade` ADD COLUMN `valid_day` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_grade') AND UPPER(COLUMN_NAME) = UPPER('DISCOUNT')) THEN
    ALTER TABLE `bahar-db`.`mt_user_grade` ADD COLUMN `discount` DECIMAL(12,4) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_grade') AND UPPER(COLUMN_NAME) = UPPER('SPEED_POINT')) THEN
    ALTER TABLE `bahar-db`.`mt_user_grade` ADD COLUMN `speed_point` DECIMAL(12,4) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_grade') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_user_grade` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_user_group（10 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_user_group` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `parent_id` INT NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `status` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `operator` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_group') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user_group` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_group') AND UPPER(COLUMN_NAME) = UPPER('NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_user_group` ADD COLUMN `name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_group') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user_group` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_group') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user_group` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_group') AND UPPER(COLUMN_NAME) = UPPER('PARENT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user_group` ADD COLUMN `parent_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_group') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_user_group` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_group') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_user_group` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_group') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_user_group` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_group') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_user_group` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_group') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_user_group` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_user_tag（10 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_user_tag` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `merchant_id` INT NULL,
  `name` VARCHAR(255) NULL,
  `color` VARCHAR(255) NULL,
  `sort` INT NULL,
  `description` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `operator` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag') AND UPPER(COLUMN_NAME) = UPPER('NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag` ADD COLUMN `name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag') AND UPPER(COLUMN_NAME) = UPPER('COLOR')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag` ADD COLUMN `color` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag') AND UPPER(COLUMN_NAME) = UPPER('SORT')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag` ADD COLUMN `sort` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_user_tag_relation（5 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_user_tag_relation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `tag_id` INT NULL,
  `create_time` DATETIME NULL,
  `operator` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag_relation') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag_relation` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag_relation') AND UPPER(COLUMN_NAME) = UPPER('USER_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag_relation` ADD COLUMN `user_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag_relation') AND UPPER(COLUMN_NAME) = UPPER('TAG_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag_relation` ADD COLUMN `tag_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag_relation') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag_relation` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag_relation') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag_relation` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_user_tag_rule（16 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_user_tag_rule` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `merchant_id` INT NULL,
  `tag_id` INT NULL,
  `rule_name` VARCHAR(255) NULL,
  `rule_type` VARCHAR(255) NULL,
  `time_range` VARCHAR(255) NULL,
  `operator_type` VARCHAR(255) NULL,
  `threshold_value` DECIMAL(12,2) NULL,
  `threshold_max` DECIMAL(12,2) NULL,
  `description` VARCHAR(255) NULL,
  `is_auto` VARCHAR(255) NULL,
  `priority` INT NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `operator` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag_rule') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag_rule` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag_rule') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag_rule` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag_rule') AND UPPER(COLUMN_NAME) = UPPER('TAG_ID')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag_rule` ADD COLUMN `tag_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag_rule') AND UPPER(COLUMN_NAME) = UPPER('RULE_NAME')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag_rule` ADD COLUMN `rule_name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag_rule') AND UPPER(COLUMN_NAME) = UPPER('RULE_TYPE')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag_rule` ADD COLUMN `rule_type` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag_rule') AND UPPER(COLUMN_NAME) = UPPER('TIME_RANGE')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag_rule` ADD COLUMN `time_range` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag_rule') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR_TYPE')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag_rule` ADD COLUMN `operator_type` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag_rule') AND UPPER(COLUMN_NAME) = UPPER('THRESHOLD_VALUE')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag_rule` ADD COLUMN `threshold_value` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag_rule') AND UPPER(COLUMN_NAME) = UPPER('THRESHOLD_MAX')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag_rule` ADD COLUMN `threshold_max` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag_rule') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag_rule` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag_rule') AND UPPER(COLUMN_NAME) = UPPER('IS_AUTO')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag_rule` ADD COLUMN `is_auto` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag_rule') AND UPPER(COLUMN_NAME) = UPPER('PRIORITY')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag_rule` ADD COLUMN `priority` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag_rule') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag_rule` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag_rule') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag_rule` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag_rule') AND UPPER(COLUMN_NAME) = UPPER('OPERATOR')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag_rule` ADD COLUMN `operator` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_user_tag_rule') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`mt_user_tag_rule` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 mt_verify_code（7 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`mt_verify_code` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `mobile` VARCHAR(255) NULL,
  `verify_code` VARCHAR(255) NULL,
  `add_time` DATETIME NULL,
  `expire_time` DATETIME NULL,
  `used_time` DATETIME NULL,
  `valid_flag` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_verify_code') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`mt_verify_code` ADD COLUMN `id` BIGINT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_verify_code') AND UPPER(COLUMN_NAME) = UPPER('MOBILE')) THEN
    ALTER TABLE `bahar-db`.`mt_verify_code` ADD COLUMN `mobile` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_verify_code') AND UPPER(COLUMN_NAME) = UPPER('VERIFY_CODE')) THEN
    ALTER TABLE `bahar-db`.`mt_verify_code` ADD COLUMN `verify_code` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_verify_code') AND UPPER(COLUMN_NAME) = UPPER('ADD_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_verify_code` ADD COLUMN `add_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_verify_code') AND UPPER(COLUMN_NAME) = UPPER('EXPIRE_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_verify_code` ADD COLUMN `expire_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_verify_code') AND UPPER(COLUMN_NAME) = UPPER('USED_TIME')) THEN
    ALTER TABLE `bahar-db`.`mt_verify_code` ADD COLUMN `used_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('mt_verify_code') AND UPPER(COLUMN_NAME) = UPPER('VALID_FLAG')) THEN
    ALTER TABLE `bahar-db`.`mt_verify_code` ADD COLUMN `valid_flag` VARCHAR(255) NULL;
  END IF;
  -- 表 t_account（16 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`t_account` (
  `acct_id` INT NOT NULL AUTO_INCREMENT,
  `account_key` VARCHAR(255) NULL,
  `account_name` VARCHAR(255) NULL,
  `password` VARCHAR(255) NULL,
  `account_status` INT NULL,
  `is_active` INT NULL,
  `create_date` DATETIME NULL,
  `modify_date` DATETIME NULL,
  `salt` VARCHAR(255) NULL,
  `role_ids` VARCHAR(255) NULL,
  `locked` INT NULL,
  `owner_id` INT NULL,
  `real_name` VARCHAR(255) NULL,
  `store_id` INT NULL,
  `merchant_id` INT NULL,
  `staff_id` INT NULL,
  PRIMARY KEY (`acct_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_account') AND UPPER(COLUMN_NAME) = UPPER('ACCT_ID')) THEN
    ALTER TABLE `bahar-db`.`t_account` ADD COLUMN `acct_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_account') AND UPPER(COLUMN_NAME) = UPPER('ACCOUNT_KEY')) THEN
    ALTER TABLE `bahar-db`.`t_account` ADD COLUMN `account_key` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_account') AND UPPER(COLUMN_NAME) = UPPER('ACCOUNT_NAME')) THEN
    ALTER TABLE `bahar-db`.`t_account` ADD COLUMN `account_name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_account') AND UPPER(COLUMN_NAME) = UPPER('PASSWORD')) THEN
    ALTER TABLE `bahar-db`.`t_account` ADD COLUMN `password` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_account') AND UPPER(COLUMN_NAME) = UPPER('ACCOUNT_STATUS')) THEN
    ALTER TABLE `bahar-db`.`t_account` ADD COLUMN `account_status` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_account') AND UPPER(COLUMN_NAME) = UPPER('IS_ACTIVE')) THEN
    ALTER TABLE `bahar-db`.`t_account` ADD COLUMN `is_active` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_account') AND UPPER(COLUMN_NAME) = UPPER('CREATE_DATE')) THEN
    ALTER TABLE `bahar-db`.`t_account` ADD COLUMN `create_date` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_account') AND UPPER(COLUMN_NAME) = UPPER('MODIFY_DATE')) THEN
    ALTER TABLE `bahar-db`.`t_account` ADD COLUMN `modify_date` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_account') AND UPPER(COLUMN_NAME) = UPPER('SALT')) THEN
    ALTER TABLE `bahar-db`.`t_account` ADD COLUMN `salt` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_account') AND UPPER(COLUMN_NAME) = UPPER('ROLE_IDS')) THEN
    ALTER TABLE `bahar-db`.`t_account` ADD COLUMN `role_ids` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_account') AND UPPER(COLUMN_NAME) = UPPER('LOCKED')) THEN
    ALTER TABLE `bahar-db`.`t_account` ADD COLUMN `locked` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_account') AND UPPER(COLUMN_NAME) = UPPER('OWNER_ID')) THEN
    ALTER TABLE `bahar-db`.`t_account` ADD COLUMN `owner_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_account') AND UPPER(COLUMN_NAME) = UPPER('REAL_NAME')) THEN
    ALTER TABLE `bahar-db`.`t_account` ADD COLUMN `real_name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_account') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`t_account` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_account') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`t_account` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_account') AND UPPER(COLUMN_NAME) = UPPER('STAFF_ID')) THEN
    ALTER TABLE `bahar-db`.`t_account` ADD COLUMN `staff_id` INT NULL;
  END IF;
  -- 表 t_account_duty（3 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`t_account_duty` (
  `acc_duty_id` INT NOT NULL AUTO_INCREMENT,
  `acct_id` INT NULL,
  `duty_id` INT NULL,
  PRIMARY KEY (`acc_duty_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_account_duty') AND UPPER(COLUMN_NAME) = UPPER('ACC_DUTY_ID')) THEN
    ALTER TABLE `bahar-db`.`t_account_duty` ADD COLUMN `acc_duty_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_account_duty') AND UPPER(COLUMN_NAME) = UPPER('ACCT_ID')) THEN
    ALTER TABLE `bahar-db`.`t_account_duty` ADD COLUMN `acct_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_account_duty') AND UPPER(COLUMN_NAME) = UPPER('DUTY_ID')) THEN
    ALTER TABLE `bahar-db`.`t_account_duty` ADD COLUMN `duty_id` INT NULL;
  END IF;
  -- 表 t_action_log（12 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`t_action_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `merchant_id` INT NULL,
  `store_id` INT NULL,
  `action_time` DATETIME NULL,
  `time_consuming` DECIMAL(12,2) NULL,
  `client_ip` VARCHAR(255) NULL,
  `module` VARCHAR(255) NULL,
  `url` VARCHAR(255) NULL,
  `acct_name` VARCHAR(255) NULL,
  `user_agent` VARCHAR(255) NULL,
  `client_port` INT NULL,
  `param` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_action_log') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`t_action_log` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_action_log') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`t_action_log` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_action_log') AND UPPER(COLUMN_NAME) = UPPER('STORE_ID')) THEN
    ALTER TABLE `bahar-db`.`t_action_log` ADD COLUMN `store_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_action_log') AND UPPER(COLUMN_NAME) = UPPER('ACTION_TIME')) THEN
    ALTER TABLE `bahar-db`.`t_action_log` ADD COLUMN `action_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_action_log') AND UPPER(COLUMN_NAME) = UPPER('TIME_CONSUMING')) THEN
    ALTER TABLE `bahar-db`.`t_action_log` ADD COLUMN `time_consuming` DECIMAL(12,2) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_action_log') AND UPPER(COLUMN_NAME) = UPPER('CLIENT_IP')) THEN
    ALTER TABLE `bahar-db`.`t_action_log` ADD COLUMN `client_ip` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_action_log') AND UPPER(COLUMN_NAME) = UPPER('MODULE')) THEN
    ALTER TABLE `bahar-db`.`t_action_log` ADD COLUMN `module` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_action_log') AND UPPER(COLUMN_NAME) = UPPER('URL')) THEN
    ALTER TABLE `bahar-db`.`t_action_log` ADD COLUMN `url` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_action_log') AND UPPER(COLUMN_NAME) = UPPER('ACCT_NAME')) THEN
    ALTER TABLE `bahar-db`.`t_action_log` ADD COLUMN `acct_name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_action_log') AND UPPER(COLUMN_NAME) = UPPER('USER_AGENT')) THEN
    ALTER TABLE `bahar-db`.`t_action_log` ADD COLUMN `user_agent` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_action_log') AND UPPER(COLUMN_NAME) = UPPER('CLIENT_PORT')) THEN
    ALTER TABLE `bahar-db`.`t_action_log` ADD COLUMN `client_port` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_action_log') AND UPPER(COLUMN_NAME) = UPPER('PARAM')) THEN
    ALTER TABLE `bahar-db`.`t_action_log` ADD COLUMN `param` VARCHAR(255) NULL;
  END IF;
  -- 表 t_duty（6 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`t_duty` (
  `duty_id` INT NOT NULL AUTO_INCREMENT,
  `merchant_id` INT NULL,
  `duty_name` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `duty_type` VARCHAR(255) NULL,
  PRIMARY KEY (`duty_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_duty') AND UPPER(COLUMN_NAME) = UPPER('DUTY_ID')) THEN
    ALTER TABLE `bahar-db`.`t_duty` ADD COLUMN `duty_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_duty') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`t_duty` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_duty') AND UPPER(COLUMN_NAME) = UPPER('DUTY_NAME')) THEN
    ALTER TABLE `bahar-db`.`t_duty` ADD COLUMN `duty_name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_duty') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`t_duty` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_duty') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`t_duty` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_duty') AND UPPER(COLUMN_NAME) = UPPER('DUTY_TYPE')) THEN
    ALTER TABLE `bahar-db`.`t_duty` ADD COLUMN `duty_type` VARCHAR(255) NULL;
  END IF;
  -- 表 t_duty_source（3 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`t_duty_source` (
  `duty_source_id` INT NOT NULL AUTO_INCREMENT,
  `duty_id` INT NULL,
  `source_id` INT NULL,
  PRIMARY KEY (`duty_source_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_duty_source') AND UPPER(COLUMN_NAME) = UPPER('DUTY_SOURCE_ID')) THEN
    ALTER TABLE `bahar-db`.`t_duty_source` ADD COLUMN `duty_source_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_duty_source') AND UPPER(COLUMN_NAME) = UPPER('DUTY_ID')) THEN
    ALTER TABLE `bahar-db`.`t_duty_source` ADD COLUMN `duty_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_duty_source') AND UPPER(COLUMN_NAME) = UPPER('SOURCE_ID')) THEN
    ALTER TABLE `bahar-db`.`t_duty_source` ADD COLUMN `source_id` INT NULL;
  END IF;
  -- 表 t_gen_code（13 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`t_gen_code` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `service_name` VARCHAR(255) NULL,
  `module_name` VARCHAR(255) NULL,
  `table_name` VARCHAR(255) NULL,
  `table_prefix` VARCHAR(255) NULL,
  `pk_name` VARCHAR(255) NULL,
  `package_name` VARCHAR(255) NULL,
  `backend_path` VARCHAR(255) NULL,
  `front_path` VARCHAR(255) NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `author` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_gen_code') AND UPPER(COLUMN_NAME) = UPPER('ID')) THEN
    ALTER TABLE `bahar-db`.`t_gen_code` ADD COLUMN `id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_gen_code') AND UPPER(COLUMN_NAME) = UPPER('SERVICE_NAME')) THEN
    ALTER TABLE `bahar-db`.`t_gen_code` ADD COLUMN `service_name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_gen_code') AND UPPER(COLUMN_NAME) = UPPER('MODULE_NAME')) THEN
    ALTER TABLE `bahar-db`.`t_gen_code` ADD COLUMN `module_name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_gen_code') AND UPPER(COLUMN_NAME) = UPPER('TABLE_NAME')) THEN
    ALTER TABLE `bahar-db`.`t_gen_code` ADD COLUMN `table_name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_gen_code') AND UPPER(COLUMN_NAME) = UPPER('TABLE_PREFIX')) THEN
    ALTER TABLE `bahar-db`.`t_gen_code` ADD COLUMN `table_prefix` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_gen_code') AND UPPER(COLUMN_NAME) = UPPER('PK_NAME')) THEN
    ALTER TABLE `bahar-db`.`t_gen_code` ADD COLUMN `pk_name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_gen_code') AND UPPER(COLUMN_NAME) = UPPER('PACKAGE_NAME')) THEN
    ALTER TABLE `bahar-db`.`t_gen_code` ADD COLUMN `package_name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_gen_code') AND UPPER(COLUMN_NAME) = UPPER('BACKEND_PATH')) THEN
    ALTER TABLE `bahar-db`.`t_gen_code` ADD COLUMN `backend_path` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_gen_code') AND UPPER(COLUMN_NAME) = UPPER('FRONT_PATH')) THEN
    ALTER TABLE `bahar-db`.`t_gen_code` ADD COLUMN `front_path` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_gen_code') AND UPPER(COLUMN_NAME) = UPPER('CREATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`t_gen_code` ADD COLUMN `create_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_gen_code') AND UPPER(COLUMN_NAME) = UPPER('UPDATE_TIME')) THEN
    ALTER TABLE `bahar-db`.`t_gen_code` ADD COLUMN `update_time` DATETIME NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_gen_code') AND UPPER(COLUMN_NAME) = UPPER('AUTHOR')) THEN
    ALTER TABLE `bahar-db`.`t_gen_code` ADD COLUMN `author` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_gen_code') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`t_gen_code` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  -- 表 t_platform（5 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`t_platform` (
  `owner_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `status` INT NULL,
  `description` VARCHAR(255) NULL,
  `platform_type` INT NULL,
  PRIMARY KEY (`owner_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_platform') AND UPPER(COLUMN_NAME) = UPPER('OWNER_ID')) THEN
    ALTER TABLE `bahar-db`.`t_platform` ADD COLUMN `owner_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_platform') AND UPPER(COLUMN_NAME) = UPPER('NAME')) THEN
    ALTER TABLE `bahar-db`.`t_platform` ADD COLUMN `name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_platform') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`t_platform` ADD COLUMN `status` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_platform') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`t_platform` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_platform') AND UPPER(COLUMN_NAME) = UPPER('PLATFORM_TYPE')) THEN
    ALTER TABLE `bahar-db`.`t_platform` ADD COLUMN `platform_type` INT NULL;
  END IF;
  -- 表 t_source（15 列，缺失则建表）
  CREATE TABLE IF NOT EXISTS `bahar-db`.`t_source` (
  `source_id` INT NOT NULL AUTO_INCREMENT,
  `merchant_id` INT NULL,
  `source_name` VARCHAR(255) NULL,
  `source_code` VARCHAR(255) NULL,
  `path` VARCHAR(255) NULL,
  `ename` VARCHAR(255) NULL,
  `new_icon` VARCHAR(255) NULL,
  `status` VARCHAR(255) NULL,
  `source_level` INT NULL,
  `source_style` VARCHAR(255) NULL,
  `is_menu` INT NULL,
  `description` VARCHAR(255) NULL,
  `parent_id` INT NULL,
  `is_log` INT NULL,
  `icon` VARCHAR(255) NULL,
  PRIMARY KEY (`source_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='generated from entity';
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_source') AND UPPER(COLUMN_NAME) = UPPER('SOURCE_ID')) THEN
    ALTER TABLE `bahar-db`.`t_source` ADD COLUMN `source_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_source') AND UPPER(COLUMN_NAME) = UPPER('MERCHANT_ID')) THEN
    ALTER TABLE `bahar-db`.`t_source` ADD COLUMN `merchant_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_source') AND UPPER(COLUMN_NAME) = UPPER('SOURCE_NAME')) THEN
    ALTER TABLE `bahar-db`.`t_source` ADD COLUMN `source_name` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_source') AND UPPER(COLUMN_NAME) = UPPER('SOURCE_CODE')) THEN
    ALTER TABLE `bahar-db`.`t_source` ADD COLUMN `source_code` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_source') AND UPPER(COLUMN_NAME) = UPPER('PATH')) THEN
    ALTER TABLE `bahar-db`.`t_source` ADD COLUMN `path` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_source') AND UPPER(COLUMN_NAME) = UPPER('ENAME')) THEN
    ALTER TABLE `bahar-db`.`t_source` ADD COLUMN `ename` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_source') AND UPPER(COLUMN_NAME) = UPPER('NEW_ICON')) THEN
    ALTER TABLE `bahar-db`.`t_source` ADD COLUMN `new_icon` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_source') AND UPPER(COLUMN_NAME) = UPPER('STATUS')) THEN
    ALTER TABLE `bahar-db`.`t_source` ADD COLUMN `status` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_source') AND UPPER(COLUMN_NAME) = UPPER('SOURCE_LEVEL')) THEN
    ALTER TABLE `bahar-db`.`t_source` ADD COLUMN `source_level` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_source') AND UPPER(COLUMN_NAME) = UPPER('SOURCE_STYLE')) THEN
    ALTER TABLE `bahar-db`.`t_source` ADD COLUMN `source_style` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_source') AND UPPER(COLUMN_NAME) = UPPER('IS_MENU')) THEN
    ALTER TABLE `bahar-db`.`t_source` ADD COLUMN `is_menu` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_source') AND UPPER(COLUMN_NAME) = UPPER('DESCRIPTION')) THEN
    ALTER TABLE `bahar-db`.`t_source` ADD COLUMN `description` VARCHAR(255) NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_source') AND UPPER(COLUMN_NAME) = UPPER('PARENT_ID')) THEN
    ALTER TABLE `bahar-db`.`t_source` ADD COLUMN `parent_id` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_source') AND UPPER(COLUMN_NAME) = UPPER('IS_LOG')) THEN
    ALTER TABLE `bahar-db`.`t_source` ADD COLUMN `is_log` INT NULL;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'bahar-db' AND UPPER(TABLE_NAME) = UPPER('t_source') AND UPPER(COLUMN_NAME) = UPPER('ICON')) THEN
    ALTER TABLE `bahar-db`.`t_source` ADD COLUMN `icon` VARCHAR(255) NULL;
  END IF;
END $$
DELIMITER ;
CALL bahardb_entity_sync();
DROP PROCEDURE IF EXISTS bahardb_entity_sync;
