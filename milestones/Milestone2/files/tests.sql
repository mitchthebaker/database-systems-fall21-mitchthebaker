-- Script name: tests.sql
-- Author: Mitchel Baker 
-- Purpose: this file will create UPDATE/DELETE queries on all tables in order to test their integrity

-- specify the database which we are performing the following queries on
USE `atmManagementSystemDB`;

-- 1. Testing general_users table 
DELETE FROM general_users WHERE user_id = 10;
UPDATE general_users SET email = 'testABC123@gmail.com' WHERE user_id = 1;

-- 2. Testing banks table 
-- DELETE FROM banks WHERE bank_id = 5;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`csc675db`.`bank_crypto_partnerships`, CONSTRAINT `fk_partnership_bank_id` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`bank_id`) ON UPDATE CASCADE)

DELETE FROM banks WHERE bank_id = 5;
UPDATE banks SET name = 'Bank Of America' WHERE bank_id = 1;

-- 3. Testing bank_accounts table 
DELETE FROM bank_accounts WHERE bank_account_id = 10;
UPDATE bank_accounts SET routing_number = 123456789 WHERE bank_account_id = 1;

-- 4. Testing user authentication methods table 
DELETE FROM user_auth_methods WHERE user_auth_id = 1;
UPDATE user_auth_methods SET type = 'mobile' WHERE user_auth_id = 2;

-- 5. Testing mobile wallets table 
-- DELETE FROM mobile_wallets WHERE card_number = 4201997830840977;
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

-- UPDATE mobile_wallets SET cvc = 999 WHERE card_number = 4828734748332331;
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
DELETE FROM mobile_wallets WHERE wallet_id = 3;
UPDATE mobile_wallets SET cvc = 999 WHERE wallet_id = 2;

-- 6. Testing atm debit cards table 
DELETE FROM debit_atm_cards WHERE card_id = 3;
UPDATE debit_atm_cards SET cvc = 999 WHERE card_id = 2;

-- 7. Testing bank account links table 
DELETE FROM bank_account_links WHERE bank_account_id = 2;
UPDATE bank_account_links SET wallet_id = null WHERE bank_account_id = 3;

-- 8. Testing for authenticated users table 
DELETE FROM authenticated_users WHERE user_auth_token = '{nf}Qn-pNRKKZHoAurds}59I|.7PR&[azT%1I)5MXK)B>6*!+z|(w@+J,wSAq+|P';
UPDATE authenticated_users SET is_admin = 1 WHERE user_auth_token = 'pL-gj]>mg+(-:W?P64jR-I5JYGe>c7I&@:t7+;H_mFP;Vq9L>/]cB^2<Qu.{oF/s';

-- 9. Testing for regions table 
DELETE FROM regions WHERE region_id = 3;
UPDATE regions SET country = 'United States', timezone_offset = '02:00:00' WHERE region_id = 1;

-- 10. Testing for atm machines table
DELETE FROM atm_machines WHERE tid = 2;
UPDATE atm_machines SET status = 0, access_permissions = 0 WHERE tid = 3;

-- 11. Testing for languages table 
DELETE FROM languages WHERE language_id = 4;
UPDATE languages SET country = 'Japan', name = 'Japanese' WHERE language_id = 5;

-- 12. Testing for atm accounts table 
DELETE FROM atm_accounts WHERE atm_account_id = 5;
UPDATE atm_accounts SET created_at = '2021-10-21 15:00:00' WHERE atm_account_id = 4;

-- 13. Testing for portfolios table 
DELETE FROM portfolios WHERE portfolio_id = 3;
UPDATE portfolios SET num_crypto_accts = 4 WHERE portfolio_id = 4;

-- 14. Testing for crypto accounts table
DELETE FROM crypto_accounts WHERE crypto_account_id = 5;
UPDATE crypto_accounts SET balance = 10000 WHERE crypto_account_id = 4;

-- 15. Testing for crypto account info table
DELETE FROM crypto_account_info WHERE crypto_account_id = 5;
UPDATE crypto_account_info SET exchange_id = 1 WHERE crypto_account_id = 7;

