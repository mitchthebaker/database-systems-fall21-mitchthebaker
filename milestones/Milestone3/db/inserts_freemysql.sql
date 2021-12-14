-- Script name: inserts.sql
-- Author: Mitchel Baker 
-- Purpose: insert sample data into each table so that we can test the integrity and relationships of the database system

USE `sql3457683`;

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
INSERT INTO banks (name, abbreviation, address) VALUES ('Focus Financial Group', 'FFG', '575 Tara Trail, Apt. 349, 68725, Port Monica, Mississippi, United States');
INSERT INTO banks (name, abbreviation, address) VALUES ('Miracle Financial Holdings', 'MFH', '424 Jodie Radial, Suite 000, 13305, Rippinton, New Jersey, United States');
INSERT INTO banks (name, abbreviation, address) VALUES ('Lightning Bank System', 'LBS', '198 Beier Ports, Apt. 630, 40011, Skilesside, New Hampshire, United States');
INSERT INTO banks (name, abbreviation, address) VALUES ('Green Valley Holdings Inc.', 'GVH', '3723 Dickinson Knolls, Suite 016, 35261-0361, Port Wayneport, New Jersey, United States');
INSERT INTO banks (name, abbreviation, address) VALUES ('Celestial Financial', 'CF', '2697 Weissnat Fords, Suite 438, 28022, Ettieland, New York, United States');

-- inserts for bank accounts 
INSERT INTO bank_accounts (routing_number, bank_id, user_id, is_verified) VALUES (333638385, 1, 1, 0);
INSERT INTO bank_accounts (routing_number, bank_id, user_id, is_verified) VALUES (271002691, 1, 2, 0);
INSERT INTO bank_accounts (routing_number, bank_id, user_id, is_verified) VALUES (389635060, 2, 3, 0);
INSERT INTO bank_accounts (routing_number, bank_id, user_id, is_verified) VALUES (877567925, 2, 4, 0);
INSERT INTO bank_accounts (routing_number, bank_id, user_id, is_verified) VALUES (627989892, 3, 5, 0);
INSERT INTO bank_accounts (routing_number, bank_id, user_id, is_verified) VALUES (180950494, 3, 6, 0);
INSERT INTO bank_accounts (routing_number, bank_id, user_id, is_verified) VALUES (951358377, 4, 7, 0);
INSERT INTO bank_accounts (routing_number, bank_id, user_id, is_verified) VALUES (142869879, 4, 8, 0);
INSERT INTO bank_accounts (routing_number, bank_id, user_id, is_verified) VALUES (710326016, 5, 9, 0);
INSERT INTO bank_accounts (routing_number, bank_id, user_id, is_verified) VALUES (610391484, 5, 10, 0);

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
INSERT INTO bank_account_links (bank_account_id, wallet_id, card_id) VALUES (1, 1, null);
INSERT INTO bank_account_links (bank_account_id, wallet_id, card_id) VALUES (2, null, 1);
INSERT INTO bank_account_links (bank_account_id, wallet_id, card_id) VALUES (3, 2, null);
INSERT INTO bank_account_links (bank_account_id, wallet_id, card_id) VALUES (4, null, 2);
INSERT INTO bank_account_links (bank_account_id, wallet_id, card_id) VALUES (5, 3, null);
INSERT INTO bank_account_links (bank_account_id, wallet_id, card_id) VALUES (6, null, 3);
INSERT INTO bank_account_links (bank_account_id, wallet_id, card_id) VALUES (7, 4, null);
INSERT INTO bank_account_links (bank_account_id, wallet_id, card_id) VALUES (8, null, 4);
INSERT INTO bank_account_links (bank_account_id, wallet_id, card_id) VALUES (9, 5, null);
INSERT INTO bank_account_links (bank_account_id, wallet_id, card_id) VALUES (10, null, 5);

-- inserts for authenticated users 
INSERT INTO authenticated_users (user_auth_token, user_id, is_admin) VALUES ('pL-gj]>mg+(-:W?P64jR-I5JYGe>c7I&@:t7+;H_mFP;Vq9L>/]cB^2<Qu.{oF/s', 1, 0);
INSERT INTO authenticated_users (user_auth_token, user_id, is_admin) VALUES ('xa4D0-F^GNM-1cDI19-Vf|wb}RjNKNGgid3Jj|rr~8DiiRL`#kzLxC@giIPPlLak', 2, 0);
INSERT INTO authenticated_users (user_auth_token, user_id, is_admin) VALUES ('{nf}Qn-pNRKKZHoAurds}59I|.7PR&[azT%1I)5MXK)B>6*!+z|(w@+J,wSAq+|P', 3, 0);
INSERT INTO authenticated_users (user_auth_token, user_id, is_admin) VALUES ('XMY~k=6LB,C<-LoMPyXuf$R89h5dfqC:`EDBc N(Qq>;Mr;||i]6QA.4,XdO]bHr', 4, 0);
INSERT INTO authenticated_users (user_auth_token, user_id, is_admin) VALUES ('D*c12LHLG=<b|c|PLk}dz7^4?x@m|?]G>v ],;/9`nun[(UNBXE:Xir.Y@Fn]}Es', 5, 0);

-- inserts for regions 
INSERT INTO regions (country, local_currency, timezone_offset) VALUES ('US', 'Dollar', '08:00:00');
INSERT INTO regions (country, local_currency, timezone_offset) VALUES ('France', 'Euro', '01:00:00');
INSERT INTO regions (country, local_currency, timezone_offset) VALUES ('Germany', 'Euro', '01:00:00');
INSERT INTO regions (country, local_currency, timezone_offset) VALUES ('Spain', 'Euro', '01:00:00');
INSERT INTO regions (country, local_currency, timezone_offset) VALUES ('Russia', 'Ruble', '03:00:00');

-- inserts for atm_machines 
INSERT INTO atm_machines (status, access_permissions, region_id) VALUES (1, 1, 1);
INSERT INTO atm_machines (status, access_permissions, region_id) VALUES (1, 1, 2);
INSERT INTO atm_machines (status, access_permissions, region_id) VALUES (1, 1, 3);
INSERT INTO atm_machines (status, access_permissions, region_id) VALUES (1, 1, 4);
INSERT INTO atm_machines (status, access_permissions, region_id) VALUES (1, 1, 5);

-- inserts for languages 
INSERT INTO languages (country, name, is_supported, added_at) VALUES ('United States', 'English', 1, now());
INSERT INTO languages (country, name, is_supported, added_at) VALUES ('Spain', 'Spanish', 1, now());
INSERT INTO languages (country, name, is_supported, added_at) VALUES ('France', 'French', 1, now());
INSERT INTO languages (country, name, is_supported, added_at) VALUES ('Korea', 'Korean', 0, now());
INSERT INTO languages (country, name, is_supported, added_at) VALUES ('China', 'Mandarin', 1, now());

-- inserts for atm accounts 
INSERT INTO atm_accounts (created_at, bank_account_id, user_auth_token) VALUES (now(), 1, 'pL-gj]>mg+(-:W?P64jR-I5JYGe>c7I&@:t7+;H_mFP;Vq9L>/]cB^2<Qu.{oF/s');
INSERT INTO atm_accounts (created_at, bank_account_id, user_auth_token) VALUES (now(), 2, 'xa4D0-F^GNM-1cDI19-Vf|wb}RjNKNGgid3Jj|rr~8DiiRL`#kzLxC@giIPPlLak');
INSERT INTO atm_accounts (created_at, bank_account_id, user_auth_token) VALUES (now(), 3, '{nf}Qn-pNRKKZHoAurds}59I|.7PR&[azT%1I)5MXK)B>6*!+z|(w@+J,wSAq+|P');
INSERT INTO atm_accounts (created_at, bank_account_id, user_auth_token) VALUES (now(), 4, 'XMY~k=6LB,C<-LoMPyXuf$R89h5dfqC:`EDBc N(Qq>;Mr;||i]6QA.4,XdO]bHr');
INSERT INTO atm_accounts (created_at, bank_account_id, user_auth_token) VALUES (now(), 5, 'D*c12LHLG=<b|c|PLk}dz7^4?x@m|?]G>v ],;/9`nun[(UNBXE:Xir.Y@Fn]}Es');

-- inserts for portfolios 
INSERT INTO portfolios (num_crypto_accts, created_at, atm_account_id) VALUES (0, now(), 1);
INSERT INTO portfolios (num_crypto_accts, created_at, atm_account_id) VALUES (0, now(), 2);
INSERT INTO portfolios (num_crypto_accts, created_at, atm_account_id) VALUES (0, now(), 3);
INSERT INTO portfolios (num_crypto_accts, created_at, atm_account_id) VALUES (0, now(), 4);
INSERT INTO portfolios (num_crypto_accts, created_at, atm_account_id) VALUES (0, now(), 5);

