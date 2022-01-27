package com.practise.web.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import com.practise.web.Connector.ConnectionFactory;
import com.practise.web.model.NewUser;
import com.practise.web.model.User;

public class UserDAOImpl implements UserDAO {

	private Connection conn = null;

	@Override
	public boolean validateUser(User user) {
		try {
			conn = ConnectionFactory.requestConnection();

			PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE userid= ? and password= ?;");
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				System.out.println("User found.");
				return true;
			}

			System.out.println("User not found.");
			return false;
		} catch (ClassNotFoundException | SQLException e1) {
			System.out.println("Could not connect to the database.");
			e1.printStackTrace();
			return false;
		} catch (Exception e) {
			System.out.println("An error occured while validating the user: " + e.getMessage());
			return false;
		}
	}

	@Override
	public String registerUser(NewUser user) {
		try {
			conn = ConnectionFactory.requestConnection();

			PreparedStatement ps = conn.prepareStatement(
					"INSERT INTO users (userid, fname, lname, email, password) VALUES (?, ?, ?, ?, ?);");

			ps.setString(1, user.getUserid());
			ps.setString(2, user.getLname());
			ps.setString(3, user.getFname());
			ps.setString(4, user.getEmail());
			ps.setString(5, user.getPassword());

			int res = ps.executeUpdate();

			System.out.println("Insert query executed; " + res + " row(s) affected.");

			return res == 1 ? "true" : "false";
		} catch (SQLIntegrityConstraintViolationException e) {
			System.out.println("Error: " + e.getMessage());
			e.printStackTrace();
			return "error";
		} catch (ClassNotFoundException | SQLException e1) {
			System.out.println("Could not connect to the database.");
			e1.printStackTrace();
			return "error";
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "false";
	}

}
