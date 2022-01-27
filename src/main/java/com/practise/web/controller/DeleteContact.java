package com.practise.web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.practise.web.DAO.ContactDAOImpl;

/**
 * Servlet implementation class DeleteContact
 */
public class DeleteContact extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int contactid = Integer.parseInt(request.getParameter("contactid"));
		String userid = request.getParameter("userid");

		ContactDAOImpl cdi = new ContactDAOImpl();

		boolean res = cdi.deleteContact(userid, contactid);
		HttpSession s2 = request.getSession();

		if (res) {
			System.out.println("Contact deleted successfully.");
			s2.setAttribute("deleteContact", "success");
		} else {
			s2.setAttribute("deleteContact", "failure");
			System.out.println("Contact cannot be deleted.");
		}

		response.sendRedirect("viewContact.jsp");
	}

}
