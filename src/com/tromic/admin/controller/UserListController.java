package com.tromic.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tromic.admin.common.Constant;
import com.tromic.persistence.User;
import com.tromic.service.UserService;
import com.tromic.service.impl.UserServiceImpl;

@WebServlet("/Admin/UserList")
public class UserListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UserService userService;
	
	static {
		userService = new UserServiceImpl();
	} 
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		User user = (User) request.getSession().getAttribute(com.tromic.common.Constant.SESSION_USER);
		List<User> listUser = userService.getAll();
		String realPath = request.getServletContext().getRealPath("/images");
		
		request.setAttribute("realPath", realPath);
		request.setAttribute("user", user);
		request.setAttribute("listUser", listUser);
		request.getRequestDispatcher(Constant.Path.USER_LIST).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
