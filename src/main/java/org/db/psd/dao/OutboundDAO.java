package org.db.psd.dao;

import java.util.List;

import org.db.psd.model.Outbound;
import org.db.psd.model.Shop;

/**
 * 出库的DAO
 * @author Administrator
 *
 */
public interface OutboundDAO {

	/**
	 * 出库
	 * 出库的同时会在库存表中减掉相应的数量
	 * @param outboundDAO
	 * @return
	 */
	public int outboundCreate(Outbound outbound);
	
	/**
	 * 通过ID查询出库信息
	 * @param outboundId
	 * @return
	 */
	public Outbound outboundById(int outboundId);
	/**
	 * 通过商品查询出库信息
	 * @param produceName
	 * @return
	 */
	public Outbound outboundByProduceName(String produceName);
	
	/**
	 * 查看所有的出库信息
	 * @return
	 */
	public List<Outbound> outboundList();
	/**
	 * 总行数
	 * @return
	 */
	public long allrow();
	/**
	 * sql="select * from outbound limit ?,?  "
	 * @param position 当前页
	 * @param size 显示的数量
	 * @return
	 */
	public List<Outbound> infermation(long position , int size);
}