-- inserts for crypto_accounts
INSERT INTO crypto_accounts (asset_type, balance, public_key, access_permissions, portfolio_id, type) VALUES ('ethereum', 4500, '0x229AfdEa663b7Da32314DD2Bf47f7126A7878D44', 1, 1, 'crypto');
INSERT INTO crypto_accounts (asset_type, balance, public_key, access_permissions, portfolio_id, type) VALUES ('bitcoin', 1500, '03b3a9161598f2403c94772a6d8ff856212d0b45be9e13e0f3daabf523d3d84531', 1, 1, 'crypto');
INSERT INTO crypto_accounts (asset_type, balance, public_key, access_permissions, portfolio_id, type) VALUES ('ethereum', 3000, '0xAA4E7b75a19eFE07d59c391f2Ba4cD84857fD5b9', 1, 2, 'crypto');
INSERT INTO crypto_accounts (asset_type, balance, public_key, access_permissions, portfolio_id, type) VALUES ('bitcoin', 500, '022de3217f0a8feec95ddbf55fe6aa7249e9158725ac45e55fb3c39318905a2846', 1, 2, 'crypto');
INSERT INTO crypto_accounts (asset_type, balance, public_key, access_permissions, portfolio_id, type) VALUES ('ethereum', 400, '0x56aD8aE6C8F278eD32E490B18c4Ef301Aa87d9bf', 1, 3, 'crypto');
INSERT INTO crypto_accounts (asset_type, balance, public_key, access_permissions, portfolio_id, type) VALUES ('bitcoin', 3, '02351a923d0b945636e46da16ab72e4f1af02645989d9062a64cb4684e7df79f64', 1, 3, 'crypto');
INSERT INTO crypto_accounts (asset_type, balance, public_key, access_permissions, portfolio_id, type) VALUES ('ethereum', 2000, '0xAE592E32B775eBEa34469C0E68fA2DbcADB7Be01', 1, 4, 'crypto');
INSERT INTO crypto_accounts (asset_type, balance, public_key, access_permissions, portfolio_id, type) VALUES ('bitcoin', 1, '03f851c42b558cfbf8daad28532cd04752c3ba3770f784f864e79a066de7e9c85e', 1, 4, 'crypto');
INSERT INTO crypto_accounts (asset_type, balance, public_key, access_permissions, portfolio_id, type) VALUES ('ethereum', 6000, '0xde8B054b47B59EA3426FDa7417a52cFB9e902942', 1, 5, 'crypto');
INSERT INTO crypto_accounts (asset_type, balance, public_key, access_permissions, portfolio_id, type) VALUES ('dai', 1000, '0xde8B054b47B59EA3426FDa7417a52cFB9e902942', 1, 5, 'crypto');
INSERT INTO crypto_accounts (asset_type, balance, public_key, access_permissions, portfolio_id, type) VALUES ('bitcoin', 15, '029966efb2ed9bbe43ee5083690c529b7fd474ffb4e05677ccc7b974592112ee1b', 1, 5, 'crypto');

-- inserts for crypto exchanges
INSERT INTO crypto_exchanges (provider, is_operational) VALUES ('binance', 1);
INSERT INTO crypto_exchanges (provider, is_operational) VALUES ('gemini', 1);
INSERT INTO crypto_exchanges (provider, is_operational) VALUES ('uphold', 0);

-- inserts for crypto account info 
INSERT INTO crypto_account_info (crypto_account_id, exchange_id) VALUES (1, 1);
INSERT INTO crypto_account_info (crypto_account_id, exchange_id) VALUES (2, 1);
INSERT INTO crypto_account_info (crypto_account_id, exchange_id) VALUES (3, 1);
INSERT INTO crypto_account_info (crypto_account_id, exchange_id) VALUES (4, 1);
INSERT INTO crypto_account_info (crypto_account_id, exchange_id) VALUES (5, 2);
INSERT INTO crypto_account_info (crypto_account_id, exchange_id) VALUES (6, 2);
INSERT INTO crypto_account_info (crypto_account_id, exchange_id) VALUES (7, 2);
INSERT INTO crypto_account_info (crypto_account_id, exchange_id) VALUES (8, 2);
INSERT INTO crypto_account_info (crypto_account_id, exchange_id) VALUES (9, 2);
INSERT INTO crypto_account_info (crypto_account_id, exchange_id) VALUES (10, 2);
INSERT INTO crypto_account_info (crypto_account_id, exchange_id) VALUES (11, 2);

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
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('annually', '2020-11-19 21:00:00', 'borrow', 'bitcoin', 0.03, 500, 200, 15.7);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('monthly', '2021-05-16 21:00:00', 'borrow', 'ethereum', 0.04, 1000, 500, 21.5);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES (null, '2020-05-16 21:00:00', 'lend', 'ethereum', 0.04, 1000, null, 61.5);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES (null, '2021-09-16 21:00:00', 'lend', 'bitcoin', 0.03, 15000, null, 99.86);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES (null, '2021-01-16 21:00:00', 'lend', 'bitcoin', 0.03, 5000, null, 125.34);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES (null, '2020-12-25 21:00:00', 'lend', 'bitcoin', 0.03, 50000, null, 1360.27);

INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('monthly', '2021-05-16 21:00:00', 'borrow', 'ethereum', 0.04, 2200, 250, 50.0);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('monthly', '2021-05-16 21:00:00', 'borrow', 'ethereum', 0.04, 4400, 500, 100.0);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('monthly', '2021-05-16 21:00:00', 'borrow', 'ethereum', 0.04, 5000, 500, 150.0);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('monthly', '2021-05-16 21:00:00', 'borrow', 'ethereum', 0.04, 6000, 500, 200.0);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('monthly', '2021-05-16 21:00:00', 'borrow', 'ethereum', 0.04, 7000, 500, 250.0);
-- 11

INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('annually', '2020-11-19 21:00:00', 'borrow', 'bitcoin', 0.03, 1000, 200, 31.0);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('annually', '2020-11-19 21:00:00', 'borrow', 'bitcoin', 0.03, 2000, 200, 62.5);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('annually', '2020-11-19 21:00:00', 'borrow', 'bitcoin', 0.03, 4000, 200, 125.0);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('annually', '2020-11-19 21:00:00', 'borrow', 'bitcoin', 0.03, 8000, 200, 250.0);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('annually', '2020-11-19 21:00:00', 'borrow', 'bitcoin', 0.03, 16000, 200, 500.0);
-- 16

INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('monthly', '2021-05-16 21:00:00', 'borrow', 'ethereum', 0.04, 5500, 250, 110.6);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('monthly', '2021-05-16 21:00:00', 'borrow', 'ethereum', 0.04, 11000, 500, 225.2);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('monthly', '2021-05-16 21:00:00', 'borrow', 'ethereum', 0.04, 5000, 500, 107.4);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('monthly', '2021-05-16 21:00:00', 'borrow', 'ethereum', 0.04, 6500, 500, 131.2);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('monthly', '2021-05-16 21:00:00', 'borrow', 'ethereum', 0.04, 10000, 500, 220.0);
-- 21

INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('annually', '2020-11-19 21:00:00', 'borrow', 'bitcoin', 0.03, 4000, 200, 124.0);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('annually', '2020-11-19 21:00:00', 'borrow', 'bitcoin', 0.03, 5000, 200, 140.2);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('annually', '2020-11-19 21:00:00', 'borrow', 'bitcoin', 0.03, 500, 200, 15.5);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('annually', '2020-11-19 21:00:00', 'borrow', 'bitcoin', 0.03, 250, 200, 7.5);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('annually', '2020-11-19 21:00:00', 'borrow', 'bitcoin', 0.03, 10000, 200, 270.8);
-- 26

INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('monthly', '2021-05-16 21:00:00', 'borrow', 'ethereum', 0.04, 6000, 250, 125.6);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('monthly', '2021-05-16 21:00:00', 'borrow', 'ethereum', 0.04, 15000, 500, 262.3);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('monthly', '2021-05-16 21:00:00', 'borrow', 'ethereum', 0.04, 3000, 500, 62.2);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('monthly', '2021-05-16 21:00:00', 'borrow', 'ethereum', 0.04, 1500, 500, 31.6);
INSERT INTO crypto_loans (payment_plan, created_at, loan_type, asset_type, interest_rate, total_amount, total_amount_remaining, reward) VALUES ('monthly', '2021-05-16 21:00:00', 'borrow', 'ethereum', 0.04, 1000, 500, 25.4);
-- 31


-- inserts for crypto loan payments
INSERT INTO crypto_loan_payments (amount_paid, paid_at, crypto_loan_id) VALUES (100, now(), 2);
INSERT INTO crypto_loan_payments (amount_paid, paid_at, crypto_loan_id) VALUES (100, now(), 2);
INSERT INTO crypto_loan_payments (amount_paid, paid_at, crypto_loan_id) VALUES (100, now(), 2);
INSERT INTO crypto_loan_payments (amount_paid, paid_at, crypto_loan_id) VALUES (250, now(), 1);
INSERT INTO crypto_loan_payments (amount_paid, paid_at, crypto_loan_id) VALUES (250, now(), 1);

