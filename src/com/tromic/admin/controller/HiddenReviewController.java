package com.tromic.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tromic.service.ReviewService;
import com.tromic.service.impl.ReviewServiceImpl;


@WebServlet("/Admin/HiddenReview")
public class HiddenReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ReviewService reviewService;
	
	static {
		reviewService = new ReviewServiceImpl();
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		if (reviewService.updateHidden(reviewId)) {
			response.sendRedirect("ReviewList");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
