package com.tromic.controller;

import java.io.IOException;
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
import com.tromic.persistence.User;
import com.tromic.service.UserService;
import com.tromic.service.impl.UserServiceImpl;

@WebServlet("/ForgotPassword")
public class ForgotPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UserService userService;
	
	static {
		userService = new UserServiceImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher(Constant.Path.FORGOT_PASSWORD).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String confirmEmail = request.getParameter("confirmEmail");
		User user = userService.get(username, email);
		if (!email.equals(confirmEmail)) {
			request.setAttribute("confirmErr", "Confirm email is not match!");
			request.setAttribute("username", username);
			request.setAttribute("email", email);
			request.getRequestDispatcher(Constant.Path.FORGOT_PASSWORD).forward(request, response);
			return;
		}
		if (user == null) {
			request.setAttribute("userErr", "Username or Password incorrect!");
			request.getRequestDispatcher(Constant.Path.FORGOT_PASSWORD).forward(request, response);
			return;
		}
		if (user.getIsActive() == 0) {
			request.setAttribute("notActive", "Your account has been locked or not allowed access!");
			request.getRequestDispatcher(Constant.Path.FORGOT_PASSWORD).forward(request, response);
			return;
		}
		sendMail(email, user.getFullName(), user.getPassword());
		response.sendRedirect("Login");
	}

	private void sendMail(String email, String name, String password) {
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
		Message message = prepareMessage(session, email, name, password);
		try {
			Transport.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	private Message prepareMessage(Session session, String email, String name, String password) {
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("duoonghuy1123@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
			message.setSubject("FORGOT PASSWORD - TROMIC - MOTORBIKE'S ACCESSORIES & PARTS SHOP");
			String content = "<!DOCTYPE html>\n" 
							+ "<html lang=\"vi\">\n"
		                    + "\n"
		                    + "<head>\n"
		                    + "<meta charset=\"UTF-8\">\n"
		                    + "</head>\n"
							+ "\n"
							+ "<body>\n"
							+ "    <h3 style=\"color: #ee3231;\">Hello Mr/Miss " + name + ",</h3>\n"
							+ "    <div>Your password is: <i>" + password + "</i></div>\n<br/>"
							+ "    <div>Log in now to start shopping for the items that are the best for you and your motor.</div>\n"
							+ "    <h3 style=\"color: #ee3231;\">Have a nice day!</h3>\n" 
							+ "\n" 
							+ "</body>\n" 
							+ "\n"
							+ "</html>";
			message.setContent(content, "text/html; charset=UTF-8");
			return message;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
