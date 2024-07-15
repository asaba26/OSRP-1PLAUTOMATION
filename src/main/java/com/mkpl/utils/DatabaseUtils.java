package com.mkpl.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DatabaseUtils {

    public static Connection connectToDatabase(String url, String username, String password) throws Exception {
        Connection db = DriverManager.getConnection(url, username, password);
        return db;
    }

    public static List<Map<String, Object>> executeQuery(Connection db, String query) throws Exception {
        Statement stmt = db.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        List<Map<String, Object>> result = new ArrayList<>();
        while (rs.next()) {
            Map<String, Object> row = new HashMap<>();
            int columnCount = rs.getMetaData().getColumnCount();
            for (int i = 1; i <= columnCount; i++) {
                row.put(rs.getMetaData().getColumnName(i), rs.getObject(i));
            }
            result.add(row);
        }
        rs.close();
        stmt.close();
        return result;
    }

    public static void closeConnection(Connection db) throws Exception {
        db.close();
    }

    public static List<Map<String, Object>> readRows(String query) throws Exception {
        String url = "jdbc:sqlserver://172.26.220.27:1433;instance=MSSQLSERVER;databaseName=RP_Configs;";
        String username = "RP_ETL_usr";
        String password = "access@1sfwynp";
        Connection db = connectToDatabase(url, username, password);
        List<Map<String, Object>> result = executeQuery(db, query);
        closeConnection(db);
        return result;
    }

    public static void main(String[] args) {
        try {
            List<Map<String, Object>> result = readRows("SELECT * FROM sys.databases");
            System.out.println(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
