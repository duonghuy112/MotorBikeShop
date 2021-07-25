package com.tromic.controller.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tromic.common.Constant;
import com.tromic.persistence.User;
import com.tromic.service.UserService;
import com.tromic.service.impl.UserServiceImpl;

@WebFilter(filterName = "/CheckLoginFilter", urlPatterns = {"/AddToCart", "/ShoppingCart", "/Checkout", "/Wishlist", "/Orders", "/Profile"})
public class CheckLoginFilter implements Filter {
	
	@Override
	public void destroy() {
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        
        UserService userService = new UserServiceImpl();
        
        User user = (User) req.getSession().getAttribute(Constant.SESSION_USER);
        if (user != null) {
            chain.doFilter(request, response);
        } else {
            String username = null;
            String password = null;
            
            Cookie[] cookies = req.getCookies();
            for (Cookie cooky : cookies) {
                if (Constant.COOKIE_USERNAME.equals(cooky.getName())) {
                    username = cooky.getValue();
                }
                if (Constant.COOKIE_PASSWORD.equals(cooky.getName())) {
                    password = cooky.getValue();
                }
                if (username != null && password != null) {
                    break; 
                }
            }
            if (username != null && password != null) {
                User userCookie = userService.getLogin(username, password);
                if (userCookie != null) {
                    req.getSession().setAttribute(Constant.SESSION_USER, userCookie);
                    chain.doFilter(request, response);
                } else {
                    res.sendRedirect("Login");
                }
            } else {
                res.sendRedirect("Login");
            }    
        }
	}
	
	@Override
	public void init(FilterConfig fConfig) throws ServletException {
	}
}
