const config = require("./config");
const mysql = require("mysql2/promise");

// connection to database 
const pool = mysql.createPool({
  host: config.database.host,
  user: config.database.user,
  password: config.database.password,
  database: config.database.name,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
}); 

const getAllUsers = async () => {
  const result = await pool.query(`
    SELECT user_id, 
           full_name AS full_name, 
           first_name AS first_name, 
           last_name AS last_name 
    FROM general_users
    `
  );

  return result[0].length < 1 ? {} : result[0];
};

// business requirement #1
const getCryptoAccounts = async (currency, protocol, amount) => {
  const result = await pool.query(`
    SELECT bank_account.user_id, 
           crypto_account.crypto_account_id, 
           crypto_account.asset_type, 
           open_lending_protocol.provider_name, 
           crypto_loan.total_amount
    FROM crypto_accounts crypto_account
    INNER JOIN portfolios portfolio
    ON portfolio.portfolio_id = crypto_account.portfolio_id
    INNER JOIN atm_accounts atm_account
    ON atm_account.atm_account_id = portfolio.atm_account_id
    INNER JOIN bank_accounts bank_account
    ON bank_account.bank_account_id = atm_account.bank_account_id
    INNER JOIN lending_protocol_connections lending_protocol_connection
    ON lending_protocol_connection.crypto_account_id = crypto_account.crypto_account_id
    INNER JOIN open_lending_protocols open_lending_protocol 
    ON open_lending_protocol.protocol_id = lending_protocol_connection.protocol_id
    INNER JOIN crypto_loans crypto_loan 
    ON lending_protocol_connection.crypto_loan_id = crypto_loan.crypto_loan_id
    WHERE crypto_account.asset_type = ? 
    AND open_lending_protocol.provider_name = ?
    AND crypto_loan.total_amount >= ?
    ORDER BY bank_account.user_id ASC
    `, [currency, protocol, amount]
  );

  return result[0].length < 1 ? {} : result[0];
};

// business requirement #2
const getCryptoLoans = async (interestRate, reward, days) => {

  // convert interestRate, which is type string; remove % symbol and divide by 100 to get floating point value 
  interestRate = interestRate.replace("%", "");
  interestRate = parseFloat(interestRate / 100);

  const result = await pool.query(`
    SELECT general_user.user_id, 
           general_user.full_name,
           crypto_loan.asset_type,
           crypto_loan.total_amount,
           crypto_loan.interest_rate,
           crypto_loan.reward,
           DATEDIFF(CURRENT_DATE, CAST(crypto_loan.created_at AS DATE)) AS days_active
    FROM general_users general_user
    INNER JOIN bank_accounts bank_account 
    ON bank_account.user_id = general_user.user_id
    INNER JOIN atm_accounts atm_account 
    ON atm_account.bank_account_id = bank_account.bank_account_id
    INNER JOIN portfolios portfolio 
    ON portfolio.atm_account_id = atm_account.atm_account_id
    INNER JOIN crypto_accounts crypto_account
    ON crypto_account.portfolio_id = portfolio.portfolio_id
    INNER JOIN lending_protocol_connections lending_protocol_connection
    ON lending_protocol_connection.crypto_account_id =    crypto_account.crypto_account_id
    INNER JOIN crypto_loans crypto_loan
    ON crypto_loan.crypto_loan_id =     lending_protocol_connection.crypto_loan_id
    WHERE crypto_loan.interest_rate > ?
    AND crypto_loan.reward > ?
    AND DATEDIFF(CURRENT_DATE, CAST(crypto_loan.created_at AS DATE)) > ?
    ORDER BY general_user.user_id ASC
    `, [interestRate, reward, days]
  );

  return result[0].length < 1 ? {} : result[0];
};

// business requirement #3
const failedAtmTransactions = async (transactionType, accountType) => {
  
  const result = await pool.query(`
    SELECT general_user.user_id,
           general_user.full_name,
           FindTransactionType(?) AS transaction_type,
           FindAccountType(general_user.user_id, ?) AS account_type,
           (
           SELECT FindFailedTransactions(general_user.user_id, transaction_type, account_type) 
           ) AS failed_transactions
    FROM general_users general_user 
    INNER JOIN bank_accounts bank_account
    ON bank_account.user_id = general_user.user_id
    INNER JOIN atm_accounts atm_account 
    ON atm_account.bank_account_id = bank_account.bank_account_id
    INNER JOIN portfolios portfolio 
    ON portfolio.atm_account_id = atm_account.atm_account_id
    INNER JOIN atm_transaction_info transaction_info
    ON transaction_info.portfolio_id = portfolio.portfolio_id
    GROUP BY general_user.user_id ASC
    `, [transactionType, accountType]
  );

  return result[0].length < 1 ? {} : result[0];
};

