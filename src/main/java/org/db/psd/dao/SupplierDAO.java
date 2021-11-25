package org.db.psd.dao;

import java.util.List;

import org.db.psd.model.Supplier;

public interface SupplierDAO {

	/**
	 * 创建供应商
	 * @param supplier
	 * @return
	 */
	public boolean createSupplier(Supplier supplier);
	
	/**
	 * 修改
	 * @param supplier
	 * @return
	 */
	public boolean updateSupplier(Supplier supplier);
	
	public List<Supplier> select();
}