-- inserts for lending protocol connections 
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (2, 1, 2);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 2, 1);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 3, 9);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (2, 4, 4);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (2, 5, 6);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (2, 6, 8);

INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 7, 1);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 8, 1);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 9, 1);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 10, 1);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 11, 1);

INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 12, 2);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 13, 2);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 14, 2);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 15, 2);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 16, 2);

INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 17, 3);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 18, 3);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 19, 3);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 20, 3);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 21, 3);

INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 22, 4);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 23, 4);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 24, 4);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 25, 4);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 26, 4);

INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 27, 5);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 28, 5);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 29, 5);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 30, 5);
INSERT INTO lending_protocol_connections (protocol_id, crypto_loan_id, crypto_account_id) VALUES (1, 31, 5);

-- inserts for currencies 
INSERT INTO currencies (currency_name, circulation_amt) VALUES ('Dollar', 2000000000000);
INSERT INTO currencies (currency_name, circulation_amt) VALUES ('Euro', 1250000000);
INSERT INTO currencies (currency_name, circulation_amt) VALUES ('Bitcoin', 21000000);
INSERT INTO currencies (currency_name, circulation_amt) VALUES ('Ethereum', 118000000);

-- inserts for exchange rates 
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES ('2021-11-19 21:00:00', 1, 2, 0.8650, 0.8650);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES ('2021-11-19 21:00:00', 1, 3, 0.0000160444, 0.0000160444);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES ('2021-11-19 21:00:00', 1, 4, 0.000227, 0.000227);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES ('2021-11-19 21:00:00', 2, 1, 1.1561, 1.1561);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES ('2021-11-19 21:00:00', 2, 3, 0.000019, 0.000019);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES ('2021-11-19 21:00:00', 2, 4, 0.000264, 0.000264);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES ('2021-11-19 21:00:00', 3, 1, 62192.148863, 62192.148863);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES ('2021-11-19 21:00:00', 3, 2, 53447.932733, 53447.932733);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES ('2021-11-19 21:00:00', 3, 4, 14.102704, 14.102704);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES ('2021-11-19 21:00:00', 4, 1, 4409.944955, 4409.944955);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES ('2021-11-19 21:00:00', 4, 2, 3789.906694, 3789.906694);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES ('2021-11-19 21:00:00', 4, 3, 0.070908, 0.070908);
-- 12

INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES ('2021-12-11 21:00:00', 1, 2, 0.88, 0.88);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES ('2021-12-11 21:00:00', 1, 3, 0.00002051, 0.00002051);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES ('2021-12-11 21:00:00', 1, 4, 0.00024856, 0.00024856);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES ('2021-12-11 21:00:00', 2, 1, 1.13, 1.13);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES ('2021-12-11 21:00:00', 2, 3, 0.00002316, 0.00002316);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES ('2021-12-11 21:00:00', 2, 4, 0.00028043, 0.00028043);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES ('2021-12-11 21:00:00', 3, 1, 48783.90, 48783.90);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES ('2021-12-11 21:00:00', 3, 2, 43106.72, 43106.72);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES ('2021-12-11 21:00:00', 3, 4, 12.11722263, 12.11722263);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES ('2021-12-11 21:00:00', 4, 1, 4029.65, 4029.65);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES ('2021-12-11 21:00:00', 4, 2, 3560.74, 3560.74);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES ('2021-12-11 21:00:00', 4, 3, 0.08252716, 0.08252716);
-- 24

INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES ('2020-12-10 21:00:00', 1, 2, 0.82, 0.82);
INSERT INTO exchange_rates (trading_date, source_currency, target_currency, closing_rate, average_rate) VALUES ('2020-12-10 21:00:00', 2, 1, 1.21, 1.21);


-- inserts for portfolio exchange rates 
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (1, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (2, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (3, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (4, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (5, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (6, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (7, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (8, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (9, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (10, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (11, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (12, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (13, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (14, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (15, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (16, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (17, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (18, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (19, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (20, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (21, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (22, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (23, 1);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (24, 1);

INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (1, 2);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (2, 2);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (3, 2);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (4, 2);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (5, 2);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (6, 2);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (7, 2);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (8, 2);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (9, 2);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (10, 2);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (11, 2);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (12, 2);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (13, 2);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (14, 2);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (15, 2);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (16, 2);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (17, 2);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (18, 2);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (19, 2);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (20, 2);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (21, 2);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (22, 2);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (23, 2);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (24, 2);

INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (1, 3);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (2, 3);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (3, 3);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (4, 3);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (5, 3);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (6, 3);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (7, 3);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (8, 3);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (9, 3);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (10, 3);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (11, 3);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (12, 3);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (13, 3);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (14, 3);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (15, 3);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (16, 3);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (17, 3);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (18, 3);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (19, 3);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (20, 3);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (21, 3);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (22, 3);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (23, 3);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (24, 3);

INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (1, 4);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (2, 4);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (3, 4);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (4, 4);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (5, 4);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (6, 4);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (7, 4);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (8, 4);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (9, 4);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (10, 4);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (11, 4);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (12, 4);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (13, 4);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (14, 4);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (15, 4);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (16, 4);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (17, 4);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (18, 4);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (19, 4);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (20, 4);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (21, 4);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (22, 4);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (23, 4);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (24, 4);

INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (1, 5);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (2, 5);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (3, 5);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (4, 5);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (5, 5);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (6, 5);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (7, 5);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (8, 5);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (9, 5);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (10, 5);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (11, 5);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (12, 5);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (13, 5);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (14, 5);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (15, 5);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (16, 5);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (17, 5);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (18, 5);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (19, 5);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (20, 5);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (21, 5);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (22, 5);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (23, 5);
INSERT INTO portfolio_exchange_rates (exchange_rate_id, portfolio_id) VALUES (24, 5);

-- inserts for atm transactions
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'crypto', 100, 'withdrawal');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'crypto', 200, 'withdrawal');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'crypto', 75, 'withdrawal');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'crypto', 90, 'withdrawal');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'crypto', 240, 'withdrawal');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'crypto', 450, 'withdrawal');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'cash', 12500, 'withdrawal');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'cash', 250, 'deposit');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'cash', 250, 'deposit');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'cash', 250, 'deposit');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'cash', 120000, 'withdrawal');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'cash', 135000, 'withdrawal');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'cash', 50000, 'withdrawal');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'crypto', 60000, 'withdrawal');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'crypto', 75000, 'withdrawal');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'cash', 35000, 'withdrawal');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'cash', 35000, 'withdrawal');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'crypto', 65000, 'withdrawal');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'crypto', 100000, 'withdrawal');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'crypto', 150000, 'withdrawal');
-- 20 

-- (transaction_totals for all): 1, 2, 3, 4, 16, 17, 21, 22, 23, 24, 25 
-- (transaction_totals for only transfers): 21, 22, 23, 24, 25

INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'cash', 100, 'transfer');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'cash', 50, 'transfer');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'cash', 60, 'transfer');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'crypto', 200, 'transfer');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'crypto', 150, 'transfer');
-- 25

INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'crypto', 200, 'transfer');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'cash', 350, 'transfer');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'crypto', 160, 'transfer');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'cash', 50, 'transfer');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'cash', 250, 'transfer');
-- 30

INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'crypto', 30, 'transfer');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'cash', 40, 'transfer');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'crypto', 60, 'transfer');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'cash', 50, 'transfer');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'cash', 75, 'transfer');
-- 35 

INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'crypto', 300, 'transfer');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'cash', 400, 'transfer');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'crypto', 600, 'transfer');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'cash', 500, 'transfer');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'cash', 750, 'transfer');
-- 40 

INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'crypto', 50, 'transfer');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'cash', 75, 'transfer');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'crypto', 160, 'transfer');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'cash', 250, 'transfer');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES (null, null, 'cash', 375, 'transfer');
-- 45

INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 375, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 555, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 300, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 50, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 50, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 50, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 50, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 150, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 100, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 100, 'exchange');
-- 55

INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 550, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 250, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 250, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 125, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 210, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 75, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 80, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 50, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 25, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 25, 'exchange');
-- 65 

INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 1000, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 1125, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 890, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 25, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 25, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 25, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 25, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 200, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 200, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 200, 'exchange');
-- 75

INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 500, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 75, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 75, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 75, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 75, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 250, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 250, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 650, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 100, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 100, 'exchange');
-- 85 

INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Ruble', 'Bitcoin', 'crypto', 50, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Ruble', 'Bitcoin', 'crypto', 50, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Ruble', 'Bitcoin', 'crypto', 100, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Ruble', 'Bitcoin', 'crypto', 250, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Ruble', 'Bitcoin', 'crypto', 250, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Ruble', 'Bitcoin', 'crypto', 250, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Ruble', 'Bitcoin', 'crypto', 250, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Ruble', 'Bitcoin', 'crypto', 375, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Ruble', 'Bitcoin', 'crypto', 450, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Ruble', 'Bitcoin', 'crypto', 500, 'exchange');
-- 95

INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Ruble', 'Ethereum', 'crypto', 250, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Ruble', 'Ethereum', 'crypto', 750, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Ruble', 'Ethereum', 'crypto', 750, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Ruble', 'Ethereum', 'crypto', 75, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Ruble', 'Ethereum', 'crypto', 75, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Ruble', 'Ethereum', 'crypto', 150, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Ruble', 'Ethereum', 'crypto', 150, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Ruble', 'Ethereum', 'crypto', 350, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Ruble', 'Ethereum', 'crypto', 150, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Ruble', 'Ethereum', 'crypto', 150, 'exchange');
-- 105 

INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 1000, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 1200, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 290, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 250, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 250, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 250, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 250, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 200, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 20, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Bitcoin', 'crypto', 20, 'exchange');
-- 115

INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 550, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 25, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 25, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 25, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 25, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 350, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 450, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 150, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 120, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Euro', 'Ethereum', 'crypto', 130, 'exchange');
-- 125 

INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Dollar', 'Bitcoin', 'crypto', 100, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Dollar', 'Bitcoin', 'crypto', 120, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Dollar', 'Bitcoin', 'crypto', 90, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Dollar', 'Bitcoin', 'crypto', 50, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Dollar', 'Bitcoin', 'crypto', 50, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Dollar', 'Bitcoin', 'crypto', 50, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Dollar', 'Bitcoin', 'crypto', 50, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Dollar', 'Bitcoin', 'crypto', 1000, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Dollar', 'Bitcoin', 'crypto', 200, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Dollar', 'Bitcoin', 'crypto', 200, 'exchange');
-- 135

INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Dollar', 'Ethereum', 'crypto', 250, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Dollar', 'Ethereum', 'crypto', 250, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Dollar', 'Ethereum', 'crypto', 250, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Dollar', 'Ethereum', 'crypto', 250, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Dollar', 'Ethereum', 'crypto', 250, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Dollar', 'Ethereum', 'crypto', 350, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Dollar', 'Ethereum', 'crypto', 450, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Dollar', 'Ethereum', 'crypto', 550, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Dollar', 'Ethereum', 'crypto', 20, 'exchange');
INSERT INTO atm_transactions (exchange_from, exchange_to, type, amount, action) VALUES ('Dollar', 'Ethereum', 'crypto', 30, 'exchange');
-- 145 

-- inserts for devices 

-- ATM tid 1
INSERT INTO devices (type, tid) VALUES ('security', 1);
INSERT INTO devices (type, tid) VALUES ('security', 1);
INSERT INTO devices (type, tid) VALUES ('security', 1);
INSERT INTO devices (type, tid) VALUES ('authentication', 1);
INSERT INTO devices (type, tid) VALUES ('authentication', 1);
INSERT INTO devices (type, tid) VALUES ('io', 1);
INSERT INTO devices (type, tid) VALUES ('io', 1);
INSERT INTO devices (type, tid) VALUES ('io', 1);
INSERT INTO devices (type, tid) VALUES ('io', 1);
INSERT INTO devices (type, tid) VALUES ('transaction', 1);
INSERT INTO devices (type, tid) VALUES ('transaction', 1);
INSERT INTO devices (type, tid) VALUES ('transaction', 1); 
-- 12 

-- ATM tid 2
INSERT INTO devices (type, tid) VALUES ('security', 2);
INSERT INTO devices (type, tid) VALUES ('security', 2);
INSERT INTO devices (type, tid) VALUES ('security', 2);
INSERT INTO devices (type, tid) VALUES ('authentication', 2);
INSERT INTO devices (type, tid) VALUES ('authentication', 2);
INSERT INTO devices (type, tid) VALUES ('io', 2);
INSERT INTO devices (type, tid) VALUES ('io', 2);
INSERT INTO devices (type, tid) VALUES ('io', 2);
INSERT INTO devices (type, tid) VALUES ('io', 2);
INSERT INTO devices (type, tid) VALUES ('transaction', 2);
INSERT INTO devices (type, tid) VALUES ('transaction', 2);
INSERT INTO devices (type, tid) VALUES ('transaction', 2); 
-- 24

-- ATM tid 3
INSERT INTO devices (type, tid) VALUES ('security', 3);
INSERT INTO devices (type, tid) VALUES ('security', 3);
INSERT INTO devices (type, tid) VALUES ('security', 3);
INSERT INTO devices (type, tid) VALUES ('authentication', 3);
INSERT INTO devices (type, tid) VALUES ('authentication', 3);
INSERT INTO devices (type, tid) VALUES ('io', 3);
INSERT INTO devices (type, tid) VALUES ('io', 3);
INSERT INTO devices (type, tid) VALUES ('io', 3);
INSERT INTO devices (type, tid) VALUES ('io', 3);
INSERT INTO devices (type, tid) VALUES ('transaction', 3);
INSERT INTO devices (type, tid) VALUES ('transaction', 3);
INSERT INTO devices (type, tid) VALUES ('transaction', 3); 
-- 36

-- ATM tid 4
INSERT INTO devices (type, tid) VALUES ('security', 4);
INSERT INTO devices (type, tid) VALUES ('security', 4);
INSERT INTO devices (type, tid) VALUES ('security', 4);
INSERT INTO devices (type, tid) VALUES ('authentication', 4);
INSERT INTO devices (type, tid) VALUES ('authentication', 4);
INSERT INTO devices (type, tid) VALUES ('io', 4);
INSERT INTO devices (type, tid) VALUES ('io', 4);
INSERT INTO devices (type, tid) VALUES ('io', 4);
INSERT INTO devices (type, tid) VALUES ('io', 4);
INSERT INTO devices (type, tid) VALUES ('transaction', 4);
INSERT INTO devices (type, tid) VALUES ('transaction', 4);
INSERT INTO devices (type, tid) VALUES ('transaction', 4); 
-- 48

-- ATM tid 5
INSERT INTO devices (type, tid) VALUES ('security', 5);
INSERT INTO devices (type, tid) VALUES ('security', 5);
INSERT INTO devices (type, tid) VALUES ('security', 5);
INSERT INTO devices (type, tid) VALUES ('authentication', 5);
INSERT INTO devices (type, tid) VALUES ('authentication', 5);
INSERT INTO devices (type, tid) VALUES ('io', 5);
INSERT INTO devices (type, tid) VALUES ('io', 5);
INSERT INTO devices (type, tid) VALUES ('io', 5);
INSERT INTO devices (type, tid) VALUES ('io', 5);
INSERT INTO devices (type, tid) VALUES ('transaction', 5);
INSERT INTO devices (type, tid) VALUES ('transaction', 5);
INSERT INTO devices (type, tid) VALUES ('transaction', 5); 
-- 60

-- inserts for security devices 
INSERT INTO security_devices (status, access_permissions, device_id) VALUES ('online', 1, 1);
INSERT INTO security_devices (status, access_permissions, device_id) VALUES ('online', 1, 2);
INSERT INTO security_devices (status, access_permissions, device_id) VALUES ('online', 1, 3);

INSERT INTO security_devices (status, access_permissions, device_id) VALUES ('online', 1, 13);
INSERT INTO security_devices (status, access_permissions, device_id) VALUES ('online', 1, 14);
INSERT INTO security_devices (status, access_permissions, device_id) VALUES ('online', 1, 15);

INSERT INTO security_devices (status, access_permissions, device_id) VALUES ('online', 1, 25);
INSERT INTO security_devices (status, access_permissions, device_id) VALUES ('online', 1, 26);
INSERT INTO security_devices (status, access_permissions, device_id) VALUES ('online', 1, 27);

INSERT INTO security_devices (status, access_permissions, device_id) VALUES ('offline', 1, 37);
INSERT INTO security_devices (status, access_permissions, device_id) VALUES ('offline', 1, 38);
INSERT INTO security_devices (status, access_permissions, device_id) VALUES ('offline', 1, 39);

INSERT INTO security_devices (status, access_permissions, device_id) VALUES ('offline', 1, 49);
INSERT INTO security_devices (status, access_permissions, device_id) VALUES ('offline', 1, 50);
INSERT INTO security_devices (status, access_permissions, device_id) VALUES ('offline', 1, 51);

-- inserts for authentication devices
INSERT INTO authentication_devices (status, access_permissions, device_id) VALUES ('online', 1, 4);
INSERT INTO authentication_devices (status, access_permissions, device_id) VALUES ('online', 1, 5);

INSERT INTO authentication_devices (status, access_permissions, device_id) VALUES ('online', 1, 16);
INSERT INTO authentication_devices (status, access_permissions, device_id) VALUES ('online', 1, 17);

