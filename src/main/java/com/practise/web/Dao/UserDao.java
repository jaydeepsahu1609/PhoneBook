package com.practise.web.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import com.practise.web.model.NewUser;
import com.practise.web.model.User;

public class UserDao {
	private static Connection conn = null;

//	Table : users(userid, emailid, password, fname,lname)

	public static boolean validateUser(User user) {
		conn = DaoConnection.connect();

		if (conn != null) {
			try {
				PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE userid= ? and password= ?;");
				ps.setString(1, user.getUsername());
				ps.setString(2, user.getPassword());
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					return true;
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return false;
	}

	public static String registerUser(NewUser user) {
		conn = DaoConnection.connect();

		if (conn != null) {
			try {
				PreparedStatement ps = conn.prepareStatement(
						"INSERT INTO users (userid, fname, lname, email, password) VALUES (?, ?, ?, ?, ?);");

				ps.setString(1, user.getUserid());
				ps.setString(2, user.getLname());
				ps.setString(3, user.getFname());
				ps.setString(4, user.getEmail());
				ps.setString(5, user.getPassword());

				int res = ps.executeUpdate();

				return res == 1 ? "true" : "false";
			} catch (SQLException e) {
				if (e instanceof SQLIntegrityConstraintViolationException) {
					// Duplicate entry
					return "error";
				} else {
					// Other SQL Exception
					e.printStackTrace();
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return "false";
	}
}
