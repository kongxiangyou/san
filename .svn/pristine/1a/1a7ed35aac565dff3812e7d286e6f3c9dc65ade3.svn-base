package org.db.psd.dao;

import java.util.List;

import org.db.psd.model.Produce;

public interface ProduceDAO {

	/**
	 * 创建商品信息，并且在库存表中也相应的添加数据，默认库存数量为0
	 * @param produce
	 * @return
	 */
	public boolean produceCreate(Produce produce);
	
	
	/**
	 * 修改商品信息
	 * @param produce
	 * @return
	 */
	public boolean produceUpdate(Produce produce);
	
	/**
	 * 查看商品列表
		@param position 当前访问数据库表中起始位置 
	 * @param size 显示的数量
	 */
	public List<Produce> produceList(long position, int size);
	
	
	/**
	 * 点击列表显示商品详细信息
	 * @param produceId
	 * @return
	 */
	public Produce producebyId(int produceId);
	/**
	 * 总行数
	 * @return
	 */
	public long allrow();
	
	/**
	 * 页面内容
	 * sql = "select * from Employee limit ? , ?"
	 * @param position 当前访问数据库表中起始位置 
	 * @param size 显示的数量
	 * @return
	 */
	public List<Produce> infermation(long position, int size);
	
}
