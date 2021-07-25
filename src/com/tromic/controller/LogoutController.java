package com.tromic.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tromic.common.Constant;

@WebServlet("/Logout")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		Cookie[] cookies = request.getCookies();
		for (Cookie cooky : cookies) {
			if (Constant.COOKIE_USERNAME.equals(cooky.getName())) {
				cooky.setMaxAge(0);
				response.addCookie(cooky);
			}
			if (Constant.COOKIE_PASSWORD.equals(cooky.getName())) {
				cooky.setMaxAge(0);
				response.addCookie(cooky);
			}
		}
		request.getSession().removeAttribute(Constant.SESSION_LISTCART);
		request.getSession().removeAttribute(Constant.SESSION_USER);
		response.sendRedirect("Login");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
