function connectToDatabase(config) {
  var db = java.sql.DriverManager.getConnection(config.url, config.username, config.password);
  return db;
}

function executeQuery(db, query) {
  var stmt = db.createStatement();
  var rs = stmt.executeQuery(query);
  var result = [];
  while (rs.next()) {
    var row = {};
    var metaData = rs.getMetaData();
    for (var i = 1; i <= metaData.getColumnCount(); i++) {
      row[metaData.getColumnName(i)] = rs.getObject(i);
    }
    result.push(row);
  }
  rs.close();
  stmt.close();
  return result;
}

function closeConnection(db) {
  db.close();
}

function readRows(query) {
  var config = {
    url: 'jdbc:sqlserver://qnm0114ac:1433;databaseName=master;integratedSecurity=false;',
    username: 'SAFEWAY01/descartes',
    password: 'access2desc@rtes'
  };
  var db = connectToDatabase(config);
  var result = executeQuery(db, query);
  closeConnection(db);
  return result;
}