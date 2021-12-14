DELIMITER $$

CREATE FUNCTION DetermineDeviceStatus(
  content_id INT,
  status VARCHAR(20)
) 
RETURNS TINYINT(1)
DETERMINISTIC
BEGIN

    DECLARE ca_sensor_status VARCHAR(20);
    DECLARE temp_sensor_status VARCHAR(20);
    DECLARE camera_status VARCHAR(20);

    SET ca_sensor_status = (
      SELECT ca_sensor.status
      FROM context_aware_sensor_data ca_sensor_data
      INNER JOIN iot_contextaware_sensors ca_sensor
      ON ca_sensor.context_sensor_id = ca_sensor_data.context_sensor_id
      WHERE ca_sensor_data.media_content_id = content_id);
      
    SET temp_sensor_status = (
      SELECT temp_sensor.status
      FROM temperature_sensor_data temp_sensor_data
      INNER JOIN iot_temperature_sensors temp_sensor
      ON temp_sensor.temp_sensor_id = temp_sensor_data.temp_sensor_id
      WHERE temp_sensor_data.media_content_id = content_id);
      
    SET camera_status = (
      SELECT camera.status
      FROM camera_footage footage
      INNER JOIN cameras camera
      ON camera.camera_id = footage.camera_id
      WHERE footage.media_content_id = content_id);

    IF ca_sensor_status = status THEN
    	RETURN (1);
    ELSEIF temp_sensor_status = status THEN
    	RETURN (1);
    ELSEIF camera_status = status THEN
    	RETURN (1);
    ELSE 
    	RETURN (0);
    
    END IF;

END$$
DELIMITER ;



DELIMITER $$

CREATE FUNCTION CalculateAverage(
  portfolio_id INT,
  source_currency_id INT,
  target_currency_id INT
) 
RETURNS FLOAT
DETERMINISTIC
BEGIN

    DECLARE average FLOAT;

    SET average = (
      SELECT AVG(exchange_rate.average_rate)
      FROM portfolio_exchange_rates p_exchange_rate 
      INNER JOIN exchange_rates exchange_rate 
      ON exchange_rate.exchange_rate_id = p_exchange_rate.exchange_rate_id
      WHERE p_exchange_rate.portfolio_id = portfolio_id
      AND exchange_rate.source_currency = source_currency_id
      AND exchange_rate.target_currency = target_currency_id
    );

    RETURN (average);
END$$
DELIMITER ;



DELIMITER $$

