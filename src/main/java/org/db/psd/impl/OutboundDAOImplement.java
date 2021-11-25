package org.db.psd.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.db.psd.base.Execute_CRUD;
import org.db.psd.dao.OutboundDAO;
import org.db.psd.model.Outbound;

public class OutboundDAOImplement extends Execute_CRUD implements OutboundDAO {

	@Override
	public int outboundCreate(Outbound outbound) {
	
		 String sql = "insert into outbound(outboundNum, outboundTime, produceId, employeeId, inventoryId) value (?,?,?,?,?)";
		 Date date = new Date();
		 SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 
		 int outboundNum = outbound.getOutboundNum();
		 String outboundTime =  simpleDateFormat.format(date);
		 int produceId = outbound.getProduceId();
		 int employeeId = outbound.getEmployeeId();
		 int inventoryId = outbound.getInventoryId();	
		 
		 Object[] objects = {outboundNum,outboundTime, produceId, employeeId, inventoryId};
		 
		 boolean b = false;		
		 int outboundId = execute_C_Key(sql, objects);
		 if(outboundId!=0) {
			 StoreDAOImplement storeDAOImplement = new StoreDAOImplement();
			b= storeDAOImplement.storeOutboundChangeNumber(outbound);
			
			 if(b) {
				 System.out.println("库存修改成功");
			 }else {
				 System.out.println("库存修改失败");
			 } 
		 }
		return outboundId;
	}

	@Override
	public Outbound outboundById(int outboundId) {
		String sql = "select o.*,p.produceName , e.employeeName from outbound o , produce p ,employee e"
				+ "  where o.produceId = p.produceId and e.employeeId = o.employeeId and o.outboundId = ?";
		Object[] objects = {outboundId};
		Outbound outbound = null;
		ResultSet rs = execute_Query(sql, objects);
		try {
			if(rs.next()) {
				int outboundNum = rs.getInt("outboundNum");
				String outboundTime = rs.getString("outboundTime");
				int produceId = rs.getInt("produceId");
				int employeeId = rs.getInt("employeeId");
				int inventoryId = rs.getInt("inventoryId");
				String produceName = rs.getString("produceName");
				String employeeName = rs.getString("employeeName");
				outbound = new Outbound(outboundId, outboundNum, outboundTime, produceId, employeeId, inventoryId,produceName,employeeName);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeRs(rs);
		}
		
		return outbound;
	}

	@Override
	public List<Outbound> outboundList() {
		String sql = "select o.*,p.produceName , e.employeeName from outbound o , produce p ,employee e"
				+ " where o.produceId = p.produceId and e.employeeId = o.employeeId ";
		
		List<Outbound> outbounds = new ArrayList<Outbound>();
		ResultSet rs = execute_Query(sql, null);
		try {
			while(rs.next()) {
				int outboundId = rs.getInt("outboundId");
				int outboundNum = rs.getInt("outboundNum");
				String outboundTime = rs.getString("outboundTime");
				int produceId = rs.getInt("produceId");
				int employeeId = rs.getInt("employeeId");
				int inventoryId = rs.getInt("inventoryId");
				String produceName = rs.getString("produceName");
				String employeeName = rs.getString("employeeName");
				Outbound outbound = new Outbound(outboundId, outboundNum, outboundTime, produceId, employeeId, inventoryId,produceName,employeeName);
				outbounds.add(outbound);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeRs(rs);
		}
		
		return outbounds;
	}

	@Override
	public long allrow() {
		String sql ="select count(*) from outbound";
		long num = 0;
		ResultSet rs = execute_Query(sql, null);
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
	public List<Outbound> infermation(long position, int size) {
		String sql = "select o.*,p.produceName , e.employeeName from outbound o , produce p ,employee e"
				+ " where o.produceId = p.produceId and e.employeeId = o.employeeId limit ?,?";
		Object[]object= {position, size};
		List<Outbound> outbounds = new ArrayList<Outbound>();
		ResultSet rs = execute_Query(sql, object);
		try {
			while(rs.next()) {
				int outboundId = rs.getInt("outboundId");
				int outboundNum = rs.getInt("outboundNum");
				String outboundTime = rs.getString("outboundTime");
				int produceId = rs.getInt("produceId");
				int employeeId = rs.getInt("employeeId");
				int inventoryId = rs.getInt("inventoryId");
				String produceName = rs.getString("produceName");
				String employeeName = rs.getString("employeeName");
				Outbound outbound = new Outbound(outboundId, outboundNum, outboundTime,
						produceId, employeeId, inventoryId,produceName,employeeName);
				outbounds.add(outbound);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeRs(rs);
		}
		
		return outbounds;
	}

	@Override
	public Outbound outboundByProduceName(String produceName) {
		String sql = "select o.*,p.produceName , e.employeeName from outbound o , produce p ,employee e"
				+ "  where o.produceId = p.produceId and e.employeeId = o.employeeId and p.produceName = ?";
		Object[] objects = {produceName};
		Outbound outbound = null;
		ResultSet rs = execute_Query(sql, objects);
		try {
			if(rs.next()) {
				int outboundId = rs.getInt("outboundId");
				int outboundNum = rs.getInt("outboundNum");
				String outboundTime = rs.getString("outboundTime");
				int produceId = rs.getInt("produceId");
				int employeeId = rs.getInt("employeeId");
				int inventoryId = rs.getInt("inventoryId");
				//String produceName = rs.getString("produceName");
				String employeeName = rs.getString("employeeName");
				outbound = new Outbound(outboundId, outboundNum, outboundTime, produceId, employeeId, inventoryId,produceName,employeeName);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeRs(rs);
		}
		
		return outbound;
	}

}
