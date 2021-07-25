package com.tromic.controller;

import java.io.IOException;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tromic.common.Constant;
import com.tromic.persistence.Product;
import com.tromic.service.ProductService;
import com.tromic.service.impl.ProductServiceImpl;

@WebServlet("/AddToWishlist")
public class AddToWishlistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ProductService productService;
	
	static {
		productService = new ProductServiceImpl();
	}
       
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		int productId = Integer.parseInt(request.getParameter("productId"));
		Product product = productService.get(productId);
		Set<Product> setProduct = (Set<Product>) request.getSession().getAttribute(Constant.SESSION_WISHLIST);
		if (setProduct == null) {
			setProduct = new LinkedHashSet<>();
			setProduct.add(product);
		} else {
			setProduct.add(product);
		}
		request.getSession().setAttribute(Constant.SESSION_WISHLIST, setProduct);
		response.sendRedirect("Shop");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
