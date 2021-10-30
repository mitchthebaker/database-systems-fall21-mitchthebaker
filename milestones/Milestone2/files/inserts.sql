-- Script name: inserts.sql
-- Author: Mitchel Baker 
-- Purpose: insert sample data into each table so that we can test the integrity and relationships of the database system

USE atmManagementSystemDB;

-- inserts for general users 
INSERT INTO general_users (email, full_name, first_name, last_name, is_authenticated) VALUES ('test1@mail.com', 'Emmett Ravenna', 'Emmett', 'Ravenna', 0);
INSERT INTO general_users (email, full_name, first_name, last_name, is_authenticated) VALUES ('test2@mail.com', 'Kara Deacon', 'Kara', 'Deacon', 0);
INSERT INTO general_users (email, full_name, first_name, last_name, is_authenticated) VALUES ('test3@mail.com', 'Howard Yasmin', 'Howard', 'Yasmin', 0);
INSERT INTO general_users (email, full_name, first_name, last_name, is_authenticated) VALUES ('test4@mail.com', 'Patti Viviette', 'Patti', 'Viviette', 0);
INSERT INTO general_users (email, full_name, first_name, last_name, is_authenticated) VALUES ('test5@mail.com', 'Catherina Brittney', 'Catherina', 'Brittney', 0);
INSERT INTO general_users (email, full_name, first_name, last_name, is_authenticated) VALUES ('test6@mail.com', 'Rowina Rainbow', 'Rowina', 'Rainbow', 0);
INSERT INTO general_users (email, full_name, first_name, last_name, is_authenticated) VALUES ('test7@mail.com', 'Geoff Salome', 'Geoff', 'Salome', 0);
INSERT INTO general_users (email, full_name, first_name, last_name, is_authenticated) VALUES ('test8@mail.com', 'Truman Tahnee', 'Truman', 'Tahnee', 0);
INSERT INTO general_users (email, full_name, first_name, last_name, is_authenticated) VALUES ('test9@mail.com', 'Elsa Stone', 'Elsa', 'Stone', 0);
INSERT INTO general_users (email, full_name, first_name, last_name, is_authenticated) VALUES ('test10@mail.com', 'Zander Gabby', 'Zander', 'Gabby', 0);

-- inserts for banks
INSERT INTO banks (name, address) VALUES ('Focus Financial Group', '575 Tara Trail, Apt. 349, 68725, Port Monica, Mississippi, United States');
INSERT INTO banks (name, address) VALUES ('Miracle Financial Holdings', '424 Jodie Radial, Suite 000, 13305, Rippinton, New Jersey, United States');
INSERT INTO banks (name, address) VALUES ('Lightning Bank System', '198 Beier Ports, Apt. 630, 40011, Skilesside, New Hampshire, United States');
INSERT INTO banks (name, address) VALUES ('Green Valley Holdings Inc.', '3723 Dickinson Knolls, Suite 016, 35261-0361, Port Wayneport, New Jersey, United States');
INSERT INTO banks (name, address) VALUES ('Celestial Financial', '2697 Weissnat Fords, Suite 438, 28022, Ettieland, New York, United States');

-- inserts for bank accounts 
INSERT INTO bank_accounts (routing_number, bank_id, user_id) VALUES (333638385, 1, 1);
INSERT INTO bank_accounts (routing_number, bank_id, user_id) VALUES (271002691, 1, 2);
INSERT INTO bank_accounts (routing_number, bank_id, user_id) VALUES (389635060, 2, 3);
INSERT INTO bank_accounts (routing_number, bank_id, user_id) VALUES (877567925, 2, 4);
INSERT INTO bank_accounts (routing_number, bank_id, user_id) VALUES (627989892, 3, 5);
INSERT INTO bank_accounts (routing_number, bank_id, user_id) VALUES (180950494, 3, 6);
INSERT INTO bank_accounts (routing_number, bank_id, user_id) VALUES (951358377, 4, 7);
INSERT INTO bank_accounts (routing_number, bank_id, user_id) VALUES (142869879, 4, 8);
INSERT INTO bank_accounts (routing_number, bank_id, user_id) VALUES (710326016, 5, 9);
INSERT INTO bank_accounts (routing_number, bank_id, user_id) VALUES (610391484, 5, 10);

-- inserts for user authentication methods 
INSERT INTO user_auth_methods (type, is_international, user_id) VALUES ('mobile', 1, 1);
INSERT INTO user_auth_methods (type, is_international, user_id) VALUES ('card', 1, 2);
INSERT INTO user_auth_methods (type, is_international, user_id) VALUES ('mobile', 1, 3);
INSERT INTO user_auth_methods (type, is_international, user_id) VALUES ('card', 1, 4);
INSERT INTO user_auth_methods (type, is_international, user_id) VALUES ('mobile', 1, 5);
INSERT INTO user_auth_methods (type, is_international, user_id) VALUES ('card', 1, 6);
INSERT INTO user_auth_methods (type, is_international, user_id) VALUES ('mobile', 1, 7);
INSERT INTO user_auth_methods (type, is_international, user_id) VALUES ('card', 1, 8);
INSERT INTO user_auth_methods (type, is_international, user_id) VALUES ('mobile', 1, 9);
INSERT INTO user_auth_methods (type, is_international, user_id) VALUES ('card', 1, 10);

