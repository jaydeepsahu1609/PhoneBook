package com.practise.web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.practise.web.DAO.UserDAOImpl;
import com.practise.web.model.User;

@SuppressWarnings("serial")
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		User user = new User();
		user.setUsername(username);
		user.setPassword(password);

		UserDAOImpl udi = new UserDAOImpl();
		boolean valid = udi.validateUser(user);

		if (valid) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			System.out.println("User logged in.");
			response.sendRedirect("index.jsp");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("invalidUser", "true");
			response.sendRedirect("login.jsp");
		}
	}

}
