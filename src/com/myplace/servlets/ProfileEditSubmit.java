package com.myplace.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class ProfileEditSubmit extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2883674628635717338L;
	private static String url = "jdbc:mysql://localhost:3307/";
	private static String dbName = "myplace_data";
	private static String driver = "com.mysql.jdbc.Driver";
	private static String userName = "root";
	private static String password = "Woodpecker99";
	
	public ProfileEditSubmit(){
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String ID, usrPass, firstName, lastName, email, facebookID, twitterID;
		
		// Collect POST data
		ID			= request.getParameter("ID");
		firstName 	= request.getParameter("fn");
		lastName  	= request.getParameter("ln");
		email		= request.getParameter("email");
		facebookID	= request.getParameter("fbID");
		twitterID	= request.getParameter("twID");
		usrPass		= request.getParameter("passChange");
		boolean	passChanged = false;
		
        Connection conn = null;
        PreparedStatement pst = null;
        
        try {
        	
			Class.forName(driver).newInstance();
			conn = (Connection) DriverManager.getConnection(url + dbName, userName, password);
			
			String query = "UPDATE User SET "
					+ "FirstName = ?, " 
					+ "LastName = ?, "
					+ "Email = ?, "
					+ "FacebookID = ?, "
					+ "TwitterID = ?";
			
			// Check if new password was submitted and prepare query to update row
			if (usrPass != null || usrPass != ""){
				query += ", Password = ?";
				passChanged = true;
			}
			
			query += " WHERE ID = ?";
			
			pst = (PreparedStatement) conn.prepareStatement(query);
			pst.setString(1, firstName);
			pst.setString(2, lastName);
			pst.setString(3, email);
			pst.setString(4, facebookID);
			pst.setString(5, twitterID);
			if (passChanged) {
				pst.setString(6, usrPass);
				pst.setString(7, ID);
			}
			else {
				pst.setString(6, ID);
			}
			
			// Run UPDATE on database
			pst.executeUpdate();
			
			// Close connection and redirect user back to profile page
			conn.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        if (ID == null) {
			request.getRequestDispatcher("User/profile.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("User/profile.jsp?ID=" + ID).forward(request, response);
		}
        
	}
}
