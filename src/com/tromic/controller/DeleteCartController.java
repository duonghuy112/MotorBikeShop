package com.tromic.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tromic.common.Constant;
import com.tromic.persistence.Cart;

@WebServlet("/DeleteCart")
public class DeleteCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		List<Cart> listCart = (List<Cart>) request.getSession().getAttribute(Constant.SESSION_LISTCART);
		int productId = Integer.parseInt(request.getParameter("productId"));
		listCart.removeIf(c -> c.getProduct().getId() == productId);
		if (listCart.size() == 0) {
			request.getSession().removeAttribute("listCart");
		}
		response.sendRedirect("ShoppingCart");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
