package com.tromic.dao;

import java.util.List;

import com.tromic.persistence.Cart;
import com.tromic.persistence.Order;
import com.tromic.persistence.OrderDetailRawData;


public interface OrderDetailDao {
	
	List<OrderDetailRawData> get(int orderId);
	
	boolean save(List<Cart> listCart, Order order);
}
