package com.tromic.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tromic.connection.DatabaseConnection;
import com.tromic.dao.ShippingDao;
import com.tromic.persistence.Shipping;
import com.tromic.utils.SqlUtils;

public class ShippingDaoImpl implements ShippingDao {

	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public ShippingDaoImpl() {
		conn = DatabaseConnection.getConnection();
	}
	
	@Override
	public List<Shipping> getAll() {
		List<Shipping> list = new ArrayList<>();
		String sql = "SELECT * \r\n"
				+ "FROM [Shipping]";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				Shipping shipping = new Shipping();
				transformer(shipping);
				list.add(shipping);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return list;
	}

	@Override
	public Shipping get(int shippingId) {
		Shipping shipping = null;
		String sql = "SELECT * \r\n"
				+ "FROM [Shipping] \r\n"
				+ "WHERE [Shipping_id] = ? ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, shippingId);
			rs = pst.executeQuery();
			if (rs.next()) {
				shipping = new Shipping();
				transformer(shipping);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return shipping;
	}

	@Override
	public int saveReturnId(Shipping shipping) {
		int id = 0;
		String sql = "INSERT INTO [dbo].[Shipping]\r\n"
				+ "           ([Fullname]\r\n"
				+ "           ,[Phone]\r\n"
				+ "           ,[Address]\r\n"
				+ "           ,[TotalPrice])\r\n"
				+ "     VALUES (?,?,?,?)";
		try {
			pst = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pst.setString(1, shipping.getFullname());
			pst.setString(2, shipping.getPhone());
			pst.setString(3, shipping.getAddress());
			pst.setDouble(4, shipping.getTotalPrice());
			if (pst.executeUpdate() > 0) {
				rs = pst.getGeneratedKeys();
				rs.next();
				id = rs.getInt(1);
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return id;
	}

	@Override
	public boolean delete(int shippingId) {
		boolean isDeleted = false;
		String sql = "DELETE FROM [Shipping] \r\n"
				+ "WHERE [Shipping_id] = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, shippingId);
			isDeleted = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(pst);
		}
		return isDeleted;
	}
	
	private void transformer(Shipping shipping) throws SQLException {
		shipping.setId(rs.getInt(1));
		shipping.setFullname(rs.getString(2));
		shipping.setPhone(rs.getString(3));
		shipping.setAddress(rs.getString(4));
		shipping.setTotalPrice(rs.getDouble(5));
	}

}
