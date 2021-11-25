package org.db.psd.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.db.psd.base.Execute_CRUD;
import org.db.psd.dao.SupplierDAO;
import org.db.psd.model.Supplier;

public class SupplierDAOImpl extends Execute_CRUD implements SupplierDAO   {

	@Override
	public boolean createSupplier(Supplier supplier) {
		 String sql = "insert into suppliers (supplierName,procurementId)value(?,?)";
		 String supplierName = supplier.getSupplierName();
		 int procurementId = supplier.getProcurementId();
		 Object[]object = {supplierName,procurementId};
		 boolean b = execute_CUD(sql, object);
		return b;
	}

	@Override
	public boolean updateSupplier(Supplier supplier) {
		 String sql = "update suppliers set supplierName=?,procurementId=? where supplierId = ?";
		int supplierId = supplier.getSupplierId();
		 String supplierName = supplier.getSupplierName();
		 int procurementId = supplier.getProcurementId();
		 Object[]object = {supplierName,procurementId,supplierId};
		 boolean b = execute_CUD(sql, object);
		return b;
	}

	@Override
	public List<Supplier> select() {
		 String sql = "select * form suppliers";
		 ResultSet rs = execute_Query(sql, null);
		 List<Supplier> suppliers = new ArrayList<Supplier>();
		 Supplier supplier = null;
		 try {
			while(rs.next()) {
				 int supplierId = rs.getInt("supplierId");
				 String supplierName = rs.getString("supplierName");
				 int procurementId = rs.getInt("procurementId");
				 supplier = new Supplier(supplierId, supplierName, procurementId);
				 suppliers.add(supplier);
			 }
		} catch (SQLException e) { 
			e.printStackTrace();
		}finally {
			closeRs(rs);
		}
		return suppliers;
	}

}
