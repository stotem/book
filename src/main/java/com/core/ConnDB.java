package com.core;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class ConnDB {
    public Connection conn = null;
    public ResultSet rs = null;
    public PreparedStatement stmt = null;
    /*private String proxool = "org.logicalcobwebs.proxool.ProxoolDriver";
    private String poolname = "proxool.library";*/
    private static String driverClass = null;
    private static String url = null;
    private static String userName = null;
    private static String password = null;

    static {
        // 加载配置
        Properties databaseConfig = new Properties();
        InputStream inputStream = null;
        try {
            inputStream = ConnDB.class.getResourceAsStream("/Database.properties");
            databaseConfig.load(inputStream);
            driverClass = databaseConfig.getProperty("database.driverclass");
            url = databaseConfig.getProperty("database.url");
            userName = databaseConfig.getProperty("database.username");
            password = databaseConfig.getProperty("database.password");
        } catch (IOException e) {
            e.printStackTrace();
            System.exit(0);
        } finally {
            try {
                inputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        try {
            Class.forName(driverClass);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
    //˵˴Ҫweb.xmlļ
    public ConnDB() {   //췽
    }

    public Connection getConnection() {
        try {
            conn = DriverManager.getConnection(url, userName, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }//쳣
        return conn;//Ҫ󷵻ظConnection
    }

    /*
 *ܣִв
 */
    public ResultSet executeQuery(String sql,Object...args) {
        try {
            conn = getConnection();
            stmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            for (int i = 0; i < args.length; i++) {
                stmt.setObject(i+1, args[i]);
            }
            rs = stmt.executeQuery();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return rs;
    }

    /*
     *:ִи²
     */
    public int executeUpdate(String sql,Object...args) {
        int result = 0;
        try {
            conn = getConnection();
            stmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            for (int i = 0; i < args.length; i++) {
                stmt.setObject(i+1, args[i]);
            }
            result = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
            result = 0;
        }
        try {
            stmt.close();
        } catch (SQLException ex1) {
        }
        return result;
    }

    /*
     *:رݿ
     */
    public void close() {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
        try {
            if (stmt != null) {
                stmt.close();
            }
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
    }
}