-- inserts for mobile wallets 
INSERT INTO mobile_wallets (card_number, exp_date, cvc, zip, user_auth_id) VALUES ('4318633921643299', '07/26', 862, 94104, 1);
INSERT INTO mobile_wallets (card_number, exp_date, cvc, zip, user_auth_id) VALUES ('4201997830840977', '07/23', 296, 94103, 3);
INSERT INTO mobile_wallets (card_number, exp_date, cvc, zip, user_auth_id) VALUES ('4992663415030540', '09/25', 528, 94105, 5);
INSERT INTO mobile_wallets (card_number, exp_date, cvc, zip, user_auth_id) VALUES ('4224084448288619', '04/26', 128, 94103, 7);
INSERT INTO mobile_wallets (card_number, exp_date, cvc, zip, user_auth_id) VALUES ('4828734748332331', '07/25', 647, 94105, 9);

-- inserts for debit/ATM cards 
INSERT INTO debit_atm_cards (card_number, exp_date, cvc, zip, user_auth_id) VALUES ('4148879714396324', '10/22', 619, 94105, 2);
INSERT INTO debit_atm_cards (card_number, exp_date, cvc, zip, user_auth_id) VALUES ('4913553158169876', '11/25', 656, 94104, 4);
INSERT INTO debit_atm_cards (card_number, exp_date, cvc, zip, user_auth_id) VALUES ('4401096645839353', '04/26', 220, 94101, 6);
INSERT INTO debit_atm_cards (card_number, exp_date, cvc, zip, user_auth_id) VALUES ('4213649532586350', '03/24', 219, 94104, 8);
INSERT INTO debit_atm_cards (card_number, exp_date, cvc, zip, user_auth_id) VALUES ('4098741374963282', '11/25', 382, 94102, 10);

-- inserts for bank_account_links
INSERT INTO bank_account_links (bank_account_id, wallet_id, card_id) VALUES (3, 7, null);
INSERT INTO bank_account_links (bank_account_id, wallet_id, card_id) VALUES (4, null, 6);
INSERT INTO bank_account_links (bank_account_id, wallet_id, card_id) VALUES (5, 8, null);
INSERT INTO bank_account_links (bank_account_id, wallet_id, card_id) VALUES (6, null, 7);
INSERT INTO bank_account_links (bank_account_id, wallet_id, card_id) VALUES (7, 9, null);
INSERT INTO bank_account_links (bank_account_id, wallet_id, card_id) VALUES (8, null, 8);
INSERT INTO bank_account_links (bank_account_id, wallet_id, card_id) VALUES (9, 10, null);
INSERT INTO bank_account_links (bank_account_id, wallet_id, card_id) VALUES (10, null, 9);
INSERT INTO bank_account_links (bank_account_id, wallet_id, card_id) VALUES (11, 11, null);
INSERT INTO bank_account_links (bank_account_id, wallet_id, card_id) VALUES (12, null, 10);

-- inserts for authenticated users 
INSERT INTO authenticated_users (user_auth_token, user_id, is_admin) VALUES ('pL-gj]>mg+(-:W?P64jR-I5JYGe>c7I&@:t7+;H_mFP;Vq9L>/]cB^2<Qu.{oF/s', 1, 0);
INSERT INTO authenticated_users (user_auth_token, user_id, is_admin) VALUES ('xa4D0-F^GNM-1cDI19-Vf|wb}RjNKNGgid3Jj|rr~8DiiRL`#kzLxC@giIPPlLak', 2, 0);
INSERT INTO authenticated_users (user_auth_token, user_id, is_admin) VALUES ('{nf}Qn-pNRKKZHoAurds}59I|.7PR&[azT%1I)5MXK)B>6*!+z|(w@+J,wSAq+|P', 3, 0);
INSERT INTO authenticated_users (user_auth_token, user_id, is_admin) VALUES ('XMY~k=6LB,C<-LoMPyXuf$R89h5dfqC:`EDBc N(Qq>;Mr;||i]6QA.4,XdO]bHr', 4, 0);
INSERT INTO authenticated_users (user_auth_token, user_id, is_admin) VALUES ('D*c12LHLG=<b|c|PLk}dz7^4?x@m|?]G>v ],;/9`nun[(UNBXE:Xir.Y@Fn]}Es', 5, 0);

-- inserts for regions 
INSERT INTO regions (country, timezone_offset) VALUES ('Honduras', '-06:00:00');
INSERT INTO regions (country, timezone_offset) VALUES ('Finland', '03:00:00');
INSERT INTO regions (country, timezone_offset) VALUES ('Kazakhstan', '05:00:00');
INSERT INTO regions (country, timezone_offset) VALUES ('Bolivia', '-04:00:00');
INSERT INTO regions (country, timezone_offset) VALUES ('Panama', '-05:00:00');

