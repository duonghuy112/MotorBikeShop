package com.tromic.controller;

import java.io.IOException;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tromic.common.Constant;
import com.tromic.persistence.Cart;
import com.tromic.persistence.Order;
import com.tromic.persistence.Shipping;
import com.tromic.persistence.User;
import com.tromic.service.OrderDetailService;
import com.tromic.service.OrderService;
import com.tromic.service.ShippingService;
import com.tromic.service.impl.OrderDetailServiceImpl;
import com.tromic.service.impl.OrderServiceImpl;
import com.tromic.service.impl.ShippingServiceImpl;

@WebServlet("/Checkout")
public class CheckoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderService orderService;
	private OrderDetailService orderDetailService;
	private ShippingService shippingService;
    
	public CheckoutController() {
		orderService = new OrderServiceImpl();
		orderDetailService = new OrderDetailServiceImpl();
		shippingService = new ShippingServiceImpl();
	}
	
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		List<Cart> listCart = (List<Cart>) request.getSession().getAttribute(Constant.SESSION_LISTCART);
		if (listCart != null) {
			double totalPrice = listCart.stream()
					.mapToDouble(c -> c.getProduct().getPrice() * c.getQuantity())
					.sum();
			
			request.setAttribute("listCart", listCart);
			request.setAttribute("totalPrice", totalPrice);
			request.getRequestDispatcher(Constant.Path.CHECKOUT).forward(request, response);
		} else {
			response.sendRedirect("Error404");
		}
	}

	@SuppressWarnings({ "unchecked", "unused" })
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		String fullname = request.getParameter("fullname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String note = request.getParameter("note");
		double totalPriceShipping = Double.parseDouble(request.getParameter("totalPrice"));
		
		User user = (User) request.getSession().getAttribute(Constant.SESSION_USER);
		
		Shipping shipping = new Shipping();
		shipping.setFullname(fullname);
		shipping.setPhone(phone);
		shipping.setAddress(address);
		shipping.setTotalPrice(totalPriceShipping);
		int shippingId = shippingService.saveReturnId(shipping);
		if (shippingId > 0) {
			List<Cart> listCart = (List<Cart>) request.getSession().getAttribute(Constant.SESSION_LISTCART);
			double totalPriceOrder = listCart.stream()
					.mapToDouble(c -> c.getProduct().getPrice() * c.getQuantity())
					.sum();
			Order order = new Order();
			order.setUser(user);
			order.setShipping(shippingService.get(shippingId));
			order.setTotalPrice(totalPriceOrder);
			order.setNote(note);
			order.setStatus(1);
			int orderId = orderService.saveReturnId(order);
			if (orderId > 0) {
				if (orderDetailService.save(listCart, orderService.get(orderId))) {
					request.getSession().removeAttribute(Constant.SESSION_LISTCART);
					sendMail(shipping, user.getEmail(), user.getFullName());
					response.sendRedirect("Home");
				} else {
					boolean removeOrder = orderService.delete(orderId);
					boolean removeShipping = shippingService.delete(shippingId);
					response.sendRedirect("Error404");
					
				}
			} else {
				boolean removeShipping = shippingService.delete(shippingId);
				response.sendRedirect("Error404");
			}
		}  else {
			response.sendRedirect("Error404");
		}
	}
	
	private void sendMail(Shipping shipping, String email, String name) {
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");

		Session session = Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("duoonghuy1123@gmail.com", "huy123huy");
			}
		});
		Message message = prepareMessage(session, shipping, email, name);
		try {
			Transport.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	private Message prepareMessage(Session session, Shipping shipping, String email, String name) {
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("duoonghuy1123@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
			message.setSubject("CHECKOUT - TROMIC - MOTORBIKE'S ACCESSORIES & PARTS SHOP");
			String content = "<!DOCTYPE html>\n"
		                    + "<html lang=\"vi\">\n"
		                    + "\n"
		                    + "<head>\n"
		                    + "<meta charset=\"UTF-8\">\n"
		                    + "</head>\n"
		                    + "\n"
		                    + "<body>\n"
		                    + "    <h3 style=\"color: #ee3231;\">Hello Mr/Miss "+ name + ", </h3>\n"
		                    + "    <h3 >Your order has been processing.</h3>\n"
		                    + "    <div>Full Name : "+ shipping.getFullname() +"</div>\n"
		                    + "    <div>Address : "+ shipping.getAddress() +"</div>\n"
		                    + "    <div>Phone : "+ shipping.getPhone() +"</div>\n"
		                    + "    <div>Total Price : "+ shipping.getTotalPrice() +"</div>\n"
		                    + "    <h3 style=\"color: #ee3231;\">Thank you very much!</h3>\n"
		                    + "\n"
		                    + "</body>\n"
		                    + "\n"
		                    + "</html>";
			message.setContent(content, "text/html; charset=UTF-8");;
			return message;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
