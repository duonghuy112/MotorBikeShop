package com.tromic.admin.controller;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tromic.admin.common.Constant;
import com.tromic.persistence.Order;
import com.tromic.persistence.User;
import com.tromic.service.OrderService;
import com.tromic.service.impl.OrderServiceImpl;

@WebServlet("/Admin/OrdersList")
public class OrdersListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
private static OrderService orderService;
	
	static {
		orderService = new OrderServiceImpl();
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		User user = (User) request.getSession().getAttribute(com.tromic.common.Constant.SESSION_USER);
		List<Order> listOrder = orderService.getAll();
		List<Order> pendingOrder = orderService.getAll()
				.stream()
				.filter(o -> o.getStatus() == 1)
				.collect(Collectors.toList());
		List<Order> processingOrder = orderService.getAll()
				.stream()
				.filter(o -> o.getStatus() == 2)
				.collect(Collectors.toList());
		List<Order> completedOrder = orderService.getAll()
				.stream()
				.filter(o -> o.getStatus() == 3)
				.collect(Collectors.toList());
		List<Order> canceledOrder = orderService.getAll()
				.stream()
				.filter(o -> o.getStatus() == 0)
				.collect(Collectors.toList());
		
		request.setAttribute("user", user);
		request.setAttribute("listOrder", listOrder);
		request.setAttribute("pendingOrder", pendingOrder);
		request.setAttribute("processingOrder", processingOrder);
		request.setAttribute("completedOrder", completedOrder);
		request.setAttribute("canceledOrder", canceledOrder);
		request.getRequestDispatcher(Constant.Path.ORDERS_LIST).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
