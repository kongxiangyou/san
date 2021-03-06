package org.db.psd.dao;

import java.util.List;

import org.db.psd.model.Inventory;

public interface InventoryDAO {

	/**
	 * 判断某次进货商品是否入库
	 * @param procurementId
	 * @return
	 */
	public boolean inventoryIudgeByProcurementId(int procurementId);
	
	/**
	 * 某一次采购还能入库的数量
	 * @return
	 */
	public int inventoryTOProcurementRemainSum(int procurementId);
	 
	
	/**
	 * 入库
	 * @param inventory
	 * @return
	 */
	public boolean inventoryCrete(Inventory inventory);
	
	/**
	 * 通过ID查询入库信息信息
	 * @param inventoryId
	 * @return
	 */
	public Inventory inventoryById(int inventoryId);
	
	/**
	 * 通过商品ID查询入库信息
	 * @param produceName
	 * @return
	 */
	public List<Inventory> inventorieListByProduceId(String produceName);
	/**
	 * 总行数
	 * @return
	 */
	public long allrow();
	
	/**
	 * 页面内容
	 * sql = "select * from inventory limit ? , ?"
	 * @param position 当前访问数据库表中起始位置 
	 * @param size 显示的数量
	 * @return
	 */
	public List<Inventory> infermation(long position , int size);
	/**
	 * 修改剩余量
	 * @param procurementId
	 * @return
	 */
	public boolean updateRemain(int procurementId, int number);
}
