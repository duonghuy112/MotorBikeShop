package com.tromic.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tromic.common.Constant;
import com.tromic.persistence.User;
import com.tromic.service.UserService;
import com.tromic.service.impl.UserServiceImpl;

@WebServlet("/UpdateProfile")
public class UpdateProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService;
	
	public UpdateProfileController() {
		userService = new UserServiceImpl();
	}
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		String fullName = request.getParameter("fullName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		int gender = "Male".equals(request.getParameter("gender")) ? 1 : 2;
		Date dob = Date.valueOf(request.getParameter("dob"));
		User userS = (User) request.getSession().getAttribute(Constant.SESSION_USER);
		
		if (userService.update(fullName, email, phone, gender, dob, userS.getId())) {
			User user = userService.get(userS.getId()); 
			request.getSession().setAttribute(Constant.SESSION_USER, user);
			response.sendRedirect("Profile");
		}
	}

}