-- inserts for atm_machines 
INSERT INTO atm_machines (status, access_permissions, region_id) VALUES (1, 1, 1);
INSERT INTO atm_machines (status, access_permissions, region_id) VALUES (1, 1, 1);
INSERT INTO atm_machines (status, access_permissions, region_id) VALUES (1, 1, 2);
INSERT INTO atm_machines (status, access_permissions, region_id) VALUES (1, 1, 2);
INSERT INTO atm_machines (status, access_permissions, region_id) VALUES (1, 1, 3);
INSERT INTO atm_machines (status, access_permissions, region_id) VALUES (1, 1, 3);
INSERT INTO atm_machines (status, access_permissions, region_id) VALUES (1, 1, 4);
INSERT INTO atm_machines (status, access_permissions, region_id) VALUES (1, 1, 4);
INSERT INTO atm_machines (status, access_permissions, region_id) VALUES (1, 1, 5);
INSERT INTO atm_machines (status, access_permissions, region_id) VALUES (1, 1, 5);

-- inserts for languages 
INSERT INTO languages (country, name, is_supported, added_at) VALUES ('United States', 'English', 1, now());
INSERT INTO languages (country, name, is_supported, added_at) VALUES ('Spain', 'Spanish', 1, now());
INSERT INTO languages (country, name, is_supported, added_at) VALUES ('France', 'French', 1, now());
INSERT INTO languages (country, name, is_supported, added_at) VALUES ('Korea', 'Korean', 0, now());
INSERT INTO languages (country, name, is_supported, added_at) VALUES ('China', 'Mandarin', 1, now());

-- inserts for atm accounts 
INSERT INTO atm_accounts (created_at, bank_account_id, user_auth_token) VALUES (now(), 3, 'pL-gj]>mg+(-:W?P64jR-I5JYGe>c7I&@:t7+;H_mFP;Vq9L>/]cB^2<Qu.{oF/s');
INSERT INTO atm_accounts (created_at, bank_account_id, user_auth_token) VALUES (now(), 4, 'xa4D0-F^GNM-1cDI19-Vf|wb}RjNKNGgid3Jj|rr~8DiiRL`#kzLxC@giIPPlLak');
INSERT INTO atm_accounts (created_at, bank_account_id, user_auth_token) VALUES (now(), 5, '{nf}Qn-pNRKKZHoAurds}59I|.7PR&[azT%1I)5MXK)B>6*!+z|(w@+J,wSAq+|P');
INSERT INTO atm_accounts (created_at, bank_account_id, user_auth_token) VALUES (now(), 6, 'XMY~k=6LB,C<-LoMPyXuf$R89h5dfqC:`EDBc N(Qq>;Mr;||i]6QA.4,XdO]bHr');
INSERT INTO atm_accounts (created_at, bank_account_id, user_auth_token) VALUES (now(), 7, 'D*c12LHLG=<b|c|PLk}dz7^4?x@m|?]G>v ],;/9`nun[(UNBXE:Xir.Y@Fn]}Es');

-- inserts for portfolios 
INSERT INTO portfolios (num_crypto_accts, created_at, atm_account_id) VALUES (0, now(), 6);
INSERT INTO portfolios (num_crypto_accts, created_at, atm_account_id) VALUES (0, now(), 7);
INSERT INTO portfolios (num_crypto_accts, created_at, atm_account_id) VALUES (0, now(), 8);
INSERT INTO portfolios (num_crypto_accts, created_at, atm_account_id) VALUES (0, now(), 9);
INSERT INTO portfolios (num_crypto_accts, created_at, atm_account_id) VALUES (0, now(), 10);

-- inserts for crypto_accounts
INSERT INTO crypto_accounts (asset_type, balance, public_key, access_permissions, portfolio_id) VALUES ('ethereum', 4500, '0x229AfdEa663b7Da32314DD2Bf47f7126A7878D44', 1, 1);
INSERT INTO crypto_accounts (asset_type, balance, public_key, access_permissions, portfolio_id) VALUES ('bitcoin', 1500, '03b3a9161598f2403c94772a6d8ff856212d0b45be9e13e0f3daabf523d3d84531', 1, 1);
INSERT INTO crypto_accounts (asset_type, balance, public_key, access_permissions, portfolio_id) VALUES ('ethereum', 3000, '0xAA4E7b75a19eFE07d59c391f2Ba4cD84857fD5b9', 1, 2);
INSERT INTO crypto_accounts (asset_type, balance, public_key, access_permissions, portfolio_id) VALUES ('bitcoin', 500, '022de3217f0a8feec95ddbf55fe6aa7249e9158725ac45e55fb3c39318905a2846', 1, 2);
INSERT INTO crypto_accounts (asset_type, balance, public_key, access_permissions, portfolio_id) VALUES ('ethereum', 400, '0x56aD8aE6C8F278eD32E490B18c4Ef301Aa87d9bf', 1, 3);
INSERT INTO crypto_accounts (asset_type, balance, public_key, access_permissions, portfolio_id) VALUES ('bitcoin', 3, '02351a923d0b945636e46da16ab72e4f1af02645989d9062a64cb4684e7df79f64', 1, 3);
INSERT INTO crypto_accounts (asset_type, balance, public_key, access_permissions, portfolio_id) VALUES ('ethereum', 2000, '0xAE592E32B775eBEa34469C0E68fA2DbcADB7Be01', 1, 4);
INSERT INTO crypto_accounts (asset_type, balance, public_key, access_permissions, portfolio_id) VALUES ('bitcoin', 1, '03f851c42b558cfbf8daad28532cd04752c3ba3770f784f864e79a066de7e9c85e', 1, 4);
INSERT INTO crypto_accounts (asset_type, balance, public_key, access_permissions, portfolio_id) VALUES ('ethereum', 6000, '0xde8B054b47B59EA3426FDa7417a52cFB9e902942', 1, 5);
INSERT INTO crypto_accounts (asset_type, balance, public_key, access_permissions, portfolio_id) VALUES ('dai', 1000, '0xde8B054b47B59EA3426FDa7417a52cFB9e902942', 1, 5);
INSERT INTO crypto_accounts (asset_type, balance, public_key, access_permissions, portfolio_id) VALUES ('bitcoin', 15, '029966efb2ed9bbe43ee5083690c529b7fd474ffb4e05677ccc7b974592112ee1b', 1, 5);

