package org.db.psd.model;

public class Supplier {

	private int supplierId;
	private String supplierName;
	private int procurementId;
	public Supplier() {
		 
	}
	public Supplier(int supplierId, String supplierName, int procurementId) {
		super();
		this.supplierId = supplierId;
		this.supplierName = supplierName;
		this.procurementId = procurementId;
	}
	public int getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public int getProcurementId() {
		return procurementId;
	}
	public void setProcurementId(int procurementId) {
		this.procurementId = procurementId;
	}
	
}
