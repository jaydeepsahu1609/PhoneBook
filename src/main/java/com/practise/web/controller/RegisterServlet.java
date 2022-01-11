package com.practise.web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.practise.web.Dao.UserDao;
import com.practise.web.model.NewUser;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String password = request.getParameter("password");
		String email = request.getParameter("email");

		NewUser user = new NewUser();
		user.setUserid(userid);
		user.setFname(fname);
		user.setLname(lname);
		user.setEmail(email);
		user.setPassword(password);

		String res = UserDao.registerUser(user);

		HttpSession session = request.getSession();

		if (res == "true") {
			session.setAttribute("register", "true");
			response.sendRedirect("login.jsp");
		} else if(res == "false") {
			session.setAttribute("register", "false");
			response.sendRedirect("register.jsp");
		}
		else {
			session.setAttribute("register", "error");
			response.sendRedirect("register.jsp");
		}

	}

}
