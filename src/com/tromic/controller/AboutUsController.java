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
import com.tromic.persistence.Review;
import com.tromic.service.ReviewService;
import com.tromic.service.impl.ReviewServiceImpl;

@WebServlet("/About")
public class AboutUsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ReviewService reviewService;
	
	static {
		reviewService = new ReviewServiceImpl();
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		List<Review> listReview = reviewService.getAll().stream()
				.filter(r -> r.getIsPublish() == 1)
				.sorted(Comparator.comparing(Review::getCreateDate))
				.collect(Collectors.toList());
								
		request.setAttribute("listReview", listReview);
		request.getRequestDispatcher(Constant.Path.ABOUT).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
