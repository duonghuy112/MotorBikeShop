package com.tromic.persistence;

import java.sql.Date;

import com.tromic.service.ShippingService;
import com.tromic.service.UserService;
import com.tromic.service.impl.ShippingServiceImpl;
import com.tromic.service.impl.UserServiceImpl;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderRawData {
	
	private static UserService userService;
	private static ShippingService shippingService;
	
	static {
		userService = new UserServiceImpl();
		shippingService = new ShippingServiceImpl();
	}
	
	private Integer id;
	private Integer userId;
	private Integer shippingId;
	private Double totalPrice;
	private String note;
	private Integer status;
	private Date createDate;
	
	public static Order transfer(OrderRawData orderRawData) {
		Order order = new Order();
		order.setId(orderRawData.getId());
		order.setUser(userService.get(orderRawData.getUserId()));
		order.setShipping(shippingService.get(orderRawData.getShippingId()));
		order.setTotalPrice(orderRawData.getTotalPrice());
		order.setNote(orderRawData.getNote());
		order.setStatus(orderRawData.getStatus());
		order.setCreateDate(orderRawData.getCreateDate());
		return order;
	}
}
