package com.cdkshop.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ConnectCreateListener implements ServletContextListener {
	public void contextInitialized(ServletContextEvent sce) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			final String url = "jdbc:mysql://localhost:3306/cdkshop";
			final String user = "cdkshop_user";
			final String password = "123456";
			Connection con = DriverManager.getConnection(url, user, password);
			sce.getServletContext().setAttribute("connect", con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void contextDestroyed(ServletContextEvent sce) {
		try {
			Connection con = (Connection) sce.getServletContext().getAttribute("connect");
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
