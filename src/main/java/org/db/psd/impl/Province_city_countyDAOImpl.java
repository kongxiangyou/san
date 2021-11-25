package org.db.psd.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.db.psd.base.Execute_CRUD;
import org.db.psd.dao.Province_city_countyDAO;
import org.db.psd.model.province_city_county;

public class Province_city_countyDAOImpl extends Execute_CRUD implements Province_city_countyDAO {

	@Override
	public List<province_city_county> select() {
		 String sql ="select * from province_city_county";
		 ResultSet rs = execute_Query(sql, null);
		 List<province_city_county> pccList = new ArrayList<province_city_county>();
		 province_city_county pcc = null;
		 try {
			while(rs.next()) {
				 int id = rs.getInt("id");
				  String name = rs.getString("name");
				   int pid = rs.getInt("pid");
				   int type = rs.getInt("type");
				   String code= rs.getString("code");
				   String status= rs.getString("status");
				   int create_time  = rs.getInt("create_time");
				   int update_time = rs.getInt("update_time");
				   pcc = new province_city_county(id, name, pid, type, code, status, create_time, update_time);
				   pccList.add(pcc);
			 }
		} catch (SQLException e) { 
			e.printStackTrace();
		}
		return pccList;
	}

}
