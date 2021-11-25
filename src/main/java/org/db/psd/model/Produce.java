package org.db.psd.model;

import java.sql.*;

/**
 * @author lanruijiang Thu Aug 19 10:03:50 CST 2021
 *         <p>
 *         produce 实体类
 *         </P>
 */

public class Produce {
	private int produceId;
	private String produceName;
	private String produceISBN;
	private String produceDescribe;
	private int employeeId;
	private int shopstoreNum;
	private String shopName;
	

	public Produce() {
	};
	
	

 



	public Produce(int produceId, String produceName, String produceISBN, String produceDescribe, int employeeId,
			int shopstoreNum, String shopName) {
		super();
		this.produceId = produceId;
		this.produceName = produceName;
		this.produceISBN = produceISBN;
		this.produceDescribe = produceDescribe;
		this.employeeId = employeeId;
		this.shopstoreNum = shopstoreNum;
		this.shopName = shopName;
	}







	public int getShopstoreNum() {
		return shopstoreNum;
	}



	public void setShopstoreNum(int shopstoreNum) {
		this.shopstoreNum = shopstoreNum;
	}



	public String getShopName() {
		return shopName;
	}



	public void setShopName(String shopName) {
		this.shopName = shopName;
	}



	public void setProduceId(int produceId) {
		this.produceId = produceId;
	}

	public int getProduceId() {
		return produceId;
	}

	public void setProduceName(String produceName) {
		this.produceName = produceName;
	}

	public String getProduceName() {
		return produceName;
	}

	public void setProduceISBN(String produceISBN) {
		this.produceISBN = produceISBN;
	}

	public String getProduceISBN() {
		return produceISBN;
	}

	public void setProduceDescribe(String produceDescribe) {
		this.produceDescribe = produceDescribe;
	}

	public String getProduceDescribe() {
		return produceDescribe;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public int getEmployeeId() {
		return employeeId;
	}
}