INSERT INTO authentication_devices (status, access_permissions, device_id) VALUES ('online', 1, 28);
INSERT INTO authentication_devices (status, access_permissions, device_id) VALUES ('online', 1, 29);

INSERT INTO authentication_devices (status, access_permissions, device_id) VALUES ('online', 1, 40);
INSERT INTO authentication_devices (status, access_permissions, device_id) VALUES ('online', 1, 41);

INSERT INTO authentication_devices (status, access_permissions, device_id) VALUES ('online', 1, 52);
INSERT INTO authentication_devices (status, access_permissions, device_id) VALUES ('online', 1, 53);

-- inserts for io devices
INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 6);
INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 7);
INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 8);
INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 9);

INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 18);
INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 19);
INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 20);
INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 21);

INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 30);
INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 31);
INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 32);
INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 33);

INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 42);
INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 43);
INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 44);
INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 45);

INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 54);
INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 55);
INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 56);
INSERT INTO io_devices (status, access_permissions, device_id) VALUES ('online', 1, 57);

-- inserts for transaction devices
INSERT INTO transaction_devices (status, access_permissions, device_id) VALUES ('online', 1, 10);
INSERT INTO transaction_devices (status, access_permissions, device_id) VALUES ('online', 1, 11);
INSERT INTO transaction_devices (status, access_permissions, device_id) VALUES ('online', 1, 12);

INSERT INTO transaction_devices (status, access_permissions, device_id) VALUES ('online', 1, 22);
INSERT INTO transaction_devices (status, access_permissions, device_id) VALUES ('online', 1, 23);
INSERT INTO transaction_devices (status, access_permissions, device_id) VALUES ('online', 1, 24);

INSERT INTO transaction_devices (status, access_permissions, device_id) VALUES ('online', 1, 34);
INSERT INTO transaction_devices (status, access_permissions, device_id) VALUES ('online', 1, 35);
INSERT INTO transaction_devices (status, access_permissions, device_id) VALUES ('online', 1, 36);

INSERT INTO transaction_devices (status, access_permissions, device_id) VALUES ('online', 1, 46);
INSERT INTO transaction_devices (status, access_permissions, device_id) VALUES ('online', 1, 47);
INSERT INTO transaction_devices (status, access_permissions, device_id) VALUES ('online', 1, 48);

INSERT INTO transaction_devices (status, access_permissions, device_id) VALUES ('online', 1, 58);
INSERT INTO transaction_devices (status, access_permissions, device_id) VALUES ('online', 1, 59);
INSERT INTO transaction_devices (status, access_permissions, device_id) VALUES ('online', 1, 60);



-- SECURITY DEVICES
-- inserts for iot context aware sensors
INSERT INTO iot_contextaware_sensors (status, has_malfunction, security_device_id) VALUES ('online', 0, 1);
INSERT INTO iot_contextaware_sensors (status, has_malfunction, security_device_id) VALUES ('online', 0, 4);
INSERT INTO iot_contextaware_sensors (status, has_malfunction, security_device_id) VALUES ('online', 0, 7);
INSERT INTO iot_contextaware_sensors (status, has_malfunction, security_device_id) VALUES ('offline', 0, 10);
INSERT INTO iot_contextaware_sensors (status, has_malfunction, security_device_id) VALUES ('offline', 0, 13);

-- inserts for iot temperature sensors 
INSERT INTO iot_temperature_sensors (status, has_malfunction, security_device_id) VALUES ('online', 0, 2);
INSERT INTO iot_temperature_sensors (status, has_malfunction, security_device_id) VALUES ('online', 0, 5);
INSERT INTO iot_temperature_sensors (status, has_malfunction, security_device_id) VALUES ('online', 0, 8);
INSERT INTO iot_temperature_sensors (status, has_malfunction, security_device_id) VALUES ('offline', 0, 11);
INSERT INTO iot_temperature_sensors (status, has_malfunction, security_device_id) VALUES ('offline', 0, 14);

-- inserts for cameras 
INSERT INTO cameras (status, has_malfunction, security_device_id) VALUES ('online', 0, 3);
INSERT INTO cameras (status, has_malfunction, security_device_id) VALUES ('online', 0, 6);
INSERT INTO cameras (status, has_malfunction, security_device_id) VALUES ('online', 0, 9);
INSERT INTO cameras (status, has_malfunction, security_device_id) VALUES ('offline', 0, 12);
INSERT INTO cameras (status, has_malfunction, security_device_id) VALUES ('offline', 0, 15);



-- AUTHENTICATION DEVICES 
-- inserts for card reader devices 
INSERT INTO card_reader_devices (status, has_malfunction, auth_device_id) VALUES ('online', 0, 1);
INSERT INTO card_reader_devices (status, has_malfunction, auth_device_id) VALUES ('online', 0, 3);
INSERT INTO card_reader_devices (status, has_malfunction, auth_device_id) VALUES ('online', 0, 5);
INSERT INTO card_reader_devices (status, has_malfunction, auth_device_id) VALUES ('online', 0, 7);
INSERT INTO card_reader_devices (status, has_malfunction, auth_device_id) VALUES ('online', 0, 9);

-- inserts for fingerprint scanners
INSERT INTO fingerprint_scanners (status, has_malfunction, auth_device_id) VALUES ('online', 0, 2);
INSERT INTO fingerprint_scanners (status, has_malfunction, auth_device_id) VALUES ('online', 0, 4);
INSERT INTO fingerprint_scanners (status, has_malfunction, auth_device_id) VALUES ('online', 0, 6);
INSERT INTO fingerprint_scanners (status, has_malfunction, auth_device_id) VALUES ('online', 0, 8);
INSERT INTO fingerprint_scanners (status, has_malfunction, auth_device_id) VALUES ('online', 0, 10);



-- IO DEVICES 
-- inserts for ada headphone jacks
INSERT INTO ada_headphone_jacks (status, has_malfunction, io_device_id) VALUES ('online', 0, 1); 
INSERT INTO ada_headphone_jacks (status, has_malfunction, io_device_id) VALUES ('online', 0, 5); 
INSERT INTO ada_headphone_jacks (status, has_malfunction, io_device_id) VALUES ('online', 0, 9); 
INSERT INTO ada_headphone_jacks (status, has_malfunction, io_device_id) VALUES ('online', 0, 13); 
INSERT INTO ada_headphone_jacks (status, has_malfunction, io_device_id) VALUES ('online', 0, 17); 

-- inserts for speakers
INSERT INTO speakers (status, has_malfunction, io_device_id) VALUES ('online', 0, 2);
INSERT INTO speakers (status, has_malfunction, io_device_id) VALUES ('online', 0, 6);
INSERT INTO speakers (status, has_malfunction, io_device_id) VALUES ('online', 0, 10);
INSERT INTO speakers (status, has_malfunction, io_device_id) VALUES ('online', 0, 14);
INSERT INTO speakers (status, has_malfunction, io_device_id) VALUES ('online', 0, 18);

-- inserts for atm displays
INSERT INTO atm_displays (status, has_malfunction, io_device_id) VALUES ('online', 0, 3);
INSERT INTO atm_displays (status, has_malfunction, io_device_id) VALUES ('online', 0, 7);
INSERT INTO atm_displays (status, has_malfunction, io_device_id) VALUES ('online', 0, 11);
INSERT INTO atm_displays (status, has_malfunction, io_device_id) VALUES ('online', 0, 15);
INSERT INTO atm_displays (status, has_malfunction, io_device_id) VALUES ('online', 0, 19);

-- inserts for keypads
INSERT INTO keypads (status, has_malfunction, io_device_id) VALUES ('online', 0, 4);
INSERT INTO keypads (status, has_malfunction, io_device_id) VALUES ('online', 0, 8);
INSERT INTO keypads (status, has_malfunction, io_device_id) VALUES ('online', 0, 12);
INSERT INTO keypads (status, has_malfunction, io_device_id) VALUES ('online', 0, 16);
INSERT INTO keypads (status, has_malfunction, io_device_id) VALUES ('online', 0, 20);



-- TRANSACTION DEVICES 
-- inserts for cash dispensers
INSERT INTO cash_dispensers (status, has_malfunction, transaction_device_id) VALUES ('online', 0, 1);
INSERT INTO cash_dispensers (status, has_malfunction, transaction_device_id) VALUES ('online', 0, 4);
INSERT INTO cash_dispensers (status, has_malfunction, transaction_device_id) VALUES ('online', 0, 7);
INSERT INTO cash_dispensers (status, has_malfunction, transaction_device_id) VALUES ('online', 0, 10);
INSERT INTO cash_dispensers (status, has_malfunction, transaction_device_id) VALUES ('online', 0, 13);

