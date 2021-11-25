package org.db.psd.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.db.psd.base.Execute_CRUD;
import org.db.psd.dao.EmployeeJobDAO;
import org.db.psd.model.EmployeeJob;

public class EmployeeJobDAOImplement extends Execute_CRUD implements EmployeeJobDAO {

	@Override
	public int jobCreate(EmployeeJob employeeJob) {
		String sql = "insert into employeeJob (employeeJobName,employeeDescribe) value(?,?)";
		// int employeeJobId = employeeJob.getEmployeeJobId();
		String employeeJobName = employeeJob.getEmployeeJobName();// 超级管理员：1，采购员：2，仓库员：3，销售员：4
		String employeeDescribe = employeeJob.getEmployeeDescribe();
		Object[] object = { employeeJobName, employeeDescribe };
		int b = execute_C_Key(sql, object);
		return b;
	}

	@Override
	public boolean jobUpdate(EmployeeJob employeeJob) {
		String sql = "update employeeJob set employeeJobName=?,employeeDescribe=? where employeeJobId=?";
		int employeeJobId = employeeJob.getEmployeeJobId();
		String employeeJobName = employeeJob.getEmployeeJobName();// 超级管理员：1，采购员：2，仓库员：3，销售员：4
		String employeeDescribe = employeeJob.getEmployeeDescribe();
		Object[] object = { employeeJobName, employeeDescribe, employeeJobId };
		boolean b = execute_CUD(sql, object);
		return b;
	}

	@Override
	public EmployeeJob jobSelect(int employeeJobId) {
		String sql ="select * from employeeJob where employeeJobId =?";
		Object[]object= {employeeJobId};
		ResultSet rs = execute_Query(sql, object);
		EmployeeJob employeeJob =null;
		try {
			if(rs.next()) {
				String employeeJobName = rs.getString("employeeJobName");// 超级管理员：1，采购员：2，仓库员：3，销售员：4
				String employeeDescribe = rs.getString("employeeDescribe");
				employeeJob = new EmployeeJob(employeeJobId, employeeJobName, employeeDescribe);
			}
		} catch (SQLException e) { 
			e.printStackTrace();
		}finally {
			closeRs(rs);
		}
		return employeeJob;
	}

	@Override
	public List<EmployeeJob> employeeJobList() {
		String sql ="select distinct employeeJobName from employeeJob ";
		
		ResultSet rs = execute_Query(sql, null);
		EmployeeJob employeeJob =null;
		 List<EmployeeJob> employeeJobs = new ArrayList<EmployeeJob>();
		try {
			while(rs.next()) {
			//	int employeeJobId = rs.getInt("employeeJobId");
				String employeeJobName = rs.getString("employeeJobName");// 超级管理员：1，采购员：2，仓库员：3，销售员：4
				//String employeeDescribe = rs.getString("employeeDescribe");
				employeeJob = new EmployeeJob(0, employeeJobName, null);
				employeeJobs.add(employeeJob);
			}
		} catch (SQLException e) { 
			e.printStackTrace();
		}finally {
			closeRs(rs);
		}
		return employeeJobs;
	}
	public static void main(String[] args) {
		EmployeeJobDAOImplement en =new EmployeeJobDAOImplement();
		List<EmployeeJob> es = en.employeeJobList();
		System.out.println(es);
	}
}
