package com.tromic.admin.controller;

import java.io.IOException;
import java.nio.file.Path;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.tromic.persistence.User;
import com.tromic.service.UserService;
import com.tromic.service.impl.UserServiceImpl;

@MultipartConfig
@WebServlet("/Admin/AddNewUser")
public class AddNewUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UserService userService;
	
	static {
		userService = new UserServiceImpl();
	}
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		String fullName = request.getParameter("fullName");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		int gender = "male".equals(request.getParameter("gender")) ? 1 : 2;
		Date dob = Date.valueOf(request.getParameter("dob"));
		int isAdmin = "admin".equals(request.getParameter("role")) ? 1 : 0;
		
		Part part = request.getPart("avatar");
		String realPath = request.getServletContext().getRealPath("/view/admin");
		String fileName = Path.of(part.getSubmittedFileName()).getFileName().toString();
		part.write(realPath + "/assets/images/profile/" + fileName);

		User user = new User();
		user.setFullName(fullName);
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		user.setPhone(phone);
		user.setGender(gender);
		user.setDob(dob);
		user.setIsAdmin(isAdmin);
		user.setAvatar(fileName);
		if (userService.saveFull(user)) {
			response.sendRedirect("UserList");
		}
	}

}
