package org.db.psd.model;

import java.sql.*;

/**
 * @author lanruijiang Mon Aug 23 10:43:06 CST 2021
 *         <p>
 *         sale 实体类
 *         </P>
 */

public class Sale {
	private int saleId;
	private double salePrice;
	private int saleNum;
	private double proceeds;// 总金额
	private String saleTime;
	private int employeeId;
	private int produceId;
	private int shopStoreId;
	private int shopId;
	private String produceName;
	private String shopName;

	public Sale() {
	};

	public Sale(int saleId, double salePrice, int saleNum, double proceeds, String saleTime, int employeeId,
			int produceId, int shopStoreId, int shopId, String produceName, String shopName) {
		super();
		this.saleId = saleId;
		this.salePrice = salePrice;
		this.saleNum = saleNum;
		this.proceeds = proceeds;
		this.saleTime = saleTime;
		this.employeeId = employeeId;
		this.produceId = produceId;
		this.shopStoreId = shopStoreId;
		this.shopId = shopId;
		this.produceName = produceName;
		this.shopName = shopName;
	}

	public String getProduceName() {
		return produceName;
	}

	public void setProduceName(String produceName) {
		this.produceName = produceName;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public int getSaleNum() {
		return saleNum;
	}

	public void setSaleNum(int saleNum) {
		this.saleNum = saleNum;
	}

	public double getProceeds() {
		return proceeds;
	}

	public void setProceeds(double proceeds) {
		this.proceeds = proceeds;
	}

	public int getShopId() {
		return shopId;
	}

	public void setShopId(int shopId) {
		this.shopId = shopId;
	}

	public void setSaleId(int saleId) {
		this.saleId = saleId;
	}

	public int getSaleId() {
		return saleId;
	}

	public void setSalePrice(double salePrice) {
		this.salePrice = salePrice;
	}

	public double getSalePrice() {
		return salePrice;
	}

	public void setSaleTime(String saleTime) {
		this.saleTime = saleTime;
	}

	public String getSaleTime() {
		return saleTime;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public void setProduceId(int produceId) {
		this.produceId = produceId;
	}

	public int getProduceId() {
		return produceId;
	}

	public void setShopStoreId(int shopStoreId) {
		this.shopStoreId = shopStoreId;
	}

	public int getShopStoreId() {
		return shopStoreId;
	}
}
