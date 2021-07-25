package com.tromic.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tromic.connection.DatabaseConnection;
import com.tromic.dao.OrderDao;
import com.tromic.persistence.Order;
import com.tromic.persistence.OrderRawData;
import com.tromic.utils.SqlUtils;

public class OrderDaoImpl implements OrderDao {

	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public OrderDaoImpl() {
		conn = DatabaseConnection.getConnection();
	}
	
	@Override
	public List<OrderRawData> getAll() {
		List<OrderRawData> list = new ArrayList<>();
		String sql = "SELECT * \r\n"
				+ "FROM [Order]";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				OrderRawData order = new OrderRawData();
				transformer(order);
				list.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return list;
	}

	@Override
	public List<OrderRawData> getByUser(int userId) {
		List<OrderRawData> list = new ArrayList<>();
		String sql = "SELECT * \r\n"
				+ "FROM [Order] \r\n"
				+ "WHERE Account_id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, userId);
			rs = pst.executeQuery();
			while (rs.next()) {
				OrderRawData order = new OrderRawData();
				transformer(order);
				list.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return list;
	}

	@Override
	public OrderRawData get(int orderId) {
		OrderRawData order = null;
		String sql = "SELECT * \r\n"
				+ "FROM [Order] \r\n"
				+ "WHERE Order_id = ? ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, orderId);
			rs = pst.executeQuery();
			if (rs.next()) {
				order = new OrderRawData();
				transformer(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return order;
	}

	@Override
	public int saveReturnId(Order order) {
		int id = 0;
		String sql = "INSERT INTO [Order] \r\n"
				+ "					([Account_id],\r\n"
				+ "					[Shipping_id],\r\n"
				+ "					[TotalPrice],\r\n"
				+ "					[Note],\r\n"
				+ "					[Status],\r\n"
				+ "					[CreateDate])\r\n"
				+ "VALUES (?,?,?,?,?,GETDATE())";
		try {
			pst = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pst.setInt(1, order.getUser().getId());
			pst.setInt(2, order.getShipping().getId());
			pst.setDouble(3, order.getTotalPrice());
			pst.setString(4, order.getNote());
			pst.setInt(5, order.getStatus());
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
	public boolean delete(int orderId) {
		boolean isDeleted = false;
		String sql = "DELETE FROM [Order] \r\n"
				+ "WHERE Order_id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, orderId);
			isDeleted = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(pst);
		}
		return isDeleted;
	}

	@Override
	public boolean updateProcessing(int orderId) {
		boolean isUpdated = false;
		String sql = "UPDATE [Order]\r\n"
				+ "SET Status = 2\r\n"
				+ "WHERE Order_id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, orderId);
			isUpdated = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(pst);
		}
		return isUpdated;
	}

	@Override
	public boolean updateCompleted(int orderId) {
		boolean isUpdated = false;
		String sql = "UPDATE [Order]\r\n"
				+ "SET Status = 3\r\n"
				+ "WHERE Order_id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, orderId);
			isUpdated = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(pst);
		}
		return isUpdated;
	}

	@Override
	public boolean updateCanceled(int orderId) {
		boolean isUpdated = false;
		String sql = "UPDATE [Order]\r\n"
				+ "SET Status = 0\r\n"
				+ "WHERE Order_id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, orderId);
			isUpdated = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(pst);
		}
		return isUpdated;
	}

	@Override
	public boolean reOrder(int orderId) {
		boolean isUpdated = false;
		String sql = "UPDATE [Order]\r\n"
				+ "SET Status = 1\r\n"
				+ "WHERE Order_id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, orderId);
			isUpdated = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(pst);
		}
		return isUpdated;
	}
	
	private void transformer(OrderRawData order) throws SQLException {
		order.setId(rs.getInt(1));
		order.setUserId(rs.getInt(2));
		order.setShippingId(rs.getInt(3));
		order.setTotalPrice(rs.getDouble(4));
		order.setNote(rs.getString(5));
		order.setStatus(rs.getInt(6));
		order.setCreateDate(rs.getDate(7));
	}
}
