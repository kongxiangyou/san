package org.db.psd.fatory;

import org.db.psd.dao.EmployeeDAO;
import org.db.psd.dao.EmployeeJobDAO;
import org.db.psd.dao.InventoryDAO;
import org.db.psd.dao.OutboundDAO;
import org.db.psd.dao.ProcurementDAO;
import org.db.psd.dao.ProduceDAO;
import org.db.psd.dao.Province_city_countyDAO;
import org.db.psd.dao.SaleDAO;
import org.db.psd.dao.ShopDAO;
import org.db.psd.dao.ShopStoreDAO;
import org.db.psd.dao.SplitDAO;
import org.db.psd.dao.StoreDAO;
import org.db.psd.dao.SupplierDAO;
import org.db.psd.impl.EmployeeDAOImplement;
import org.db.psd.impl.EmployeeJobDAOImplement;
import org.db.psd.impl.InventoryDAOImplement;
import org.db.psd.impl.OutboundDAOImplement;
import org.db.psd.impl.ProcurementDAOImplement;
import org.db.psd.impl.ProduceDAOImplement;
import org.db.psd.impl.Province_city_countyDAOImpl;
import org.db.psd.impl.ShopDAOImplement;
import org.db.psd.impl.ShopStoreDAOImplement;
import org.db.psd.impl.SplitDAOImpl;
import org.db.psd.impl.StoreDAOImplement;
import org.db.psd.impl.SupplierDAOImpl;
import org.db.psd.impl.saleDAOImplement;

public class FatoryModel {

	private static FatoryModel fatory;
	private EmployeeDAO employeeDAO;
	private EmployeeJobDAO employeeJobDAO;
	private InventoryDAO inventoryDAO;
	private OutboundDAO outboundDAO;
	private ProcurementDAO procurementDAO;
	private ProduceDAO produceDAO;
	private ShopDAO shopDAO;
	private ShopStoreDAO shopStoreDAO;
	private StoreDAO storeDAO;
	private SplitDAO splitDAO;
	private SaleDAO saleDAO;
	private SupplierDAO supplierDAO;
	private Province_city_countyDAO pccDao;

	public static FatoryModel getInstanceFatory() {
		if (fatory == null) {
			fatory = new FatoryModel();
		}
		return fatory;
	}

	public EmployeeDAO getEmployeeDAO() {
		if (employeeDAO == null) {
			employeeDAO = new EmployeeDAOImplement();
		}
		return employeeDAO;
	}

	public EmployeeJobDAO getEmployeeJobDAO() {
		if (employeeJobDAO == null) {
			employeeJobDAO = new EmployeeJobDAOImplement();
		}
		return employeeJobDAO;
	}

	public InventoryDAO getInventoryDAO() {
		if (inventoryDAO == null) {
			inventoryDAO = new InventoryDAOImplement();
		}
		return inventoryDAO;
	}

	public OutboundDAO getOutboundDAO() {
		if (outboundDAO == null) {
			outboundDAO = new OutboundDAOImplement();
		}
		return outboundDAO;
	}

	public ProcurementDAO getProcurementDAO() {
		if (procurementDAO == null) {
			procurementDAO = new ProcurementDAOImplement();
		}
		return procurementDAO;
	}

	public ProduceDAO getProduceDAO() {
		if (produceDAO == null) {
			produceDAO = new ProduceDAOImplement();
		}
		return produceDAO;
	}

	public ShopDAO getShopDAO() {
		if (shopDAO == null) {
			shopDAO = new ShopDAOImplement();
		}
		return shopDAO;
	}

	public ShopStoreDAO getShopStoreDAO() {
		if (shopStoreDAO == null) {
			shopStoreDAO = new ShopStoreDAOImplement();
		}
		return shopStoreDAO;
	}

	public StoreDAO getStoreDAO() {
		if (storeDAO == null) {
			storeDAO = new StoreDAOImplement();
		}
		return storeDAO;
	}

	public SplitDAO getSplitDAO() {
		if (splitDAO == null) {
			splitDAO = new SplitDAOImpl();
		}
		return splitDAO;
	}
	public SaleDAO getSaleDAO() {
		if (saleDAO == null) {
			saleDAO = new saleDAOImplement();
		}
		return saleDAO;
	}
	public SupplierDAO getSupplierDAO() {
		if (supplierDAO == null) {
			supplierDAO = new SupplierDAOImpl();
		}
		return supplierDAO;
	}
	public Province_city_countyDAO getProvince_city_countyDAO() {
		if (pccDao == null) {
			pccDao = new Province_city_countyDAOImpl();
		}
		return pccDao;
	}
}
