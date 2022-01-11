package com.practise.web.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.practise.web.model.Contact;

public class ContactDao {

	private static Connection conn = null;

	public static String saveContact(Contact contact) {
		if (contact == null)
			return "error";

		conn = DaoConnection.connect();
		if (conn != null) {
			String userid = contact.getUserid();
			String fname = contact.getFname();
			String lname = contact.getLname();
			String number = contact.getNumber();

			String iq = "INSERT INTO contacts (userid, fname, lname, contact) VALUES (?, ?, ?, ?);";

			try {
				PreparedStatement ps = conn.prepareStatement(iq);

				ps.setString(1, userid);
				ps.setString(2, fname);
				ps.setString(3, lname);
				ps.setString(4, number);

				int res = ps.executeUpdate();

				if (res <= 0)
					return "false";

				return "true";

			} catch (Exception e) {
				System.out.println("Inside saveContact: " + e.getMessage());
				return "error";
			}
		}

		return "error";
	}

	public static Contact viewContact(String userid) {

		if (userid == null)
			return null;

		conn = DaoConnection.connect();
		if (conn != null) {
			String iq = "SELECT fname, lname, contact FROM contacts WHERE userid = ?;";

			try {
				PreparedStatement ps = conn.prepareStatement(iq);
				ResultSet rs = ps.executeQuery();

				if (rs.next()) {
					Contact contact = new Contact();
					contact.setFname(rs.getString("fname"));
					contact.setLname(rs.getString("lname"));
					contact.setNumber(rs.getString("contact"));
					return contact;
				}

				return null;
			} catch (Exception e) {
				return null;
			}
		}

		return null;
	}

}
