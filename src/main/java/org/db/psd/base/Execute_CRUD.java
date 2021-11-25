package org.db.psd.base;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Execute_CRUD extends DBUtils {
	private static PreparedStatement pstmt = null;
	private static Connection con = null;

	
	/**
	 * insert update delete
	 * @param sql
	 * @param objects
	 * @return
	 */
	public boolean execute_CUD(String sql, Object[] objects) {
		boolean b = false;

		con = getPoolConnection();
		try {
			pstmt = con.prepareStatement(sql);
			
			if (objects != null) {
				for (int i = 0; i < objects.length; i++) {
					pstmt.setObject(i + 1, objects[i]);
				}
			}

			int row = pstmt.executeUpdate();
			if (row > 0) {
				b = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}

		return b;

	}
	
	public int execute_C_Key(String sql, Object[] objects) {

		con = getPoolConnection();
		ResultSet rs = null;
		int id = 0;
		try {
			//Statement.RETURN_GENERATED_KEYS 在插入数据的的同时会返回改插入语句的主键
			pstmt = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			
			if (objects != null) {
				for (int i = 0; i < objects.length; i++) {
					pstmt.setObject(i + 1, objects[i]);
				}
			}

			int row = pstmt.executeUpdate();
			
			//取出主键
			if (row > 0) {
				// 获取数据集，该数据集只包含主键值
				rs = pstmt.getGeneratedKeys();
				if(rs.next()) { 
					//通过位置的方式获取主键值
					id = rs.getInt(1);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}

		return id;

	}


	public ResultSet execute_Query(String sql, Object[] objects) {
		ResultSet rs = null;
		con = getPoolConnection();
		try {
			pstmt = con.prepareStatement(sql);
			if (objects != null) {
				for (int i = 0; i < objects.length; i++) {
					pstmt.setObject(i + 1, objects[i]);
				}
			}

			rs = pstmt.executeQuery();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	public void closeRs(ResultSet rs) {
		close(rs, pstmt, con);
	}
}
