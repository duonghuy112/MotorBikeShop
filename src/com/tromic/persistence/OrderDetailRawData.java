package com.tromic.persistence;

import com.tromic.service.OrderService;
import com.tromic.service.ProductService;
import com.tromic.service.impl.OrderServiceImpl;
import com.tromic.service.impl.ProductServiceImpl;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetailRawData {
	
	private static OrderService orderService;
	private static ProductService productService;
	
	static {
		orderService = new OrderServiceImpl();
		productService = new ProductServiceImpl();
	}
	
	private Integer id;
	private Integer orderId;
	private Integer productId;
	private Integer quantity;
	
	public static OrderDetail transfer(OrderDetailRawData orderDetailRawData) {
		OrderDetail orderDetail = new OrderDetail();
		orderDetail.setId(orderDetailRawData.getId());
		orderDetail.setOrder(orderService.get(orderDetailRawData.getOrderId()));
		orderDetail.setProduct(productService.get(orderDetailRawData.getProductId()));
		orderDetail.setQuantity(orderDetailRawData.getQuantity());
		return orderDetail;
	}
}
