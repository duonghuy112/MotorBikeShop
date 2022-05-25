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
import com.tromic.persistence.Review;
import com.tromic.persistence.User;
import com.tromic.service.ReviewService;
import com.tromic.service.UserService;
import com.tromic.service.impl.ReviewServiceImpl;
import com.tromic.service.impl.UserServiceImpl;

@WebServlet("/Contact")
public class ContactController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private UserService userService;
	private ReviewService reviewService;
	
	public ContactController() {
		userService = new UserServiceImpl();
		reviewService = new ReviewServiceImpl();
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher(Constant.Path.CONTACT).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		String email = request.getParameter("email");
        String password = request.getParameter("password");
        String content = request.getParameter("content");
        User user = (User) request.getSession().getAttribute(Constant.SESSION_USER);
        if (user == null) {
        	request.setAttribute("userErr", "Please log in to send a review!");
        	request.getRequestDispatcher(Constant.Path.CONTACT).forward(request, response);
        	return;
		}
        Review review = new Review();
        review.setUser(userService.get(user.getId()));
        review.setContent(content);
        if (reviewService.save(review)) {
        	sendMail(email, user, password, content);
        	response.sendRedirect("Home");
        	return;
		} else {
			response.sendRedirect("Error404");
			return;
		}
	}
	
	private void sendMail(String email, User user, String password, String content) {
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");

		Session session = Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(email, password);
			}
		});
		Message message = prepareMessage(session, user, email, content);
		try {
			Transport.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	private Message prepareMessage(Session session, User user, String email, String content) {
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(email));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("duoonghuy1123@gmail.com"));
			message.setSubject("REVIEW - TROMIC - MOTORBIKE'S ACCESSORIES & PARTS SHOP");
			String contentHtml = "<!DOCTYPE html>\n"
								+ "<html lang=\"vi\">\n"
			                    + "\n"
			                    + "<head>\n"
			                    + "<meta charset=\"UTF-8\">\n"
			                    + "</head>\n"
			                    + "\n"
			                    + "<body>\n"
			                    + "    <h3 style=\"color: #ee3231;\">Review from User: "+ user.getUsername() + " - Fullname: " + user.getFullName() + " - Id:  " + user.getId() + " </h3>\n"
			                    + "    <div>"+ content +"</div>\n"
			                    + "    <h3 style=\"color: #ee3231;\">Have a nice working day!</h3>\n"
			                    + "\n"
			                    + "</body>\n"
			                    + "\n"
			                    + "</html>";
			message.setContent(contentHtml, "text/html; charset=UTF-8");
			return message;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
