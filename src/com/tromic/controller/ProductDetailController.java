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
import com.tromic.persistence.Comment;
import com.tromic.persistence.Product;
import com.tromic.service.CommentService;
import com.tromic.service.ProductService;
import com.tromic.service.impl.CommentServiceImpl;
import com.tromic.service.impl.ProductServiceImpl;

@WebServlet("/ProductDetail")
public class ProductDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ProductService productService;
	private static CommentService commentService;
	
	static {
		productService = new ProductServiceImpl();
		commentService = new CommentServiceImpl();
	}
	
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		int productId = Integer.parseInt(request.getParameter("productId"));
		Product product = productService.get(productId);
		List<Comment> listComment = commentService.getByProductId(productId)
				.stream()
				.sorted(Comparator.comparing(Comment::getCreateDate))
				.collect(Collectors.toList());
		int countComment = listComment.size();
		List<Product> newProduct = productService.getAll()
				.stream()
				.sorted(Comparator.comparing(Product::getCreateDate).reversed().thenComparing(Product::getName))
				.limit(5) 
				.collect(Collectors.toList());

		request.setAttribute("product", product);
		request.setAttribute("listComment", listComment);
		request.setAttribute("countComment", countComment);
		request.setAttribute("newProduct", newProduct);
		request.getRequestDispatcher(Constant.Path.PRODUCT_DETAIL).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
