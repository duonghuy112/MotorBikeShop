package com.tromic.utils;

public class SqlUtils {
	
	private SqlUtils() {
	}
	
	public static void close(AutoCloseable ...autoCloseables) {
		for (AutoCloseable autoCloseable : autoCloseables) {
			try {
				if (autoCloseable != null) {
					autoCloseable.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
