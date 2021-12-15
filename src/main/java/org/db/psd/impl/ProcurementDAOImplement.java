package org.db.psd.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.db.psd.base.Execute_CRUD;
import org.db.psd.dao.InventoryDAO;
import org.db.psd.dao.ProcurementDAO;
import org.db.psd.model.Employee;
import org.db.psd.model.Procurement;

public class ProcurementDAOImplement extends Execute_CRUD implements ProcurementDAO {

	@Override
	public boolean procurementCreate(Procurement procurement) {
		String sql = "insert into procurement(procurementNum,procurementPrice ,procurementTime ,procurementSuppliers,produceId,employeeId) value(?,?,now(),?,?,?)";
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		Date date = new Date();
		int procurementNum = procurement.getProcurementNum();
		double procurementPrice = procurement.getProcurementPrice();
		//String procurementTime = simpleDateFormat.format(date);
		String procurementSuppliers = procurement.getProcurementSuppliers();
		int produceId = procurement.getProduceId();
		int employeeId = procurement.getEmployeeId();
		
		Object[] objects = { procurementNum, procurementPrice, procurementSuppliers, produceId,
				employeeId };
		
		boolean b = execute_CUD(sql, objects);
		if(b) {
			StoreDAOImplement storeDAOImplement = new StoreDAOImplement();
			b=storeDAOImplement.storeprocurementChangeNumber(procurement);
			if(b) {
				System.out.println("采购成功，库存修改成功");
			}else {
				System.out.println("库存修改失败");
			}
		}
		return b;
	}

	@Override
	public boolean procurementUpdate(Procurement procurement) {
		boolean b = false;
		int procurementId = procurement.getProcurementId();
		InventoryDAO inventoryDAO = new InventoryDAOImplement();

		b = inventoryDAO.inventoryIudgeByProcurementId(procurementId);
		if (b) {
			String sql = "update procurement p , employee e ,produce o "
					+ "set p.procurementNum=?, p.procurementPrice=?,p.procurementTime=?,p.procurementSuppliers=?,o.produceName=?,e.employeeName=?"
					+ "  where p.employeeId=e.employeeId and p.produceId = o.produceId and procurementId=?";

			int procurementNum = procurement.getProcurementNum();
			double procurementPrice = procurement.getProcurementPrice();
			String procurementTime = procurement.getProcurementTime();
			String procurementSuppliers = procurement.getProcurementSuppliers();
			String employeeName = procurement.getEmployeeName();
			String produceName = procurement.getProduceName();
			Object[] object = { procurementNum, procurementPrice, procurementTime, procurementSuppliers, 
					produceName,employeeName, procurementId };
			b = execute_CUD(sql, object);

		}else {
			System.out.println("商品已入库");
		}

		return b;
	}

	@Override
	public boolean procurementDelete(int procurementId) {
		boolean b = false;
		InventoryDAO inventoryDAO = new InventoryDAOImplement();
		b = inventoryDAO.inventoryIudgeByProcurementId(procurementId);
		
		if (b) {
			String sql = "delete from procurement where procurementId = ?";
			Object[] objects = { procurementId };
			b = execute_CUD(sql, objects);
		}
		return b;
	}

	@Override
	public Procurement procurementById(int procurementId) {
		String sql = "select p.*,e.employeeName,o.produceName from procurement p , employee e ,produce o where  p.employeeId=e.employeeId and p.produceId = o.produceId and p.procurementId =?";
		Object[] objects = { procurementId };
		ResultSet rs = execute_Query(sql, objects);
		Procurement procurement = null;
		try {
			if (rs.next()) {
				int procurementNum = rs.getInt("procurementNum");
				double procurementPrice = rs.getDouble("procurementPrice");
				String procurementTime = rs.getString("procurementTime");
				String procurementSuppliers = rs.getString("procurementSuppliers");
				int produceId = rs.getInt("produceId");
				int employeeId = rs.getInt("employeeId");
				String employeeName = rs.getString("employeeName");
				String produceName = rs.getString("produceName");
				procurement = new Procurement(procurementId, procurementNum, procurementPrice, procurementTime,
						procurementSuppliers, produceId, employeeId, employeeName,produceName);
			} else {
				procurement = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeRs(rs);
		}
		return procurement;
	}

	@Override
	public List<Procurement> procurementList(String wordKey, int type) {

		String sql = null;

		if (type == 1) {
			sql = "select pm.*,p.produceName from procurement pm inner join produce p on  p.produceISBN = ? and p.produceId = pm.produceId";
		} else if (type == 2) {
			sql = "select pm.*,p.produceName from procurement pm inner join produce p on  p.produceId = pm.produceId and p.produceName like \"%\"?\"%\" ";
		} else if (type == 3) {
			sql = "select pm.*,p.produceName from procurement pm , employee e ,produce p where pm.employeeId = e.employeeId and p.produceId = pm.produceId  and e.employeeCode= ?";
		} else if (type == 4) {
			sql = "select pm.*,p.produceName from procurement pm inner join produce p on p.produceId = pm.produceId and pm.procurementTime = ?";
		}

		Object[] objects = { wordKey };

		List<Procurement> procurements = new ArrayList<Procurement>();
		ResultSet rs = execute_Query(sql, objects);
		Procurement procurement = null;
		try {
			while (rs.next()) {
				int procurementId = rs.getInt("procurementId");
				int procurementNum = rs.getInt("procurementNum");
				double procurementPrice = rs.getDouble("procurementPrice");
				String procurementTime = rs.getString("procurementTime");
				String procurementSuppliers = rs.getString("procurementSuppliers");
				int produceId = rs.getInt("produceId");
				int employeeId = rs.getInt("employeeId");
				//String employeeName = rs.getString("employeeName");
				String produceName = rs.getString("produceName");
				procurement = new Procurement(procurementId, procurementNum, procurementPrice, procurementTime,
						procurementSuppliers, produceId, employeeId, null,produceName);
				procurements.add(procurement);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeRs(rs);
		}
		return procurements;
	}

	@Override
	public long allRows() {
		
			String sql = "select count(*) from procurement";
			ResultSet rs =  execute_Query(sql, null);
			long i = 0 ;
			try {
				if(rs.next()) {
					i = rs.getLong(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				 closeRs(rs);
			}
			
			return i;
		}
	

	@Override
	public List<Procurement> showInfermation(long position, int size) {
		String sql = "select p.*,e.employeeName,o.produceName from"
				+ " procurement p , employee e ,produce o  "
				+ "where  p.employeeId=e.employeeId and p.produceId = o.produceId limit ?,?";
		
		Object[] object = {position,size};
		ResultSet rs = execute_Query(sql, object);
		List<Procurement> procurements = new ArrayList<Procurement>();
		
		 try {
			while(rs.next()) {
				int procurementId = rs.getInt("procurementId");
				int procurementNum = rs.getInt("procurementNum");
				double procurementPrice = rs.getDouble("procurementPrice");
				String procurementTime = rs.getString("procurementTime");
				String procurementSuppliers = rs.getString("procurementSuppliers");
				int produceId = rs.getInt("produceId");
				int employeeId = rs.getInt("employeeId");
				String employeeName = rs.getString("employeeName");
				String produceName = rs.getString("produceName");
			Procurement procurement = new Procurement(procurementId, procurementNum, procurementPrice, procurementTime,
						procurementSuppliers, produceId, employeeId, employeeName,produceName);
				procurements.add(procurement);
			 }
		} catch (SQLException e) { 
			e.printStackTrace();
		}finally {
			closeRs(rs);
		}
		return procurements;
	}

}
