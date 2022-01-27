package com.practise.web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.practise.web.DAO.ContactDAOImpl;
import com.practise.web.model.Contact;

/**
 * Servlet implementation class EditContact
 */
@SuppressWarnings("serial")
public class EditContact extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside editContact");
		
		Contact contact = new Contact();
		contact.setContactid(Integer.parseInt(request.getParameter("contactid")));
		contact.setFname(request.getParameter("fname"));
		contact.setLname(request.getParameter("lname"));
		contact.setEmail(request.getParameter("email"));
		contact.setAbout(request.getParameter("about"));
		contact.setNumber(request.getParameter("number"));
		
		ContactDAOImpl cdi = new ContactDAOImpl();
		String res = cdi.editContact(contact);
		HttpSession session3 = request.getSession();
		
	
		if(res == "true")
		{
			session3.setAttribute("editContact", "true");
			response.sendRedirect("viewContact.jsp");
		}
		else {
			session3.setAttribute("editContact", res);
			response.sendRedirect("editContact.jsp");
		}
	}

}
