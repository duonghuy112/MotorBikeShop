package com.tromic.controller;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tromic.common.Constant;
import com.tromic.persistence.Product;

@WebServlet("/DeleteWishlist")
public class DeleteWishlistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		int productId = Integer.parseInt(request.getParameter("productId"));
		Set<Product> setProduct = (Set<Product>) request.getSession().getAttribute(Constant.SESSION_WISHLIST);
		setProduct.removeIf(p -> p.getId() == productId);
		if (setProduct.size() == 0) {
			request.getSession().removeAttribute(Constant.SESSION_WISHLIST);
		}
		response.sendRedirect("Wishlist");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
