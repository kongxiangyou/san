package org.db.psd.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.db.psd.base.Execute_CRUD;
import org.db.psd.dao.ShopDAO;
import org.db.psd.model.Shop;
import org.db.psd.model.Shopstore;

public class ShopDAOImplement extends Execute_CRUD implements ShopDAO {

	@Override
	public int shopCreate(Shop shop) {
		String sql = "insert into shop (shopName,shopAddress,shopPhone,employeeId) value (?,?,?,0)";
		String shopName = shop.getShopName();
		String shopAddress = shop.getShopAddress();
		String shopPhone = shop.getShopPhone();
		Object[] object = { shopName, shopAddress, shopPhone };
	
		int shopId = execute_C_Key(sql, object);
//		if(shopId!=0) {
//			ShopStoreDAOImplement shopStoreDAOImplement = new ShopStoreDAOImplement();
//			Shopstore shopstore = new Shopstore(0, 0, null, shopId, 0, 0, 0, 0);
//				boolean b =  shopStoreDAOImplement.shopStoreCreate(shopstore);
//		}
		return shopId;
	}

	@Override
	public Shop shopById(int shopId) {
		String sql = "select s.*, e.employeeName from shop s inner join employee e on s.employeeId = e.employeeId and s.shopId = ?";
		Object[] object = { shopId };
		Shop shop = null;
		ResultSet rs = execute_Query(sql, object);
		try {
			if (rs.next()) {
				String shopName = rs.getString("shopName");
				String shopAddress = rs.getString("shopAddress");
				String shopPhone = rs.getString("shopPhone");
				int employeeId = rs.getInt("employeeId");
				String employeeName = rs.getString("employeeName");
				shop = new Shop(shopId, shopName, shopAddress, shopPhone,employeeId,employeeName);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeRs(rs);
		}
		return shop;
	}

	@Override
	public boolean shopUpdate(Shop shop) {
		
		String sql = "update shop set shopName = ?,shopAddress = ?,shopPhone = ? where shopId = ?";
		
		int shopId = shop.getShopId();
		String shopName = shop.getShopName();
		String shopAddress = shop.getShopAddress();
		String shopPhone = shop.getShopPhone();
		Object[] object = { shopName, shopAddress, shopPhone, shopId };
		
		boolean b = execute_CUD(sql, object);
		
		return b;
	}

	@Override
	public List<Shop> shopList(int shopId) {
		String sql="select s.*, e.employeeName from shop s inner join employee e on s.employeeId = e.employeeId and s.shopId = ? ";
		Object[] object= {shopId};
		List<Shop> shops=new ArrayList<Shop>();
		
		Shop shop=null;
		ResultSet rs=execute_Query(sql, object);
		try {
			while(rs.next()) {
				//int shopId=rs.getInt("shopId") ;
			    String shopName =rs.getString("shopName");
			    String shopAddress =rs.getString("shopAddress");
			    String shopPhone=rs.getString("shopPhone");
			    int employeeId = rs.getInt("employeeId");
				String employeeName = rs.getString("employeeName");
			    shop=new Shop(shopId, shopName, shopAddress, shopPhone,employeeId,employeeName);
			    shops.add(shop);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeRs(rs);
		}
		return shops;
	}

	@Override
	public long allrow() {
		String sql = "select count(*) from shop";
		ResultSet rs = execute_Query(sql, null);
		long num = 0;
		try {
			if(rs.next()) {
				num = rs.getLong(1);
			}
		} catch (SQLException e) { 
			e.printStackTrace();
		}finally {
			closeRs(rs);
		}
		return num;
	}

	@Override
	public List<Shop> infermation(long position, int size) {
		String sql="select * from shop limit ?,? ";
		Object[]object= {position,size};
		List<Shop> shops=new ArrayList<Shop>();
		Shop shop=null;
		ResultSet rs=execute_Query(sql, object);
		try {
			while(rs.next()) {
				int shopId=rs.getInt("shopId") ;
			    String shopName =rs.getString("shopName");
			    String shopAddress =rs.getString("shopAddress");
			    String shopPhone=rs.getString("shopPhone");
			    shop=new Shop(shopId, shopName, shopAddress, shopPhone,0,null);
			    shops.add(shop);
			}
		} catch (SQLException e) { 
			e.printStackTrace();
		}finally {
			closeRs(rs);
		}
		return shops;
	}

	@Override
	public List<Shop> shopByMore(String wordkey, int type) {
		 String sql = null;
		 if(type==1) {
			 sql= "select  * from shop where shopName=?";
		 }else if(type==2) {
			 sql= "select  * from shop where shopPhone=?";
		 }else if(type==3) {
			 sql= "select  * from shop where shopAddress=?";
		 }
		 Object[] objects= {wordkey};
		 List<Shop> shops =new ArrayList<Shop>();
			Shop shop=null;
			ResultSet rs=execute_Query(sql, objects);
			try {
				while(rs.next()) {
					int shopId=rs.getInt("shopId") ;
				    String shopName =rs.getString("shopName");
				    String shopAddress =rs.getString("shopAddress");
				    String shopPhone=rs.getString("shopPhone");
				    shop=new Shop(shopId, shopName, shopAddress, shopPhone,0,null);
				    shops.add(shop);
				}
			} catch (SQLException e) { 
				e.printStackTrace();
			}finally {
				closeRs(rs);
			}
			return shops;
	}

	@Override
	public Shop shopByName(String shopName) {
		String sql = "select * from shop where shopName = ?";
		Object[] object = { shopName };
		Shop shop = null;
		ResultSet rs = execute_Query(sql, object);
		try {
			if (rs.next()) {
				
				int shopId = rs.getInt("shopId");
				String shopAddress = rs.getString("shopAddress");
				String shopPhone = rs.getString("shopPhone");
				shop = new Shop(shopId, shopName, shopAddress, shopPhone,0,null);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeRs(rs);
		}
		return shop;
	}

	@Override
	public boolean shopUpdate(int shopId, int employeeId) {
		 String sql = "update shop set employeeId = ? where shopId = ?";
		 Object[] ojbect = {employeeId,shopId};
		 boolean b = execute_CUD(sql, ojbect);
		 if(b) {
			 System.out.println("employeeId update success");
		 }else {
			 System.out.println("employeeId update false");
		 }
		return b;
	}

	@Override
	public List<Shop> shopList() {
		String sql="select * from shop  ";
		 
		List<Shop> shops=new ArrayList<Shop>();
		
		Shop shop=null;
		ResultSet rs=execute_Query(sql, null);
		try {
			while(rs.next()) {
				int shopId=rs.getInt("shopId") ;
			    String shopName =rs.getString("shopName");
			    String shopAddress =rs.getString("shopAddress");
			    String shopPhone=rs.getString("shopPhone");
			    int employeeId = rs.getInt("employeeId");
				//String employeeName = rs.getString("employeeName");
			    shop=new Shop(shopId, shopName, shopAddress, shopPhone,employeeId,null);
			    shops.add(shop);
			}
		} catch (SQLException e) { 
			e.printStackTrace();
		}finally {
			closeRs(rs);
		}
		return shops;
	}

	@Override
	public boolean shopJudgeEmployee(int shopId, int employeeId) {
		 String sql = "select count(*) from shop where shopId=? and employeeId= ?";
		 Object[]object = {shopId,  employeeId};
		 boolean b = false;
		 ResultSet rs = execute_Query(sql, object);
		 try {
			if(rs.next()) {
				 int i = rs.getInt(1);
				 if(i>0) {
					 b=true;
				 }
			 }
		} catch (SQLException e) { 
			e.printStackTrace();
		}finally {
			closeRs(rs);
		}
		return b;
	}

}
