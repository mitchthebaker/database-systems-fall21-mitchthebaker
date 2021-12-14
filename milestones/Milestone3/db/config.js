let config = {};

config.database = {};
config.database.host = process.env["DATABASE_HOST"] || 'localhost';
config.database.user = process.env["DATABASE_USER"] || 'user'; 
config.database.password = process.env["DATABASE_PASSWORD"] || 'secret';
config.database.name = process.env["DATABASE_NAME"] || 'mysql';

module.exports = config;