package org.db.psd.model;

 
import java.sql.*;

/**
 * @author lanruijiang Mon Aug 23 10:43:06 CST 2021
 *         <p>
 *         outbound 实体类
 *         </P>
 */

public class Outbound {
	private int outboundId;
	private int outboundNum;
	private String outboundTime;
	private int produceId;
	private int employeeId;
	private int inventoryId;
	private String produceName;
	private String employeeName;

	 

	 
	

	public String getEmployeeName() {
		return employeeName;
	}


	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}


	public Outbound(int outboundId, int outboundNum, String outboundTime, int produceId, int employeeId,
			int inventoryId, String produceName, String employeeName) {
		super();
		this.outboundId = outboundId;
		this.outboundNum = outboundNum;
		this.outboundTime = outboundTime;
		this.produceId = produceId;
		this.employeeId = employeeId;
		this.inventoryId = inventoryId;
		this.produceName = produceName;
		this.employeeName = employeeName;
	}


	public String getProduceName() {
		return produceName;
	}


	public void setProduceName(String produceName) {
		this.produceName = produceName;
	}


	public Outbound() {
	};

	public void setOutboundId(int outboundId) {
		this.outboundId = outboundId;
	}

	public int getOutboundId() {
		return outboundId;
	}

	public void setOutboundNum(int outboundNum) {
		this.outboundNum = outboundNum;
	}

	public int getOutboundNum() {
		return outboundNum;
	}

	public void setOutboundTime(String outboundTime) {
		this.outboundTime = outboundTime;
	}

	public String getOutboundTime() {
		return outboundTime;
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

	public void setInventoryId(int inventoryId) {
		this.inventoryId = inventoryId;
	}

	public int getInventoryId() {
		return inventoryId;
	}
}
