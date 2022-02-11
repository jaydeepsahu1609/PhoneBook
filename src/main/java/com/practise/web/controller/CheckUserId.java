package com.practise.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.practise.web.Connector.ConnectionFactory;

@SuppressWarnings("serial")
@WebServlet("/checkUserId")
public class CheckUserId extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		
		System.out.println("Inside the servlet : "+username);
		
		try {
			Connection conn = ConnectionFactory.requestConnection();
			
			String q = "SELECT userid FROM users WHERE userid = ?";
			PreparedStatement ps = conn.prepareStatement(q);
			ps.setString(1, username);
			
//			System.out.println(ps);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				System.out.println("User found with username : "+username);
				resp.getWriter().write("false");
			}
			else {
				System.out.println("Username not in use.");
				resp.getWriter().write("true");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			resp.getWriter().write("error");
		}
	}
}
