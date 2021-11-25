package org.db.psd.model;

 
import java.sql.*;

/**
 * @author lanruijiang Fri Aug 20 10:05:33 CST 2021
 *         <p>
 *         procurement 实体类
 *         </P>
 */

public class Procurement {
	private int procurementId;
	private int procurementNum;
	private double procurementPrice;
	private String procurementTime;
	private String procurementSuppliers;
	private int produceId;
	private int employeeId;
	private String employeeName;
	private String produceName;

	public Procurement() {
	};

 

	public String getProduceName() {
		return produceName;
	}



	public void setProduceName(String produceName) {
		this.produceName = produceName;
	}



	public Procurement(int procurementId, int procurementNum, double procurementPrice, String procurementTime,
			String procurementSuppliers, int produceId, int employeeId, String employeeName, String produceName) {
		super();
		this.procurementId = procurementId;
		this.procurementNum = procurementNum;
		this.procurementPrice = procurementPrice;
		this.procurementTime = procurementTime;
		this.procurementSuppliers = procurementSuppliers;
		this.produceId = produceId;
		this.employeeId = employeeId;
		this.employeeName = employeeName;
		this.produceName = produceName;
	}



	public void setProcurementId(int procurementId) {
		this.procurementId = procurementId;
	}

	public int getProcurementId() {
		return procurementId;
	}

	public void setProcurementNum(int procurementNum) {
		this.procurementNum = procurementNum;
	}

	public int getProcurementNum() {
		return procurementNum;
	}

	public void setProcurementPrice(double procurementPrice) {
		this.procurementPrice = procurementPrice;
	}

	public double getProcurementPrice() {
		return procurementPrice;
	}

	public void setProcurementTime(String procurementTime) {
		this.procurementTime = procurementTime;
	}

	public String getProcurementTime() {
		return procurementTime;
	}

	public void setProcurementSuppliers(String procurementSuppliers) {
		this.procurementSuppliers = procurementSuppliers;
	}

	public String getProcurementSuppliers() {
		return procurementSuppliers;
	}

	public void setProduceId(int produceId) {
		this.produceId = produceId;
	}

	public int getProduceId() {
		return produceId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	
	
}
