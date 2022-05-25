package com.tromic.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tromic.common.Constant;
import com.tromic.persistence.User;
import com.tromic.service.UserService;
import com.tromic.service.impl.UserServiceImpl;

@WebServlet("/ChangePassword")
public class ChangePasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService;
	
	public ChangePasswordController { 
		userService = new UserServiceImpl();
	}
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		User user = (User) request.getSession().getAttribute(Constant.SESSION_USER);
		String password = request.getParameter("password");
		String newPassword = request.getParameter("newPassword");
		String confirmNewPassword = request.getParameter("confirmNewPassword");
		
		if (!user.getPassword().equals(password)) {
			request.setAttribute("passwordErr", "Password is incorrect!");
			request.getRequestDispatcher(Constant.Path.PROFILE).forward(request, response);
			return;
		}
		if (!confirmNewPassword.equals(newPassword)) {
			request.setAttribute("confirmErr", "Confirm password is not match!");
			request.getRequestDispatcher(Constant.Path.PROFILE).forward(request, response);
			return;
		}
		if (userService.updatePassword(user.getId(), confirmNewPassword)) {
			response.sendRedirect("Profile");
		} 
	}

}
