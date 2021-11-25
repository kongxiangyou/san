package org.db.psd.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.db.psd.base.Execute_CRUD;
import org.db.psd.dao.StoreDAO;
import org.db.psd.model.Inventory;
import org.db.psd.model.Outbound;
import org.db.psd.model.Procurement;
import org.db.psd.model.Store;

public class StoreDAOImplement extends Execute_CRUD implements StoreDAO {

	@Override
	public boolean storeCreate(Store store) {
		String sql = "insert into store (produceNum,produceId,allNum,procurementNum) value (?,?,?,?)";
		int produceNum = store.getProduceNum();
		int produceId = store.getProduceId();
		int allNum = store.getAllNum();
		int procurementNum = store.getProcurementNum();
		Object[] objects = { produceNum, produceId,allNum,procurementNum };
		boolean b = execute_CUD(sql, objects);
		return b;
	}

	@Override
	public boolean storeInventoryChangeNumber(Inventory inventory) {
		boolean b = false;
		String sql = "update store set produceNum = (produceNum + ?), allNum=(allNum+?) where produceId = ?";
		 
		int inventoryNum = inventory.getInventoryNum();
		int produceId = inventory.getProduceId();
		 int allNum = inventory.getInventoryNum();
		Object[] objects = { inventoryNum,allNum, produceId, };
			
		b = execute_CUD(sql, objects);

		return b;
	}

	@Override
	public boolean storeOutboundChangeNumber(Outbound outbound) {
		boolean b = false;
		String sql = "update store set produceNum = (produceNum - ?) where produceId = ?";
		 
		int inventoryNum = outbound.getOutboundNum();
		int produceId = outbound.getProduceId() ;
		 
		Object[] objects = { inventoryNum, produceId };
			
		b = execute_CUD(sql, objects);

		return b;
	}

	@Override
	public Store storeByid(int produceId) {
		String sql="select * from store where produceId=?";
		Object[] object= {produceId};
		ResultSet rs = execute_Query(sql, object);
		Store store = null;
		try {
			if(rs.next()) {
				 int storeId = rs.getInt("storeId");
				 int produceNum = rs.getInt("produceNum");	 
				 int allNum = rs.getInt("allNum");
				 int procurementNum= rs.getInt("procurementNum");
				 store = new Store(storeId, produceNum, produceId, allNum,procurementNum);
			}
		} catch (SQLException e) { 
			e.printStackTrace();
		}finally {
			closeRs(rs);
		}
		return store;
	}

	@Override
	public boolean storeprocurementChangeNumber(Procurement procurement) {
		 String sql = "update store set procurementNum=(procurementNum+?) where produceId=? ";
		 int procurementNum = procurement.getProcurementNum();
		 int produceId = procurement.getProduceId();
		 Object [] object= {procurementNum,produceId};
		 boolean b = execute_CUD(sql, object);
		 
		return b;
	}

}
