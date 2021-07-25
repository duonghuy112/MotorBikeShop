package com.tromic.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tromic.admin.common.Constant;
import com.tromic.persistence.Order;
import com.tromic.persistence.OrderDetail;
import com.tromic.persistence.User;
import com.tromic.service.OrderDetailService;
import com.tromic.service.OrderService;
import com.tromic.service.UserService;
import com.tromic.service.impl.OrderDetailServiceImpl;
import com.tromic.service.impl.OrderServiceImpl;
import com.tromic.service.impl.UserServiceImpl;

@WebServlet("/Admin/OrderDetail")
public class OrderDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UserService userService;
	private static OrderService orderService;
	private static OrderDetailService orderDetailService;
	
	static {
		userService = new UserServiceImpl();
		orderService = new OrderServiceImpl();
		orderDetailService = new OrderDetailServiceImpl();
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		List<OrderDetail> orderDetailList = orderDetailService.get(orderId);
		Order order = orderService.get(orderId);
		User user = userService.get(order.getUser().getId());
		double totalPrice = orderDetailList.stream()
				.mapToDouble(o -> o.getProduct().getPrice() * o.getQuantity())
				.sum();
		
		request.setAttribute("order", order);
		request.setAttribute("user", user);
		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("orderDetailList", orderDetailList);
		request.getRequestDispatcher(Constant.Path.ORDER_DETAIL).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
