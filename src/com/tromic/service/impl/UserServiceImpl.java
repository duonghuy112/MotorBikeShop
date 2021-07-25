package com.tromic.service.impl;

import java.sql.Date;
import java.util.List;

import com.tromic.dao.UserDao;
import com.tromic.dao.impl.UserDaoImpl;
import com.tromic.persistence.User;
import com.tromic.service.UserService;

public class UserServiceImpl implements UserService {
	
	private UserDao userDao;
	
	public UserServiceImpl() {
		userDao = new UserDaoImpl();
	}

	@Override
	public List<User> getAll() {
		return userDao.getAll();
	}

	@Override
	public User get(int userId) {
		return userDao.get(userId);
	}

	@Override
	public User get(String username, String email) {
		return userDao.get(username, email);
	}

	@Override
	public User getLogin(String username, String password) {
		return userDao.getLogin(username, password);
	}

	@Override
	public boolean isExistEmail(String email) {
		return userDao.isExistEmail(email);
	}

	@Override
	public boolean isExistUsername(String username) {
		return userDao.isExistUsername(username);
	}

	@Override
	public boolean save(User user) {
		return userDao.save(user);
	}

	@Override
	public boolean saveFull(User user) {
		return userDao.saveFull(user);
	}

	@Override
	public boolean update(String fullName, String email, String phone, int gender, Date dob, int userId) {
		return userDao.update(fullName, email, phone, gender, dob, userId);
	}

	@Override
	public boolean updateAvatar(int userId, String avatar) {
		return userDao.updateAvatar(userId, avatar);
	}

	@Override
	public boolean updatePassword(int userId, String newPassword) {
		return userDao.updatePassword(userId, newPassword);
	}

	@Override
	public boolean setAdmin(int userId) {
		return userDao.setAdmin(userId);
	}

	@Override
	public boolean setUser(int userId) {
		return userDao.setUser(userId);
	}

	@Override
	public boolean setActive(int userId) {
		return userDao.setActive(userId);
	}

	@Override
	public boolean setBlock(int userId) {
		return userDao.setBlock(userId);
	}

	@Override
	public boolean delete(int userId) {
		return userDao.delete(userId);
	}

}
