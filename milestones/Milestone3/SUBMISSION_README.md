Name and Student ID

    i. Mitchel Baker, 917679066

Link to join Discord server
  
    ii. https://discord.gg/NkFEvn2ZsD

Link to repl app 
  
    iii. https://replit.com/join/smdpvhavna-mitchthebaker

Bot commands

    1. /get-crypto-accounts <currency> <lending protocol> <minimum loan amount>
     e.g. /get-crypto-accounts bitcoin aave 500
     e.g. /get-crypto-accounts ethereum compound 500
     e.g. /get-crypto-accounts bitcoin compound 1000
  
    2. /get-crypto-loans <minimum interest rate> <reward amount> <duration of loan in days>
    e.g. /get-crypto-loans 3% 50 10
    e.g. /get-crypto-loans 2% 200 10
    e.g. /get-crypto-loans 2% 200 365
  
    3. /failed-atm-transactions <transaction type> <bank account type>
    e.g. /failed-atm-transactions crypto checking
    e.g. /failed-atm-transactions crypto savings
    e.g. /failed-atm-transactions crypto crypto
    e.g. /failed-atm-transactions cash checking
    e.g. /failed-atm-transactions cash savings
    e.g. /failed-atm-transactions cash crypto
  
    4. /get-atm-accounts <bank> <minimum transaction #> <minimum transfer amount> 
    e.g. /get-atm-accounts MFH 5 2800
    e.g. /get-atm-accounts FFG 1 1 
  
    5. /security-content-status <country> <security device type> <status>
    e.g. /security-content-status US iot_contextaware_sensors online
    e.g. /security-content-status US iot_temperature_sensors offline
    e.g. /security-content-status France iot_contextaware_sensors online
    e.g. /security-content-status France cameras offline  
  
    6. /crypto-exchange-account-info <crypto exchange> <asset type> <minimum balance> <minimum # crypto loans>
    e.g. /crypto-exchange-account-info binance bitcoin 200 3
    e.g. /crypto-exchange-account-info binance ethereum 200 4
    e.g. /crypto-exchange-account-info gemini ethereum 200 4
  
    7. /avg-closing-rate <source currency> <target currency>  <start year> <end year>
    e.g. /avg-closing-rate bitcoin ethereum 2020 2021
    e.g. /avg-closing-rate ethereum bitcoin 2019 2021
    e.g. /avg-closing-rate dollar bitcoin 2019 2021
    e.g. /avg-closing-rate euro bitcoin 2019 2021
    e.g. /avg-closing-rate dollar ethereum 2019 2021
    e.g. /avg-closing-rate ethereum dollar 2019 2021
  
    8. /user-currency-exchanges <country> <crypto currency> <quantity>
    e.g. /user-currency-exchanges US bitcoin 250
    e.g. /user-currency-exchanges France bitcoin 2500
    e.g. /user-currency-exchanges Spain ethereum 5000
    e.g. /user-currency-exchanges US ethereum 200

Business requirements

    1. For each user, find all their crypto accounts in a specific currency which is currently being lent to specific open lending protocol with a minimum loan amount of X.

    2. For each user, find all their crypto loans with a specific minimum interest rate which has earned a reward amount higher than X over a specific time frame in days.

    3. For each user, find the total number of atm transactions for a specific transaction type they’ve made where their bank account with a specific type did not have sufficient funds to complete the transaction.

    4. Find all atm accounts filed under a specific bank which have conducted at least X number of transactions and transferred a minimum of X amount into their checking account.

    5. For each atm machine within a region in a specific country, find the total number of security media content where the security device of a specific type it originated from had a status of X.

    6. For a specific crypto exchange, find all crypto accounts of a specific asset type with a balance above X which also have at least X number of crypto loans.

    7. For each authenticated user, find the average closing rate for all currency exchanges between X currency and Y currency between the years X and Y.

    8. Find all authenticated users who have transacted with atm machines in a specific country who have exchanged this country’s local currency with a specific crypto currency in quantities greater than X.
