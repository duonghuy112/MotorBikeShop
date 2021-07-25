package com.tromic.service;

import java.util.List;

import com.tromic.persistence.Cart;
import com.tromic.persistence.Order;
import com.tromic.persistence.OrderDetail;


public interface OrderDetailService {
	
	List<OrderDetail> get(int orderId);
	
	boolean save(List<Cart> listCart, Order order);
}
