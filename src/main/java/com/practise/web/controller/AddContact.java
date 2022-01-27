package com.practise.web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.practise.web.DAO.ContactDAOImpl;
import com.practise.web.model.Contact;

/**
 * Servlet implementation class AddContact
 */

@SuppressWarnings("serial")
@WebServlet("/addContact")
public class AddContact extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Contact contact = new Contact();
		contact.setFname(request.getParameter("fname"));
		contact.setLname(request.getParameter("lname"));
		contact.setNumber(request.getParameter("number"));
		contact.setUserid(request.getParameter("userid"));
		contact.setEmail(request.getParameter("email"));
		contact.setAbout(request.getParameter("about"));

		ContactDAOImpl cdi = new ContactDAOImpl();
		String res = cdi.saveContact(contact);

		HttpSession session2 = request.getSession();

		session2.setAttribute("addContact", res);

		response.sendRedirect("addContact.jsp");

	}

}
