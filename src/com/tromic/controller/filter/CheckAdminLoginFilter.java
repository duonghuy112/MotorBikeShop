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
import javax.servlet.http.HttpServletResponse;

import com.tromic.common.Constant;
import com.tromic.persistence.User;

@WebFilter(filterName = "/CheckAdminLoginFilter", urlPatterns = {"/Admin/*"})
public class CheckAdminLoginFilter implements Filter {
	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        
        User user = (User) req.getSession().getAttribute(Constant.SESSION_USER);
        if (user != null && user.getIsAdmin() == 1) {
        	chain.doFilter(request, response);
        } else {
			res.sendRedirect("../Home");
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
