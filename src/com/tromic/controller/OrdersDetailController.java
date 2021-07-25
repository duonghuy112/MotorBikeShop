package com.tromic.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tromic.common.Constant;
import com.tromic.persistence.OrderDetail;
import com.tromic.service.OrderDetailService;
import com.tromic.service.impl.OrderDetailServiceImpl;

@WebServlet("/OrdersDetail")
public class OrdersDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static OrderDetailService orderDetailService;
	
	static {
		orderDetailService = new OrderDetailServiceImpl();
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		List<OrderDetail> listOrderDetail = orderDetailService.get(orderId);
		double totalPrice = listOrderDetail.stream()
				.mapToDouble(o -> o.getProduct().getPrice() * o.getQuantity())
				.sum();
		
		request.setAttribute("listOrderDetail", listOrderDetail);
		request.setAttribute("totalPrice", totalPrice);
		request.getRequestDispatcher(Constant.Path.ORDERS_DETAIL).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