-- inserts for deposit_check_slots
INSERT INTO deposit_check_slots (status, has_malfunction, transaction_device_id) VALUES ('online', 0, 2);
INSERT INTO deposit_check_slots (status, has_malfunction, transaction_device_id) VALUES ('online', 0, 5);
INSERT INTO deposit_check_slots (status, has_malfunction, transaction_device_id) VALUES ('online', 0, 8);
INSERT INTO deposit_check_slots (status, has_malfunction, transaction_device_id) VALUES ('online', 0, 11);
INSERT INTO deposit_check_slots (status, has_malfunction, transaction_device_id) VALUES ('online', 0, 14);

-- inserts for receipt printers 
INSERT INTO receipt_printers (paper_qty, ink_cartridge_qty, status, has_malfunction, transaction_device_id) VALUES (1, 1, 'online', 0, 3);
INSERT INTO receipt_printers (paper_qty, ink_cartridge_qty, status, has_malfunction, transaction_device_id) VALUES (1, 1, 'online', 0, 6);
INSERT INTO receipt_printers (paper_qty, ink_cartridge_qty, status, has_malfunction, transaction_device_id) VALUES (1, 1, 'online', 0, 9);
INSERT INTO receipt_printers (paper_qty, ink_cartridge_qty, status, has_malfunction, transaction_device_id) VALUES (1, 1, 'online', 0, 12);
INSERT INTO receipt_printers (paper_qty, ink_cartridge_qty, status, has_malfunction, transaction_device_id) VALUES (1, 1, 'online', 0, 15);


-- RECEIPT ENTITY SET 
-- inserts for receipt roll paper 
INSERT INTO receipt_roll_paper (used_at, length, printer_id) VALUES (now(), '50', 1);
INSERT INTO receipt_roll_paper (used_at, length, printer_id) VALUES (now(), '50', 2);
INSERT INTO receipt_roll_paper (used_at, length, printer_id) VALUES (now(), '50', 3);
INSERT INTO receipt_roll_paper (used_at, length, printer_id) VALUES (now(), '50', 4);
INSERT INTO receipt_roll_paper (used_at, length, printer_id) VALUES (now(), '50', 5);

-- inserts for ink cartridges 
INSERT INTO ink_cartridges (manufacturer, color, printer_id) VALUES ('HP', 'black', 1); 
INSERT INTO ink_cartridges (manufacturer, color, printer_id) VALUES ('HP', 'black', 2); 
INSERT INTO ink_cartridges (manufacturer, color, printer_id) VALUES ('HP', 'black', 3);
INSERT INTO ink_cartridges (manufacturer, color, printer_id) VALUES ('HP', 'black', 4);
INSERT INTO ink_cartridges (manufacturer, color, printer_id) VALUES ('HP', 'black', 5);




-- inserts for kubeCDNs
INSERT INTO kubeCDNs (cdn_description, region_id) VALUES ('CDN is operational and running', 1);
INSERT INTO kubeCDNs (cdn_description, region_id) VALUES ('CDN is operational and running', 2);
INSERT INTO kubeCDNs (cdn_description, region_id) VALUES ('CDN is operational and running', 3);
INSERT INTO kubeCDNs (cdn_description, region_id) VALUES ('CDN is operational and running', 4);
INSERT INTO kubeCDNs (cdn_description, region_id) VALUES ('CDN is operational and running', 5);

-- inserts for security media contents 
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_contextaware_sensors', 0, 1);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_contextaware_sensors', 0, 2);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_contextaware_sensors', 0, 3);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_contextaware_sensors', 0, 4);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_contextaware_sensors', 0, 5);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_temperature_sensors', 0, 1);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_temperature_sensors', 0, 2);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_temperature_sensors', 0, 3);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_temperature_sensors', 0, 4);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_temperature_sensors', 0, 5);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('cameras', 0, 1);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('cameras', 0, 2);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('cameras', 0, 3);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('cameras', 0, 4);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('cameras', 0, 5);
-- 15

INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_contextaware_sensors', 0, 1);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_contextaware_sensors', 0, 2);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_contextaware_sensors', 0, 3);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_contextaware_sensors', 0, 4);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_contextaware_sensors', 0, 5);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_temperature_sensors', 0, 1);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_temperature_sensors', 0, 2);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_temperature_sensors', 0, 3);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_temperature_sensors', 0, 4);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_temperature_sensors', 0, 5);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('cameras', 0, 1);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('cameras', 0, 2);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('cameras', 0, 3);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('cameras', 0, 4);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('cameras', 0, 5);
-- 30

INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_contextaware_sensors', 0, 1);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_contextaware_sensors', 0, 2);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_contextaware_sensors', 0, 3);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_contextaware_sensors', 0, 4);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_contextaware_sensors', 0, 5);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_temperature_sensors', 0, 1);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_temperature_sensors', 0, 2);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_temperature_sensors', 0, 3);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_temperature_sensors', 0, 4);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_temperature_sensors', 0, 5);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('cameras', 0, 1);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('cameras', 0, 2);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('cameras', 0, 3);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('cameras', 0, 4);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('cameras', 0, 5);
-- 45

INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_contextaware_sensors', 0, 1);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_contextaware_sensors', 0, 2);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_contextaware_sensors', 0, 3);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_contextaware_sensors', 0, 4);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_contextaware_sensors', 0, 5);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_temperature_sensors', 0, 1);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_temperature_sensors', 0, 2);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_temperature_sensors', 0, 3);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_temperature_sensors', 0, 4);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_temperature_sensors', 0, 5);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('cameras', 0, 1);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('cameras', 0, 2);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('cameras', 0, 3);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('cameras', 0, 4);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('cameras', 0, 5);
-- 60

INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_contextaware_sensors', 0, 1);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_contextaware_sensors', 0, 2);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_contextaware_sensors', 0, 3);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_contextaware_sensors', 0, 4);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_contextaware_sensors', 0, 5);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_temperature_sensors', 0, 1);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_temperature_sensors', 0, 2);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_temperature_sensors', 0, 3);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_temperature_sensors', 0, 4);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('iot_temperature_sensors', 0, 5);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('cameras', 0, 1);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('cameras', 0, 2);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('cameras', 0, 3);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('cameras', 0, 4);
INSERT INTO security_media_content (content_type, access_permissions, cdn_id) VALUES ('cameras', 0, 5);
-- 75

-- inserts for context aware sensor data 
INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (0, 'iot_contextaware_sensors', 'atm machine operational', 1, 1);
INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (1, 'iot_contextaware_sensors', 'atm machine being tampered', 1, 2);
INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (0, 'iot_contextaware_sensors', 'no errors present', 1, 3);
INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (0, 'iot_contextaware_sensors', 'no errors present', 1, 4);
INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (0, 'iot_contextaware_sensors', 'no errors present', 1, 5);

INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (0, 'iot_contextaware_sensors', 'atm machine operational', 2, 16);
INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (1, 'iot_contextaware_sensors', 'atm machine being tampered', 2, 17);
INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (0, 'iot_contextaware_sensors', 'no errors present', 2, 18);
INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (0, 'iot_contextaware_sensors', 'no errors present', 2, 19);
INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (0, 'iot_contextaware_sensors', 'no errors present', 2, 20);

INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (0, 'iot_contextaware_sensors', 'atm machine operational', 3, 31);
INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (1, 'iot_contextaware_sensors', 'atm machine being tampered', 3, 32);
INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (0, 'iot_contextaware_sensors', 'no errors present', 3, 33);
INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (0, 'iot_contextaware_sensors', 'no errors present', 3, 34);
INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (0, 'iot_contextaware_sensors', 'no errors present', 3, 35);

INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (0, 'iot_contextaware_sensors', 'atm machine operational', 3, 46);
INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (1, 'iot_contextaware_sensors', 'atm machine being tampered', 3, 47);
INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (0, 'iot_contextaware_sensors', 'no errors present', 3, 48);
INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (0, 'iot_contextaware_sensors', 'no errors present', 3, 49);
INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (0, 'iot_contextaware_sensors', 'no errors present', 3, 50);

INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (0, 'iot_contextaware_sensors', 'atm machine operational', 3, 61);
INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (1, 'iot_contextaware_sensors', 'atm machine being tampered', 3, 62);
INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (0, 'iot_contextaware_sensors', 'no errors present', 3, 63);
INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (0, 'iot_contextaware_sensors', 'no errors present', 3, 64);
INSERT INTO context_aware_sensor_data (atm_violation_status, device_origin, description, context_sensor_id, media_content_id) VALUES (0, 'iot_contextaware_sensors', 'no errors present', 3, 65);

-- inserts for temperature sensor data 
INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (0, 'iot_temperature_sensors', 'internal CPU at normal capacity', 1, 6);
INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (1, 'iot_temperature_sensors', 'internal CPU at maximum capacity', 1, 7);
INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (0, 'iot_temperature_sensors', 'all internal hardware checks passed', 1, 8);
INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (0, 'iot_temperature_sensors', 'all internal hardware checks passed', 1, 9);
INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (0, 'iot_temperature_sensors', 'all internal hardware checks passed', 1, 10);

INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (0, 'iot_temperature_sensors', 'internal CPU at normal capacity', 2, 21);
INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (1, 'iot_temperature_sensors', 'internal CPU at maximum capacity', 2, 22);
INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (0, 'iot_temperature_sensors', 'all internal hardware checks passed', 2, 23);
INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (0, 'iot_temperature_sensors', 'all internal hardware checks passed', 2, 24);
INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (0, 'iot_temperature_sensors', 'all internal hardware checks passed', 2, 25);

INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (0, 'iot_temperature_sensors', 'internal CPU at normal capacity', 3, 36);
INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (1, 'iot_temperature_sensors', 'internal CPU at maximum capacity', 3, 37);
INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (0, 'iot_temperature_sensors', 'all internal hardware checks passed', 3, 38);
INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (0, 'iot_temperature_sensors', 'all internal hardware checks passed', 3, 39);
INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (0, 'iot_temperature_sensors', 'all internal hardware checks passed', 3, 40);

INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (0, 'iot_temperature_sensors', 'internal CPU at normal capacity', 3, 51);
INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (1, 'iot_temperature_sensors', 'internal CPU at maximum capacity', 3, 52);
INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (0, 'iot_temperature_sensors', 'all internal hardware checks passed', 3, 53);
INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (0, 'iot_temperature_sensors', 'all internal hardware checks passed', 3, 54);
INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (0, 'iot_temperature_sensors', 'all internal hardware checks passed', 3, 55);

INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (0, 'iot_temperature_sensors', 'internal CPU at normal capacity', 3, 66);
INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (1, 'iot_temperature_sensors', 'internal CPU at maximum capacity', 3, 67);
INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (0, 'iot_temperature_sensors', 'all internal hardware checks passed', 3, 68);
INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (0, 'iot_temperature_sensors', 'all internal hardware checks passed', 3, 69);
INSERT INTO temperature_sensor_data (internal_error_status, device_origin, description, temp_sensor_id, media_content_id) VALUES (0, 'iot_temperature_sensors', 'all internal hardware checks passed', 3, 70);

-- inserts for camera footage 
INSERT INTO camera_footage (device_origin, created_at, ended_at, duration, camera_id, media_content_id) VALUES ('cameras', now(), now(), 24, 1, 11);
INSERT INTO camera_footage (device_origin, created_at, ended_at, duration, camera_id, media_content_id) VALUES ('cameras',now(), now(), 24, 1, 12);
INSERT INTO camera_footage (device_origin, created_at, ended_at, duration, camera_id, media_content_id) VALUES ('cameras',now(), now(), 24, 1, 13);
INSERT INTO camera_footage (device_origin, created_at, ended_at, duration, camera_id, media_content_id) VALUES ('cameras',now(), now(), 24, 1, 14);
INSERT INTO camera_footage (device_origin, created_at, ended_at, duration, camera_id, media_content_id) VALUES ('cameras',now(), now(), 24, 1, 15);

INSERT INTO camera_footage (device_origin, created_at, ended_at, duration, camera_id, media_content_id) VALUES ('cameras',now(), now(), 24, 2, 26);
INSERT INTO camera_footage (device_origin, created_at, ended_at, duration, camera_id, media_content_id) VALUES ('cameras',now(), now(), 24, 2, 27);
INSERT INTO camera_footage (device_origin, created_at, ended_at, duration, camera_id, media_content_id) VALUES ('cameras',now(), now(), 24, 2, 28);
INSERT INTO camera_footage (device_origin, created_at, ended_at, duration, camera_id, media_content_id) VALUES ('cameras',now(), now(), 24, 2, 29);
INSERT INTO camera_footage (device_origin, created_at, ended_at, duration, camera_id, media_content_id) VALUES ('cameras',now(), now(), 24, 2, 30);

INSERT INTO camera_footage (device_origin, created_at, ended_at, duration, camera_id, media_content_id) VALUES ('cameras',now(), now(), 24, 3, 41);
INSERT INTO camera_footage (device_origin, created_at, ended_at, duration, camera_id, media_content_id) VALUES ('cameras',now(), now(), 24, 3, 42);
INSERT INTO camera_footage (device_origin, created_at, ended_at, duration, camera_id, media_content_id) VALUES ('cameras',now(), now(), 24, 3, 43);
INSERT INTO camera_footage (device_origin, created_at, ended_at, duration, camera_id, media_content_id) VALUES ('cameras',now(), now(), 24, 3, 44);
INSERT INTO camera_footage (device_origin, created_at, ended_at, duration, camera_id, media_content_id) VALUES ('cameras',now(), now(), 24, 3, 45);

INSERT INTO camera_footage (device_origin, created_at, ended_at, duration, camera_id, media_content_id) VALUES ('cameras',now(), now(), 24, 3, 56);
INSERT INTO camera_footage (device_origin, created_at, ended_at, duration, camera_id, media_content_id) VALUES ('cameras',now(), now(), 24, 3, 57);
INSERT INTO camera_footage (device_origin, created_at, ended_at, duration, camera_id, media_content_id) VALUES ('cameras',now(), now(), 24, 3, 58);
INSERT INTO camera_footage (device_origin, created_at, ended_at, duration, camera_id, media_content_id) VALUES ('cameras',now(), now(), 24, 3, 59);
INSERT INTO camera_footage (device_origin, created_at, ended_at, duration, camera_id, media_content_id) VALUES ('cameras',now(), now(), 24, 3, 60);

INSERT INTO camera_footage (device_origin, created_at, ended_at, duration, camera_id, media_content_id) VALUES ('cameras',now(), now(), 24, 3, 71);
INSERT INTO camera_footage (device_origin, created_at, ended_at, duration, camera_id, media_content_id) VALUES ('cameras',now(), now(), 24, 3, 72);
INSERT INTO camera_footage (device_origin, created_at, ended_at, duration, camera_id, media_content_id) VALUES ('cameras',now(), now(), 24, 3, 73);
INSERT INTO camera_footage (device_origin, created_at, ended_at, duration, camera_id, media_content_id) VALUES ('cameras',now(), now(), 24, 3, 74);
INSERT INTO camera_footage (device_origin, created_at, ended_at, duration, camera_id, media_content_id) VALUES ('cameras',now(), now(), 24, 3, 75);

-- inserts for sessions 
INSERT INTO sessions (expires_at, session_data, user_auth_token, tid) VALUES (now(), null, 'D*c12LHLG=<b|c|PLk}dz7^4?x@m|?]G>v ],;/9`nun[(UNBXE:Xir.Y@Fn]}Es', 1);
INSERT INTO sessions (expires_at, session_data, user_auth_token, tid) VALUES (now(), null, 'pL-gj]>mg+(-:W?P64jR-I5JYGe>c7I&@:t7+;H_mFP;Vq9L>/]cB^2<Qu.{oF/s', 2);
INSERT INTO sessions (expires_at, session_data, user_auth_token, tid) VALUES (now(), null, 'xa4D0-F^GNM-1cDI19-Vf|wb}RjNKNGgid3Jj|rr~8DiiRL`#kzLxC@giIPPlLak', 3);
INSERT INTO sessions (expires_at, session_data, user_auth_token, tid) VALUES (now(), null, 'XMY~k=6LB,C<-LoMPyXuf$R89h5dfqC:`EDBc N(Qq>;Mr;||i]6QA.4,XdO]bHr', 4);
INSERT INTO sessions (expires_at, session_data, user_auth_token, tid) VALUES (now(), null, '{nf}Qn-pNRKKZHoAurds}59I|.7PR&[azT%1I)5MXK)B>6*!+z|(w@+J,wSAq+|P', 5);

-- inserts for atm admins
INSERT INTO atm_admins (access_code, access_permissions, user_auth_token) VALUES (12345, 1, 'D*c12LHLG=<b|c|PLk}dz7^4?x@m|?]G>v ],;/9`nun[(UNBXE:Xir.Y@Fn]}Es');
INSERT INTO atm_admins (access_code, access_permissions, user_auth_token) VALUES (12345, 1, 'xa4D0-F^GNM-1cDI19-Vf|wb}RjNKNGgid3Jj|rr~8DiiRL`#kzLxC@giIPPlLak');

-- inserts for atm maintenance
INSERT INTO atm_maintenance (tid, admin_id) VALUES (1, 1);
INSERT INTO atm_maintenance (tid, admin_id) VALUES (2, 1);
INSERT INTO atm_maintenance (tid, admin_id) VALUES (3, 2);
INSERT INTO atm_maintenance (tid, admin_id) VALUES (4, 2);

