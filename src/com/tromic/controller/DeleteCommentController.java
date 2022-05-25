package com.tromic.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tromic.service.CommentService;
import com.tromic.service.impl.CommentServiceImpl;

@WebServlet("/DeleteComment")
public class DeleteCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CommentService commentService;
	
	public DeleteCommentController() {
		commentService = new CommentServiceImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		int productId = Integer.parseInt(request.getParameter("productId"));
		int commentId = Integer.parseInt(request.getParameter("commentId"));
		if (commentService.delete(commentId)) {
			response.sendRedirect("ProductDetail?productId=" + productId);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
