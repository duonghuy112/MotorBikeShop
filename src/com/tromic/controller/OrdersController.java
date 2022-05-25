package com.tromic.controller;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tromic.common.Constant;
import com.tromic.persistence.Order;
import com.tromic.persistence.User;
import com.tromic.service.OrderService;
import com.tromic.service.impl.OrderServiceImpl;

@WebServlet("/Orders")
public class OrdersController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderService orderService;
	
	public OrdersController() {
		orderService = new OrderServiceImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		User user = (User) request.getSession().getAttribute(Constant.SESSION_USER);
		List<Order> listOrder = orderService.getByUser(user.getId()).stream()
				.sorted(Comparator.comparing(Order::getId))
				.collect(Collectors.toList());
								
		if (listOrder.isEmpty()) {
			response.sendRedirect("Error404");
		} else {
			request.setAttribute("listOrder", listOrder);
			request.getRequestDispatcher(Constant.Path.ORDERS).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
