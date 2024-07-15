Feature: mssql query test

Background: testing
 # * def config = { username: 'SAFEWAY01/descartes', password: 'access2desc@rtes', url: 'jdbc:sqlserver:qnm0114ac;databaseName=master;user=%s;password=%s;integratedSecurity=true', driverClassName: 'com.microsoft.sqlserver.jdbc.SQLServerDriver' }

@db
Scenario: query mssql using jdbc shims
  #* def MSSqlUtil = Java.type('com.mkpl.utils.MSSqlUtil')
  * def dbUtils = Java.type('com.mkpl.utils.DatabaseUtils')
 # * def db = new MSSqlUtil(config)
  * def query = "SELECT TOP (3) OrderNumber, Id FROM [dbo].[Order] WHERE CustomerId = 79"
  * def queryResult = dbUtils.readRows(query)
  * print queryResult
  #* match queryResult[0] == {OrderNumber: '542379', Id: 2}
  #* match queryResult contains {OrderNumber: '542379', Id: 2}
  * karate.log("\nqueryResult:\n" + queryResult + "\n")