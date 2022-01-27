package com.practise.web.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

import com.practise.web.Connector.ConnectionFactory;
import com.practise.web.model.Contact;

public class ContactDAOImpl implements ContactDAO {

	private static Connection conn = null;

	public String saveContact(Contact contact) {
		if (contact == null)
			return "error";

		try {
			conn = ConnectionFactory.requestConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			System.out.println("Could not connect to the database.");
			e1.printStackTrace();
			return "error";
		}

		String userid = contact.getUserid();
		String fname = contact.getFname();
		String lname = contact.getLname();
		String number = contact.getNumber();
		String email = contact.getEmail();
		String about = contact.getAbout();

		String iq = "INSERT INTO contacts (userid, fname, lname, contact, email, about) VALUES (?, ?, ?, ?, ?, ?);";

		try {
			PreparedStatement ps = conn.prepareStatement(iq);

			ps.setString(1, userid);
			ps.setString(2, fname);
			ps.setString(3, lname);
			ps.setString(4, number);
			ps.setString(5, email);
			ps.setString(6, about);

			int res = ps.executeUpdate();

			System.out.println("Insert query executed; " + res + " row(s) affected.");
			if (res <= 0)
				return "false";

			return "true";

		} catch (SQLIntegrityConstraintViolationException e) {
			// TODO: handle exception
			System.out.println("Inside saveContact: " + e.getMessage());
			return "icvError";
		} catch (Exception e) {
			System.out.println("Inside saveContact: " + e.getMessage());
			return "error";
		}

	}

	public ArrayList<Contact> viewAllContacts(String userid) {

		if (userid == null)
			return null;

		try {
			conn = ConnectionFactory.requestConnection();
		} catch (ClassNotFoundException | SQLException e1) {

			System.out.println("Could not connect to the database.");
			e1.printStackTrace();
			return null;
		}

		String iq = "SELECT contactid, fname, lname, contact, email, about FROM contacts WHERE userid = ?;";

		try {
			PreparedStatement ps = conn.prepareStatement(iq);
			ps.setString(1, userid);
			ResultSet rs = ps.executeQuery();
			ArrayList<Contact> contacts = new ArrayList<Contact>();
			int rowCount = 0;
			while (rs.next()) {
				rowCount++;
				Contact contact = new Contact();
				contact.setContactid(Integer.parseInt(rs.getString("contactid")));
				contact.setFname(rs.getString("fname"));
				contact.setLname(rs.getString("lname"));
				contact.setNumber(rs.getString("contact"));
				contact.setEmail(rs.getString("email"));
				contact.setAbout(rs.getString("about"));
				contacts.add(contact);
			}
			System.out.println(rowCount + " contacts returned.");
			return contacts;
		} catch (Exception e) {
			System.out.println("Inside ViewAllContact: " + e.getMessage());
			return null;
		}
	}

	public Contact viewContact(String userid, int contactid) {

		if (userid == null)
			return null;

		try {
			conn = ConnectionFactory.requestConnection();
		} catch (ClassNotFoundException | SQLException e1) {

			System.out.println("Could not connect to the database.");
			e1.printStackTrace();
			return null;
		}
		String iq = "SELECT * FROM contacts WHERE contactid = ?;";

		try {
			PreparedStatement ps = conn.prepareStatement(iq);
			ps.setInt(1, contactid);
			ResultSet rs = ps.executeQuery();
			Contact contact = new Contact();
			if (rs.next()) {
				System.out.println("Contact Found.");

				contact.setContactid(Integer.parseInt(rs.getString("contactid")));
				contact.setFname(rs.getString("fname"));
				contact.setLname(rs.getString("lname"));
				contact.setNumber(rs.getString("contact"));
				contact.setEmail(rs.getString("email"));
				contact.setAbout(rs.getString("about"));
				contact.setUserid(rs.getString("userid"));

				System.out.println("Returning the contact.");
				return contact;
			}
			System.out.println("Contact not found.");
			return null;
		} catch (Exception e) {
			System.out.println("Inside ViewContact: " + e.getMessage());
			return null;
		}
	}

	public boolean deleteContact(String userid, int contactid) {

		if (userid == null)
			return false;

		try {
			conn = ConnectionFactory.requestConnection();
		} catch (ClassNotFoundException | SQLException e1) {

			System.out.println("Could not connect to the database.");
			e1.printStackTrace();
			return false;
		}
		String iq = "DELETE FROM contacts WHERE contactid = ?;";

		try {
			PreparedStatement ps = conn.prepareStatement(iq);
			ps.setInt(1, contactid);
			int rs = ps.executeUpdate();

			if (rs > 0)
				return true;
			return false;
		} catch (Exception e) {
			System.out.println("Inside DeleteContact: " + e.getMessage());
			return false;
		}
	}

	@Override
	public String editContact(Contact contact) {
		if (contact == null)
			return "error";

		try {
			Connection conn = ConnectionFactory.requestConnection();
		} catch (ClassNotFoundException | SQLException e1) {

			System.out.println("Could not connect to the database.");
			e1.printStackTrace();
			return "error";
		}

		String iq = "UPDATE contacts SET fname=?, lname=?, contact=?, email=?, about=?  WHERE contactid = ?;";

		String fname = contact.getFname();
		String lname = contact.getLname();
		String email = contact.getEmail();
		String about = contact.getAbout();
		String number = contact.getNumber();
		int contactid = contact.getContactid();

		try {
			PreparedStatement ps = conn.prepareStatement(iq);
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, number);
			ps.setString(4, email);
			ps.setString(5, about);
			ps.setInt(6, contactid);
			int rs = ps.executeUpdate();

			if (rs > 0) {
				System.out.println("Contact updated. ("+rs+") rows affected.");
				return "true";
			}
			System.out.println("Contact not updated.");
			return "false";
		} catch (Exception e) {
			System.out.println("Inside editContact: " + e.getMessage());
			return "error";
		}
	}
}
