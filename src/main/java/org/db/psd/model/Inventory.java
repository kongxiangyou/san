package org.db.psd.model;

 
import java.sql.*;

/**
 * @author lanruijiang Fri Aug 20 10:05:33 CST 2021
 *         <p>
 *         inventory 实体类
 *         </P>
 */

public class Inventory {
	private int inventoryId;
	private int inventoryNum;
	private String inventoryTime;
	private String inventoryPostion;
	private int inventoryRemain;
	private int produceId;
	private int employeeId;
	private int procurementId;
	private int produceNum;
	private int allNum;
	private String produceName;
	
	public Inventory() {
	};

	public Inventory(int inventoryId, int inventoryNum, String inventoryTime, String inventoryPostion,
			int inventoryRemain, int produceId, int employeeId, int procurementId, int produceNum, int allNum,
			String produceName) {
		super();
		this.inventoryId = inventoryId;
		this.inventoryNum = inventoryNum;
		this.inventoryTime = inventoryTime;
		this.inventoryPostion = inventoryPostion;
		this.inventoryRemain = inventoryRemain;
		this.produceId = produceId;
		this.employeeId = employeeId;
		this.procurementId = procurementId;
		this.produceNum = produceNum;
		this.allNum = allNum;
		this.produceName = produceName;
	}



	public String getProduceName() {
		return produceName;
	}

	public void setProduceName(String produceName) {
		this.produceName = produceName;
	}

	public int getProduceNum() {
		return produceNum;
	}

	public void setProduceNum(int produceNum) {
		this.produceNum = produceNum;
	}

	public int getAllNum() {
		return allNum;
	}

	public void setAllNum(int allNum) {
		this.allNum = allNum;
	}

	public void setInventoryId(int inventoryId) {
		this.inventoryId = inventoryId;
	}

	public int getInventoryId() {
		return inventoryId;
	}

	public void setInventoryNum(int inventoryNum) {
		this.inventoryNum = inventoryNum;
	}

	public int getInventoryNum() {
		return inventoryNum;
	}

	public void setInventoryTime(String inventoryTime) {
		this.inventoryTime = inventoryTime;
	}

	public String getInventoryTime() {
		return inventoryTime;
	}

	public void setInventoryPostion(String inventoryPostion) {
		this.inventoryPostion = inventoryPostion;
	}

	public String getInventoryPostion() {
		return inventoryPostion;
	}

	public void setInventoryRemain(int inventoryRemain) {
		this.inventoryRemain = inventoryRemain;
	}

	public int getInventoryRemain() {
		return inventoryRemain;
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

	public void setProcurementId(int procurementId) {
		this.procurementId = procurementId;
	}

	public int getProcurementId() {
		return procurementId;
	}
}
