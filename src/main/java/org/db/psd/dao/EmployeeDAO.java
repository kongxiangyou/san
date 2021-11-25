package org.db.psd.dao;

import java.util.List;


import org.db.psd.model.Employee;

/**
 * 官员管理功能模块接口
 * @author Administrator
 *
 */
public interface EmployeeDAO {

	/**
	 * 员工登录
	 * 超级管理员默认用户名和密码 (admin/123456)
	 * @param employee
	 * @return
	 */
	public int employeeLogin(Employee employee);
	/**
	 * 判断员工是否离职
	 * @param employeeCode 工号
	 * @return
	 */
	public boolean employeeJudgeState(String employeeCode);
	/**
	 * 判断员工的权限
	 * 根据员工的职位有不同的权限
	 * @param employeeCode 工号
	 * @return
	 */
	public int employeeJudgeJurisdiction(String  employeeCode);
	/**
	 * 判断员工是否存在
	 * 通过工号判断
	 * @param employeeCode
	 * @return
	 */
	public boolean employeeJudgeByemployeeCode(String  employeeCode);
	
	/**
	 * 创建员工信息
	 * @param employee
	 * @return
	 */
	public boolean employeeCreate(Employee employee);
	
	/**
	 * 普通员工修改密码
	 * @param employee
	 * @return
	 */
	public boolean employeeUpdatePassword(String employeeCode,String employeePassword);
	
	
	/**
	 * 管理员修改员工信息
	 * @param employee
	 * @return
	 */
	public boolean employeeUpdateInformation(Employee employee);
	
	
	/**
	 * 通过员工Id查询员工信息
	 * @param employeeId
	 * @return
	 */
	public Employee employeeById(String employeeCode);
	
	/**
	 * 通过条件查询
	 * @param wordKey 关键字
	 * @param wordKey2 关键字
	 *  @param wordKey3 关键字
	 * @param type 多条件查询（1. 员工状态和员工职位，2.工号，3.email）
	 * @return
	 */
	public List<Employee> multipleChoice(String wordKey ,String wordkey2,String wordkey3, int type);
	
	/**
	 * 查询所有销售员工信息列表
	 * @return
	 */
	public List<Employee> employeeList();
		
	
	/**
	 * 页面内容
	 * sql = "select * from Employee limit ? , ?"
	 * @param position 当前访问数据库表中起始位置 
	 * @param size 显示的数量
	 * @return
	 */
	public List<Employee> showInfermation(long position , int size) ;
	
}
