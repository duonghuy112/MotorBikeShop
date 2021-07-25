package com.tromic.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Date;

public class Constant {
	public static final String SESSION_USER = "user";
	public static final String SESSION_LISTCART = "listcart";
	public static final String SESSION_WISHLIST= "wishlist";
	public static final String COOKIE_USERNAME = "username";
	public static final String COOKIE_PASSWORD = "password";
	public static final String DIR = "log" + File.separator + "log.txt";

	public static void saveLog(String text) {
		try {
			File file = createFile(DIR);
			Files.write(Paths.get(file.getPath()),
					(new Date().toString() + ": " + text + System.lineSeparator()).getBytes(),
					StandardOpenOption.APPEND);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private static File createFile(String path) throws IOException {
		File file = new File(path);
		if (!file.exists()) {
			File parent = file.getParentFile();
			if (!parent.exists()) {
				parent.mkdirs();
			}
			file.createNewFile();
			System.out.println("Create file successfully!");
		}
		return file;
	}

	public static class Path {
		public static final String HOME = "/view/client/index.jsp";
		public static final String DASHBOARD = "/view/admin/index.jsp";
		public static final String SHOP = "/view/client/shop.jsp";
		public static final String CONTACT = "/view/client/contact.jsp";
		public static final String ABOUT = "/view/client/about.jsp";
		public static final String CATEGORY = "/view/client/filterByCategory.jsp";
		public static final String SUPPLIER = "/view/client/filterBySupplier.jsp";
		public static final String SEARCH_NAME = "/view/client/searchByName.jsp";
		public static final String PRODUCT_DETAIL = "/view/client/product-detail.jsp";
		public static final String LOGIN = "/view/client/login.jsp";
		public static final String REGISTER = "/view/client/register.jsp";
		public static final String FORGOT_PASSWORD = "/view/client/forgot-password.jsp";
		public static final String SHOPPING_CART = "/view/client/cart.jsp";
		public static final String WISHLIST = "/view/client/wishlist.jsp";
		public static final String CHECKOUT = "/view/client/checkout.jsp";
		public static final String PROFILE = "/view/client/my-profile.jsp";
		public static final String ORDERS = "/view/client/orders.jsp";
		public static final String ORDERS_DETAIL = "/view/client/orderdetail.jsp";
		public static final String FAQ = "/view/client/faq.jsp";
		public static final String ERR404 = "/view/client/404.jsp";
	}

}