-- inserts for crypto exchanges
INSERT INTO crypto_exchanges (provider, is_operational) VALUES ('binance', 1);
INSERT INTO crypto_exchanges (provider, is_operational) VALUES ('gemini', 1);
INSERT INTO crypto_exchanges (provider, is_operational) VALUES ('uphold', 0);

-- inserts for crypto account info 
INSERT INTO crypto_account_info (crypto_account_id, exchange_id) VALUES (3, 1);
INSERT INTO crypto_account_info (crypto_account_id, exchange_id) VALUES (4, 1);
INSERT INTO crypto_account_info (crypto_account_id, exchange_id) VALUES (5, 1);
INSERT INTO crypto_account_info (crypto_account_id, exchange_id) VALUES (6, 1);
INSERT INTO crypto_account_info (crypto_account_id, exchange_id) VALUES (7, 2);
INSERT INTO crypto_account_info (crypto_account_id, exchange_id) VALUES (8, 2);
INSERT INTO crypto_account_info (crypto_account_id, exchange_id) VALUES (9, 2);
INSERT INTO crypto_account_info (crypto_account_id, exchange_id) VALUES (10, 2);
INSERT INTO crypto_account_info (crypto_account_id, exchange_id) VALUES (11, 2);
INSERT INTO crypto_account_info (crypto_account_id, exchange_id) VALUES (12, 2);

-- inserts for bank crypto partnerships
INSERT INTO bank_crypto_partnerships (bank_id, exchange_id) VALUES (1, 1);
INSERT INTO bank_crypto_partnerships (bank_id, exchange_id) VALUES (2, 2);
INSERT INTO bank_crypto_partnerships (bank_id, exchange_id) VALUES (3, 2);
INSERT INTO bank_crypto_partnerships (bank_id, exchange_id) VALUES (4, 2);
INSERT INTO bank_crypto_partnerships (bank_id, exchange_id) VALUES (5, 3);

-- inserts for open lending protocols 
INSERT INTO open_lending_protocols (provider_name, is_operational) VALUES ('compound', 1);
INSERT INTO open_lending_protocols (provider_name, is_operational) VALUES ('aave', 1);
INSERT INTO open_lending_protocols (provider_name, is_operational) VALUES ('0x', 0);
INSERT INTO open_lending_protocols (provider_name, is_operational) VALUES ('uniswap', 1);

-- inserts for crypto loans 
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining) VALUES ('annually', now(), 'borrow', 'bitcoin', 0.03, 500, 200);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining) VALUES ('monthly', now(), 'borrow', 'ethereum', 0.04, 1000, 500);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining) VALUES (null, now(), 'lend', 'ethereum', 0.04, 1000, null);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining) VALUES (null, now(), 'lend', 'bitcoin', 0.03, 15000, null);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining) VALUES (null, now(), 'lend', 'bitcoin', 0.03, 5000, null);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining) VALUES (null, now(), 'lend', 'bitcoin', 0.03, 50000, null);

-- inserts for crypto loan payments
INSERT INTO crypto_loan_payments (amount_paid, paid_at, crypto_loan_id) VALUES (100, now(), 7);
INSERT INTO crypto_loan_payments (amount_paid, paid_at, crypto_loan_id) VALUES (100, now(), 7);
INSERT INTO crypto_loan_payments (amount_paid, paid_at, crypto_loan_id) VALUES (100, now(), 7);
INSERT INTO crypto_loan_payments (amount_paid, paid_at, crypto_loan_id) VALUES (250, now(), 8);
INSERT INTO crypto_loan_payments (amount_paid, paid_at, crypto_loan_id) VALUES (250, now(), 8);

-- inserts for lending protocol connections 
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (2, 7, 4);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (2, 10, 6);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (2, 11, 8);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (2, 12, 10);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 8, 3);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 9, 11);