CREATE FUNCTION FindCurrency(
  local_currency VARCHAR(20),
  exchange_to VARCHAR(20)
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN

    DECLARE currency VARCHAR(20);

    SET currency = (
      SELECT DISTINCT atm_transaction.exchange_to
      FROM atm_transactions atm_transaction 
      WHERE atm_transaction.action = 'exchange'
      AND atm_transaction.exchange_from = local_currency
      AND atm_transaction.exchange_to = exchange_to
    );

    RETURN (currency);
END$$
DELIMITER ;



DELIMITER $$

CREATE FUNCTION FindAccountType(
  user_id INT,
  account_type VARCHAR(20)
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN

    DECLARE accountType VARCHAR(20);

    IF account_type = 'checking' THEN 
      SET accountType = (
        SELECT DISTINCT checking_account.type 
        FROM checking_accounts checking_account 
        INNER JOIN bank_accounts bank_account 
        ON bank_account.user_id = user_id 
        WHERE checking_account.bank_account_id = bank_account.bank_account_id
      );
    ELSEIF account_type = 'savings' THEN 
      SET accountType = (
        SELECT DISTINCT savings_account.type 
        FROM savings_accounts savings_account 
        INNER JOIN bank_accounts bank_account 
        ON bank_account.user_id = user_id 
        WHERE savings_account.bank_account_id = bank_account.bank_account_id
      );
    ELSEIF account_type = 'crypto' THEN 
      SET accountType = (
        SELECT DISTINCT crypto_account.type 
        FROM crypto_accounts crypto_account 
        INNER JOIN bank_accounts bank_account 
        ON bank_account.user_id = user_id 
        INNER JOIN atm_accounts atm_account 
        ON atm_account.bank_account_id = bank_account.bank_account_id
        INNER JOIN portfolios portfolio 
        ON portfolio.atm_account_id = atm_account.atm_account_id
        WHERE crypto_account.portfolio_id = portfolio.portfolio_id
      );
      END IF;

    RETURN (accountType);
END$$
DELIMITER ;



DELIMITER $$

CREATE FUNCTION FindTransactionType(
  transaction_type VARCHAR(20)
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN

    DECLARE transactionType VARCHAR(20);

    IF transaction_type = 'cash' THEN 
      SET transactionType = (
        SELECT DISTINCT atm_transaction.type 
        FROM atm_transactions atm_transaction 
        WHERE atm_transaction.type = transaction_type 
      );
    ELSEIF transaction_type = 'crypto' THEN 
      SET transactionType = (
        SELECT DISTINCT atm_transaction.type 
        FROM atm_transactions atm_transaction 
        WHERE atm_transaction.type = transaction_type
      );
      END IF;

    RETURN (transactionType);
END$$
DELIMITER ;



DELIMITER $$

CREATE FUNCTION FindFailedTransactions(
  user_id INT,
  transaction_type VARCHAR(20),
  account_type VARCHAR(20)
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN

    DECLARE failedTransactions INT;

    IF account_type = 'checking' THEN 
      SET failedTransactions = (
        SELECT COUNT(atm_transaction.transaction_id)
        FROM atm_transactions atm_transaction 
        INNER JOIN bank_accounts bank_account
        ON bank_account.user_id = user_id
        INNER JOIN atm_accounts atm_account 
        ON atm_account.bank_account_id = bank_account.bank_account_id
        INNER JOIN portfolios portfolio 
        ON portfolio.atm_account_id = atm_account.atm_account_id
        INNER JOIN atm_transaction_info transaction_info
        ON transaction_info.portfolio_id = portfolio.portfolio_id
        INNER JOIN checking_accounts checking_account 
        ON checking_account.bank_account_id = bank_account.bank_account_id
        WHERE atm_transaction.transaction_id = transaction_info.transaction_id
        AND atm_transaction.action != 'deposit'
        AND atm_transaction.type = transaction_type
        AND (checking_account.balance - atm_transaction.amount) < 0
      );
    ELSEIF account_type = 'savings' THEN 
      SET failedTransactions = (
        SELECT COUNT(atm_transaction.transaction_id)
        FROM atm_transactions atm_transaction 
        INNER JOIN bank_accounts bank_account
        ON bank_account.user_id = user_id
        INNER JOIN atm_accounts atm_account 
        ON atm_account.bank_account_id = bank_account.bank_account_id
        INNER JOIN portfolios portfolio 
        ON portfolio.atm_account_id = atm_account.atm_account_id
        INNER JOIN atm_transaction_info transaction_info
        ON transaction_info.portfolio_id = portfolio.portfolio_id
        INNER JOIN savings_accounts savings_account 
        ON savings_account.bank_account_id = bank_account.bank_account_id
        WHERE atm_transaction.transaction_id = transaction_info.transaction_id
        AND atm_transaction.action != 'deposit'
        AND atm_transaction.type = transaction_type
        AND (savings_account.balance - atm_transaction.amount) < 0
      );
    ELSEIF account_type = 'crypto' THEN 
      SET failedTransactions = (
        SELECT COUNT(atm_transaction.transaction_id)
        FROM atm_transactions atm_transaction 
        INNER JOIN bank_accounts bank_account
        ON bank_account.user_id = user_id
        INNER JOIN atm_accounts atm_account 
        ON atm_account.bank_account_id = bank_account.bank_account_id
        INNER JOIN portfolios portfolio 
        ON portfolio.atm_account_id = atm_account.atm_account_id
        INNER JOIN atm_transaction_info transaction_info
        ON transaction_info.portfolio_id = portfolio.portfolio_id
        INNER JOIN crypto_accounts crypto_account 
        ON crypto_account.portfolio_id = portfolio.portfolio_id
        WHERE atm_transaction.transaction_id = transaction_info.transaction_id
        AND atm_transaction.action != 'deposit'
        AND atm_transaction.type = transaction_type
        AND (crypto_account.balance - atm_transaction.amount) < 0
      );
    END IF;

    RETURN (failedTransactions);
END$$
DELIMITER ;