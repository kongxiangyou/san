package org.db.psd.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.db.psd.base.Execute_CRUD;
import org.db.psd.dao.EmployeeDAO;
import org.db.psd.model.Employee;

public class EmployeeDAOImplement extends Execute_CRUD implements EmployeeDAO {

	@Override
	public int employeeLogin(Employee employee) {

		boolean b = false ; 
		EmployeeDAOImplement employeeDAOImplement = new EmployeeDAOImplement();
		
		String employeeCode = employee.getEmployeeCode();
		String employeePassword = employee.getEmployeePassword();
		b=employeeDAOImplement.employeeJudgeState(employeeCode);
		int row = 0;
		ResultSet rs = null;
		String sql = "select * from employee where employeeCode = ?  and employeePassword = ?";
		Object[] objects = { employeeCode, employeePassword };
		if(b) {
				  rs = execute_Query(sql, objects);
				  row= 1;
			try {
				if(rs.next()) {
					int employeeId = rs.getInt("employeeId");
					if(employeeId<=0) {
						System.out.println("用户不存在！");
					}
				}else {
					row=0;
				}
			} catch (SQLException e) { 
				e.printStackTrace();
			}
			closeRs(rs);
		}else {
			System.out.println("该员工已离职！");
		}	
		return row;
	}

