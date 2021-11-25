package org.db.psd.dao;

import org.db.psd.model.Inventory;
import org.db.psd.model.Outbound;
import org.db.psd.model.Procurement;
import org.db.psd.model.Store;

public interface StoreDAO {

	/**
	 * 创建库存信息
	 * @param store
	 * @return
	 */
	public boolean storeCreate(Store store);
	
	/**
	 * 采购时相应的更改库存的数量
	 * @param store
	 * @return
	 */
	public boolean storeprocurementChangeNumber(Procurement procurement);
	
	/**
	 * 入库时相应的更改库存的数量
	 * @param store
	 * @return
	 */
	public boolean storeInventoryChangeNumber(Inventory inventory);
	/**
	 * 出库时相应的更改库存的数量
	 * @param outbound
	 * @return
	 */
	public boolean storeOutboundChangeNumber(Outbound outbound);
	/**
	 * 通过id查询库存信息
	 * @param proudceId
	 * @return
	 */
	public Store storeByid(int produceId);
	
}
