package com.tromic.controller.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

@WebFilter(filterName = "/CountViewFilter", urlPatterns = {"/Home", "/Shop", "/About", "/Contact", "/Supplier", "/Category", "/Profile", "/Orders",
														"/ShoppingCart", "/Checkout", "/Wishlist", "/Login", "/Register", "/ForgotPassword", "/Search", "/Faq"})
public class CountViewFilter implements Filter {
	public static int view;
	
	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		view++;
		req.getSession().setAttribute("view", view);
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		view = 0;
	}

}
