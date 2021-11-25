package org.db.psd.dao;

import java.util.List;

import org.db.psd.model.Employee;
import org.db.psd.model.Procurement;

public interface ProcurementDAO {
	
	/**
	 * 录入进货信息
	 * @param procurement
	 * @return
	 */
	public boolean procurementCreate(Procurement procurement);
	
	/**
	 * 修改进货单
	 * @param procurement
	 * @return
	 */
	public boolean procurementUpdate(Procurement procurement);
	
	/**
	 * 删除订货单
	 * @param procurementId
	 * @return
	 */
	public boolean procurementDelete(int procurementId);
	
	/**
	 * 通过ID查询进货单详细信息
	 * @param procurementId
	 * @return
	 */
	public Procurement procurementById(int procurementId);
	
	/**
	 * 通过条件查询
	 * @param wordKey 关键字
	 * @param type 多条件查询（1.商品的编号，2.商品的名字（模糊），3.采购员的工号，4.采购日期）
	 * @return
	 */
	public List<Procurement> procurementList(String wordKey , int type);

	/**
	 * 总行数
	 * @return
	 */
	public long allRows() ;
	
	/**
	 * 页面内容
	 * sql = "select * from Procurement limit ? , ?"
	 * @param position 当前访问数据库表中起始位置 
	 * @param size 显示的数量
	 * @return
	 */
	public List<Procurement> showInfermation(long position , int size) ;
}
















