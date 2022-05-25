package com.tromic.controller;

import java.io.IOException;
import java.nio.file.Path;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.tromic.common.Constant;
import com.tromic.persistence.User;
import com.tromic.service.UserService;
import com.tromic.service.impl.UserServiceImpl;

@MultipartConfig
@WebServlet("/UploadAvatar")
public class UpdateAvatarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService;
	
	public UpdateAvatarController() {
		userService = new UserServiceImpl();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    
		User user = (User) request.getSession().getAttribute(Constant.SESSION_USER);
		Part part = request.getPart("avatar");
		String realPath = request.getServletContext().getRealPath("/view/client");
		String fileName = Path.of(part.getSubmittedFileName()).getFileName().toString();
		part.write(realPath + "/assets/images/profile/" + fileName);

		if (userService.updateAvatar(user.getId(), fileName)) {
			response.sendRedirect("Profile");
		}
	}

}