-- 16. Testing for bank crypto partnerships table
DELETE FROM bank_crypto_partnerships WHERE partnership_id = 4;
UPDATE bank_crypto_partnerships SET bank_id = 2 WHERE partnership_id = 3;

-- 17. Testing for open lending protocols table
DELETE FROM open_lending_protocols WHERE protocol_id = 3;
UPDATE open_lending_protocols SET provider_name = 'Gemini' WHERE protocol_id = 2;

-- 18. Testing for crypto loans table
DELETE FROM crypto_loans WHERE crypto_loan_id = 4; 
UPDATE crypto_loans SET payment_plan = 'weekly', loan_type = 'borrow', asset_type = 'dai', interest_rate = 0.08 WHERE crypto_loan_id = 3; 

-- 19. Testing for crypto loan payments table
DELETE FROM crypto_loan_payments WHERE crypto_loan_payment_id = 4; 
UPDATE crypto_loan_payments SET amount_paid = '50' WHERE crypto_loan_payment_id = 3; 

-- 20. Testing for lending protocol connections table
DELETE FROM lending_protocol_connections WHERE protocol_id = 1; 
-- UPDATE lending_protocol_connections SET crypto_loan_id = 5 WHERE protocol_id = 2; 
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`csc675db`.`lending_protocol_connections`, CONSTRAINT `fk_lending_connection_crypto_loan_id` FOREIGN KEY (`crypto_loan_id`) REFERENCES `crypto_loans` (`crypto_loan_id`) ON DELETE CASCADE ON UP)

UPDATE lending_protocol_connections SET crypto_account_id = null WHERE protocol_id = 2; 

-- 21. Testing for currencies table 
DELETE FROM currencies WHERE currency_id = 2; 
UPDATE currencies SET circulation_amt = 115000000 WHERE currency_id = 4; 

-- 22. Testing for exchange rates table 
DELETE FROM exchange_rates WHERE exchange_rate_id = 4; 
UPDATE exchange_rates SET closing_rate = 0.123, average_rate = 0.5 WHERE exchange_rate_id = 5; 

-- 23. Testing for portfolio exchange rates table
DELETE FROM portfolio_exchange_rates WHERE exchange_rate_id = 14; 
UPDATE portfolio_exchange_rates SET portfolio_id = 2 WHERE exchange_rate_id = 15; 

-- 24. Testing for atm transactions table
DELETE FROM atm_transactions WHERE transaction_id = 2; 
UPDATE atm_transactions SET type = 'check deposit', amount = 500 WHERE transaction_id = 3; 

-- 25. Testing for devices table
DELETE FROM devices WHERE device_id = 3; 
UPDATE devices SET type = 'authentication' WHERE device_id = 6; 

-- 26. Testing for security devices table
DELETE FROM security_devices WHERE security_device_id = 4; 
UPDATE security_devices SET status = 'offline', access_permissions = 0 WHERE security_device_id = 2;

-- 27. Testing for authentication devices table 
DELETE FROM authentication_devices WHERE auth_device_id = 3; 
UPDATE authentication_devices SET status = 'offline', access_permissions = 0 WHERE auth_device_id = 2;

-- 28. Testing for io devices table 
DELETE FROM io_devices WHERE io_device_id = 3; 
UPDATE io_devices SET status = 'offline', access_permissions = 0 WHERE io_device_id = 2;

-- 28. Testing for transaction devices table 
DELETE FROM transaction_devices WHERE transaction_device_id = 3; 
UPDATE transaction_devices SET status = 'offline', access_permissions = 0 WHERE transaction_device_id = 2;

-- 29. Testing for iot context aware sensors table
DELETE FROM iot_contextaware_sensors WHERE context_sensor_id = 2; 
UPDATE iot_contextaware_sensors SET status = 'offline', has_malfunction = 1 WHERE context_sensor_id = 1;

-- 30. Testing for iot temperature sensors table 
DELETE FROM iot_temperature_sensors WHERE temp_sensor_id = 2; 
UPDATE iot_temperature_sensors SET status = 'offline', has_malfunction = 1 WHERE temp_sensor_id = 1;