	@Override
	public boolean employeeCreate(Employee employee) {
		boolean b = false; 
		EmployeeDAOImplement employeeDAOImplement = new EmployeeDAOImplement();
		
		String employeeCode = employee.getEmployeeCode();
		String employeeName=employee.getEmployeeName();
		String employeePassword = employee.getEmployeePassword();
		String employeeGender = employee.getEmployeeGender();
		String employeePhone = employee.getEmployeePhone();
		String employeeEmail=employee.getEmployeeEmail();
		String employeeBrithday = employee.getemployeeBrithday();
		String employeeIdentity = employee.getEmployeeIdentity();
		String employeeState = employee.getEmployeeState();
		String employeeIntroduction = employee.getEmployeeIntroduction();
		String employeeAddress = employee.getEmployeeAddress();
		String employeeEducation = employee.getEmployeeEducation();
		String pciture = employee.getPciture();
		 int employeeJobId = employee.getEmployeeJobId();
		b=employeeDAOImplement.employeeJudgeByemployeeCode(employeeCode);
		if(b) {
			b=false;
			System.out.println("用户已存在");
		}else {
			String sql = "insert into employee ( employeeCode, employeeName, employeePassword,"
					+ "employeeGender,  employeePhone,  employeeEmail, "
					+ " employeeBrithday,  employeeIdentity,  employeeState,  employeeIntroduction,"
					+ "employeeAddress,  employeeEducation,employeeJobId,pciture) value (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			Object[] objects = {  employeeCode, employeeName, employeePassword,
						employeeGender,  employeePhone,  employeeEmail, 
					 employeeBrithday,  employeeIdentity,  employeeState,  employeeIntroduction,
					 employeeAddress,  employeeEducation,employeeJobId,pciture };
				b = execute_CUD(sql, objects);
				if(b) {
					System.out.println("创建成功");
				}else {
					System.out.println("创建失败");
				}
		}
		return b;
	}

	@Override
	public boolean employeeUpdatePassword(String employeeCode,String employeePassword) {
		String sql = "update employee set employeePassword = ? where employeeCode = ?";
		
		Object[] objects = { employeePassword,employeeCode};
		boolean b = execute_CUD(sql, objects);
		return b;
	}

	@Override
	public boolean employeeUpdateInformation(Employee employee) {
		String sql = "update employee set employeeName =?, "
				+ " employeeGender=?,employeePhone=?,  employeeEmail =?,  employeeBrithday=?, "
				+ " employeeIdentity=?,  employeeState=?,  employeeIntroduction=?,employeeAddress=?,  employeeEducation=? , pciture=?  where employeeCode = ?";
		
		String employeeName = employee.getEmployeeName(); 
		String employeeGender = employee.getEmployeeGender(); 
		String employeePhone = employee.getEmployeePhone();
		String employeeEmail = employee.getEmployeeEmail();
		String employeeBrithday = employee.getemployeeBrithday();
		String employeeIdentity = employee.getEmployeeIdentity();
		String employeeState = employee.getEmployeeState();
		String employeeIntroduction = employee.getEmployeeIntroduction();
		String employeeAddress = employee.getEmployeeAddress();
		String employeeEducation = employee.getEmployeeEducation();
		String pciture = employee.getPciture();
		//int employeeJobId = employee.getEmployeeJobId();
		String employeeCode = employee.getEmployeeCode();
		Object[] objects = { employeeName,employeeGender, employeePhone, employeeEmail,employeeBrithday,employeeIdentity,employeeState,employeeIntroduction,employeeAddress,employeeEducation,
				pciture,employeeCode };
		boolean b = execute_CUD(sql, objects);
		return b;
	}

	@Override
	public Employee employeeById(String employeeCode) {

		String sql = "select e.*,j.employeeJobName,j.employeeDescribe from employee e inner join employeeJob j on e.employeeJobId=j.employeeJobId and e.employeeCode = ? ";
		Object[] objects = { employeeCode };
		 
		ResultSet rs = execute_Query(sql, objects);
		 
		Employee employee = null;
		try {
			if (rs.next()) {
				int employeeId = rs.getInt("employeeId");
				String employeePassword = rs.getString("employeePassword");
				String employeeName = rs.getString("employeeName");
				String employeeGender = rs.getString("employeeGender");
				String employeePhone = rs.getString("employeePhone");
				String employeeEmail = rs.getString("employeeEmail");
				String employeeBrithday = rs.getString("employeeBrithday");
				String employeeIdentity =  rs.getString("employeeIdentity");
				String employeeState =  rs.getString("employeeState");
				String employeeIntroduction =  rs.getString("employeeIntroduction");
				String employeeAddress = rs.getString("employeeAddress");
				String employeeEducation =  rs.getString("employeeEducation");
				int employeeJobId = rs.getInt("employeeJobId");
				String employeeJobName = rs.getString("employeeJobName");// 超级管理员：1，采购员：2，仓库员：3，销售员：4
				String employeeDescribe = rs.getString("employeeDescribe");
				String pciture = rs.getString("pciture");
				 employee = new Employee(employeeId, employeeCode, employeeName, employeePassword,
						 employeeGender, employeePhone, employeeEmail, employeeBrithday,
						 employeeIdentity, employeeState, employeeIntroduction,
						 employeeAddress, employeeEducation, employeeJobId,employeeJobName,employeeDescribe,pciture);	
				  
			}  
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeRs(rs);
		}
		 
		return employee;
	}

 

	@Override
	public List<Employee> showInfermation(long position, int size) {
		String sql = "select * from employee where employeeId>1  limit ?,?";
		
		Object[] object = {position,size};
		ResultSet rs = execute_Query(sql, object);
		List<Employee> employees = new ArrayList<Employee>();

		try {
			while (rs.next()) {
				int employeeId = rs.getInt("employeeId");
				String employeeCode = rs.getString("employeeCode");
				String employeeName = rs.getString("employeeName");
				String employeeGender = rs.getString("employeeGender");
				
				Employee employee = new Employee(employeeId, employeeCode, employeeName, null,
						 employeeGender, null, null, null,
						 null, null, null,
						 null, null, 0,null,null,null);
				employees.add(employee);
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeRs(rs);
		}
		return employees;
	}

	@Override
	public boolean employeeJudgeState(String  employeeCode) {
		boolean b = true;
		String sql = "select employeeState from employee where employeeCode=?";
		Object[] object = {employeeCode};
		ResultSet rs = execute_Query(sql, object);
		try {
			if(rs.next()) {
				String employeeState = rs.getString("employeeState");
				if(employeeState==null) {
					b = true;
				}else if(employeeState.equals("离职")) {
					b = false;
				}
			}
		} catch (SQLException e) { 
			e.printStackTrace();
		}finally {
			closeRs(rs);
		}
		
		return b;
	}

	@Override
	public int employeeJudgeJurisdiction(String  employeeCode) {
		String sql = "select m.employeeJobName from employee e inner join employeeJob m on e.employeeJobId = m.employeeJobId and e.employeeCode=?";
		Object[]object = {employeeCode};
		ResultSet rs = execute_Query(sql, object);
		int b = 0;
		try {
			if(rs.next()) {
				String employeeJobName = rs.getString("employeeJobName");
				if(employeeJobName.equals("超级管理员")) {
					b=1;
				}else if(employeeJobName.equals("采购员")) {
					b=2;
				}else if(employeeJobName.equals("仓库员")) {
					b=3;
				}else if(employeeJobName.equals("销售员")) {
					b=4;
				}
			}
		} catch (SQLException e) { 
			e.printStackTrace();
		}finally {
			closeRs(rs);
		}
		return b;
	}

	@Override
	public List<Employee> multipleChoice(String wordKey,String wordkey2,String wordkey3, int type) {
		String sql = null;

		 if (type == 1) {
			sql = "select e.*,m.employeeJobName,m.employeeDescribe from employee e inner join employeeJob m on e.employeeJobId = m.employeeJobId and e.employeeCode =? and  e.employeeState=? and m.employeeJobName=?";
		} else if (type == 2) {
			sql = "select e.*,m.employeeJobName,m.employeeDescribe from employee e inner join employeeJob m on e.employeeJobId = m.employeeJobId and e.employeeEmail =? and  e.employeeState=? and m.employeeJobName=?";
		} 

		Object[] objects = { wordKey,wordkey2, wordkey3 };
		ResultSet rs = execute_Query(sql, objects);
		List<Employee> employees = new ArrayList<Employee>();
		
		try {
			while (rs.next()) {
				int employeeId = rs.getInt("employeeId");
				String employeeCode = rs.getString("employeeCode");
				String employeePassword = rs.getString("employeePassword");
				String employeeName = rs.getString("employeeName");
				String employeeGender = rs.getString("employeeGender");
				String employeePhone = rs.getString("employeePhone");
				String employeeEmail = rs.getString("employeeEmail");
				String employeeBrithday = rs.getString("employeeBrithday");
				String employeeIdentity =  rs.getString("employeeIdentity");
				String employeeState =  rs.getString("employeeState");
				String employeeIntroduction =  rs.getString("employeeIntroduction");
				String employeeAddress = rs.getString("employeeAddress");
				String employeeEducation =  rs.getString("employeeEducation");
				int employeeJobId = rs.getInt("employeeJobId");
				String employeeJobName = rs.getString("employeeJobName");// 超级管理员：1，采购员：2，仓库员：3，销售员：4
				String employeeDescribe = rs.getString("employeeDescribe");
				String pciture = rs.getString("pciture");
				 
				Employee employee = new Employee(employeeId, employeeCode, employeeName, employeePassword,
						 employeeGender, employeePhone, employeeEmail, employeeBrithday,
						 employeeIdentity, employeeState, employeeIntroduction,
						 employeeAddress, employeeEducation, employeeJobId,employeeJobName,employeeDescribe,pciture);
				employees.add(employee);
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeRs(rs);
		}
		return employees;
	}

	@Override
	public boolean employeeJudgeByemployeeCode(String employeeCode) {
		boolean b = false;

		String sql = "select * from employee where employeeCode=?";
		Object[]object={employeeCode};
		ResultSet rs = execute_Query(sql, object);
		try {
			if(rs.next()) {
				String  Code = rs.getString("employeeCode");
				if(employeeCode.equals(Code)) {
					b=true;
				}
			}
		} catch (SQLException e) { 
			e.printStackTrace();
		}finally {
			closeRs(rs);
		}
		return b;
	}

 

	@Override
	public List<Employee> employeeList() { 
		String sql = "select * from employee e inner join employeejob b on"
				+ " e.employeejobId = b.employeejobId and b.employeeJobName=?";
		String employeeJobName = "销售员";
		Object[] objects = { employeeJobName };
		ResultSet rs = execute_Query(sql, objects);
		List<Employee> employees = new ArrayList<Employee>();
		
		try {
			while (rs.next()) {
				int employeeId = rs.getInt("employeeId");
				String employeeCode = rs.getString("employeeCode");
				String employeePassword = rs.getString("employeePassword");
				String employeeName = rs.getString("employeeName");
				String employeeGender = rs.getString("employeeGender");
				String employeePhone = rs.getString("employeePhone");
				String employeeEmail = rs.getString("employeeEmail");
				String employeeBrithday = rs.getString("employeeBrithday");
				String employeeIdentity =  rs.getString("employeeIdentity");
				String employeeState =  rs.getString("employeeState");
				String employeeIntroduction =  rs.getString("employeeIntroduction");
				String employeeAddress = rs.getString("employeeAddress");
				String employeeEducation =  rs.getString("employeeEducation");
				int employeeJobId = rs.getInt("employeeJobId");
				//String employeeJobName = rs.getString("employeeJobName");// 超级管理员：1，采购员：2，仓库员：3，销售员：4
				String employeeDescribe = rs.getString("employeeDescribe");
				String pciture = rs.getString("pciture");
				 
				Employee employee = new Employee(employeeId, employeeCode, employeeName, employeePassword,
						 employeeGender, employeePhone, employeeEmail, employeeBrithday,
						 employeeIdentity, employeeState, employeeIntroduction,
						 employeeAddress, employeeEducation, employeeJobId,employeeJobName,employeeDescribe,pciture);
				employees.add(employee);
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeRs(rs);
		}
		return employees;
	}
}
