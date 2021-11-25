package org.db.psd.impl;

import java.sql.ResultSet;
import java.sql.SQLException; 
import java.util.ArrayList;
 
import java.util.List;

import org.db.psd.base.Execute_CRUD;
import org.db.psd.dao.SaleDAO;
import org.db.psd.model.Sale;

public class saleDAOImplement extends Execute_CRUD implements SaleDAO  {

	@Override
	public int create(Sale sale) { 
		String sql  ="insert into sale(salePrice, saleNum, proceeds, saleTime, employeeId, produceId, shopStoreId, shopId)value(?,?,?,now(),?,?,?,?)";
		 
		 double salePrice = sale.getSalePrice();
		 int saleNum = sale.getSaleNum() ;
		 double  proceeds = sale.getProceeds() ; 
		 
		 int employeeId = sale.getEmployeeId();
		 int produceId = sale.getProduceId();
		 int shopStoreId = sale.getShopStoreId();
		 int shopId = sale.getShopId();
		 Object[]object= {salePrice, saleNum, proceeds, employeeId, produceId, shopStoreId, shopId};
		 
		 int b = execute_C_Key(sql, object);
		return b;
	}

	@Override
	public long allrow() { 
		String sql = "select count(*) from sale";
		long i = 0;
		ResultSet rs = execute_Query(sql, null);
		try {
			if(rs.next()) {
				i = rs.getLong(1);
			}
		} catch (SQLException e) { 
			e.printStackTrace();
		}finally {
			closeRs(rs);
		}
		return i;
	}

	@Override
	public boolean update(Sale sale) { 
		String sql = "update sale set proceeds = (? * ?) where saleId =? ";
		 double salePrice = sale.getSalePrice();
		 int saleNum = sale.getSaleNum() ;
		 int saleId = sale.getSaleId();
		 Object[] object= {salePrice,saleNum,saleId};
		 boolean b = execute_CUD(sql, object);
		 if(b) {
			 System.out.println("得到总收入");
		 }else {
			 System.out.println("sale update失败");
		 }
		return b;
	}

	@Override
	public List<Sale> SaleList(long position, int size) {
		 String sql = "select s.*,p.produceName,o.shopName from sale s , produce p , shop o where s.produceId = p.produceId and s.shopId = o.shopId limit ?,?";
		 Object[]object= {position, size};
		 ResultSet rs = execute_Query(sql, object);
		 List<Sale> sales = new ArrayList<Sale>();
		 Sale sale = null;
		 try {
			while(rs.next()) {
				 int saleId = rs.getInt("saleId");
				 double salePrice = rs.getDouble("salePrice");
				 int saleNum = rs.getInt("saleNum");
				 double  proceeds = rs.getDouble("proceeds");
				 String saleTime = rs.getString("saleTime");
				 int employeeId = rs.getInt("employeeId");
				 int produceId = rs.getInt("produceId");
				 int shopStoreId = rs.getInt("shopStoreId");
				 int shopId = rs.getInt("shopId");
				   String produceName= rs.getString("produceName");
					  String shopName= rs.getString("shopName");
				 sale = new Sale(saleId, salePrice, saleNum, proceeds, saleTime, employeeId, produceId, shopStoreId, shopId,produceName,shopName);
				 sales.add(sale);
			}
		} catch (SQLException e) { 
			e.printStackTrace();
		}finally {
			closeRs(rs);
		}
		return sales;
	}

	@Override
	public List<Sale> ByMore(String wordkey, int type) {
		 String sql = null;
		 if(type==1) {
			 sql="select s.* from sale s inner join shop p on s.shopId = p.shopId and p.shopName=? ";
		 }else if(type==2) {
			 sql= "select * from sale where saleId = ? ";
		 }else if(type==3) {
			 sql="select s.* from sale s inner join produce p on s.produceId = p.produceId and p.produceName=? ";
		 }
		 Object[]object= {wordkey};
		 ResultSet rs = execute_Query(sql, object);
		 List<Sale> sales = new ArrayList<Sale>();
		 Sale sale = null;
		 try {
			while(rs.next()) {
				 int saleId = rs.getInt("saleId");
				 double salePrice = rs.getDouble("salePrice");
				 int saleNum = rs.getInt("saleNum");
				 double  proceeds = rs.getDouble("proceeds");
				 String saleTime = rs.getString("saleTime");
				 int employeeId = rs.getInt("employeeId");
				 int produceId = rs.getInt("produceId");
				 int shopStoreId = rs.getInt("shopStoreId");
				 int shopId = rs.getInt("shopId");
				   String produceName= rs.getString("produceName");
					  String shopName= rs.getString("shopName");
				 sale = new Sale(saleId, salePrice, saleNum, proceeds, saleTime, employeeId, produceId, shopStoreId, shopId,produceName,shopName);
				 sales.add(sale);
			}
		} catch (SQLException e) { 
			e.printStackTrace();
		}finally {
			closeRs(rs);
		}
		return sales;
	}

}
