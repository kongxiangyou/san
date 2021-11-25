package org.db.psd.impl;


 
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.db.psd.base.Execute_CRUD;
import org.db.psd.dao.InventoryDAO;
import org.db.psd.model.Inventory;
import org.db.psd.model.Procurement;
import org.db.psd.model.Store;

public class InventoryDAOImplement extends Execute_CRUD implements InventoryDAO {

	@Override
	public boolean inventoryIudgeByProcurementId(int procurementId) {

		boolean b = true;
		String sql = "select count(*) from inventory where procurementId = ?";
		Object[] objects = { procurementId };
		ResultSet rs = execute_Query(sql, objects);
		try {
			if (rs.next()) {
				int count = rs.getInt(1);
				if (count > 0) {
					b = false;
				}
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeRs(rs);
		}
		return b;
	}

	@Override
	public int inventoryTOProcurementRemainSum(int procurementId) {
		String sql = "SELECT p.procurementNum -  SUM(i.inventoryNum) " + "FROM procurement p INNER JOIN inventory i "
				+ "ON p.procurementId = i.procurementId AND i.procurementId = ?";
		Object[] objects = { procurementId };
		ResultSet rs = execute_Query(sql, objects);
		int remain = 0;
		try {
			if (rs.next()) {
				remain = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeRs(rs);
		}

		return remain;
	}

	@Override
	public boolean inventoryCrete(Inventory inventory) {
 
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String sql = "INSERT INTO inventory"
					+ "(inventoryNum,inventoryTime,inventoryPostion,inventoryRemain,produceId,employeeId,procurementId)"
					+ "VALUE (?,?,?,?,?,?,?)";
			
			int inventoryNum = inventory.getInventoryNum();
			
			String inventoryTime = simpleDateFormat.format(date);
			
			String inventoryPostion = inventory.getInventoryPostion();
			int inventoryRemain = inventory.getInventoryRemain();
			int employeeId = inventory.getEmployeeId();
			int produceId = inventory.getProduceId();
			int procurementId = inventory.getProcurementId();
			
			Object[] objects = { inventoryNum,inventoryTime, inventoryPostion, inventoryRemain, produceId, employeeId, procurementId };
	
			boolean b = false;
			
			StoreDAOImplement storeDAOImplement = new StoreDAOImplement();
			Store store = storeDAOImplement.storeByid(produceId);
			int produceNum = store.getProduceNum();
			
			  
			 int procurementNum =  store.getProcurementNum();
			 if(produceNum==procurementNum) {
				 b=false;
			 }else {
				 b= execute_CUD(sql, objects);
				 if(b) {
					 InventoryDAOImplement inventoryDAOImplement = new InventoryDAOImplement();
					int num = inventoryDAOImplement.inventoryTOProcurementRemainSum(procurementId);
					if(num==0) {
						System.out.println("该商品已全入库");
					} 
					inventoryDAOImplement.updateRemain(procurementId, num);
					
					boolean a = false;
					a = storeDAOImplement.storeInventoryChangeNumber(inventory);
					
					 if(a) {
						 System.out.println("库存修改成功");
					 }else {
						 System.out.println("库存修改失败");
					 }
					
				}else {
					System.out.println("入库失败");
				}
			 }	
		return b;
	}

	@Override
	public Inventory inventoryById(int inventoryId) {
		String sql = "select i.*,s.produceNum,s.allNum,o.produceName"
				+ " from inventory i , store s ,produce o where"
				+ " i.produceId = s.produceId and i.produceId = o.produceId and  inventoryId = ?";
		Object[] objects = { inventoryId };
		ResultSet rs = execute_Query(sql, objects);
		Inventory inventory = null;
		try {
			if (rs.next()) {
				int inventoryNum = rs.getInt("inventoryNum");
				String inventoryPostion = rs.getString("inventoryPostion");
				int inventoryRemain = rs.getInt("inventoryRemain");
				int employeeId = rs.getInt("employeeId");
				int produceId = rs.getInt("produceId");
				int procurementId = rs.getInt("procurementId");
				String inventoryTime = rs.getString("inventoryTime");
				int produceNum = rs.getInt("produceNum");
				int allNum = rs.getInt("allNum");
				String produceName = rs.getString("produceName");
				  inventory = new Inventory(inventoryId, inventoryNum, inventoryTime, inventoryPostion,
						inventoryRemain, produceId, employeeId, procurementId,produceNum,allNum,produceName);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeRs(rs);
		}

		return inventory;
	}

	@Override
	public List<Inventory> inventorieListByProduceId(String produceName) {
		String sql = "select i.*,s.produceNum,s.allNum,o.produceName from"
				+ " inventory i , store s ,produce o where "
				+ "i.produceId = s.produceId and i.produceId = o.produceId  and o.produceName = ?";
		Object[] objects = { produceName };
		ResultSet rs = execute_Query(sql, objects);
		List<Inventory> inventories = new ArrayList<Inventory>();
		Inventory inventory = null;
		try {
			while (rs.next()) {
				int inventoryNum = rs.getInt("inventoryNum");
				String inventoryPostion = rs.getString("inventoryPostion");
				int inventoryRemain = rs.getInt("inventoryRemain");
				int produceId = rs.getInt("produceId");
				int employeeId = rs.getInt("employeeId");
				int procurementId = rs.getInt("procurementId");
				String inventoryTime = rs.getString("inventoryTime");
				int inventoryId = rs.getInt("inventoryId");
				int produceNum = rs.getInt("produceNum");
				int allNum = rs.getInt("allNum");
				//String produceName = rs.getString("produceName");
				  inventory = new Inventory(inventoryId, inventoryNum, inventoryTime, inventoryPostion,
						inventoryRemain, produceId, employeeId, procurementId,produceNum,allNum,produceName);
				inventories.add(inventory);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeRs(rs);
		}

		return inventories;
	}

	@Override
	public List<Inventory> infermation(long position, int size) {
		String sql = "select i.*,s.produceNum,s.allNum,o.produceName from"
				+" inventory i , store s ,produce o where "
				+"i.produceId = s.produceId and i.produceId = o.produceId  limit ?,?";
		 
		Object[] objects = { position, size };
		ResultSet rs = execute_Query(sql, objects);
		List<Inventory> inventories = new ArrayList<Inventory>();
		try {
			while (rs.next()) {
				
				int inventoryNum = rs.getInt("inventoryNum");
				String inventoryPostion = rs.getString("inventoryPostion");
				int inventoryRemain = rs.getInt("inventoryRemain");
				int produceId = rs.getInt("produceId");
				int employeeId = rs.getInt("employeeId");
				int procurementId = rs.getInt("procurementId");
				 
				String inventoryTime = rs.getString("inventoryTime");
				int inventoryId = rs.getInt("inventoryId");
				int produceNum = rs.getInt("produceNum");
				int allNum = rs.getInt("allNum");
				String produceName = rs.getString("produceName");
				Inventory inventory = new Inventory(inventoryId, inventoryNum, inventoryTime, inventoryPostion,
						inventoryRemain, produceId, employeeId, procurementId,produceNum,allNum,produceName);
				inventories.add(inventory);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeRs(rs);
		}

		return inventories;
	}
	
	@Override
	public long allrow() {
		 String sql = "select count(*) from inventory";
		 ResultSet rs  = execute_Query(sql, null);
		 long allrow = 0;
		 try {
			if(rs.next()) {
				 allrow = rs.getLong(1);
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeRs(rs);
		}
		return allrow;
	}
	public static void main(String[] args) {
//		InventoryDAO inventoryDAO = new InventoryDAOImplement();
//		//Inventory inventory = new Inventory(0, 1, null,"11-11-11" , 0, 3, 1, 8);
//		Inventory inventory = null;
//		//boolean b = inventoryDAO.inventoryCrete(inventory);
//		
//			inventory = inventoryDAO.inventoryById(9);
//			System.out.println(inventory.getInventoryTime());
		 
		
	}

	@Override
	public boolean updateRemain(int procurementId , int number) {
		 String sql = "update inventory set inventoryRemain = ? where procurementId = ? ";
		 Object [] object = {number,procurementId};
		 boolean b = execute_CUD(sql, object);
		 if(b) {
			 System.out.println("update success");
		 }else {
			 System.out.println("update false");
		 }
		return b;
	}
	 

	 

}
