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
import com.tromic.persistence.Product;
import com.tromic.service.ProductService;
import com.tromic.service.impl.ProductServiceImpl;

@WebServlet("/AddToCart")
public class AddToCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ProductService productService;
	
	static {
		productService = new ProductServiceImpl();
	}

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		int productId = Integer.parseInt(request.getParameter("productId"));
		int quantity = 1;
		if (request.getParameter("quantity") != null) {
			quantity = Integer.parseInt(request.getParameter("quantity"));
		}
		Product product = productService.get(productId);
		Cart cart = new Cart(product, quantity, product.getPrice());
		List<Cart> listCart = (List<Cart>) request.getSession().getAttribute(Constant.SESSION_LISTCART);
		if (listCart == null) {
			listCart = new ArrayList<>();
			listCart.add(cart);
		} else {
			boolean isProductExist = false;
			for (Cart c : listCart) {
				if (c.getProduct().getId() == productId) {
					c.setQuantity(c.getQuantity() + quantity);
					isProductExist = true;
				}
			}
			if (!isProductExist) {
				listCart.add(cart);
			}
		}
		request.getSession().setAttribute(Constant.SESSION_LISTCART, listCart);
		response.sendRedirect("Shop");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
