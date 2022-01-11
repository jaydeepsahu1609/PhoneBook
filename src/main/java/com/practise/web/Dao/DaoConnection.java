package com.practise.web.Dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DaoConnection {
	private static Connection conn=null;
	
	public static Connection connect()
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/phonebook", "root", "root");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
}
