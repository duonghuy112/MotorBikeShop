package com.tromic.dao;

import java.util.List;

import com.tromic.persistence.Order;
import com.tromic.persistence.OrderRawData;


public interface OrderDao {
	List<OrderRawData> getAll();
	
	List<OrderRawData> getByUser(int userId);
	
	OrderRawData get(int orderId);
	
	int saveReturnId(Order order);
	
	boolean delete(int orderId);
	
	boolean updateProcessing(int orderId);
	
	boolean updateCompleted(int orderId);
	
	boolean updateCanceled(int orderId);
	
	boolean reOrder(int orderId);
}
