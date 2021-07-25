package com.tromic.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tromic.connection.DatabaseConnection;
import com.tromic.dao.SupplierDao;
import com.tromic.persistence.Supplier;
import com.tromic.utils.SqlUtils;

public class SupplierDaoImpl implements SupplierDao{

	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public SupplierDaoImpl() {
		conn = DatabaseConnection.getConnection();
	}
	
	@Override
	public List<Supplier> getAll() {
		List<Supplier> list = new ArrayList<>();
		String sql = "SELECT * \r\n"
				+ "FROM [Supplier]";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				Supplier supplier = new Supplier();
				transformer(supplier);
				list.add(supplier);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return list;
	}


	@Override
	public Supplier get(int supplierId) {
		Supplier supplier = null;
		String sql = "SELECT * \r\n"
				+ "FROM [Supplier] \r\n"
				+ "WHERE [Supplier_id] = ? ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, supplierId);
			rs = pst.executeQuery();
			if (rs.next()) {
				supplier = new Supplier();
				transformer(supplier);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return supplier;
	}

	private void transformer(Supplier supplier) throws SQLException {
		supplier.setId(rs.getInt(1));
		supplier.setName(rs.getString(2));
		supplier.setDescription(rs.getString(3));
	}
}
