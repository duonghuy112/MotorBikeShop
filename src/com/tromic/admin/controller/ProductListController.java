package com.tromic.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tromic.admin.common.Constant;
import com.tromic.persistence.Product;
import com.tromic.persistence.User;
import com.tromic.service.ProductService;
import com.tromic.service.impl.ProductServiceImpl;

@WebServlet("/Admin/ProductList")
public class ProductListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ProductService productService;
	
	static {
		productService = new ProductServiceImpl();
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		User user = (User) request.getSession().getAttribute(com.tromic.common.Constant.SESSION_USER);
		List<Product> listProduct = productService.getAll();
		
		request.setAttribute("user", user);
		request.setAttribute("listProduct", listProduct);
		request.getRequestDispatcher(Constant.Path.PRODUCT_LIST).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
