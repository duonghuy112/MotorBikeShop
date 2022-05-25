package com.tromic.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tromic.common.Constant;
import com.tromic.persistence.User;
import com.tromic.service.UserService;
import com.tromic.service.impl.UserServiceImpl;

@WebServlet("/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService;

	public LoginController() {
		userService = new UserServiceImpl();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher(Constant.Path.LOGIN).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");
		User user = userService.getLogin(username, password);

		if (user != null && user.getIsAdmin() == 1) {
			if (remember != null) {
				Cookie uCookie = new Cookie(Constant.COOKIE_USERNAME, username);
				uCookie.setMaxAge(60 * 60 * 24);
				Cookie pCookie = new Cookie(Constant.COOKIE_PASSWORD, password);
				pCookie.setMaxAge(60 * 60 * 24);
				response.addCookie(uCookie);
				response.addCookie(pCookie);
			}
			request.getSession().setAttribute(Constant.SESSION_USER, user);
			response.sendRedirect("Admin/Dashboard");
		}
		
		if (user != null && user.getIsAdmin() == 0) {
			if (user.getIsActive() == 0) {
				request.setAttribute("notActive", "Your account has been locked or not allowed access!");
				request.getRequestDispatcher(Constant.Path.LOGIN).forward(request, response);
				return;
			}
			if (remember != null) {
				Cookie uCookie = new Cookie(Constant.COOKIE_USERNAME, username);
				uCookie.setMaxAge(60 * 60 * 24);
				Cookie pCookie = new Cookie(Constant.COOKIE_PASSWORD, password);
				pCookie.setMaxAge(60 * 60 * 24);
				response.addCookie(uCookie);
				response.addCookie(pCookie);
			}
			request.getSession().setAttribute(Constant.SESSION_USER, user);
			response.sendRedirect("Home");
		} else if (user == null) {
			request.setAttribute("err", "Username or password is incorrect!");
			request.setAttribute("username", username);
			request.setAttribute("password", password);
			request.getRequestDispatcher(Constant.Path.LOGIN).forward(request, response);
		}

	}

}
