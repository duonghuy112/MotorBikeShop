package com.tromic.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.tromic.connection.DatabaseConnection;
import com.tromic.dao.OrderDetailDao;
import com.tromic.persistence.Cart;
import com.tromic.persistence.Order;
import com.tromic.persistence.OrderDetailRawData;
import com.tromic.utils.SqlUtils;

public class OrderDetailDaoImpl implements OrderDetailDao{

	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public OrderDetailDaoImpl() {
		conn = DatabaseConnection.getConnection();
	}
	
	@Override
	public List<OrderDetailRawData> get(int orderId) {
		List<OrderDetailRawData> list = new ArrayList<>();
		String sql = "SELECT * \r\n"
				+ "FROM [OrderDetail] \r\n"
				+ "WHERE Order_id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, orderId);
			rs = pst.executeQuery();
			while (rs.next()) {
				OrderDetailRawData orderDetail = new OrderDetailRawData();
				transformer(orderDetail);
				list.add(orderDetail);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return list;
	}

	@Override
	public boolean save(List<Cart> listCart, Order order) {
		boolean isSaved = false;
		String sql = "INSERT INTO [OrderDetail]\r\n"
				+ "						([Order_id],\r\n"
				+ "						[Product_id],\r\n"
				+ "						[Quantity])\r\n"
				+ "VALUES (?,?,?)";
		try {
			pst = conn.prepareStatement(sql);
			for (Cart cart : listCart) {
				pst.setInt(1, order.getId());
				pst.setInt(2, cart.getProduct().getId());
				pst.setInt(3, cart.getQuantity());
				pst.addBatch();
			}
			isSaved = Arrays.stream(pst.executeBatch()).sum() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isSaved;
	}
	
	private void transformer(OrderDetailRawData orderDetail) throws SQLException {
		orderDetail.setId(rs.getInt(1));
		orderDetail.setOrderId(rs.getInt(2));
		orderDetail.setProductId(rs.getInt(3));
		orderDetail.setQuantity(rs.getInt(4));
	}

}
