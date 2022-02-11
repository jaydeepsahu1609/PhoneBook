package com.practise.web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.practise.web.DAO.UserDAOImpl;
import com.practise.web.model.NewUser;

/**
 * Servlet implementation class RegisterServlet
 */
@SuppressWarnings("serial")
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Inside register");
		if (request.getParameter("userid") == null) {
			HttpSession session = request.getSession();
			System.out.println("No parameter obtained.");
			session.setAttribute("register", "error");
			response.sendRedirect("register.jsp");
		}
		NewUser user = new NewUser();
		user.setUserid(request.getParameter("userid"));
		user.setFname(request.getParameter("fname"));
		user.setLname(request.getParameter("lname"));
		user.setEmail(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));

		UserDAOImpl udi = new UserDAOImpl();
		String res = udi.registerUser(user);

		HttpSession session = request.getSession();

		if (res == "true") {
			System.out.println("User registered.");
			session.setAttribute("register", "true");
			response.sendRedirect("login.jsp");
		} else { if (res == "false") {
			System.out.println("Registration failed.");
			session.setAttribute("register", "false");}
		 else {
			System.out.println("Error while registering.");
			session.setAttribute("register", "error");
		 	}
		response.sendRedirect("register.jsp");
		}
	}
}
