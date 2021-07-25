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
import com.tromic.persistence.Product;
import com.tromic.persistence.Review;
import com.tromic.service.ProductService;
import com.tromic.service.ReviewService;
import com.tromic.service.impl.ProductServiceImpl;
import com.tromic.service.impl.ReviewServiceImpl;

@WebServlet("/Home")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ProductService productService;
	private static ReviewService reviewService;
	
	static {
		productService = new ProductServiceImpl();
		reviewService = new ReviewServiceImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		List<Product> newProduct = productService.getAll().stream()
				.sorted(Comparator.comparing(Product::getCreateDate).reversed().thenComparing(Product::getName))
				.limit(5)
				.collect(Collectors.toList());
		List<Review> listReview = reviewService.getAll().stream()
				.filter(r -> r.getIsPublish() == 1)
				.sorted(Comparator.comparing(Review::getCreateDate))
				.collect(Collectors.toList());

		request.setAttribute("newProduct", newProduct);
		request.setAttribute("listReview", listReview);
		request.getRequestDispatcher(Constant.Path.HOME).forward(request, response);
	}
}