-- inserts for currencies 
INSERT INTO currencies (currency_name, circulation_amt) VALUES ('US dollar', 2000000000000);
INSERT INTO currencies (currency_name, circulation_amt) VALUES ('Euro', 1250000000);
INSERT INTO currencies (currency_name, circulation_amt) VALUES ('Bitcoin', 21000000);
INSERT INTO currencies (currency_name, circulation_amt) VALUES ('Ethereum', 118000000);

-- inserts for exchange rates 
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES (now(), 1, 2, 0.8650, 0.8650);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES (now(), 1, 3, 0.0000160444, 0.0000160444);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES (now(), 1, 4, 0.000227, 0.000227);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES (now(), 2, 1, 1.1561, 1.1561);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES (now(), 2, 3, 0.000019, 0.000019);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES (now(), 2, 4, 0.000264, 0.000264);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES (now(), 3, 1, 62192.148863, 62192.148863);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES (now(), 3, 2, 53447.932733, 53447.932733);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES (now(), 3, 4, 14.102704, 14.102704);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES (now(), 4, 1, 4409.944955, 4409.944955);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES (now(), 4, 2, 3789.906694, 3789.906694);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES (now(), 4, 3, 0.070908, 0.070908);

-- inserts for portfolio exchange rates 
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (14, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (15, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (19, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (20, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (21, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (22, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (23, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (24, 1);

-- inserts for atm transactions
INSERT INTO atm_transactions (type, amount) VALUES ('crypto withdrawal', 100);
INSERT INTO atm_transactions (type, amount) VALUES ('crypto withdrawal', 200);
INSERT INTO atm_transactions (type, amount) VALUES ('crypto withdrawal', 75);
INSERT INTO atm_transactions (type, amount) VALUES ('crypto withdrawal', 90);
INSERT INTO atm_transactions (type, amount) VALUES ('crypto withdrawal', 50);
INSERT INTO atm_transactions (type, amount) VALUES ('crypto withdrawal', 500);
INSERT INTO atm_transactions (type, amount) VALUES ('cash withdrawal', 1000);
INSERT INTO atm_transactions (type, amount) VALUES ('cash deposit', 250);
INSERT INTO atm_transactions (type, amount) VALUES ('cash deposit', 250);
INSERT INTO atm_transactions (type, amount) VALUES ('cash deposit', 250);

-- inserts for devices 
INSERT INTO devices (type, tid) VALUES ('security', 11);
INSERT INTO devices (type, tid) VALUES ('security', 11);
INSERT INTO devices (type, tid) VALUES ('security', 11);
INSERT INTO devices (type, tid) VALUES ('authentication', 11);
INSERT INTO devices (type, tid) VALUES ('authentication', 11);
INSERT INTO devices (type, tid) VALUES ('io', 11);
INSERT INTO devices (type, tid) VALUES ('io', 11);
INSERT INTO devices (type, tid) VALUES ('io', 11);
INSERT INTO devices (type, tid) VALUES ('io', 11);
INSERT INTO devices (type, tid) VALUES ('transaction', 11);
INSERT INTO devices (type, tid) VALUES ('transaction', 11);
INSERT INTO devices (type, tid) VALUES ('transaction', 11);
INSERT INTO devices (type, tid) VALUES ('security', 12);
INSERT INTO devices (type, tid) VALUES ('security', 12);
INSERT INTO devices (type, tid) VALUES ('security', 12);
INSERT INTO devices (type, tid) VALUES ('authentication', 12);
INSERT INTO devices (type, tid) VALUES ('authentication', 12);
INSERT INTO devices (type, tid) VALUES ('io', 12);
INSERT INTO devices (type, tid) VALUES ('io', 12);
INSERT INTO devices (type, tid) VALUES ('io', 12);
INSERT INTO devices (type, tid) VALUES ('io', 12);
INSERT INTO devices (type, tid) VALUES ('transaction', 12);
INSERT INTO devices (type, tid) VALUES ('transaction', 12);
INSERT INTO devices (type, tid) VALUES ('transaction', 12);

-- inserts for security devices 
INSERT INTO security_devices (status, access_permissions, device_id) VALUES ('online', 1, 1);
INSERT INTO security_devices (status, access_permissions, device_id) VALUES ('online', 1, 2);
INSERT INTO security_devices (status, access_permissions, device_id) VALUES ('online', 1, 3);
INSERT INTO security_devices (status, access_permissions, device_id) VALUES ('online', 1, 13);
INSERT INTO security_devices (status, access_permissions, device_id) VALUES ('online', 1, 14);
INSERT INTO security_devices (status, access_permissions, device_id) VALUES ('online', 1, 15);

-- inserts for authentication devices
INSERT INTO authentication_devices (status, access_permissions, device_id) VALUES ('online', 1, 4);
INSERT INTO authentication_devices (status, access_permissions, device_id) VALUES ('online', 1, 5);
INSERT INTO authentication_devices (status, access_permissions, device_id) VALUES ('online', 1, 16);
INSERT INTO authentication_devices (status, access_permissions, device_id) VALUES ('online', 1, 17);

-- inserts for io devices
INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 6);
INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 7);
INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 8);
INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 9);
INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 18);
INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 19);
INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 20);
INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 21);

