package org.db.psd.dao;

import java.util.List;

import org.db.psd.model.Shop;

public interface ShopDAO {
	
	/**
	 * 创建商铺
	 * @param shop
	 * @return
	 */
	public int shopCreate(Shop shop);

	/**
	 * 查看商铺详细信息
	 * @param shopId
	 * @return
	 */
	public Shop shopById(int shopId);
	/**
	 * 招聘员工
	 * @param shopId , employeeId
	 * @return
	 */
	public boolean shopUpdate(int shopId,int employeeId);
	/**
	 * 查看商铺详细信息
	 * @param shopName
	 * @return
	 */
	public Shop shopByName(String shopName);
	/**
	 * 判断商铺的员工是否存在
	 * @param shopId , employeeId
	 * @return
	 */
	public boolean shopJudgeEmployee(int shopId,int employeeId);
	/**
	 * 修改商铺信息
	 * @param shop
	 * @return
	 */
	public boolean shopUpdate(Shop shop);
	
	/**
	 * 查看商铺的所有员工
	 * @return shopId
	 */
	public List<Shop> shopList(int shopId);
	/**
	 * 查看所有商铺
	 * @return 
	 */
	public List<Shop> shopList();
	
	
	/**
	 * 总行数
	 * @return
	 */
	public long allrow ();
	/**
	 * 页面内容
	 * sql = "select * from shop limit ? , ?"
	 * @param position 当前访问数据库表中起始位置 
	 * @param size 显示的数量
	 * @return
	 */
	public List<Shop> infermation(long position,int size);
	/**
	 * 
	 * @param wordkey 关键字
	 * @param type 1.商店名，2.商店电话，3 商店地址
	 * @return
	 */
	public List<Shop> shopByMore(String wordkey, int type);
}
