package com.practise.web.Connector;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

	public static Connection requestConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Driver loaded");
		
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/phonebook", "root", "root");
		System.out.println("Connected to database.");

		return conn;
	}
}
