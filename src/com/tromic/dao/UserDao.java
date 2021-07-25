package com.tromic.dao;

import java.sql.Date;
import java.util.List;

import com.tromic.persistence.User;


public interface UserDao {

	List<User> getAll();
	
	User get(int userId);
	
	User get(String username, String email);
	
	User getLogin(String username, String password);
	
	boolean isExistEmail(String email);
	
	boolean isExistUsername(String username);
	
	boolean save(User user);
	
	boolean saveFull(User user);
	
	boolean update(String fullName, String email, String phone, int gender, Date dob, int userId);
	
	boolean updateAvatar(int userId, String avatar);
	
	boolean updatePassword(int userId, String newPassword);
	
	boolean setAdmin(int userId);
	
	boolean setUser(int userId);
	
	boolean setActive(int userId);
	
	boolean setBlock(int userId);
	
	boolean delete(int userId);
}