// business requirements #4
const getAtmAccounts = async (bank, minTransactionNum, minTransferAmount) => {
  const result = await pool.query(`
    SELECT DISTINCT atm_account.atm_account_id, 	
       general_user.full_name,
       bank.name,
       (
       	   SELECT COUNT(transaction_info.transaction_id)
           FROM atm_transaction_info transaction_info 
           WHERE transaction_info.portfolio_id = portfolio.portfolio_id
       ) AS total_transactions,
       (
         SELECT SUM(atm_transaction.amount)
         FROM atm_transactions atm_transaction
         INNER JOIN atm_transaction_info transaction_info
         ON transaction_info.transaction_id = atm_transaction.transaction_id
         INNER JOIN transaction_actions transaction_action
         ON transaction_action.transaction_action_id = transaction_info.transaction_action_id
         WHERE atm_transaction.action = 'transfer'
         AND transaction_action.to_account = 'checking'
         AND portfolio.portfolio_id = transaction_info.portfolio_id
       ) AS total_transfer_amount
    FROM general_users general_user
    INNER JOIN bank_accounts bank_account
    ON bank_account.user_id = general_user.user_id
    INNER JOIN banks bank
    ON bank.bank_id = bank_account.bank_id
    INNER JOIN atm_accounts atm_account
    ON atm_account.bank_account_id = bank_account.bank_account_id
    INNER JOIN portfolios portfolio
    ON portfolio.atm_account_id = atm_account.atm_account_id
    INNER JOIN atm_transaction_info transaction_info
    ON transaction_info.portfolio_id = portfolio.portfolio_id
    INNER JOIN atm_transactions atm_transaction
    ON atm_transaction.transaction_id = transaction_info.transaction_id
    WHERE bank.abbreviation = ?
    GROUP BY atm_account.atm_account_id, 
    		 portfolio.portfolio_id, 
             atm_transaction.transaction_id, 
             general_user.full_name
    AND portfolio.portfolio_id IN (
    	SELECT transaction_info.portfolio_id
        FROM atm_transaction_info transaction_info
        WHERE transaction_info.portfolio_id = portfolio.portfolio_id
        HAVING COUNT(transaction_info.transaction_id) >= ?
    )
    AND atm_transaction.transaction_id IN (
      SELECT transaction_info.transaction_id
        FROM atm_transaction_info transaction_info
        INNER JOIN transaction_actions transaction_action
        ON transaction_action.transaction_action_id = transaction_info.transaction_action_id
        WHERE transaction_info.transaction_id = atm_transaction.transaction_id
        AND transaction_action.to_account = 'checking'
        HAVING SUM(atm_transaction.amount) >= ?
    )
    `, [bank, minTransactionNum, minTransferAmount]
  );

  return result[0].length < 1 ? {} : result[0];
};

// Business requirements #5
const securityContentStatus = async (country, deviceType, status) => {
  const result = await pool.query(`
    SELECT DISTINCT atm_machine.tid, 
           region.country,
           (
           	SELECT COUNT(security_content.media_content_id)
              FROM security_media_content security_content
              WHERE security_content.cdn_id = kubeCDN.cdn_id
              AND security_content.content_type = ?
              AND 1 =
              	CASE WHEN DetermineDeviceStatus(security_content.media_content_id, ?) = 1 THEN 1
              	END
           ) AS security_content_total
    FROM atm_machines atm_machine 
    INNER JOIN regions region 
    ON region.region_id = atm_machine.region_id
    INNER JOIN kubeCDNs kubeCDN 
    ON kubeCDN.region_id = region.region_id
    INNER JOIN security_media_content security_content
    ON security_content.cdn_id = kubeCDN.cdn_id
    WHERE region.country = ?
    `, [deviceType, status, country]
  );

  return result[0].length < 1 ? {} : result[0];
};

// Business requirements #6
const cryptoExchangeAcctInfo = async (exchange, asset, minBalance, minNumLoans) => {
  const result = await pool.query(`
    SELECT DISTINCT crypto_exchange.exchange_id, 
	                  crypto_exchange.provider AS exchange_provider,
	                  crypto_account.crypto_account_id,
                    crypto_account.asset_type AS asset,
                    crypto_account.balance AS crypto_balance,
                    (
                      SELECT COUNT(protocol_connection.crypto_loan_id) 
                      FROM lending_protocol_connections protocol_connection 
                      WHERE protocol_connection.crypto_account_id = crypto_account.crypto_account_id
                    ) AS total_crypto_loans
    FROM crypto_exchanges crypto_exchange
    INNER JOIN crypto_account_info account_info 
    ON account_info.exchange_id = crypto_exchange.exchange_id
    INNER JOIN crypto_accounts crypto_account 
    ON crypto_account.crypto_account_id = account_info.crypto_account_id
    INNER JOIN lending_protocol_connections protocol_connection
    ON protocol_connection.crypto_account_id = crypto_account.crypto_account_id
    WHERE crypto_exchange.provider = ?
    AND crypto_account.asset_type = ?
    AND crypto_account.balance > ?
    HAVING total_crypto_loans > ?
    `, [exchange, asset, minBalance, minNumLoans]
  );

  return result[0].length < 1 ? {} : result[0];
};