-- inserts for transaction devices
INSERT INTO transaction_devices (status, access_permissions, device_id) VALUES ('online', 1, 10);
INSERT INTO transaction_devices (status, access_permissions, device_id) VALUES ('online', 1, 11);
INSERT INTO transaction_devices (status, access_permissions, device_id) VALUES ('online', 1, 12);
INSERT INTO transaction_devices (status, access_permissions, device_id) VALUES ('online', 1, 22);
INSERT INTO transaction_devices (status, access_permissions, device_id) VALUES ('online', 1, 23);
INSERT INTO transaction_devices (status, access_permissions, device_id) VALUES ('online', 1, 24);

-- inserts for iot context aware sensors
INSERT INTO iot_contextaware_sensors (status, has_malfunction, security_device_id) VALUES ('online', 0, 1);
INSERT INTO iot_contextaware_sensors (status, has_malfunction, security_device_id) VALUES ('online', 0, 4);

-- inserts for iot temperature sensors 
INSERT INTO iot_temperature_sensors (status, has_malfunction, security_device_id) VALUES ('online', 0, 2);
INSERT INTO iot_temperature_sensors (status, has_malfunction, security_device_id) VALUES ('online', 0, 5);

-- inserts for cameras 
INSERT INTO cameras (status, has_malfunction, security_device_id) VALUES ('online', 0, 3);
INSERT INTO cameras (status, has_malfunction, security_device_id) VALUES ('online', 0, 6);

-- inserts for card reader devices 
INSERT INTO card_reader_devices (status, has_malfunction, auth_device_id) VALUES ('online', 0, 1);
INSERT INTO card_reader_devices (status, has_malfunction, auth_device_id) VALUES ('online', 0, 3);

-- inserts for fingerprint scanners
INSERT INTO fingerprint_scanners (status, has_malfunction, auth_device_id) VALUES ('online', 0, 2);
INSERT INTO fingerprint_scanners (status, has_malfunction, auth_device_id) VALUES ('online', 0, 4);

-- inserts for ada headphone jacks
INSERT INTO ada_headphone_jacks (status, has_malfunction, io_device_id) VALUES ('online', 0, 1); 
INSERT INTO ada_headphone_jacks (status, has_malfunction, io_device_id) VALUES ('online', 0, 5); 

-- inserts for speakers
INSERT INTO speakers (status, has_malfunction, io_device_id) VALUES ('online', 0, 2);
INSERT INTO speakers (status, has_malfunction, io_device_id) VALUES ('online', 0, 6);

-- inserts for atm displays
INSERT INTO atm_displays (status, has_malfunction, io_device_id) VALUES ('online', 0, 3);
INSERT INTO atm_displays (status, has_malfunction, io_device_id) VALUES ('online', 0, 7);

-- inserts for keypads
INSERT INTO keypads (status, has_malfunction, io_device_id) VALUES ('online', 0, 4);
INSERT INTO keypads (status, has_malfunction, io_device_id) VALUES ('online', 0, 8);

-- inserts for cash dispensers
INSERT INTO cash_dispensers (status, has_malfunction, transaction_device_id) VALUES ('online', 0, 1);
INSERT INTO cash_dispensers (status, has_malfunction, transaction_device_id) VALUES ('online', 0, 4);

-- inserts for deposit_check_slots
INSERT INTO deposit_check_slots (status, has_malfunction, transaction_device_id) VALUES ('online', 0, 2);
INSERT INTO deposit_check_slots (status, has_malfunction, transaction_device_id) VALUES ('online', 0, 5);

-- inserts for receipt printers 
INSERT INTO receipt_printers (paper_qty, ink_cartridge_qty, status, has_malfunction, transaction_device_id) VALUES (1, 1, 'online', 0, 3);
INSERT INTO receipt_printers (paper_qty, ink_cartridge_qty, status, has_malfunction, transaction_device_id) VALUES (1, 1, 'online', 0, 6);

-- inserts for receipt roll paper 
INSERT INTO receipt_roll_paper (used_at, length, printer_id) VALUES (now(), '50', 1);
INSERT INTO receipt_roll_paper (used_at, length, printer_id) VALUES (now(), '50', 2);

-- inserts for ink cartridges 
INSERT INTO ink_cartridges (manufacturer, color, printer_id) VALUES ('HP', 'black', 1); 
INSERT INTO ink_cartridges (manufacturer, color, printer_id) VALUES ('HP', 'black', 2); 

-- inserts for kubeCDNs
INSERT INTO kubeCDNs (cdn_description, region_id) VALUES ('CDN is operational and running', 1);
INSERT INTO kubeCDNs (cdn_description, region_id) VALUES ('CDN is operational and running', 2);
INSERT INTO kubeCDNs (cdn_description, region_id) VALUES ('CDN is operational and running', 3);
INSERT INTO kubeCDNs (cdn_description, region_id) VALUES ('CDN is operational and running', 4);
INSERT INTO kubeCDNs (cdn_description, region_id) VALUES ('CDN is operational and running', 5);