-- 31. Testing for cameras table
INSERT INTO cameras (status, has_malfunction, security_device_id) VALUES ('offline', 1, 6);
DELETE FROM cameras WHERE camera_id = 3; 
UPDATE cameras SET status = 'offline', has_malfunction = 1 WHERE camera_id = 2;

-- 32. Testing for card reader devices table 
INSERT INTO card_reader_devices (status, has_malfunction, auth_device_id) VALUES ('offline', 1, 4);
DELETE FROM card_reader_devices WHERE card_reader_id = 4; 
UPDATE card_reader_devices SET status = 'offline', has_malfunction = 1 WHERE card_reader_id = 1; 

-- 33. Testing for fingerprint scanners table 
DELETE FROM fingerprint_scanners WHERE scanner_id = 2; 
UPDATE fingerprint_scanners SET status = 'offline', has_malfunction = 1 WHERE scanner_id = 1; 

-- 34. Testing for ada headphone jacks table 
DELETE FROM ada_headphone_jacks WHERE ada_jack_id = 2; 
UPDATE ada_headphone_jacks SET status = 'offline', has_malfunction = 1 WHERE ada_jack_id = 1; 

-- 35. Testing for speakers table 
DELETE FROM speakers WHERE speaker_id = 2; 
UPDATE speakers SET status = 'offline', has_malfunction = 1 WHERE speaker_id = 1;  

-- 36. Testing for atm displays table
INSERT INTO atm_displays (status, has_malfunction, io_device_id) VALUES ('offline', 1, 6);
DELETE FROM atm_displays WHERE display_id = 3; 
UPDATE atm_displays SET status = 'offline', has_malfunction = 1 WHERE display_id = 2;

-- 37. Testing for keypads table 
DELETE FROM keypads WHERE keypad_id = 2; 
UPDATE keypads SET status = 'offline', has_malfunction = 1 WHERE keypad_id = 1;

-- 38. Testing for cash dispensers table 
DELETE FROM cash_dispensers WHERE dispenser_id = 2; 
UPDATE cash_dispensers SET status = 'offline', has_malfunction = 1 WHERE dispenser_id = 1;

-- 39. Testing for deposit check slots table 
DELETE FROM deposit_check_slots WHERE deposit_slot_id = 2; 
UPDATE deposit_check_slots SET status = 'offline', has_malfunction = 1 WHERE deposit_slot_id = 1;

-- 40. Testing for receipt printers table 
INSERT INTO receipt_printers (paper_qty, ink_cartridge_qty, status, has_malfunction, transaction_device_id) VALUES (1, 1, 'offline', 1, 6);
DELETE FROM receipt_printers WHERE printer_id = 3;
UPDATE receipt_printers SET status = 'offline', has_malfunction = 1 WHERE printer_id = 2;

-- 41. Testing for receipt roll paper table
DELETE FROM receipt_roll_paper WHERE roll_paper_id = 2;
UPDATE receipt_roll_paper SET length = 5 WHERE roll_paper_id = 1;

-- 42. Testing for ink cartridges table 
DELETE FROM ink_cartridges WHERE cartridge_id = 2;
UPDATE ink_cartridges SET manufacturer = 'Canon', color = 'multicolored' WHERE cartridge_id = 1;

-- 43. Testing for kubeCDNs table 
DELETE FROM kubeCDNs WHERE cdn_id = 5;
UPDATE kubeCDNs SET cdn_description = 'CDN has ceased to operate, seems it no longer exists' WHERE cdn_id = 1;

-- 44. Testing for security media content table 
DELETE FROM security_media_content WHERE media_content_id = 3;
UPDATE security_media_content SET content_type = 'camera', access_permissions = 1 WHERE cdn_id = 1;

-- 45. Testing for context aware sensor data table 
DELETE FROM context_aware_sensor_data WHERE context_data_id = 5;
UPDATE context_aware_sensor_data SET atm_violation_status = 1, description = 'contextaware sensor had a malfunction' WHERE context_data_id = 1;

-- 46. Testing for temperature sensor data table 
DELETE FROM temperature_sensor_data WHERE temp_data_id = 5;
UPDATE temperature_sensor_data SET internal_error_status = 1, description = 'temperature sensor had a malfunction' WHERE temp_data_id = 1;

