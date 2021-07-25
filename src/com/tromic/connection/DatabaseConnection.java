package com.tromic.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DatabaseConnection {
	private static Connection connection;
	
	private DatabaseConnection() {
	}
	
	public static Connection getConnection() {
		if (connection == null) {
			Properties props = DatabaseProvider.getDbConfig();
			
			try {
				Class.forName(props.getProperty("DRIVER"));
				connection = DriverManager.getConnection(props.getProperty("URL"), props.getProperty("USER"), props.getProperty("PASSWORD"));
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
		return connection;
	}
	
	public static void main(String[] args) {
		Properties props = DatabaseProvider.getDbConfig();
		System.out.println(props.getProperty("DRIVER"));
		System.out.println(props.getProperty("URL"));
	}
}
