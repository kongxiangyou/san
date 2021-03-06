package org.db.psd.dao;

import java.util.List;

 
import org.db.psd.model.Outbound;
import org.db.psd.model.Sale;
import org.db.psd.model.Shopstore;

/**
 * 商品库存DAO
 * @author Administrator
 *
 */
public interface ShopStoreDAO {

	/**
	 * 创建店铺仓库
	 * @param shopstore
	 * @return
	 */
	public boolean shopStoreCreate(Shopstore shopstore);
	/**
	 * 判断库存是否存在
	 * @param shopstore
	 * @return
	 */
	public boolean shopStoreJudge(int shopId,int produceId);
	/**
	 * 通过店铺ID查询库存
	 * @param shopId
	 * @return
	 */
	public List<Shopstore> shopStoreByShopId(int shopId);
	
	/**
	 * 通过商品ID查询商铺库存
	 * @param produceId
	 * @return
	 */
	public List<Shopstore> shopStoreByProduceId(int produceId);
	/**
	 * 分配商品到店铺仓库
	 * @param produceId 和 shopId
	 * @return
	 */
	public boolean  ShopStoreChangNum(Outbound outbound,int shopId);
	/**
	 * 总行数
	 * @return
	 */
	public long allrow();
	/**
	 * 
	 * @param position 数据库当前位置
	 * @param szie 显示的数量
	 * @return
	 */
	public List<Shopstore> infermation(long position,int szie);
	/**
	 * 销售时商店库存相应减少
	 * @param shopstore
	 * @return
	 */
	public boolean saleChangNum(Sale sale);
	/**
	 * 通过商品ID查询库存信息
	 * @param produceId
	 * @return
	 */
	public Shopstore byProduceId(int produceId,int shopId);
}