-- 47. Testing for camera footage table 
INSERT INTO camera_footage (created_at, ended_at, duration, camera_id, media_content_id) VALUES (now(), now(), 24, 2, 15);
DELETE FROM camera_footage WHERE footage_id = 5;
UPDATE camera_footage SET duration = 5, ended_at = '2021-10-25 11:00:00' WHERE footage_id = 4;

-- 48. Testing for sessions table 
DELETE FROM sessions WHERE session_id = 4;
UPDATE sessions SET session_data = 'store this variable for later' WHERE session_id = 1;

-- 49. Testing for atm admins table 
INSERT INTO atm_admins (access_code, access_permissions, user_auth_token) VALUES (12345, 1, 'xa4D0-F^GNM-1cDI19-Vf|wb}RjNKNGgid3Jj|rr~8DiiRL`#kzLxC@giIPPlLak');
DELETE FROM atm_admins WHERE admin_id = 4;
UPDATE atm_admins SET access_code = 123, access_permissions = 0 WHERE admin_id = 3;

-- 50. Testing for atm maintenance table 
DELETE FROM atm_maintenance WHERE tid = 4; 
-- UPDATE atm_maintenance SET admin_id = null WHERE tid = 3;
-- Error Code: 1048. Column 'admin_id' cannot be null

UPDATE atm_maintenance SET admin_id = null WHERE tid = 3; 

-- 51. Testing for transaction actions table 
DELETE FROM transaction_actions WHERE transaction_action_id = 4; 
UPDATE transaction_actions SET is_verified = 0, fee = 5 WHERE transaction_action_id = 3; 

-- 52. Testing for atm transaction info table 
DELETE FROM atm_transaction_info WHERE atm_transaction_info_id = 4; 
UPDATE atm_transaction_info SET portfolio_id = null WHERE atm_transaction_info_id = 3; 

-- 53. Testing for crypto permissions table 
DELETE FROM crypto_permissions WHERE crypto_permissions_id = 4; 
UPDATE crypto_permissions SET crypto_account_id = null WHERE crypto_permissions_id = 3; 

-- 54. Testing for checking accounts table 
DELETE FROM checking_accounts WHERE checking_account_id = 3; 
UPDATE checking_accounts SET balance = 100, access_permissions = 0 WHERE checking_account_id = 2; 

-- 55. Testing for savings accounts table 
DELETE FROM savings_accounts WHERE savings_account_id = 3; 
UPDATE savings_accounts SET balance = 100, access_permissions = 0 WHERE savings_account_id = 2; 

-- 56. Testing for checking bank permissions table 
-- INSERT INTO checking_bank_permissions (transaction_action_id, checking_account_id) VALUES (11, 3);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`csc675db`.`checking_bank_permissions`, CONSTRAINT `fk_permissions_checking_account_id` FOREIGN KEY (`checking_account_id`) REFERENCES `checking_accounts` (`checking_account_id`) ON DELETE CAS)

INSERT INTO checking_bank_permissions (transaction_action_id, checking_account_id) VALUES (12, 1);
DELETE FROM checking_bank_permissions WHERE checking_bank_permissions_id = 2;
UPDATE checking_bank_permissions SET checking_account_id = null WHERE checking_bank_permissions_id = 1;

-- 57. Testing for savings bank permissions table 
INSERT INTO savings_bank_permissions (transaction_action_id, savings_account_id) VALUES (12, 1);
DELETE FROM savings_bank_permissions WHERE savings_bank_permissions_id = 2;
UPDATE savings_bank_permissions SET savings_account_id = null WHERE savings_bank_permissions_id = 1;

-- 58. Testing for account notifications table 
DELETE FROM account_notifications WHERE notification_id = 7;
UPDATE account_notifications SET message = 'null message' WHERE notification_id = 6;

-- 59. Testing for fraud claims table 
DELETE FROM fraud_claims WHERE claim_id = 5;
UPDATE fraud_claims SET description = 'claim has been settled', resolved_at = now() WHERE claim_id = 4;