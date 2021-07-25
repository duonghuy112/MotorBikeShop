package com.tromic.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tromic.admin.common.Constant;
import com.tromic.controller.filter.CountViewFilter;
import com.tromic.persistence.Order;
import com.tromic.persistence.User;
import com.tromic.service.OrderService;
import com.tromic.service.ProductService;
import com.tromic.service.ShippingService;
import com.tromic.service.UserService;
import com.tromic.service.impl.OrderServiceImpl;
import com.tromic.service.impl.ProductServiceImpl;
import com.tromic.service.impl.ShippingServiceImpl;
import com.tromic.service.impl.UserServiceImpl;

@WebServlet("/Admin/Dashboard")
public class DashboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UserService userService;
	private static OrderService orderService;
	private static ProductService productService;
	private static ShippingService shippingService;
	
	static {
		userService = new UserServiceImpl();
		orderService = new OrderServiceImpl();
		productService = new ProductServiceImpl();
		shippingService = new ShippingServiceImpl();
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		int view = CountViewFilter.view;
		User user = (User) request.getSession().getAttribute(com.tromic.common.Constant.SESSION_USER);
		double earning = orderService.getAll()
				.stream().filter(o -> o.getStatus() == 3)
				.mapToDouble(Order::getTotalPrice)
				.sum();
		int totalUser = userService.getAll().size();
		int totalOrder = orderService.getAll().size();
		int totalProduct = productService.getAll().size();
		int totalShipping = shippingService.getAll().size();
		
		request.setAttribute("user", user);
		request.setAttribute("view", view);
		request.setAttribute("earning", earning);
		request.setAttribute("totalUser", totalUser);
		request.setAttribute("totalOrder", totalOrder);
		request.setAttribute("totalProduct", totalProduct);
		request.setAttribute("totalShipping", totalShipping);
		request.getRequestDispatcher(Constant.Path.DASHBOARD).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
