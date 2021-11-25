package org.db.psd.model;

import java.util.Date;
import java.sql.*;

/**
 * @author lanruijiang Mon Aug 23 10:43:06 CST 2021
 *         <p>
 *         shop 实体类
 *         </P>
 */

public class Shop {
	private int shopId;
	private String shopName;
	private String shopAddress;
	private String shopPhone;
	private int employeeId;
	private String employeeName;
	public Shop() {
	};


	public Shop(int shopId, String shopName, String shopAddress, String shopPhone, int employeeId,
			String employeeName) {
		super();
		this.shopId = shopId;
		this.shopName = shopName;
		this.shopAddress = shopAddress;
		this.shopPhone = shopPhone;
		this.employeeId = employeeId;
		this.employeeName = employeeName;
	}


	public String getEmployeeName() {
		return employeeName;
	}


	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}


	public int getEmployeeId() {
		return employeeId;
	}



	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}



	public void setShopId(int shopId) {
		this.shopId = shopId;
	}

	public int getShopId() {
		return shopId;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopAddress(String shopAddress) {
		this.shopAddress = shopAddress;
	}

	public String getShopAddress() {
		return shopAddress;
	}

	public void setShopPhone(String shopPhone) {
		this.shopPhone = shopPhone;
	}

	public String getShopPhone() {
		return shopPhone;
	}
}
