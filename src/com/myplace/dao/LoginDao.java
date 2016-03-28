package com.myplace.dao;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class LoginDao {
	
	private static String url = "jdbc:mysql://localhost:3307/";
	private static String dbName = "myplace_data";
	private static String driver = "com.mysql.jdbc.Driver";
	private static String userName = "root";
	private static String password = "Woodpecker99";
    
	public static boolean validate(String name, String pass) {        
        boolean status = false;
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        
        try {
            Class.forName(driver).newInstance();
            conn = (Connection) DriverManager.getConnection(url + dbName, userName, password);

            pst = (PreparedStatement) conn.prepareStatement("select * from user where Email=? and Password=?");
            pst.setString(1, name);
            pst.setString(2, pass);

            rs = pst.executeQuery();
            status = rs.next();

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return status;
    }
	
	public static int getID(String name){
		int ID = 0;
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        
		try {
            Class.forName(driver).newInstance();
            conn = (Connection) DriverManager.getConnection(url + dbName, userName, password);

            pst = (PreparedStatement) conn.prepareStatement("select * from user where Email=?");
            pst.setString(1, name);

            rs = pst.executeQuery();
            rs.next();
            ID = rs.getInt("ID");

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return ID;

	}

}
