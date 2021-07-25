package com.tromic.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import com.tromic.dao.OrderDetailDao;
import com.tromic.dao.impl.OrderDetailDaoImpl;
import com.tromic.persistence.Cart;
import com.tromic.persistence.Order;
import com.tromic.persistence.OrderDetail;
import com.tromic.persistence.OrderDetailRawData;
import com.tromic.service.OrderDetailService;

public class OrderDetailServiceImpl implements OrderDetailService{

	private OrderDetailDao orderDetailDao;
	
	public OrderDetailServiceImpl() {
		orderDetailDao = new OrderDetailDaoImpl();
	}
	
	@Override
	public List<OrderDetail> get(int orderId) {
		return orderDetailDao.get(orderId)
				.stream()
				.map(OrderDetailRawData::transfer)
				.collect(Collectors.toList());
	}

	@Override
	public boolean save(List<Cart> listCart, Order order) {
		return orderDetailDao.save(listCart, order);
	}

}
