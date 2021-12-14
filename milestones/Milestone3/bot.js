const { Client, Intents } = require("discord.js");
const token = process.env["DISCORD_TOKEN"];
const db = require("./db/db.js");
const typeHandlers = require("./utils/typeHandlers.js");

const AsciiTable = require("ascii-table");

const client = new Client({
  intents: [Intents.FLAGS.GUILDS, Intents.FLAGS.GUILD_MESSAGES]
});

client.on("ready", async () => {
  console.log(`Logged in as ${client.user.tag}!`);
});

client.on("messageCreate", async (msg) => {

  const tokens = msg.content.match(/\S+/g);
  const command = (tokens[0].charAt(0).match(/\//ig)) ? tokens[0] : null;
  const args = (tokens.length > 1 && command) ? tokens.filter(token => !(token.includes(command))) : [];

  if(msg.author === client.user || !command)
    return // message was sent by the bot, or no command specified
  
  switch(command) {
    case "/get-all-users":
      const users = await db.getAllUsers();
      const table = new AsciiTable("All Users");
            table.setHeading("user_id", "full_name", "first_name", "last_name");

      if(!Object.keys(users).length) {
        return msg.channel.send("No data found which corresponds to query");
      }
      else {
        users.forEach(user => {
          table.addRow(user.user_id, user.full_name, user.first_name, user.last_name);
        });

        if(table.toString().length > 2000) 
          return msg.channel.send("Request was too large, please specify more specific arguments");
        else
          return msg.channel.send("`" + table.toString() + "`");
      }

    // bot command #1
    case "/get-crypto-accounts":
      if(args[0] && args[1] && args[2]) {

        if(typeHandlers.isNumeric(args[0])) {
          return msg.channel.send(
            "Please make sure the value you pass in for <currency> is of type string"
          );
        }

        if(typeHandlers.isNumeric(args[1])) {
          return msg.channel.send(
            "Please make sure the value you pass in for <lending protocol> is of type string"
          );
        }

        if(!(typeHandlers.isNumeric(args[2]))) {
          return msg.channel.send(
            "Please make sure the value you pass in for <minimum loan amount> is of type integer"
          );
        }

        const cryptoAccounts = await db.getCryptoAccounts(args[0], args[1], args[2]);
        const table = new AsciiTable("Crypto Accounts");
              table.setHeading("user_id", "crypto_acct_id", "asset", "lending_protocol", "loan_amount");

        if(!Object.keys(cryptoAccounts).length) {
          return msg.channel.send("No data found which corresponds to query, please try again with different arguments");
        }
        else {
          cryptoAccounts.forEach(account => {
            table.addRow(account.user_id, account.crypto_account_id, account.asset_type, account.provider_name, account.total_amount);
          });

          if(table.toString().length > 2000) 
            return msg.channel.send("Request was too large, please specify more specific arguments");
          else
            return msg.channel.send("`" + table.toString() + "`");
        }
      }
      else {
        return msg.channel.send(
          "Incorrect number of arguments passed. \n\nCorrect usage would be:\n /get-crypto-accounts <currency> <lending protocol> <minimum loan amount>"
        );
      }
    
    // bot command #2
    case "/get-crypto-loans":
      if(args[0] && args[1] && args[2]) {

        if(typeHandlers.isNumeric(args[0])) {
          return msg.channel.send(
            "Please make sure the value you pass in for <interest rate> is of type string with the format <interest rate>%"
          );
        }

        if(!(typeHandlers.isNumeric(args[1]))) {
          return msg.channel.send(
            "Please make sure the value you pass in for <reward amount> is of type integer"
          );
        }

        if(!(typeHandlers.isNumeric(args[2]))) {
          return msg.channel.send(
            "Please make sure the value you pass in for <days> is of type integer"
          );
        }

        const cryptoLoans = await db.getCryptoLoans(args[0], args[1], args[2]);
        const table = new AsciiTable("Crypto Loans");
              table.setHeading("user_id", "full_name", "asset", "loan_amount", "interest_rate", "reward", "days_active");
        
        if(!Object.keys(cryptoLoans).length) {
          return msg.channel.send("No data found which corresponds to query, please try again with different arguments");
        }
        else {
          cryptoLoans.forEach(loan => {
            table.addRow(loan.user_id, loan.full_name, loan.asset_type, loan.total_amount, loan.interest_rate, loan.reward, loan.days_active);
          });

          if(table.toString().length > 2000) 
            return msg.channel.send("Request was too large, please specify more specific arguments");
          else
            return msg.channel.send("`" + table.toString() + "`");
        }
      } 
      else {
        return msg.channel.send(
          "Incorrect number of arguments passed. \n\nCorrect usage would be:\n /get-crypto-loans <minimum interest rate> <reward amount> <duration of loan in days>"
        );
      }
    
    // bot command #3
    case "/failed-atm-transactions":
      if(args[0] && args[1]) {
        if(typeHandlers.isNumeric(args[0])) {
          return msg.channel.send(
            "Please make sure the value you pass in for <transaction type> is of type string"
          );
        }

        if(typeHandlers.isNumeric(args[1])) {
          return msg.channel.send(
            "Please make sure the value you pass in for <bank account type> is of type string"
          );
        }

        const failedAtmTransactions = await db.failedAtmTransactions(args[0], args[1]);
        const table = new AsciiTable("Failed ATM Transactions");
              table.setHeading("user_id", "full_name", "transaction_type", "account_type", "failed_transactions");

        if(!Object.keys(failedAtmTransactions).length) {
          return msg.channel.send("No data found which corresponds to query, please try again with different arguments");
        }
        else {
          failedAtmTransactions.forEach(transaction => {
            table.addRow(transaction.user_id, transaction.full_name, transaction.transaction_type, transaction.account_type, transaction.failed_transactions);
          });

          if(table.toString().length > 2000) 
            return msg.channel.send("Request was too large, please specify more specific arguments");
          else
            return msg.channel.send("`" + table.toString() + "`");
        }
      }
      else {
        return msg.channel.send(
          "Incorrect number of arguments passed. \n\nCorrect usage would be:\n /failed-atm-transactions <transaction type> <bank account type>"
        );
      }
    
    // bot command #4
    case "/get-atm-accounts":
      if(args[0] && args[1] && args[2]) {
        if(typeHandlers.isNumeric(args[0])) {
          return msg.channel.send(
            "Please make sure the value you pass in for <bank> is of type string"
          );
        }

        if(!(typeHandlers.isNumeric(args[1]))) {
          return msg.channel.send(
            "Please make sure the value you pass in for <minimum transaction #> is of type integer"
          );
        }

        if(!(typeHandlers.isNumeric(args[2]))) {
          return msg.channel.send(
            "Please make sure the value you pass in for <minimum transfer amount> is of type integer"
          );
        }

        const atmAccounts = await db.getAtmAccounts(args[0], args[1], args[2]);
        const table = new AsciiTable("ATM Accounts");
              table.setHeading("atm_account_id", "full_name", "bank", "total_transactions", "total_transfer_amount");

        if(!Object.keys(atmAccounts).length) {
          return msg.channel.send("No data found which corresponds to query, please try again with different arguments");
        }
        else {
          atmAccounts.forEach(account => {
            table.addRow(account.atm_account_id, account.full_name, account.name, account.total_transactions, account.total_transfer_amount);
          });

          if(table.toString().length > 2000) 
            return msg.channel.send("Request was too large, please specify more specific arguments");
          else
            return msg.channel.send("`" + table.toString() + "`");
        }
      }
      else {
        return msg.channel.send(
          "Incorrect number of arguments passed. \n\nCorrect usage would be:\n/get-atm-accounts <bank> <minimum transaction #> <minimum transfer amount>"
        );
      }
    
    // bot command #5
    case "/security-content-status":
      if(args[0] && args[1] && args[2]) {
        if(typeHandlers.isNumeric(args[0])) {
          return msg.channel.send(
            "Please make sure the value you pass in for <country> is of type string"
          );
        }

        if(typeHandlers.isNumeric(args[1])) {
          return msg.channel.send(
            "Please make sure the value you pass in for <security device type> is of type string"
          );
        }

        if(typeHandlers.isNumeric(args[2])) {
          return msg.channel.send(
            "Please make sure the value you pass in for <status> is of type string "
          );
        }

        const securityContentStatus = await db.securityContentStatus(args[0], args[1], args[2]);
        const table = new AsciiTable("Security Content Status");
              table.setHeading("atm_tid", "country", "security_content_total");

        if(!Object.keys(securityContentStatus).length) {
          return msg.channel.send("No data found which corresponds to query, please try again with different arguments");
        }
        else {
          securityContentStatus.forEach(content => {
            table.addRow(content.tid, content.country, content.security_content_total);
          });

          if(table.toString().length > 2000) 
            return msg.channel.send("Request was too large, please specify more specific arguments");
          else
            return msg.channel.send("`" + table.toString() + "`");
        }
      }
      else {
        return msg.channel.send(
          "Incorrect number of arguments pased. \n\nCorrect usage would be:\n/security-content-status <country> <security device type> <status>"
        );
      }
    
    // bot command #6
    case "/crypto-exchange-account-info":
      if(args[0] && args[1] && args[2] && args[3]) {
        if(typeHandlers.isNumeric(args[0])) {
          return msg.channel.send(
            "Please make sure the value you pass in for <crypto exchange> is of type string"
          );
        }

        if(typeHandlers.isNumeric(args[1])) {
          return msg.channel.send(
            "Please make sure the value you pass in for <asset type> is of type string"
          );
        }

        if(!(typeHandlers.isNumeric(args[2]))) {
          return msg.channel.send(
            "Please make sure the value you pass in for <minimum balance> is of type integer"
          );
        }

        if(!(typeHandlers.isNumeric(args[3]))) {
          return msg.channel.send(
            "Please make sure the value you pass in for <minimum # crypto loans> is of type integer"
          );
        }

        const cryptoExchangeAcctInfo = await db.cryptoExchangeAcctInfo(args[0], args[1], args[2], args[3]);
        const table = new AsciiTable("Crypto Exchange Account Info");
              table.setHeading("exchange_id", "lending_protocol", "crypto_account_id", "asset", "crypto_balance", "total_crypto_loans");
        
        if(!Object.keys(cryptoExchangeAcctInfo).length) {
          return msg.channel.send("No data found which corresponds to query, please try again with different arguments");
        }
        else {
          cryptoExchangeAcctInfo.forEach(account => {
            table.addRow(account.exchange_id, account.exchange_provider, account.crypto_account_id, account.asset, account.crypto_balance, account.total_crypto_loans);
          });

          if(table.toString().length > 2000) 
            return msg.channel.send("Request was too large, please specify more specific arguments");
          else
            return msg.channel.send("`" + table.toString() + "`");
        }
      }
      else {
        return msg.channel.send(
          "Incorrect number of arguments passed. \n\nCorrect usage would be:\n/crypto-exchange-account-info <crypto exchange> <asset type> <minimum balance> <minimum # crypto loans>"
        );
      }
    
    // bot command #7
    case "/avg-closing-rate":
      if(args[0] && args[1] && args[2] && args[3]) {
        if(typeHandlers.isNumeric(args[0])) {
          return msg.channel.send(
            "Please make sure the value you pass in for <source currency> is of type string"
          );
        }

        if(typeHandlers.isNumeric(args[1])) {
          return msg.channel.send(
            "Please make sure the value you pass in for <target currency> is of type string"
          );
        }

        if(!(typeHandlers.isNumeric(args[2]))) {
          return msg.channel.send(
            "Please make sure the value you pass in for <start year> is of type integer"
          );
        }

        if(!(typeHandlers.isNumeric(args[3]))) {
          return msg.channel.send(
            "Please make sure the value you pass in for <end year> is of type integer"
          );
        }

        const avgClosingRate = await db.avgClosingRate(args[0], args[1], args[2], args[3]);
        const table = new AsciiTable("Average Closing Rates");
              table.setHeading("user_id", "source_currency", "target_currency", "average_rate");

        if(!Object.keys(avgClosingRate).length) {
          return msg.channel.send("No data found which corresponds to query, please try again with different arguments");
        }
        else {
          avgClosingRate.forEach(rate => {
            table.addRow(rate.user_id, rate.source_currency, rate.target_currency, rate.average_rate);
          });

          if(table.toString().length > 2000) 
            return msg.channel.send("Request was too large, please specify more specific arguments");
          else
            return msg.channel.send("`" + table.toString() + "`");
        }
      }
      else {
        return msg.channel.send(
          "Incorrect number of arguments passed. \n\nCorrect usage would be:\n/avg-closing-rate <source currency> <target currency> <start year> <end year>"
        );
      }
    
    // bot command #8
    case "/user-currency-exchanges":
      if(args[0] && args[1] && args[2]) {
        if(typeHandlers.isNumeric(args[0])) {
          return msg.channel.send(
            "Please make sure the value you pass in for <country> is of type string"
          );
        }

        if(typeHandlers.isNumeric(args[1])) {
          return msg.channel.send(
            "Please make sure the value you pass in for <crypto currency> is of type string"
          );
        }

        if(!(typeHandlers.isNumeric(args[2]))) {
          return msg.channel.send(
            "Please make sure the value you pass in for <quantity> is of type integer"
          );
        }

        const authUserExchanges = await db.authUserExchanges(args[0], args[1], args[2]);
        const table = new AsciiTable("User Currency Exchanges");
              table.setHeading("user_id", "country", "from_currency", "to_currency", "exchange_total");

        if(!Object.keys(authUserExchanges).length) {
          return msg.channel.send("No data found which corresponds to query, please try again with different arguments");
        }
        else {
          authUserExchanges.forEach(authUsers => {
            table.addRow(authUsers.user_id, authUsers.country, authUsers.from_currency, authUsers.to_currency, authUsers.exchange_total);
          });

          if(table.toString().length > 2000) 
            return msg.channel.send("Request was too large, please specify more specific arguments");
          else
            return msg.channel.send("`" + table.toString() + "`");
        }
      }
      else {
        return msg.channel.send(
          "Incorrect number of arguments passed. \n\nCorrect usage would be:\n/user-currency-exchanges <country> <crypto currency> <quantity>"
        );
      }

    default:
      if(msg.content === "milestone3")
        return msg.channel.send("bot is alive");
      
      if(command) 
        return msg.channel.send("The command you specified does not exist, refer to `#commands` for more info.");
  }
});

client.on("guildMemberAdd", member => {
  member.guild.channels.get("channelID").send("Welcome to the server!")
});

client.login(token);