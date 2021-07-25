package com.tromic.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tromic.common.Constant;
import com.tromic.persistence.Cart;

@WebServlet("/ShoppingCart")
public class ShoppingCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		List<Cart> listCart = (List<Cart>) request.getSession().getAttribute(Constant.SESSION_LISTCART);
		if (listCart == null) {
			listCart = new ArrayList<>();
		}
		double total = listCart.stream()
				.mapToDouble(c -> c.getProduct().getPrice() * c.getQuantity())
				.sum();

		if (listCart.size() == 0 || listCart == null) {
			response.sendRedirect("Error404");
		} else {
			request.setAttribute("total", total);
			request.setAttribute("listCart", listCart);
			request.getRequestDispatcher(Constant.Path.SHOPPING_CART).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
