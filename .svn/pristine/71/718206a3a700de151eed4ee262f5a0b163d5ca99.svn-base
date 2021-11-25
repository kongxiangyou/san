package org.db.psd.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.db.psd.base.Execute_CRUD;
import org.db.psd.dao.ProduceDAO;
import org.db.psd.dao.StoreDAO;
import org.db.psd.model.Produce;
import org.db.psd.model.Store;

public class ProduceDAOImplement extends Execute_CRUD implements ProduceDAO {

	@Override
	public boolean produceCreate(Produce produce) {
		boolean b = false;
		String sql = "insert into produce (produceName,produceISBN,produceDescribe,employeeId) value (?,?,?,?)";

		String produceName = produce.getProduceName();
		String produceISBN = produce.getProduceISBN();
		String produceDescribe = produce.getProduceDescribe();
		int employeeId = produce.getEmployeeId();

		Object[] objects = { produceName, produceISBN, produceDescribe, employeeId };

		int produceId = execute_C_Key(sql, objects);

		if (produceId > 0) {
			StoreDAO storeDAO = new StoreDAOImplement();
			Store store = new Store(0, 0, produceId, 0, 0);
			b = storeDAO.storeCreate(store);
			if(b) {
				System.out.println("库存创建成功");
			}else {
				System.out.println("库存创建失败");
			}
		}

		return b;
	}

	@Override
	public boolean produceUpdate(Produce produce) {
		String sql = "update produce set produceName = ? ,produceISBN = ?,produceDescribe= ?,employeeId = ? where produceId = ? ";

		int produceId = produce.getProduceId();
		String produceName = produce.getProduceName();
		String produceISBN = produce.getProduceISBN();
		String produceDescribe = produce.getProduceDescribe();
		int employeeId = produce.getEmployeeId();

		Object[] objects = { produceName, produceISBN, produceDescribe, employeeId, produceId };

		boolean b = execute_CUD(sql, objects);

		return b;
	}

	/**
	 * 通过id号查询商品信息
	 */
	@Override
	public Produce producebyId(int produceId) {
		String sql = "select * from Produce where produceId =?";

		Object[] objects = { produceId };
		ResultSet rs = execute_Query(sql, objects);
		Produce produce = null;
		try {
			if (rs.next()) {
				String produceName = rs.getString("produceName");
				String produceISBN = rs.getString("produceISBN");
				String produceDescribe = rs.getString("produceDescribe");
				int employeeId = rs.getInt("employeeId");
				produce = new Produce(produceId, produceName, produceISBN, produceDescribe, employeeId,0,null);
			} else {
				produce = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeRs(rs);
		}
		return produce;
	}

	@Override
	/**
	 * 点击列表查询商品所有信息
	 */
	public List<Produce> produceList(long position, int size) {
		String sql = "select p.*,s.shopstoreNum,o.shopName from produce p , shopstore s , shop o where p.produceId = s.produceId and s.shopId = o.shopId limit ?,? ";
		Object[] object = { position, size };
		ResultSet rs = execute_Query(sql, object);
		List<Produce> produces = new ArrayList<Produce>(); // 用来存储数据
		Produce produce = null;
		try {
			while (rs.next()) {
				int produceId = rs.getInt("produceId");
				String produceName = rs.getString("produceName");
				String produceISBN = rs.getString("produceISBN");
				String produceDescribe = rs.getString("produceDescribe");
				int employeeId = rs.getInt("employeeId");
				int shopstoreNum = rs.getInt("shopstoreNum");
				String shopName = rs.getString("shopName");
				produce = new Produce(produceId, produceName, produceISBN, produceDescribe, employeeId,shopstoreNum,shopName);
				produces.add(produce);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeRs(rs);
		}
		return produces;
	}

	@Override
	public List<Produce> infermation(long position, int size) {
		String sql = "select * from produce limit ?,?";
		Object[] object = { position, size };
		ResultSet rs = execute_Query(sql, object);
		List<Produce> produces = new ArrayList<Produce>(); // 用来存储数据
		Produce produce = null;
		try {
			while (rs.next()) {
				int produceId = rs.getInt("produceId");
				String produceName = rs.getString("produceName");
				String produceISBN = rs.getString("produceISBN");
				// String produceDescribe = rs.getString("produceDescribe");
				int employeeId = rs.getInt("employeeId");
				produce = new Produce(produceId, produceName, produceISBN, null, employeeId,0,null);
				produces.add(produce);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeRs(rs);
		}
		return produces;
	}

	@Override
	public long allrow() {
		String sql ="select count(*) from produce";
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

}