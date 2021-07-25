package com.tromic.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tromic.service.UserService;
import com.tromic.service.impl.UserServiceImpl;

@WebServlet("/Admin/SetBlock")
public class SetBlockController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UserService userService;
	
	static {
		userService = new UserServiceImpl();
	} 
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		int userId = Integer.parseInt(request.getParameter("userId"));
		if (userService.setBlock(userId)) {
			response.sendRedirect("UserList");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