-- inserts for transaction actions 
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'crypto', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'crypto', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'crypto', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'crypto', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'crypto', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'crypto', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'checking', 'savings');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'checking', 'savings');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'checking', 'savings');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'checking', 'savings');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'checking', 'savings');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'checking', 'savings');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'checking', 'savings');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'crypto', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'crypto', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'savings', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'savings', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'crypto', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'crypto', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'crypto', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'savings', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'savings', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'savings', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'crypto', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'crypto', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'crypto', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'savings', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'crypto', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'savings', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'savings', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'crypto', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'savings', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'crypto', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'savings', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'savings', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'crypto', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'savings', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'crypto', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'savings', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'savings', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'crypto', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'savings', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'crypto', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'savings', 'checking');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (2, 1, 2, 2, 'savings', 'checking');
-- 45

INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
-- 55

INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
-- 65

INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
-- 75

INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
-- 85

INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
-- 95

INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
-- 105

INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
-- 115

INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
-- 125

INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
-- 135

INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
INSERT INTO transaction_actions (printer_id, is_verified, processing_device_id, fee, from_account, to_account) VALUES (1, 1, 1, 2, 'checking', 'crypto');
-- 145

-- inserts for atm transaction info 
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 1, 1); 
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 2, 2);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 3, 3);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 4, 4);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 5, 5);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 6, 6);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 7, 7);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 8, 8);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 9, 9);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 10, 10);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 11, 11);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 12, 12);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 13, 13);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 14, 14);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 15, 15);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 16, 16);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 17, 17);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 18, 18);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 19, 19);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 20, 20);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 21, 21);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 22, 22);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 23, 23);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 24, 24);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 25, 25);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 26, 26);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 27, 27);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 28, 28);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 29, 29);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 30, 30);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 31, 31);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 32, 32);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 33, 33);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 34, 34);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 35, 35);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 36, 36);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 37, 37);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 38, 38);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 39, 39);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 40, 40);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (5, 41, 41);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (5, 42, 42);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (5, 43, 43);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (5, 44, 44);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (5, 45, 45);
-- 45 

INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 46, 46);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 47, 47);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 48, 48);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 49, 49);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 50, 50);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 51, 51);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 52, 52);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 53, 53);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 54, 54);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 55, 55);
-- 55

INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 56, 56);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 57, 57);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 58, 58);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 59, 59);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 60, 60);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 61, 61);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 62, 62);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 63, 63);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 64, 64);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (1, 65, 65);
-- 65

INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 66, 66);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 67, 67);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 68, 68);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 69, 69);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 70, 70);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 71, 71);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 72, 72);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 73, 73);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 74, 74);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 75, 75);
-- 75

INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 76, 76);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 77, 77);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 78, 78);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 79, 79);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 80, 80);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 81, 81);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 82, 82);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 83, 83);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 84, 84);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (2, 85, 85);
-- 85

INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 86, 86);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 87, 87);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 88, 88);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 89, 89);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 90, 90);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 91, 91);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 92, 92);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 93, 93);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 94, 94);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 95, 95);
-- 95

INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 96, 96);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 97, 97);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 98, 98);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 99, 99);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 100, 100);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 101, 101);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 102, 102);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 103, 103);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 104, 104);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (3, 105, 105);
-- 105

INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 106, 106);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 107, 107);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 108, 108);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 109, 109);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 110, 110);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 111, 111);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 112, 112);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 113, 113);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 114, 114);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 115, 115);
-- 115

INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 116, 116);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 117, 117);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 118, 118);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 119, 119);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 120, 120);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 121, 121);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 122, 122);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 123, 123);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 124, 124);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (4, 125, 125);
-- 125

INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (5, 126, 126);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (5, 127, 127);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (5, 128, 128);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (5, 129, 129);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (5, 130, 130);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (5, 131, 131);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (5, 132, 132);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (5, 133, 133);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (5, 134, 134);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (5, 135, 135);
-- 135

INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (5, 136, 136);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (5, 137, 137);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (5, 138, 138);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (5, 139, 139);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (5, 140, 140);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (5, 141, 141);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (5, 142, 142);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (5, 143, 143);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (5, 144, 144);
INSERT INTO atm_transaction_info (portfolio_id, transaction_id, transaction_action_id) VALUES (5, 145, 145);
-- 145

-- inserts for crypto_permissions 
INSERT INTO crypto_permissions (transaction_action_id, crypto_account_id) VALUES (1, 1);
INSERT INTO crypto_permissions (transaction_action_id, crypto_account_id) VALUES (2, 1);
INSERT INTO crypto_permissions (transaction_action_id, crypto_account_id) VALUES (3, 2);
INSERT INTO crypto_permissions (transaction_action_id, crypto_account_id) VALUES (4, 2);
INSERT INTO crypto_permissions (transaction_action_id, crypto_account_id) VALUES (5, 3);
INSERT INTO crypto_permissions (transaction_action_id, crypto_account_id) VALUES (6, 4);

-- inserts for checking accounts 
INSERT INTO checking_accounts (balance, access_permissions, bank_account_id, type) VALUES (25000, 1, 1, 'checking');
INSERT INTO checking_accounts (balance, access_permissions, bank_account_id, type) VALUES (500000, 1, 2, 'checking');
INSERT INTO checking_accounts (balance, access_permissions, bank_account_id, type) VALUES (15000, 1, 3, 'checking');
INSERT INTO checking_accounts (balance, access_permissions, bank_account_id, type) VALUES (2000, 1, 4, 'checking');
INSERT INTO checking_accounts (balance, access_permissions, bank_account_id, type) VALUES (10000, 1, 5, 'checking');

-- inserts for savings accounts 
INSERT INTO savings_accounts (balance, access_permissions, bank_account_id, type) VALUES (75000, 1, 1, 'savings');
INSERT INTO savings_accounts (balance, access_permissions, bank_account_id, type) VALUES (50000, 1, 2, 'savings');
INSERT INTO savings_accounts (balance, access_permissions, bank_account_id, type) VALUES (15000, 1, 3, 'savings');
INSERT INTO savings_accounts (balance, access_permissions, bank_account_id, type) VALUES (30000, 1, 4, 'savings');
INSERT INTO savings_accounts (balance, access_permissions, bank_account_id, type) VALUES (45000, 1, 5, 'savings');

-- inserts for checking bank permissions 
INSERT INTO checking_bank_permissions (transaction_action_id, checking_account_id) VALUES (1, 1);
INSERT INTO checking_bank_permissions (transaction_action_id, checking_account_id) VALUES (2, 2);

-- inserts for savings bank permissions
INSERT INTO savings_bank_permissions (transaction_action_id, savings_account_id) VALUES (1, 1);
INSERT INTO savings_bank_permissions (transaction_action_id, savings_account_id) VALUES (2, 2);


-- inserts for account notifications
INSERT INTO account_notifications (created_at, message, atm_account_id) VALUES (now(), 'an amount was withdrawn from checking', 1);
INSERT INTO account_notifications (created_at, message, atm_account_id) VALUES (now(), 'an amount was deposited into savings', 1);
INSERT INTO account_notifications (created_at, message, atm_account_id) VALUES (now(), 'a new crypto account was added to your accounts portfolio', 2);
INSERT INTO account_notifications (created_at, message, atm_account_id) VALUES (now(), 'a new crypto transaction was created', 3);
INSERT INTO account_notifications (created_at, message, atm_account_id) VALUES (now(), 'your crypto transaction has gone through', 3);
INSERT INTO account_notifications (created_at, message, atm_account_id) VALUES (now(), 'your crypto loan has been initiated', 4);
INSERT INTO account_notifications (created_at, message, atm_account_id) VALUES (now(), 'you have made a successful crypto loan payment', 4);
INSERT INTO account_notifications (created_at, message, atm_account_id) VALUES (now(), 'you have successfully deposited a check', 5);
INSERT INTO account_notifications (created_at, message, atm_account_id) VALUES (now(), 'you do not have sufficient funds to perform this transaction', 5);
INSERT INTO account_notifications (created_at, message, atm_account_id) VALUES (now(), 'please add more funds into your checking if you would like to withdraw funds', 5);

-- inserts for fraud claims 
INSERT INTO fraud_claims (description, created_at, resolved_at, atm_account_id) VALUES ('iot context aware sensor has been triggered about a a possible fraud claim tied to your account', now(), null, 1);
INSERT INTO fraud_claims (description, created_at, resolved_at, atm_account_id) VALUES ('suspicious activity has been spotted after you withdraw an amount from atm machine 11', now(), null, 2);
INSERT INTO fraud_claims (description, created_at, resolved_at, atm_account_id) VALUES ('please change your bank account passwords now', now(), null, 3);
INSERT INTO fraud_claims (description, created_at, resolved_at, atm_account_id) VALUES ('potential atm card theft at atm machine 12', now(), null, 4);
INSERT INTO fraud_claims (description, created_at, resolved_at, atm_account_id) VALUES ('binance.us dropped your transaction, please look into its recovery', now(), null, 5);