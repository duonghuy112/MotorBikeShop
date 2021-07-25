package com.tromic.service;

import java.util.List;

import com.tromic.persistence.Order;


public interface OrderService {
	List<Order> getAll();
	
	List<Order> getByUser(int userId);
	
	Order get(int orderId);
	
	int saveReturnId(Order order);
	
	boolean delete(int orderId);
	
	boolean updateProcessing(int orderId);
	
	boolean updateCompleted(int orderId);
	
	boolean updateCanceled(int orderId);
	
	boolean reOrder(int orderId);
}
