package org.db.psd.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.db.psd.base.Execute_CRUD;
import org.db.psd.dao.SplitDAO;

 

public class SplitDAOImpl extends  Execute_CRUD implements SplitDAO {

	@Override
	public long allPages(long rows, int size) {
		long value = rows % size;
		long num = 0;
		if(value != 0) {
			num = (rows /  size) + 1;
		}else{
			num = rows /  size ;
		}
		return num;
	}

	@Override
	public long currentRows(int nowpage, int size) {
		int num = (nowpage - 1) * size ;
		return num;
	}

	@Override
	public long allRows() {
		String sql = "select count(*) from employee";
		ResultSet rs =  execute_Query(sql, null);
		long i = 0 ;
		try {
			if(rs.next()) {
				i = rs.getLong(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			 closeRs(rs);
		}
		
		return i;
	}

}
