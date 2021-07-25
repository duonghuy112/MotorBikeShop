package com.tromic.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tromic.common.Constant;
import com.tromic.persistence.Comment;
import com.tromic.persistence.User;
import com.tromic.service.CommentService;
import com.tromic.service.ProductService;
import com.tromic.service.impl.CommentServiceImpl;
import com.tromic.service.impl.ProductServiceImpl;

@WebServlet("/AddComment")
public class AddCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static CommentService commentService;
	private static ProductService productService;
	
	static {
		commentService = new CommentServiceImpl();
		productService = new ProductServiceImpl();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		int productId = Integer.parseInt(request.getParameter("productId"));
		String content = request.getParameter("content");
		
		Comment comment = new Comment();
		comment.setProduct(productService.get(productId));
		comment.setUser((User) request.getSession().getAttribute(Constant.SESSION_USER));
		comment.setContent(content);
		
		commentService.save(comment);
		response.sendRedirect("ProductDetail?productId=" + productId);
	}

}