-- inserts for security media contents 
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('contextaware', 0, 1);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('contextaware', 0, 2);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('contextaware', 0, 3);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('contextaware', 0, 4);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('contextaware', 0, 5);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('temperature', 0, 1);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('temperature', 0, 2);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('temperature', 0, 3);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('temperature', 0, 4);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('temperature', 0, 5);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('camera', 0, 1);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('camera', 0, 2);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('camera', 0, 3);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('camera', 0, 4);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('camera', 0, 5);

-- inserts for context aware sensor data 
INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (0, 'iot_contextaware_sensor', 'atm machine operational', 1, 1);
INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (1, 'iot_contextaware_sensor', 'atm machine being tampered', 2, 2);
INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (0, 'iot_contextaware_sensor', 'no errors present', 1, 3);
INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (0, 'iot_contextaware_sensor', 'no errors present', 1, 4);
INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (0, 'iot_contextaware_sensor', 'no errors present', 1, 5);

-- inserts for temperature sensor data 
INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (0, 'iot_temperature_sensors', 'internal CPU at normal capacity', 1, 6);
INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (1, 'iot_temperature_sensors', 'internal CPU at maximum capacity', 1, 7);
INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (0, 'iot_temperature_sensors', 'all internal hardware checks passed', 2, 8);
INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (0, 'iot_temperature_sensors', 'all internal hardware checks passed', 2, 9);
INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (0, 'iot_temperature_sensors', 'all internal hardware checks passed', 2, 10);

-- inserts for camera footage 
INSERT INTO camera_footage (created_at, ended_at, duration, camera_id, media_content_id) VALUES (now(), now(), 24, 1, 11);
INSERT INTO camera_footage (created_at, ended_at, duration, camera_id, media_content_id) VALUES (now(), now(), 24, 1, 12);
INSERT INTO camera_footage (created_at, ended_at, duration, camera_id, media_content_id) VALUES (now(), now(), 24, 1, 13);
INSERT INTO camera_footage (created_at, ended_at, duration, camera_id, media_content_id) VALUES (now(), now(), 24, 2, 14);
INSERT INTO camera_footage (created_at, ended_at, duration, camera_id, media_content_id) VALUES (now(), now(), 24, 1, 15);

-- inserts for sessions 
INSERT INTO sessions (expires_at, session_data, user_auth_token, tid) VALUES (now(), null, 'D*c12LHLG=<b|c|PLk}dz7^4?x@m|?]G>v ],;/9`nun[(UNBXE:Xir.Y@Fn]}Es', 11);
INSERT INTO sessions (expires_at, session_data, user_auth_token, tid) VALUES (now(), null, 'pL-gj]>mg+(-:W?P64jR-I5JYGe>c7I&@:t7+;H_mFP;Vq9L>/]cB^2<Qu.{oF/s', 12);
INSERT INTO sessions (expires_at, session_data, user_auth_token, tid) VALUES (now(), null, 'xa4D0-F^GNM-1cDI19-Vf|wb}RjNKNGgid3Jj|rr~8DiiRL`#kzLxC@giIPPlLak', 13);
INSERT INTO sessions (expires_at, session_data, user_auth_token, tid) VALUES (now(), null, 'XMY~k=6LB,C<-LoMPyXuf$R89h5dfqC:`EDBc N(Qq>;Mr;||i]6QA.4,XdO]bHr', 14);
INSERT INTO sessions (expires_at, session_data, user_auth_token, tid) VALUES (now(), null, '{nf}Qn-pNRKKZHoAurds}59I|.7PR&[azT%1I)5MXK)B>6*!+z|(w@+J,wSAq+|P', 15);

-- inserts for atm admins
INSERT INTO atm_admins (access_code, access_permissions, user_auth_token) VALUES (12345, 1, 'D*c12LHLG=<b|c|PLk}dz7^4?x@m|?]G>v ],;/9`nun[(UNBXE:Xir.Y@Fn]}Es');
INSERT INTO atm_admins (access_code, access_permissions, user_auth_token) VALUES (12345, 1, 'xa4D0-F^GNM-1cDI19-Vf|wb}RjNKNGgid3Jj|rr~8DiiRL`#kzLxC@giIPPlLak');

-- inserts for atm maintenance
INSERT INTO atm_maintenance (tid, admin_id) VALUES (11, 1);
INSERT INTO atm_maintenance (tid, admin_id) VALUES (12, 1);
INSERT INTO atm_maintenance (tid, admin_id) VALUES (13, 3);
INSERT INTO atm_maintenance (tid, admin_id) VALUES (14, 3);

-- inserts for transaction actions 
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee) VALUES (1, 1, 1, 2);
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee) VALUES (1, 1, 1, 2);
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee) VALUES (1, 1, 1, 2);
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee) VALUES (1, 1, 1, 2);
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee) VALUES (1, 1, 1, 2);
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee) VALUES (2, 1, 2, 2);
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee) VALUES (2, 1, 2, 2);
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee) VALUES (2, 1, 2, 2);
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee) VALUES (2, 1, 2, 2);
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee) VALUES (2, 1, 2, 2);

