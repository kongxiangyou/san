package org.db.psd.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.db.psd.base.Execute_CRUD;
import org.db.psd.dao.ShopStoreDAO;
import org.db.psd.model.Outbound;
import org.db.psd.model.Sale;
import org.db.psd.model.Shopstore;

public class ShopStoreDAOImplement extends Execute_CRUD implements ShopStoreDAO {

	@Override
	public boolean shopStoreCreate(Shopstore shopstore) {
		String sql  = "insert into shopstore (shopStoreNum,shopStoreTime,shopId,produceId,outboundId,employeeId,shopStoreallNum) value (?,?,?,?,?,?,?)";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		
		int shopStoreNum = shopstore.getShopStoreNum();
		String shopStoreTime =  simpleDateFormat.format(date);
		int shopId = shopstore.getShopId();
		int produceId = shopstore.getProduceId();
		int outboundId = shopstore.getOutboundId();
		int employeeId = shopstore.getEmployeeId();
		int shopStoreallNum = shopstore.getShopStoreallNum();
		Object [] objects = {shopStoreNum,shopStoreTime,shopId,produceId,outboundId,employeeId,shopStoreallNum};
	//	System.out.println(shopStoreNum+"<"+shopStoreTime+"<"+shopId+"<"+produceId+"<"+outboundId+"<"+employeeId+"<"+shopStoreallNum);
		boolean b = execute_CUD(sql, objects);
		if(b) {
			System.out.println("商店库存创建成功");
		}else {
			System.out.println("商店库存创建失败");
		}
		return b;
	}

