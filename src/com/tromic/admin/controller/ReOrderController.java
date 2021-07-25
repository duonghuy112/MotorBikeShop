package com.tromic.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tromic.service.OrderService;
import com.tromic.service.impl.OrderServiceImpl;

@WebServlet("/Admin/ReOrder")
public class ReOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static OrderService orderService;
	
	static {
		orderService = new OrderServiceImpl();
	}   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		if (orderService.reOrder(orderId)) {
			response.sendRedirect("OrdersList");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
