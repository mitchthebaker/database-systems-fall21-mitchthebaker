-- SET SQL_MODE=@OLD_SQL_MODE;
-- SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
-- SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
USE `sql3457683`;

DELIMITER $$
USE `sql3457683`$$
CREATE
DEFINER=`sql3457683`@`remotemysql.com`
TRIGGER `sql3457683`.`authenticated_users_AFTER_INSERT`
AFTER INSERT ON `sql3457683`.`authenticated_users`
FOR EACH ROW
BEGIN	
	UPDATE `general_users`
    SET is_authenticated = 1
    WHERE `general_users`.user_id = NEW.user_id;
END$$

USE `sql3457683`$$
CREATE
DEFINER=`sql3457683`@`remotemysql.com`
TRIGGER `sql3457683`.`atm_accounts_AFTER_INSERT`
AFTER INSERT ON `sql3457683`.`atm_accounts`
FOR EACH ROW
BEGIN
	UPDATE `bank_accounts`
    SET is_verified = 1
    WHERE `bank_accounts`.bank_account_id = NEW.bank_account_id;
END$$

USE `sql3457683`$$
CREATE
DEFINER=`sql3457683`@`remotemysql.com`
TRIGGER `sql3457683`.`atm_accounts_BEFORE_DELETE`
BEFORE DELETE ON `sql3457683`.`atm_accounts`
FOR EACH ROW
BEGIN
	UPDATE `bank_accounts`
    SET is_verified = 0
    WHERE `bank_accounts`.bank_account_id = OLD.bank_account_id;
END$$

USE `sql3457683`$$
CREATE
DEFINER=`sql3457683`@`remotemysql.com`
TRIGGER `sql3457683`.`atm_machines_AFTER_INSERT`
AFTER INSERT ON `sql3457683`.`atm_machines`
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

USE `sql3457683`$$
CREATE
DEFINER=`sql3457683`@`remotemysql.com`
TRIGGER `sql3457683`.`atm_admins_AFTER_INSERT`
AFTER INSERT ON `sql3457683`.`atm_admins`
FOR EACH ROW
BEGIN
	UPDATE `authenticated_users` SET is_admin = 1 
    WHERE user_auth_token = NEW.user_auth_token;
END$$

USE `sql3457683`$$
CREATE
DEFINER=`sql3457683`@`remotemysql.com`
TRIGGER `sql3457683`.`atm_admins_BEFORE_DELETE`
BEFORE DELETE ON `sql3457683`.`atm_admins`
FOR EACH ROW
BEGIN
	UPDATE `authenticated_users` SET is_admin = 0 
    WHERE user_auth_token = OLD.user_auth_token;
END$$

USE `sql3457683`$$
CREATE
DEFINER=`sql3457683`@`remotemysql.com`
TRIGGER `sql3457683`.`atm_transactions_AFTER_INSERT`
AFTER INSERT ON `sql3457683`.`atm_transactions`
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

USE `sql3457683`$$
CREATE
DEFINER=`sql3457683`@`remotemysql.com`
TRIGGER `sql3457683`.`crypto_accounts_AFTER_INSERT`
AFTER INSERT ON `sql3457683`.`crypto_accounts`
FOR EACH ROW
BEGIN
	DECLARE new_num_crypto_accts INT DEFAULT 0;
    
    SET new_num_crypto_accts = (SELECT (num_crypto_accts) FROM `portfolios` WHERE portfolio_id = NEW.portfolio_id);
    SET new_num_crypto_accts = new_num_crypto_accts + 1;
    
    UPDATE `portfolios` SET num_crypto_accts = new_num_crypto_accts WHERE portfolio_id = NEW.portfolio_id;
END$$

USE `sql3457683`$$
CREATE
DEFINER=`sql3457683`@`remotemysql.com`
TRIGGER `sql3457683`.`crypto_loan_payments_AFTER_INSERT`
AFTER INSERT ON `sql3457683`.`crypto_loan_payments`
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

