package org.db.psd.dao;

import java.util.List;

import org.db.psd.model.Sale;

public interface SaleDAO {

	/**
	 * 进行销售，创建销售信息
	 * @param sale
	 * @return
	 */
	public int create(Sale sale);
	/**
	 * 总行数
	 * @return
	 */
	public long allrow ();
	/**
	 * 修改销售信息
	 * @param sale
	 * @return
	 */
	public boolean update (Sale sale);
	/**
	 * 
	 * @param position 当前页
	 * @param size 显示的数量
	 * @return
	 */
	public List<Sale> SaleList(long position, int size);
	/**
	 * 
	 * @param wordkey 关键字
	 * @param type 1.商店名，2.销售ID，3.商品名
	 * @return
	 */
	public List<Sale> ByMore(String wordkey, int type);
}