	@Override
	public List<Shopstore> shopStoreByShopId(int shopId) {
		String sql = "select * frm Shopstore where shopId = ?";
		
		Object [] objects = {shopId};
		
		ResultSet rs = execute_Query(sql, objects);
		
		List<Shopstore> shopStores = new ArrayList<Shopstore>();
		
		Shopstore shopStore = null;
		
		try {
			while(rs.next()) {
				int shopStoreId = rs.getInt("shopStoreId");
				int shopStoreNum = rs.getInt("shopStoreNum");
				String shopStoreTime = rs.getString("shopStoreTime");
				int produceId = rs.getInt("produceId");
				int outboundId = rs.getInt("outboundId");
				int employeeId = rs.getInt("employeeId");
				int shopStoreallNum = rs.getInt("shopStoreallNum");
				shopStore = new Shopstore(shopStoreId, shopStoreNum, shopStoreTime, shopId, produceId, outboundId, employeeId,shopStoreallNum,null,null);
				shopStores.add(shopStore);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeRs(rs);
		}
		return shopStores;
	}

	@Override
	public List<Shopstore> shopStoreByProduceId(int produceId) {
		
		String sql ="select * from shopstore where produceId = ?";
		
		Object [] objects = {produceId};
		
		ResultSet rs = execute_Query(sql, objects);
		
		List<Shopstore> shopStores = new ArrayList<Shopstore>();
		Shopstore shopStore = null;
		
		try {
			while(rs.next()) {
				int shopId = rs.getInt("shopId");
				int shopStoreId = rs.getInt("shopStoreId");
				int shopStoreNum = rs.getInt("shopStoreNum");
				String shopStoreTime = rs.getString("shopStoreTime");
				int outboundId = rs.getInt("outboundId");
				int employeeId = rs.getInt("employeeId");
				int shopStoreallNum = rs.getInt("shopStoreallNum");
				shopStore = new Shopstore(shopStoreId, shopStoreNum, shopStoreTime, shopId, produceId, outboundId, employeeId,shopStoreallNum,null,null);
				shopStores.add(shopStore);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeRs(rs);
		}
		return shopStores;
	}

	@Override
	public boolean  ShopStoreChangNum(Outbound outbound,int shopId) {
		String sql = "update shopstore set shopStoreNum=(shopStoreNum+?) ,shopStoreallNum=(shopStoreallNum+?) where produceId  =? and shopId=? ";
 
		int shopStoreNum = outbound.getOutboundNum();
		int shopStoreallNum = outbound.getOutboundNum();
		int produceId = outbound.getProduceId();
		 
		Object[] object= {shopStoreNum,shopStoreallNum,produceId,shopId};
		boolean b = execute_CUD(sql, object);
		
		return b;
	}
 

@Override
public boolean shopStoreJudge(int shopId,int produceId) {
	String sql = "select count(*) from shopstore where shopId = ? and produceId=?";
	Object[] object= {shopId,produceId};
	 ResultSet rs  = execute_Query(sql, object);
	 boolean b = true;
	 try {
		if(rs.next()) {
			 int i = rs.getInt(1);
			 if(i>0) {
				 b=false;
			 }else {
				 System.out.println("不存在");
			 }
		 }
	} catch (SQLException e) { 
		e.printStackTrace();
	}finally {
		closeRs(rs);
	}
	return b;
}

@Override
public long allrow() { 
	String sql ="select count(*) from shopstore";
	ResultSet rs= execute_Query(sql, null);
	long num =0;
	try {
		if(rs.next()) {
			num= rs.getLong(1);
		}
	} catch (SQLException e) { 
		e.printStackTrace();
	}finally {
		closeRs(rs);
	}
	return num;
}

@Override
public List<Shopstore> infermation(long position, int szie) {
	String sql ="select s.*,p.produceName,o.shopName from produce p , shopstore s , shop o where p.produceId = s.produceId and s.shopId = o.shopId limit ?,?  ";
	
	Object [] objects = {position,szie };
	
	ResultSet rs = execute_Query(sql, objects);
	
	List<Shopstore> shopStores = new ArrayList<Shopstore>();
	Shopstore shopStore = null;
	
	try {
		while(rs.next()) {
			int shopId = rs.getInt("shopId");
			int produceId = rs.getInt("produceId");
			int shopStoreId = rs.getInt("shopStoreId");
			int shopStoreNum = rs.getInt("shopStoreNum");
			String shopStoreTime = rs.getString("shopStoreTime");
			int outboundId = rs.getInt("outboundId");
			int employeeId = rs.getInt("employeeId");
			int shopStoreallNum = rs.getInt("shopStoreallNum");
			String produceName = rs.getString("produceName");
			String shopName = rs.getString("shopName");
			shopStore = new Shopstore(shopStoreId, shopStoreNum, shopStoreTime, shopId, produceId, outboundId, employeeId,shopStoreallNum,produceName,shopName);
			shopStores.add(shopStore);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		closeRs(rs);
	}
	return shopStores;
}

@Override
public boolean saleChangNum(Sale sale) {
	 String sql = "update shopstore set shopStoreNum=(shopStoreNum-?)  where produceId  =? and shopId=?";
	 int shopStoreNum = sale.getSaleNum();
	 int produceId = sale.getProduceId();
	 int shopId = sale.getShopId();
	 Object[] object= {shopStoreNum,produceId,shopId};
	 boolean b = execute_CUD(sql, object);
	return b;
}

@Override
public Shopstore byProduceId(int produceId,int shopId) {
	String sql ="select * from shopstore where produceId = ? and shopId =?";
	
	Object [] objects = {produceId,shopId};
	
	ResultSet rs = execute_Query(sql, objects);
	
	 
	Shopstore shopStore = null;
	
	try {
		if(rs.next()) {
			 
			int shopStoreId = rs.getInt("shopStoreId");
			int shopStoreNum = rs.getInt("shopStoreNum");
			String shopStoreTime = rs.getString("shopStoreTime");
			int outboundId = rs.getInt("outboundId");
			int employeeId = rs.getInt("employeeId");
			int shopStoreallNum = rs.getInt("shopStoreallNum");
			shopStore = new Shopstore(shopStoreId, shopStoreNum, shopStoreTime, shopId, produceId, outboundId, employeeId,shopStoreallNum,null,null);
			 
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		closeRs(rs);
	}
	return shopStore;
}
	
}
