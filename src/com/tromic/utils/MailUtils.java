package com.tromic.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class MailUtils {
	public static void sendMail(String email, String name) {
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");

		Session session = Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("duoonghuy1123@gmail.com", "huy123huy");
			}
		});
		Message message = prepareMessage(session, email, name);
		try {
			Transport.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	private static Message prepareMessage(Session session, String email, String name) {
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("duoonghuy1123@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
			message.setSubject("WELCOME TO TROMIC - MOTORBIKE'S ACCESSORIES & PARTS SHOP");
			message.setText("Hello Mr/Mrs " + name + ",\n" + "You have successfully registered an account on our shop."
					+ "\nPlease log in to start shopping for the items that are best for you and your motor.");
			return message;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
