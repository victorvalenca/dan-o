package com.myplace.dao;

import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class EventListDAO {
	
	
	// SQL prerequisites
	private static final String url = "jdbc:mysql://localhost:3307/";
	private static final String dbName = "myplace_data";
	private static final String user = "root";
	private static final String password = "Woodpecker99";
	
	// retrieve page parameter from URL, if exists
	private static int pageNum = 1;	
	
	// minimum and maximum values for page indexing
 	private static int indexMin = 1;
	private static int indexMax = 9;
	
	// index of page values relevant to pagination 
	private static  int[] pageFrame = {0,0,0,0,0};
	
	// total number of items on database table
	private static int dbSize = 0;
	
	// The maximum number of pages for the datasheet to hold
	private static int dbMaxPage = 1;
	
	// ERROR TAG
	public static final int ERR = -1;
	
	public static void setNewPage(int newPageNum) {
		
		pageNum = newPageNum;
		
		indexMin = (pageNum - 1) * 9;
	 	indexMin += 1;
		indexMax = indexMin + 9;
	}
	
	public static void setDatabaseSize() {
		
		//SQL prerequisites
     	Connection cn = null;
     	Statement st = null;
     	ResultSet rs = null;
     
      	// request the number of values from database
      	try {
			//SQL parameters
	      	String sqlStat = "SELECT count(*) from Event";
	        
	        // attempt to establish connection
      		cn = DriverManager.getConnection(url + dbName, user, password);
      		st = cn.createStatement();
      		rs = st.executeQuery(sqlStat);

      		// retrieve value
      		dbSize = rs.next() ? rs.getInt(1) : ERR;
                
        }
      	catch (Exception e) {dbSize = ERR;}
      	finally {
  	        // closure of SQL connection
            try {
                if (rs != null) rs.close();
                if (st != null)  st.close();
                if (cn != null) cn.close();
        	} 
        	catch (SQLException se) {}
      	}
	}
	
	public static void setPageButtons() {
		
		int pageNumTmp = pageNum - 2;
		pageFrame[0] = isAtStart(pageNumTmp) ? ERR : pageNumTmp;
		pageNumTmp++;
		pageFrame[1] = isAtStart(pageNumTmp) ? ERR : pageNumTmp;
		pageNumTmp++;
		pageFrame[2] = pageNum;
		pageNumTmp++;
		pageFrame[3] = isAtEnd(pageNumTmp) ? ERR : pageNumTmp;
		pageNumTmp++;
		pageFrame[4] = isAtEnd(pageNumTmp) ? ERR : pageNumTmp;
	}
	
	public static void setMaxPage() {

		// the page limit of the pagination menu
		dbMaxPage = dbSize / 9;
      	
      	// add an extra page for potential leftovers
		dbMaxPage += dbSize %9 != 0 ? 1 : 0;
	}
	
	public static boolean isAtStart(int page) {return page < 1;}
	
	public static boolean isAtEnd(int page) {return page > dbMaxPage;}
	
	public static int getPage() {return pageNum;}
	public static int getMaximumIndex() {return indexMax;}
	public static int getMinimunIndex() {return indexMin;}
	public static int getDatabaseSize() {return dbSize;}
	public static int getMaxPage() {return dbMaxPage;}
	public static int[] getPageButtons() { return pageFrame;}
}
