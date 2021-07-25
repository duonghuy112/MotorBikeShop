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

@WebServlet("/UpdateCart")
public class UpdateCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		List<Cart> listCart = (List<Cart>) request.getSession().getAttribute(Constant.SESSION_LISTCART);
		for (int i = 0; i < listCart.size(); i++) {
			int quantity = Integer.parseInt(request.getParameter("quantity" + i));
			listCart.get(i).setQuantity(quantity);
			listCart.get(i).setTotal(listCart.get(i).getProduct().getPrice() * quantity);
		}
		request.getSession().setAttribute(Constant.SESSION_LISTCART, listCart);
		response.sendRedirect("ShoppingCart");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