// Business requirements #7
const avgClosingRate = async (sourceCurrency, targetCurrency, startYear, endYear) => {
  const result = await pool.query(`
    SELECT authenticated_user.user_id, 
           source_cur.currency_name AS source_currency,
           target_cur.currency_name AS target_currency,
           CalculateAverage(
             portfolio.portfolio_id, 
             source_cur.source_currency, 
             target_cur.target_currency) AS average_rate
    FROM authenticated_users authenticated_user 
    INNER JOIN atm_accounts atm_account
    ON atm_account.user_auth_token = authenticated_user.user_auth_token
    INNER JOIN portfolios portfolio 
    ON portfolio.atm_account_id = atm_account.atm_account_id
    INNER JOIN portfolio_exchange_rates p_exchange_rate
    ON p_exchange_rate.portfolio_id = portfolio.portfolio_id
    INNER JOIN exchange_rates exchange_rate 
    ON exchange_rate.exchange_rate_id = p_exchange_rate.exchange_rate_id
    INNER JOIN 
    (
    	SELECT p_exchange_rate.portfolio_id, exchange_rate.source_currency, currency.currency_name
        FROM portfolio_exchange_rates p_exchange_rate
        INNER JOIN exchange_rates exchange_rate 
        ON exchange_rate.exchange_rate_id = p_exchange_rate.exchange_rate_id
        INNER JOIN currencies currency 
        ON currency.currency_id = exchange_rate.source_currency
    ) source_cur
    INNER JOIN 
    (
    	SELECT p_exchange_rate.portfolio_id, exchange_rate.target_currency, currency.currency_name
    	FROM portfolio_exchange_rates p_exchange_rate 
        INNER JOIN exchange_rates exchange_rate 
        ON exchange_rate.exchange_rate_id = p_exchange_rate.exchange_rate_id
        INNER JOIN currencies currency 
        ON currency.currency_id = exchange_rate.target_currency
    ) target_cur
    WHERE source_cur.currency_name = ? 
    AND target_cur.currency_name = ?
    AND source_cur.portfolio_id = portfolio.portfolio_id
    AND target_cur.portfolio_id = portfolio.portfolio_id
    AND EXTRACT(YEAR FROM exchange_rate.trading_date) >= ?
    AND EXTRACT(YEAR FROM exchange_rate.trading_date) <= ?
    GROUP BY portfolio.portfolio_id
    `, [sourceCurrency, targetCurrency, startYear, endYear]
  );

  return result[0].length < 1 ? {} : result[0];
};

// Business requirements #8
const authUserExchanges = async (country, cryptoCurrency, quantity) => {
  const result = await pool.query(`
    SELECT authenticated_user.user_id, 
	         region.country, 
           region.local_currency AS from_currency,
           FindCurrency(region.local_currency, ?) AS to_currency,
           (
		        SELECT SUM(atm_transaction.amount) 
            FROM atm_transactions atm_transaction 
            WHERE atm_transaction.action = 'exchange'
            AND atm_transaction.exchange_from = from_currency
            AND atm_transaction.exchange_to = to_currency
            HAVING SUM(atm_transaction.amount) >= ? 
           ) AS exchange_total
    FROM authenticated_users authenticated_user
    INNER JOIN sessions a_session
    ON a_session.user_auth_token = authenticated_user.user_auth_token
    INNER JOIN atm_machines atm_machine 
    ON atm_machine.tid = a_session.tid
    INNER JOIN regions region 
    ON region.region_id = atm_machine.region_id
    INNER JOIN atm_accounts atm_account 
    ON atm_account.user_auth_token = authenticated_user.user_auth_token
    INNER JOIN portfolios portfolio
    ON portfolio.atm_account_id = atm_account.atm_account_id
    INNER JOIN atm_transaction_info transaction_info
    ON transaction_info.portfolio_id = portfolio.portfolio_id
    WHERE region.country = ?
    GROUP BY authenticated_user.user_id
    `, [cryptoCurrency, quantity, country]
  );

  return result[0].length < 1 ? {} : result[0];
};

module.exports = {
  getAllUsers,
  getCryptoAccounts,
  getCryptoLoans,
  failedAtmTransactions,
  getAtmAccounts,
  securityContentStatus,
  cryptoExchangeAcctInfo,
  avgClosingRate,
  authUserExchanges,
};