-- inserts for atm transaction info 
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 8, 3);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 9, 4);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 10, 5);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 11, 6);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 12, 7);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 13, 8);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 14, 9);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 15, 10);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 16, 11);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 17, 12);

-- inserts for crypto_permissions 
INSERT INTO crypto_permissions (transaction_action_id, crypto_account_id) VALUES (3, 3);
INSERT INTO crypto_permissions (transaction_action_id, crypto_account_id) VALUES (4, 3);
INSERT INTO crypto_permissions (transaction_action_id, crypto_account_id) VALUES (5, 4);
INSERT INTO crypto_permissions (transaction_action_id, crypto_account_id) VALUES (6, 4);
INSERT INTO crypto_permissions (transaction_action_id, crypto_account_id) VALUES (7, 5);
INSERT INTO crypto_permissions (transaction_action_id, crypto_account_id) VALUES (8, 6);

-- inserts for checking accounts 
INSERT INTO checking_accounts (balance, access_permissions, bank_account_id) VALUES (25000, 1, 3);
INSERT INTO checking_accounts (balance, access_permissions, bank_account_id) VALUES (500000, 1, 4);
INSERT INTO checking_accounts (balance, access_permissions, bank_account_id) VALUES (15000, 1, 5);
INSERT INTO checking_accounts (balance, access_permissions, bank_account_id) VALUES (2000, 1, 6);
INSERT INTO checking_accounts (balance, access_permissions, bank_account_id) VALUES (10000, 1, 7);

-- inserts for savings accounts 
INSERT INTO savings_accounts (balance, access_permissions, bank_account_id) VALUES (75000, 1, 3);
INSERT INTO savings_accounts (balance, access_permissions, bank_account_id) VALUES (50000, 1, 4);
INSERT INTO savings_accounts (balance, access_permissions, bank_account_id) VALUES (15000, 1, 5);
INSERT INTO savings_accounts (balance, access_permissions, bank_account_id) VALUES (30000, 1, 6);
INSERT INTO savings_accounts (balance, access_permissions, bank_account_id) VALUES (45000, 1, 7);

-- inserts for checking bank permissions 
INSERT INTO checking_bank_permissions (transaction_action_id, checking_account_id) VALUES (9, 2);
INSERT INTO checking_bank_permissions (transaction_action_id, checking_account_id) VALUES (11, 3);

-- inserts for savings bank permissions
INSERT INTO savings_bank_permissions (transaction_action_id, savings_account_id) VALUES (10, 2);
INSERT INTO savings_bank_permissions (transaction_action_id, savings_account_id) VALUES (12, 3);


-- inserts for account notifications
INSERT INTO account_notifications (created_at, message, atm_account_id) VALUES (now(), 'an amount was withdrawn from checking', 6);
INSERT INTO account_notifications (created_at, message, atm_account_id) VALUES (now(), 'an amount was deposited into savings', 6);
INSERT INTO account_notifications (created_at, message, atm_account_id) VALUES (now(), 'a new crypto account was added to your accounts portfolio', 7);
INSERT INTO account_notifications (created_at, message, atm_account_id) VALUES (now(), 'a new crypto transaction was created', 8);
INSERT INTO account_notifications (created_at, message, atm_account_id) VALUES (now(), 'your crypto transaction has gone through', 8);
INSERT INTO account_notifications (created_at, message, atm_account_id) VALUES (now(), 'your crypto loan has been initiated', 9);
INSERT INTO account_notifications (created_at, message, atm_account_id) VALUES (now(), 'you have made a successful crypto loan payment', 9);
INSERT INTO account_notifications (created_at, message, atm_account_id) VALUES (now(), 'you have successfully deposited a check', 10);
INSERT INTO account_notifications (created_at, message, atm_account_id) VALUES (now(), 'you do not have sufficient funds to perform this transaction', 10);
INSERT INTO account_notifications (created_at, message, atm_account_id) VALUES (now(), 'please add more funds into your checking if you would like to withdraw funds', 10);

-- inserts for fraud claims 
INSERT INTO fraud_claims (description, created_at, resolved_at, atm_account_id) VALUES ('iot context aware sensor has been triggered about a a possible fraud claim tied to your account', now(), null, 9);
INSERT INTO fraud_claims (description, created_at, resolved_at, atm_account_id) VALUES ('suspicious activity has been spotted after you withdraw an amount from atm machine 11', now(), null, 10);
INSERT INTO fraud_claims (description, created_at, resolved_at, atm_account_id) VALUES ('please change your bank account passwords now', now(), null, 10);
INSERT INTO fraud_claims (description, created_at, resolved_at, atm_account_id) VALUES ('potential atm card theft at atm machine 12', now(), null, 8);
INSERT INTO fraud_claims (description, created_at, resolved_at, atm_account_id) VALUES ('binance.us dropped your transaction, please look into its recovery', now(), null, 7);