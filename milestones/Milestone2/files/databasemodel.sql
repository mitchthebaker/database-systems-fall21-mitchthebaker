-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema atmManagementSystemDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema atmManagementSystemDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `atmManagementSystemDB` DEFAULT CHARACTER SET utf8 ;
USE `atmManagementSystemDB` ;

-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`general_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`general_users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `full_name` VARCHAR(100) NULL DEFAULT NULL,
  `first_name` VARCHAR(100) NULL DEFAULT NULL,
  `last_name` VARCHAR(100) NULL DEFAULT NULL,
  `is_authenticated` INT NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`authenticated_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`authenticated_users` (
  `user_auth_token` VARCHAR(100) NOT NULL,
  `user_id` INT NOT NULL,
  `is_admin` INT NOT NULL,
  PRIMARY KEY (`user_auth_token`, `user_id`),
  INDEX `fk_user_id_idx` (`user_id` ASC),
  CONSTRAINT `fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `atmManagementSystemDB`.`general_users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`banks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`banks` (
  `bank_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`bank_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`bank_accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`bank_accounts` (
  `bank_account_id` INT NOT NULL AUTO_INCREMENT,
  `routing_number` INT NOT NULL,
  `bank_id` INT NULL DEFAULT NULL,
  `user_id` INT NULL DEFAULT NULL,
  `is_verified` TINYINT(1) NOT NULL,
  PRIMARY KEY (`bank_account_id`),
  INDEX `fk_bank_id_idx` (`bank_id` ASC),
  INDEX `fk_user_id_idx` (`user_id` ASC),
  CONSTRAINT `fk_bank_id`
    FOREIGN KEY (`bank_id`)
    REFERENCES `atmManagementSystemDB`.`banks` (`bank_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_bank_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `atmManagementSystemDB`.`general_users` (`user_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`atm_accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`atm_accounts` (
  `atm_account_id` INT NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME NOT NULL,
  `bank_account_id` INT NULL DEFAULT NULL,
  `user_auth_token` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`atm_account_id`),
  UNIQUE INDEX `user_auth_token_UNIQUE` (`user_auth_token` ASC),
  INDEX `fk_bank_account_id_idx` (`bank_account_id` ASC),
  INDEX `fk_user_auth_token_idx` (`user_auth_token` ASC),
  CONSTRAINT `fk_atm_account_auth_token`
    FOREIGN KEY (`user_auth_token`)
    REFERENCES `atmManagementSystemDB`.`authenticated_users` (`user_auth_token`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_atm_account_bank_id`
    FOREIGN KEY (`bank_account_id`)
    REFERENCES `atmManagementSystemDB`.`bank_accounts` (`bank_account_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`account_notifications`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`account_notifications` (
  `notification_id` INT NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME NOT NULL,
  `message` VARCHAR(255) NULL DEFAULT NULL,
  `atm_account_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  INDEX `fk_atm_account_id_idx` (`atm_account_id` ASC),
  CONSTRAINT `fk_atm_account_notifications_id`
    FOREIGN KEY (`atm_account_id`)
    REFERENCES `atmManagementSystemDB`.`atm_accounts` (`atm_account_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`regions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`regions` (
  `region_id` INT NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(100) NOT NULL,
  `timezone_offset` TIME NOT NULL,
  PRIMARY KEY (`region_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`atm_machines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`atm_machines` (
  `tid` INT NOT NULL AUTO_INCREMENT,
  `status` INT NOT NULL,
  `access_permissions` INT NOT NULL,
  `region_id` INT NOT NULL,
  PRIMARY KEY (`tid`, `region_id`),
  INDEX `fk_region_id_idx` (`region_id` ASC),
  CONSTRAINT `fk_atm_machine_region_id`
    FOREIGN KEY (`region_id`)
    REFERENCES `atmManagementSystemDB`.`regions` (`region_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`devices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`devices` (
  `device_id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NULL DEFAULT NULL,
  `tid` INT NOT NULL,
  PRIMARY KEY (`device_id`, `tid`),
  INDEX `fk_tid_idx` (`tid` ASC),
  CONSTRAINT `fk_devices_tid`
    FOREIGN KEY (`tid`)
    REFERENCES `atmManagementSystemDB`.`atm_machines` (`tid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 25
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`io_devices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`io_devices` (
  `io_device_id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  `access_permissions` INT NOT NULL,
  `device_id` INT NOT NULL,
  PRIMARY KEY (`io_device_id`, `device_id`),
  INDEX `fk_device_id_idx` (`device_id` ASC),
  CONSTRAINT `fk_io_device`
    FOREIGN KEY (`device_id`)
    REFERENCES `atmManagementSystemDB`.`devices` (`device_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`ada_headphone_jacks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`ada_headphone_jacks` (
  `ada_jack_id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  `has_malfunction` TINYINT(1) NOT NULL,
  `io_device_id` INT NOT NULL,
  PRIMARY KEY (`ada_jack_id`, `io_device_id`),
  INDEX `fk_io_device_id_idx` (`io_device_id` ASC),
  CONSTRAINT `fk_io_device_1`
    FOREIGN KEY (`io_device_id`)
    REFERENCES `atmManagementSystemDB`.`io_devices` (`io_device_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`atm_admins`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`atm_admins` (
  `admin_id` INT NOT NULL AUTO_INCREMENT,
  `access_code` INT NOT NULL,
  `access_permissions` INT NOT NULL,
  `user_auth_token` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`admin_id`, `user_auth_token`),
  INDEX `fk_user_id_idx` (`user_auth_token` ASC),
  CONSTRAINT `fk_admin_auth_token`
    FOREIGN KEY (`user_auth_token`)
    REFERENCES `atmManagementSystemDB`.`authenticated_users` (`user_auth_token`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`atm_displays`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`atm_displays` (
  `display_id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  `has_malfunction` TINYINT(1) NOT NULL,
  `io_device_id` INT NOT NULL,
  PRIMARY KEY (`display_id`, `io_device_id`),
  INDEX `fk_io_device_id_idx` (`io_device_id` ASC),
  CONSTRAINT `fk_io_device_2`
    FOREIGN KEY (`io_device_id`)
    REFERENCES `atmManagementSystemDB`.`io_devices` (`io_device_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`atm_maintenance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`atm_maintenance` (
  `tid` INT NOT NULL,
  `admin_id` INT NOT NULL,
  PRIMARY KEY (`tid`),
  INDEX `fk_admin_id_idx` (`admin_id` ASC),
  CONSTRAINT `fk_maintenance_admin_id`
    FOREIGN KEY (`admin_id`)
    REFERENCES `atmManagementSystemDB`.`atm_admins` (`admin_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_maintenance_tid`
    FOREIGN KEY (`tid`)
    REFERENCES `atmManagementSystemDB`.`atm_machines` (`tid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`transaction_devices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`transaction_devices` (
  `transaction_device_id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  `access_permissions` INT NOT NULL,
  `device_id` INT NOT NULL,
  PRIMARY KEY (`transaction_device_id`, `device_id`),
  INDEX `fk_device_id_idx` (`device_id` ASC),
  CONSTRAINT `fk_transaction_device`
    FOREIGN KEY (`device_id`)
    REFERENCES `atmManagementSystemDB`.`devices` (`device_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`receipt_printers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`receipt_printers` (
  `printer_id` INT NOT NULL AUTO_INCREMENT,
  `paper_qty` INT NOT NULL,
  `ink_cartridge_qty` INT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `has_malfunction` INT NOT NULL,
  `transaction_device_id` INT NOT NULL,
  PRIMARY KEY (`printer_id`, `transaction_device_id`),
  INDEX `fk_transaction_device_id_idx` (`transaction_device_id` ASC),
  CONSTRAINT `fk_transaction_device_3`
    FOREIGN KEY (`transaction_device_id`)
    REFERENCES `atmManagementSystemDB`.`transaction_devices` (`transaction_device_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`transaction_actions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`transaction_actions` (
  `transaction_action_id` INT NOT NULL AUTO_INCREMENT,
  `printer_id` INT NULL DEFAULT NULL,
  `is_verified` TINYINT(1) NULL DEFAULT NULL,
  `processing_device_id` INT NOT NULL,
  `fee` INT NOT NULL,
  PRIMARY KEY (`transaction_action_id`, `processing_device_id`),
  INDEX `fk_printer_id_idx` (`printer_id` ASC),
  CONSTRAINT `fk_printer_id`
    FOREIGN KEY (`printer_id`)
    REFERENCES `atmManagementSystemDB`.`receipt_printers` (`printer_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`atm_transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`atm_transactions` (
  `transaction_id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  `amount` INT NOT NULL,
  PRIMARY KEY (`transaction_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`portfolios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`portfolios` (
  `portfolio_id` INT NOT NULL AUTO_INCREMENT,
  `num_crypto_accts` INT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `atm_account_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`portfolio_id`),
  INDEX `fk_atm_account_id_idx` (`atm_account_id` ASC),
  CONSTRAINT `fk_atm_account_id`
    FOREIGN KEY (`atm_account_id`)
    REFERENCES `atmManagementSystemDB`.`atm_accounts` (`atm_account_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`atm_transaction_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`atm_transaction_info` (
  `atm_transaction_info_id` INT NOT NULL AUTO_INCREMENT,
  `portfolio_id` INT NOT NULL,
  `transaction_id` INT NOT NULL,
  `transaction_action_id` INT NOT NULL,
  PRIMARY KEY (`atm_transaction_info_id`),
  INDEX `fk_transaction_id_idx` (`transaction_id` ASC),
  INDEX `fk_transaction_action_id_idx` (`transaction_action_id` ASC),
  INDEX `fk_atm_transaction_portfolio_id_idx` (`portfolio_id` ASC),
  CONSTRAINT `fk_atm_transaction_action_id`
    FOREIGN KEY (`transaction_action_id`)
    REFERENCES `atmManagementSystemDB`.`transaction_actions` (`transaction_action_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_atm_transaction_id`
    FOREIGN KEY (`transaction_id`)
    REFERENCES `atmManagementSystemDB`.`atm_transactions` (`transaction_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_atm_transaction_portfolio_id`
    FOREIGN KEY (`portfolio_id`)
    REFERENCES `atmManagementSystemDB`.`portfolios` (`portfolio_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`languages` (
  `language_id` INT NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(100) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `is_supported` TINYINT(1) NOT NULL,
  `added_at` DATETIME NOT NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`atm_translations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`atm_translations` (
  `tid` INT NOT NULL,
  `language_id` INT NOT NULL,
  PRIMARY KEY (`tid`, `language_id`),
  INDEX `fk_language_id_idx` (`language_id` ASC),
  CONSTRAINT `fk_translation_language_id`
    FOREIGN KEY (`language_id`)
    REFERENCES `atmManagementSystemDB`.`languages` (`language_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_translation_tid`
    FOREIGN KEY (`tid`)
    REFERENCES `atmManagementSystemDB`.`atm_machines` (`tid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`authentication_devices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`authentication_devices` (
  `auth_device_id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  `access_permissions` INT NOT NULL,
  `device_id` INT NOT NULL,
  PRIMARY KEY (`auth_device_id`, `device_id`),
  INDEX `fk_device_id_idx` (`device_id` ASC),
  CONSTRAINT `fk_auth_device`
    FOREIGN KEY (`device_id`)
    REFERENCES `atmManagementSystemDB`.`devices` (`device_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`user_auth_methods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`user_auth_methods` (
  `user_auth_id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NULL DEFAULT NULL,
  `is_international` INT NULL DEFAULT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`user_auth_id`, `user_id`),
  INDEX `fk_user_id_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `atmManagementSystemDB`.`general_users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`debit_atm_cards`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`debit_atm_cards` (
  `card_id` INT NOT NULL AUTO_INCREMENT,
  `card_number` VARCHAR(45) NOT NULL,
  `exp_date` VARCHAR(5) NOT NULL,
  `cvc` INT NOT NULL,
  `zip` INT NOT NULL,
  `user_auth_id` INT NOT NULL,
  PRIMARY KEY (`card_id`, `user_auth_id`),
  INDEX `fk_user_auth_id_idx` (`user_auth_id` ASC),
  CONSTRAINT `fk_card_user_auth_id`
    FOREIGN KEY (`user_auth_id`)
    REFERENCES `atmManagementSystemDB`.`user_auth_methods` (`user_auth_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`mobile_wallets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`mobile_wallets` (
  `wallet_id` INT NOT NULL AUTO_INCREMENT,
  `card_number` VARCHAR(45) NOT NULL,
  `exp_date` VARCHAR(5) NOT NULL,
  `cvc` INT NOT NULL,
  `zip` INT NOT NULL,
  `user_auth_id` INT NOT NULL,
  PRIMARY KEY (`wallet_id`, `user_auth_id`),
  INDEX `fk_user_auth_id_idx` (`user_auth_id` ASC),
  CONSTRAINT `fk_mobile_user_auth_id`
    FOREIGN KEY (`user_auth_id`)
    REFERENCES `atmManagementSystemDB`.`user_auth_methods` (`user_auth_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`bank_account_links`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`bank_account_links` (
  `bank_account_id` INT NOT NULL,
  `wallet_id` INT NULL DEFAULT NULL,
  `card_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`bank_account_id`),
  INDEX `fk_wallet_id_idx` (`wallet_id` ASC),
  INDEX `fk_card_id_idx` (`card_id` ASC),
  CONSTRAINT `fk_bank_account_card_id`
    FOREIGN KEY (`card_id`)
    REFERENCES `atmManagementSystemDB`.`debit_atm_cards` (`card_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_bank_account_id`
    FOREIGN KEY (`bank_account_id`)
    REFERENCES `atmManagementSystemDB`.`bank_accounts` (`bank_account_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_bank_account_wallet_id`
    FOREIGN KEY (`wallet_id`)
    REFERENCES `atmManagementSystemDB`.`mobile_wallets` (`wallet_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`crypto_exchanges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`crypto_exchanges` (
  `exchange_id` INT NOT NULL AUTO_INCREMENT,
  `provider` VARCHAR(100) NOT NULL,
  `is_operational` TINYINT(1) NOT NULL,
  PRIMARY KEY (`exchange_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`bank_crypto_partnerships`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`bank_crypto_partnerships` (
  `partnership_id` INT NOT NULL AUTO_INCREMENT,
  `bank_id` INT NOT NULL,
  `exchange_id` INT NOT NULL,
  PRIMARY KEY (`partnership_id`),
  INDEX `fk_bank_id_idx` (`bank_id` ASC),
  INDEX `fk_exchange_id_idx` (`exchange_id` ASC),
  CONSTRAINT `fk_partnership_bank_id`
    FOREIGN KEY (`bank_id`)
    REFERENCES `atmManagementSystemDB`.`banks` (`bank_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_partnership_exchange_id`
    FOREIGN KEY (`exchange_id`)
    REFERENCES `atmManagementSystemDB`.`crypto_exchanges` (`exchange_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`security_devices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`security_devices` (
  `security_device_id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  `access_permissions` INT NOT NULL,
  `device_id` INT NOT NULL,
  PRIMARY KEY (`security_device_id`, `device_id`),
  INDEX `fk_device_id_idx` (`device_id` ASC),
  CONSTRAINT `fk_security_device`
    FOREIGN KEY (`device_id`)
    REFERENCES `atmManagementSystemDB`.`devices` (`device_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`cameras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`cameras` (
  `camera_id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  `has_malfunction` TINYINT(1) NOT NULL,
  `security_device_id` INT NOT NULL,
  PRIMARY KEY (`camera_id`, `security_device_id`),
  INDEX `fk_security_devices_id_idx` (`security_device_id` ASC),
  CONSTRAINT `fk_security_device_1`
    FOREIGN KEY (`security_device_id`)
    REFERENCES `atmManagementSystemDB`.`security_devices` (`security_device_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`kubeCDNs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`kubeCDNs` (
  `cdn_id` INT NOT NULL AUTO_INCREMENT,
  `cdn_description` VARCHAR(100) NOT NULL,
  `region_id` INT NOT NULL,
  PRIMARY KEY (`cdn_id`, `region_id`),
  INDEX `fk_region_id_idx` (`region_id` ASC),
  CONSTRAINT `fk_cdn_region_id`
    FOREIGN KEY (`region_id`)
    REFERENCES `atmManagementSystemDB`.`regions` (`region_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`security_media_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`security_media_content` (
  `media_content_id` INT NOT NULL AUTO_INCREMENT,
  `content_type` VARCHAR(100) NOT NULL,
  `access_permissions` TINYINT(1) NOT NULL,
  `cdn_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`media_content_id`),
  INDEX `fk_cdn_id_idx` (`cdn_id` ASC),
  CONSTRAINT `fk_cdn_id`
    FOREIGN KEY (`cdn_id`)
    REFERENCES `atmManagementSystemDB`.`kubeCDNs` (`cdn_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`camera_footage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`camera_footage` (
  `footage_id` INT NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME NOT NULL,
  `ended_at` DATETIME NOT NULL,
  `duration` INT NOT NULL,
  `camera_id` INT NOT NULL,
  `media_content_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`footage_id`, `camera_id`),
  INDEX `fk_camera_id_idx` (`camera_id` ASC),
  INDEX `fk_media_content_id_idx` (`media_content_id` ASC),
  CONSTRAINT `fk_camera_id`
    FOREIGN KEY (`camera_id`)
    REFERENCES `atmManagementSystemDB`.`cameras` (`camera_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_camera_media_content_id`
    FOREIGN KEY (`media_content_id`)
    REFERENCES `atmManagementSystemDB`.`security_media_content` (`media_content_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`card_reader_devices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`card_reader_devices` (
  `card_reader_id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  `has_malfunction` TINYINT(1) NOT NULL,
  `auth_device_id` INT NOT NULL,
  PRIMARY KEY (`card_reader_id`, `auth_device_id`),
  INDEX `fk_auth_device_id_idx` (`auth_device_id` ASC),
  CONSTRAINT `fk_auth_device_2`
    FOREIGN KEY (`auth_device_id`)
    REFERENCES `atmManagementSystemDB`.`authentication_devices` (`auth_device_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`cash_dispensers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`cash_dispensers` (
  `dispenser_id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  `has_malfunction` TINYINT(1) NOT NULL,
  `transaction_device_id` INT NOT NULL,
  PRIMARY KEY (`dispenser_id`, `transaction_device_id`),
  INDEX `fk_transaction_device_id_idx` (`transaction_device_id` ASC),
  CONSTRAINT `fk_transaction_device_1`
    FOREIGN KEY (`transaction_device_id`)
    REFERENCES `atmManagementSystemDB`.`transaction_devices` (`transaction_device_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`checking_accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`checking_accounts` (
  `checking_account_id` INT NOT NULL AUTO_INCREMENT,
  `balance` INT NOT NULL,
  `access_permissions` INT NOT NULL,
  `bank_account_id` INT NOT NULL,
  PRIMARY KEY (`checking_account_id`, `bank_account_id`),
  INDEX `fk_bank_account_id_idx` (`bank_account_id` ASC),
  CONSTRAINT `fk_checking_permissions_bank_account_id`
    FOREIGN KEY (`bank_account_id`)
    REFERENCES `atmManagementSystemDB`.`bank_accounts` (`bank_account_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`checking_bank_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`checking_bank_permissions` (
  `checking_bank_permissions_id` INT NOT NULL AUTO_INCREMENT,
  `transaction_action_id` INT NOT NULL,
  `checking_account_id` INT NOT NULL,
  PRIMARY KEY (`checking_bank_permissions_id`),
  INDEX `fk_checking_account_id_idx` (`checking_account_id` ASC),
  INDEX `fk_permissions_transaction_action_id_idx` (`transaction_action_id` ASC),
  CONSTRAINT `fk_permissions_checking_account_id`
    FOREIGN KEY (`checking_account_id`)
    REFERENCES `atmManagementSystemDB`.`checking_accounts` (`checking_account_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_permissions_transaction_action_id`
    FOREIGN KEY (`transaction_action_id`)
    REFERENCES `atmManagementSystemDB`.`transaction_actions` (`transaction_action_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`iot_contextaware_sensors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`iot_contextaware_sensors` (
  `context_sensor_id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  `has_malfunction` TINYINT(1) NOT NULL,
  `security_device_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`context_sensor_id`),
  UNIQUE INDEX `security_device_id_UNIQUE` (`security_device_id` ASC),
  INDEX `fk_security_device_id_idx` (`security_device_id` ASC),
  CONSTRAINT `fk_context_security_device_id`
    FOREIGN KEY (`security_device_id`)
    REFERENCES `atmManagementSystemDB`.`security_devices` (`security_device_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`context_aware_sensor_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`context_aware_sensor_data` (
  `context_data_id` INT NOT NULL AUTO_INCREMENT,
  `atm_violation_status` TINYINT(1) NOT NULL,
  `device_origin` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `context_sensor_id` INT NULL DEFAULT NULL,
  `media_content_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`context_data_id`),
  INDEX `fk_context_sensor_id_idx` (`context_sensor_id` ASC),
  INDEX `fk_media_content_id_idx` (`media_content_id` ASC),
  CONSTRAINT `fk_context_media_content_id`
    FOREIGN KEY (`media_content_id`)
    REFERENCES `atmManagementSystemDB`.`security_media_content` (`media_content_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_context_sensor_id`
    FOREIGN KEY (`context_sensor_id`)
    REFERENCES `atmManagementSystemDB`.`iot_contextaware_sensors` (`context_sensor_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`crypto_accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`crypto_accounts` (
  `crypto_account_id` INT NOT NULL AUTO_INCREMENT,
  `asset_type` VARCHAR(100) NOT NULL,
  `balance` INT NOT NULL,
  `public_key` VARCHAR(255) NOT NULL,
  `access_permissions` INT NULL DEFAULT NULL,
  `portfolio_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`crypto_account_id`),
  INDEX `fk_portfolio_id_idx` (`portfolio_id` ASC),
  CONSTRAINT `fk_portfolio_id`
    FOREIGN KEY (`portfolio_id`)
    REFERENCES `atmManagementSystemDB`.`portfolios` (`portfolio_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`crypto_account_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`crypto_account_info` (
  `crypto_account_id` INT NULL DEFAULT NULL,
  `exchange_id` INT NULL DEFAULT NULL,
  INDEX `fk_exchange_id_idx` (`exchange_id` ASC),
  INDEX `fk_crypto_account_id` (`crypto_account_id` ASC),
  CONSTRAINT `fk_crypto_account_id`
    FOREIGN KEY (`crypto_account_id`)
    REFERENCES `atmManagementSystemDB`.`crypto_accounts` (`crypto_account_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_exchange_id`
    FOREIGN KEY (`exchange_id`)
    REFERENCES `atmManagementSystemDB`.`crypto_exchanges` (`exchange_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`crypto_loans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`crypto_loans` (
  `crypto_loan_id` INT NOT NULL AUTO_INCREMENT,
  `payment_plan` VARCHAR(100) NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL,
  `loan_type` VARCHAR(100) NOT NULL,
  `asset_type` VARCHAR(100) NOT NULL,
  `interest_rate` DECIMAL(2,2) NOT NULL,
  `total_amount` INT NOT NULL,
  `total_amount_remaining` INT NULL DEFAULT NULL,
  PRIMARY KEY (`crypto_loan_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`crypto_loan_payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`crypto_loan_payments` (
  `crypto_loan_payment_id` INT NOT NULL AUTO_INCREMENT,
  `amount_paid` INT NOT NULL,
  `paid_at` DATETIME NOT NULL,
  `crypto_loan_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`crypto_loan_payment_id`),
  INDEX `fk_crypto_loan_id_idx` (`crypto_loan_id` ASC),
  CONSTRAINT `fk_crypto_loan_id`
    FOREIGN KEY (`crypto_loan_id`)
    REFERENCES `atmManagementSystemDB`.`crypto_loans` (`crypto_loan_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`crypto_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`crypto_permissions` (
  `crypto_permissions_id` INT NOT NULL AUTO_INCREMENT,
  `transaction_action_id` INT NOT NULL,
  `crypto_account_id` INT NOT NULL,
  PRIMARY KEY (`crypto_permissions_id`),
  INDEX `fk_crypto_account_id_idx` (`crypto_account_id` ASC),
  INDEX `fk_permissions_transaction_action_id_idx` (`transaction_action_id` ASC),
  CONSTRAINT `fk_crypto_permissions_transaction_actions_id`
    FOREIGN KEY (`transaction_action_id`)
    REFERENCES `atmManagementSystemDB`.`transaction_actions` (`transaction_action_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_permissions_crypto_account_id`
    FOREIGN KEY (`crypto_account_id`)
    REFERENCES `atmManagementSystemDB`.`crypto_accounts` (`crypto_account_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`currencies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`currencies` (
  `currency_id` INT NOT NULL AUTO_INCREMENT,
  `currency_name` VARCHAR(100) NOT NULL,
  `circulation_amt` BIGINT NOT NULL,
  PRIMARY KEY (`currency_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`deposit_check_slots`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`deposit_check_slots` (
  `deposit_slot_id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  `has_malfunction` INT NOT NULL,
  `transaction_device_id` INT NOT NULL,
  PRIMARY KEY (`deposit_slot_id`, `transaction_device_id`),
  INDEX `fk_transaction_device_id_idx` (`transaction_device_id` ASC),
  CONSTRAINT `fk_transaction_device_2`
    FOREIGN KEY (`transaction_device_id`)
    REFERENCES `atmManagementSystemDB`.`transaction_devices` (`transaction_device_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`exchange_rates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`exchange_rates` (
  `exchange_rate_id` INT NOT NULL AUTO_INCREMENT,
  `trading_date` DATETIME NOT NULL,
  `source_currency` INT NULL DEFAULT NULL,
  `target_currency` INT NULL DEFAULT NULL,
  `closing_rate` FLOAT NOT NULL,
  `average_rate` FLOAT NOT NULL,
  PRIMARY KEY (`exchange_rate_id`),
  INDEX `fk_source_currency_idx` (`source_currency` ASC),
  INDEX `fk_target_currency_idx` (`target_currency` ASC),
  CONSTRAINT `fk_source_currency`
    FOREIGN KEY (`source_currency`)
    REFERENCES `atmManagementSystemDB`.`currencies` (`currency_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_target_currency`
    FOREIGN KEY (`target_currency`)
    REFERENCES `atmManagementSystemDB`.`currencies` (`currency_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 25
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`fingerprint_scanners`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`fingerprint_scanners` (
  `scanner_id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  `has_malfunction` INT NOT NULL,
  `auth_device_id` INT NOT NULL,
  PRIMARY KEY (`scanner_id`, `auth_device_id`),
  INDEX `fk_auth_device_id_idx` (`auth_device_id` ASC),
  CONSTRAINT `fk_fingerprint_auth_device_1`
    FOREIGN KEY (`auth_device_id`)
    REFERENCES `atmManagementSystemDB`.`authentication_devices` (`auth_device_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`fraud_claims`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`fraud_claims` (
  `claim_id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL,
  `resolved_at` DATETIME NULL DEFAULT NULL,
  `atm_account_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`claim_id`),
  INDEX `fk_atm_account_id_idx` (`atm_account_id` ASC),
  CONSTRAINT `fk_fraud_atm_account_id`
    FOREIGN KEY (`atm_account_id`)
    REFERENCES `atmManagementSystemDB`.`atm_accounts` (`atm_account_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`ink_cartridges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`ink_cartridges` (
  `cartridge_id` INT NOT NULL AUTO_INCREMENT,
  `manufacturer` VARCHAR(100) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `printer_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`cartridge_id`),
  UNIQUE INDEX `printer_id_UNIQUE` (`printer_id` ASC),
  INDEX `fk_printer_id_idx` (`printer_id` ASC),
  CONSTRAINT `fk_ink_printer_id`
    FOREIGN KEY (`printer_id`)
    REFERENCES `atmManagementSystemDB`.`receipt_printers` (`printer_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`iot_temperature_sensors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`iot_temperature_sensors` (
  `temp_sensor_id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  `has_malfunction` TINYINT(1) NOT NULL,
  `security_device_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`temp_sensor_id`),
  UNIQUE INDEX `security_device_id_UNIQUE` (`security_device_id` ASC),
  INDEX `fk_security_device_id_idx` (`security_device_id` ASC),
  CONSTRAINT `fk_temp_security_device_id`
    FOREIGN KEY (`security_device_id`)
    REFERENCES `atmManagementSystemDB`.`security_devices` (`security_device_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`keypads`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`keypads` (
  `keypad_id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  `has_malfunction` TINYINT(1) NOT NULL,
  `io_device_id` INT NOT NULL,
  PRIMARY KEY (`keypad_id`, `io_device_id`),
  INDEX `fk_io_device_id_idx` (`io_device_id` ASC),
  CONSTRAINT `fk_io_device_3`
    FOREIGN KEY (`io_device_id`)
    REFERENCES `atmManagementSystemDB`.`io_devices` (`io_device_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`open_lending_protocols`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`open_lending_protocols` (
  `protocol_id` INT NOT NULL AUTO_INCREMENT,
  `provider_name` VARCHAR(100) NOT NULL,
  `is_operational` TINYINT(1) NOT NULL,
  PRIMARY KEY (`protocol_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`lending_protocol_connections`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`lending_protocol_connections` (
  `protocol_id` INT NOT NULL,
  `crypto_loan_id` INT NOT NULL,
  `crypto_account_id` INT NOT NULL,
  PRIMARY KEY (`protocol_id`, `crypto_loan_id`),
  INDEX `fk_crypto_loan_id_idx` (`crypto_loan_id` ASC),
  INDEX `fk_crypto_account_id_idx` (`crypto_account_id` ASC),
  CONSTRAINT `fk_lending_connection_crypto_account_id`
    FOREIGN KEY (`crypto_account_id`)
    REFERENCES `atmManagementSystemDB`.`crypto_accounts` (`crypto_account_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_lending_connection_crypto_loan_id`
    FOREIGN KEY (`crypto_loan_id`)
    REFERENCES `atmManagementSystemDB`.`crypto_loans` (`crypto_loan_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_lending_connection_protocol_id`
    FOREIGN KEY (`protocol_id`)
    REFERENCES `atmManagementSystemDB`.`open_lending_protocols` (`protocol_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`portfolio_exchange_rates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`portfolio_exchange_rates` (
  `exchange_rate_id` INT NOT NULL,
  `portfolio_id` INT NOT NULL,
  PRIMARY KEY (`exchange_rate_id`),
  INDEX `fk_portfolio_id_idx` (`portfolio_id` ASC),
  CONSTRAINT `fk_exchange_portfolio_id`
    FOREIGN KEY (`portfolio_id`)
    REFERENCES `atmManagementSystemDB`.`portfolios` (`portfolio_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_exchange_rate_id`
    FOREIGN KEY (`exchange_rate_id`)
    REFERENCES `atmManagementSystemDB`.`exchange_rates` (`exchange_rate_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`receipt_roll_paper`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`receipt_roll_paper` (
  `roll_paper_id` INT NOT NULL AUTO_INCREMENT,
  `used_at` DATETIME NOT NULL,
  `length` VARCHAR(45) NOT NULL,
  `printer_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`roll_paper_id`),
  UNIQUE INDEX `printer_id_UNIQUE` (`printer_id` ASC),
  INDEX `fk_printer_id_idx` (`printer_id` ASC),
  CONSTRAINT `fk_roll_printer_id`
    FOREIGN KEY (`printer_id`)
    REFERENCES `atmManagementSystemDB`.`receipt_printers` (`printer_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`savings_accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`savings_accounts` (
  `savings_account_id` INT NOT NULL AUTO_INCREMENT,
  `balance` INT NOT NULL,
  `access_permissions` INT NOT NULL,
  `bank_account_id` INT NOT NULL,
  PRIMARY KEY (`savings_account_id`, `bank_account_id`),
  INDEX `fk_bank_account_id_idx` (`bank_account_id` ASC),
  CONSTRAINT `fk_savings_bank_account_id`
    FOREIGN KEY (`bank_account_id`)
    REFERENCES `atmManagementSystemDB`.`bank_accounts` (`bank_account_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`savings_bank_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`savings_bank_permissions` (
  `savings_bank_permissions_id` INT NOT NULL AUTO_INCREMENT,
  `transaction_action_id` INT NOT NULL,
  `savings_account_id` INT NOT NULL,
  PRIMARY KEY (`savings_bank_permissions_id`),
  INDEX `fk_savings_account_id_idx` (`savings_account_id` ASC),
  INDEX `fk_savings_bank_permissions_transaction_action_id_idx` (`transaction_action_id` ASC),
  CONSTRAINT `fk_savings_account_id`
    FOREIGN KEY (`savings_account_id`)
    REFERENCES `atmManagementSystemDB`.`savings_accounts` (`savings_account_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_savings_bank_permissions_transaction_action_id`
    FOREIGN KEY (`transaction_action_id`)
    REFERENCES `atmManagementSystemDB`.`transaction_actions` (`transaction_action_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`sessions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`sessions` (
  `session_id` INT NOT NULL AUTO_INCREMENT,
  `expires_at` DATETIME NOT NULL,
  `session_data` VARCHAR(100) NULL DEFAULT NULL,
  `user_auth_token` VARCHAR(100) NOT NULL,
  `tid` INT NOT NULL,
  PRIMARY KEY (`session_id`, `user_auth_token`, `tid`),
  INDEX `fk_tid_idx` (`tid` ASC),
  INDEX `fk_user_auth_token_idx` (`user_auth_token` ASC),
  CONSTRAINT `fk_tid`
    FOREIGN KEY (`tid`)
    REFERENCES `atmManagementSystemDB`.`atm_machines` (`tid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_auth_token`
    FOREIGN KEY (`user_auth_token`)
    REFERENCES `atmManagementSystemDB`.`authenticated_users` (`user_auth_token`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`speakers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`speakers` (
  `speaker_id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  `has_malfunction` TINYINT(1) NOT NULL,
  `io_device_id` INT NOT NULL,
  PRIMARY KEY (`speaker_id`, `io_device_id`),
  INDEX `fk_io_device_id_idx` (`io_device_id` ASC),
  CONSTRAINT `fk_io_device_4`
    FOREIGN KEY (`io_device_id`)
    REFERENCES `atmManagementSystemDB`.`io_devices` (`io_device_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `atmManagementSystemDB`.`temperature_sensor_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atmManagementSystemDB`.`temperature_sensor_data` (
  `temp_data_id` INT NOT NULL AUTO_INCREMENT,
  `internal_error_status` TINYINT(1) NOT NULL,
  `device_origin` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `temp_sensor_id` INT NULL DEFAULT NULL,
  `media_content_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`temp_data_id`),
  INDEX `fk_temp_sensor_id_idx` (`temp_sensor_id` ASC),
  INDEX `fk_media_content_id_idx` (`media_content_id` ASC),
  CONSTRAINT `fk_temp_media_content_id`
    FOREIGN KEY (`media_content_id`)
    REFERENCES `atmManagementSystemDB`.`security_media_content` (`media_content_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_temp_sensor_id`
    FOREIGN KEY (`temp_sensor_id`)
    REFERENCES `atmManagementSystemDB`.`iot_temperature_sensors` (`temp_sensor_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
USE `atmManagementSystemDB`;

DELIMITER $$
USE `atmManagementSystemDB`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `csc675db`.`authenticated_users_AFTER_INSERT`
AFTER INSERT ON `csc675db`.`authenticated_users`
FOR EACH ROW
BEGIN	
	UPDATE `general_users`
    SET is_authenticated = 1
    WHERE `general_users`.user_id = NEW.user_id;
END$$

USE `atmManagementSystemDB`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `csc675db`.`atm_accounts_AFTER_INSERT`
AFTER INSERT ON `csc675db`.`atm_accounts`
FOR EACH ROW
BEGIN
	UPDATE `bank_accounts`
    SET is_verified = 1
    WHERE `bank_accounts`.bank_account_id = NEW.bank_account_id;
END$$

USE `atmManagementSystemDB`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `csc675db`.`atm_accounts_BEFORE_DELETE`
BEFORE DELETE ON `csc675db`.`atm_accounts`
FOR EACH ROW
BEGIN
	UPDATE `bank_accounts`
    SET is_verified = 0
    WHERE `bank_accounts`.bank_account_id = OLD.bank_account_id;
END$$

USE `atmManagementSystemDB`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `csc675db`.`atm_machines_AFTER_INSERT`
AFTER INSERT ON `csc675db`.`atm_machines`
FOR EACH ROW
BEGIN
	DECLARE start_row INT DEFAULT 0;
    DECLARE end_row INT DEFAULT 0;
    DECLARE new_language_id INT;
    
    SELECT COUNT(*) FROM languages INTO end_row;
    SET start_row = 0;
    
    WHILE start_row < end_row DO
		SET new_language_id = (SELECT (language_id) FROM languages LIMIT start_row, 1);
		INSERT INTO `atm_translations` (tid, language_id) VALUES (NEW.tid, new_language_id);
        SET start_row = start_row + 1;
    END WHILE;
END$$

USE `atmManagementSystemDB`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `csc675db`.`atm_admins_AFTER_INSERT`
AFTER INSERT ON `csc675db`.`atm_admins`
FOR EACH ROW
BEGIN
	UPDATE `authenticated_users` SET is_admin = 1 
    WHERE user_auth_token = NEW.user_auth_token;
END$$

USE `atmManagementSystemDB`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `csc675db`.`atm_admins_BEFORE_DELETE`
BEFORE DELETE ON `csc675db`.`atm_admins`
FOR EACH ROW
BEGIN
	UPDATE `authenticated_users` SET is_admin = 0 
    WHERE user_auth_token = OLD.user_auth_token;
END$$

USE `atmManagementSystemDB`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `csc675db`.`atm_transactions_AFTER_INSERT`
AFTER INSERT ON `csc675db`.`atm_transactions`
FOR EACH ROW
BEGIN
	DECLARE atm_transaction_id INT;
    DECLARE atm_type VARCHAR(45);
    
    -- SELECT NEW.transaction_id AS ' ';
    -- SELECT NEW.type AS ' ';
    -- SELECT NEW.amount AS ' ';
    
    SET atm_transaction_id = NEW.transaction_id;
    SET atm_type = NEW.type;
    
    IF(atm_type = 'withdrawal') THEN
		INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee) VALUES (1, 1, 1, 1);
	END IF;
END$$

USE `atmManagementSystemDB`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `csc675db`.`crypto_accounts_AFTER_INSERT`
AFTER INSERT ON `csc675db`.`crypto_accounts`
FOR EACH ROW
BEGIN
	DECLARE new_num_crypto_accts INT DEFAULT 0;
    
    SET new_num_crypto_accts = (SELECT (num_crypto_accts) FROM `portfolios` WHERE portfolio_id = NEW.portfolio_id);
    SET new_num_crypto_accts = new_num_crypto_accts + 1;
    
    UPDATE `portfolios` SET num_crypto_accts = new_num_crypto_accts WHERE portfolio_id = NEW.portfolio_id;
END$$

USE `atmManagementSystemDB`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `csc675db`.`crypto_loan_payments_AFTER_INSERT`
AFTER INSERT ON `csc675db`.`crypto_loan_payments`
FOR EACH ROW
BEGIN
	-- cur_amount_paid is the amount_paid in new crypto loan payment
	DECLARE cur_amount_paid INT;
    
    -- cur_total_amount_remaining is the total amount remaining from the current crypto loan id 
    DECLARE cur_total_amount_remaining INT;
    
    SET cur_amount_paid = (SELECT (amount_paid) FROM `crypto_loan_payments` WHERE crypto_loan_payment_id = NEW.crypto_loan_payment_id);
    SET cur_total_amount_remaining = (SELECT (total_amount_remaining) FROM `crypto_loans` WHERE crypto_loan_id = NEW.crypto_loan_id);

    -- subtract cur_amount_paid from total_amount_remaining
    SET cur_total_amount_remaining = cur_total_amount_remaining - cur_amount_paid;
    
    -- now update the crypto loan which corresponds to cur_crypto_loan_id
    UPDATE `crypto_loans` SET total_amount_remaining = cur_total_amount_remaining WHERE crypto_loan_id = NEW.crypto_loan_id;
END$$


DELIMITER ;
