package com.tromic.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import com.tromic.dao.OrderDao;
import com.tromic.dao.impl.OrderDaoImpl;
import com.tromic.persistence.Order;
import com.tromic.persistence.OrderRawData;
import com.tromic.service.OrderService;

public class OrderServiceImpl implements OrderService {
	
	private OrderDao orderDao;
	
	public OrderServiceImpl() {
		orderDao = new OrderDaoImpl();
	}

	@Override
	public List<Order> getAll() {
		return orderDao.getAll()
				.stream()
				.map(OrderRawData::transfer)
				.collect(Collectors.toList());
	}

	@Override
	public List<Order> getByUser(int userId) {
		return orderDao.getByUser(userId)
				.stream()
				.map(OrderRawData::transfer)
				.collect(Collectors.toList());
	}

	@Override
	public Order get(int orderId) {
		return OrderRawData.transfer(orderDao.get(orderId));
	}

	@Override
	public int saveReturnId(Order order) {
		return orderDao.saveReturnId(order);
	}

	@Override
	public boolean delete(int orderId) {
		return orderDao.delete(orderId);
	}

	@Override
	public boolean updateProcessing(int orderId) {
		return orderDao.updateProcessing(orderId);
	}

	@Override
	public boolean updateCompleted(int orderId) {
		return orderDao.updateCompleted(orderId);
	}

	@Override
	public boolean updateCanceled(int orderId) {
		return orderDao.updateCanceled(orderId);
	}

	@Override
	public boolean reOrder(int orderId) {
		return orderDao.reOrder(orderId);
	}

}
