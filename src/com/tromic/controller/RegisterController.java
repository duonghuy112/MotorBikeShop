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

@WebServlet("/Register")
public class RegisterController extends HttpServlet {
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
		request.getRequestDispatcher(Constant.Path.REGISTER).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		String fullname = request.getParameter("fullname");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");

		if (password.length() < 6) {
			request.setAttribute("passwordErr", "Password must be more than 6 characters!");
			request.setAttribute("fullname", fullname);
			request.setAttribute("username", username);
			request.setAttribute("email", email);
			request.getRequestDispatcher(Constant.Path.REGISTER).forward(request, response);
			return;
		} else if (!username.matches("^[a-zA-Z0-9]([._-](?![._-])|[a-zA-Z0-9]){3,18}[a-zA-Z0-9]$")) {
			request.setAttribute("usernameErr", "Username is incorrect!");
			request.setAttribute("fullname", fullname);
			request.setAttribute("password", password);
			request.setAttribute("email", email);
			request.getRequestDispatcher(Constant.Path.REGISTER).forward(request, response);
			return;
		} else if (!password.equals(confirmPassword)) {
			request.setAttribute("confirmPasswordErr", "Confirm Password is not match!");
			request.setAttribute("fullname", fullname);
			request.setAttribute("username", username);
			request.setAttribute("email", email);
			request.setAttribute("password", password);
			request.getRequestDispatcher(Constant.Path.REGISTER).forward(request, response);
			return;
		} else if (userService.isExistUsername(username)) {
			request.setAttribute("usernameExistErr", "Username already exists!");
			request.setAttribute("fullname", fullname);
			request.setAttribute("email", email);
			request.setAttribute("password", password);
			request.setAttribute("confirmPassword", confirmPassword);
			request.getRequestDispatcher(Constant.Path.REGISTER).forward(request, response);
			return;
		} else if (userService.isExistEmail(email)) {
			request.setAttribute("emailExistErr", "Email already exists!");
			request.setAttribute("fullname", fullname);
			request.setAttribute("username", username);
			request.setAttribute("password", password);
			request.setAttribute("confirmPassword", confirmPassword);
			request.getRequestDispatcher(Constant.Path.REGISTER).forward(request, response);
			return;
		} else {
			User user = new User(fullname, username, email, password); 
			if (userService.save(user)) {
				sendMail(email, username);
				response.sendRedirect("Login");
			} else {
				request.setAttribute("systemErr", "System Error!");
				request.setAttribute("fullname", fullname);
				request.setAttribute("username", username);
				request.setAttribute("email", email);
				request.setAttribute("password", password);
				request.setAttribute("confirmPassword", confirmPassword);
				request.getRequestDispatcher(Constant.Path.REGISTER).forward(request, response);
				return;
			}
		}
	}
	
	private void sendMail(String email, String name) {
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
		Message message = prepareMessage(session, email, name);
		try {
			Transport.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	private Message prepareMessage(Session session, String email, String name) {
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("duoonghuy1123@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
			message.setSubject("WELCOME TO TROMIC - MOTORBIKE'S ACCESSORIES & PARTS SHOP");
			String content = "<!DOCTYPE html>\n"
								+ "<html lang=\"vi\">\n"
			                    + "\n"
			                    + "<head>\n"
			                    + "<meta charset=\"UTF-8\">\n"
			                    + "</head>\n"
			                    + "\n"
			                    + "<body>\n"
			                    + "    <h3 style=\"color: #ee3231;\">Hello Mr/Miss "+ name + ",</h3>\n"
			                    + "    <div>You have successfully registered an account on our shop.</div>\n"
			                    + "    <div>Please log in to start shopping for the items that are the best for you and your motor.</div>\n"
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
