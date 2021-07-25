package com.tromic.admin.controller;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tromic.admin.common.Constant;
import com.tromic.persistence.Review;
import com.tromic.persistence.User;
import com.tromic.service.ReviewService;
import com.tromic.service.impl.ReviewServiceImpl;

@WebServlet("/Admin/ReviewList")
public class ReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ReviewService reviewService;
	
	static {
		reviewService = new ReviewServiceImpl();
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		User user = (User) request.getSession().getAttribute(com.tromic.common.Constant.SESSION_USER);
		List<Review> reviewList = reviewService.getAll();
		List<Review> publishedReviewList = reviewService.getAll()
				.stream()
				.filter(r -> r.getIsPublish() == 1)
				.collect(Collectors.toList());
		List<Review> hiddenReviewList = reviewService.getAll()
				.stream()
				.filter(r -> r.getIsPublish() == 0)
				.collect(Collectors.toList());
		
		request.setAttribute("user", user);
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("publishedReviewList", publishedReviewList);
		request.setAttribute("hiddenReviewList", hiddenReviewList);
		request.getRequestDispatcher(Constant.Path.REVIEW_LIST).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
