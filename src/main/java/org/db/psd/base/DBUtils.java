 package org.db.psd.base;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

public class DBUtils {

	private static final String driver = "com.mysql.cj.jdbc.Driver";
	private static final String url = "jdbc:mysql://localhost:3307/abc?useSSL=false&serverTimezone=UTC&nullCatalogMeansCurrent=true";
	private static final String username = "root";
	private static final String password = "root";
	private static Connection con = null;
	private static LinkedList<Connection> pools = new LinkedList<Connection>();

	public DBUtils() {
	}

	static {
		try {

			Class.forName(driver);
			
			for(int i = 0 ; i < 5 ;i++) {
				
				con = getConnection();
			
				pools.addLast(con);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	
	public static Connection getConnection() {
		Connection connection = null;
	
		try {
			connection = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			System.out.println("创建失败");
			e.printStackTrace();
		}
		return connection;
	}
	
	
	public static Connection  getPoolConnection() {
		Connection con = pools.removeFirst();
		return con;
	}

	
	public static void close(ResultSet rs, Statement stmt, Connection con) {

		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
					stmt = null;
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				
					if (con != null) {
						
						pools.addLast(con);
					}
				
			}
		}

	}

	public static void main(String[] args) {
		 
//		DBUtils db = new DBUtils();
//		Connection com= DBUtils.getPoolConnection();
//		System.out.println(com);
	}
}
