package com.tromic.connection;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class DatabaseProvider {
	
	private static final String DB_CONFIG = "database.properties";

	private DatabaseProvider() {
	}

	public static Properties getDbConfig() {
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		InputStream inputStream = classLoader.getResourceAsStream(DB_CONFIG);
		Properties pros = new Properties();
		try {
			pros.load(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return pros;
	}
}
