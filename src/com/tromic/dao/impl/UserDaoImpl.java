package com.tromic.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tromic.connection.DatabaseConnection;
import com.tromic.dao.UserDao;
import com.tromic.persistence.User;
import com.tromic.utils.SqlUtils;

public class UserDaoImpl implements UserDao{

	private Connection conn;
	private PreparedStatement pst;
	private CallableStatement cs;
	private ResultSet rs;
	
	public UserDaoImpl() {
		conn = DatabaseConnection.getConnection();
	}
	
	@Override
	public List<User> getAll() {
		List<User> list = new ArrayList<>();
		String sql = "SELECT Account.Account_id, \r\n"
				+ "			Username, \r\n"
				+ "			Password, \r\n"
				+ "			Fullname, \r\n"
				+ "			Email, \r\n"
				+ "			Phone, \r\n"
				+ "			Gender, \r\n"
				+ "			DoB, \r\n"
				+ "			Avatar, \r\n"
				+ "			IsActive, \r\n"
				+ "			IsAdmin, \r\n"
				+ "			CreateDate \r\n"
				+ "FROM [Account] \r\n"
				+ "JOIN [Profile]\r\n"
				+ "		ON Account.Account_id = Profile.Account_id";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				User user = new User();
				transformer(user);
				list.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return list;
	}

	@Override
	public User get(int userId) {
		User user = null;
		String sql = "SELECT Account.Account_id, \r\n"
				+ "			Username, \r\n"
				+ "			Password, \r\n"
				+ "			Fullname, \r\n"
				+ "			Email, \r\n"
				+ "			Phone, \r\n"
				+ "			Gender, \r\n"
				+ "			DoB, \r\n"
				+ "			Avatar, \r\n"
				+ "			IsActive, \r\n"
				+ "			IsAdmin, \r\n"
				+ "			CreateDate \r\n"
				+ "FROM [Account] \r\n"
				+ "JOIN [Profile]\r\n"
				+ "		ON Account.Account_id = Profile.Account_id\r\n"
				+ "WHERE Account.Account_id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, userId);
			rs = pst.executeQuery();
			if (rs.next()) {
				user = new User();
				transformer(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return user;
	}

	@Override
	public User get(String username, String email) {
		User user = null;
		String sql = "SELECT Account.Account_id, \r\n"
				+ "			Username, \r\n"
				+ "			Password, \r\n"
				+ "			Fullname, \r\n"
				+ "			Email, \r\n"
				+ "			Phone, \r\n"
				+ "			Gender, \r\n"
				+ "			DoB, \r\n"
				+ "			Avatar, \r\n"
				+ "			IsActive, \r\n"
				+ "			IsAdmin, \r\n"
				+ "			CreateDate \r\n"
				+ "FROM [Account] \r\n"
				+ "JOIN [Profile]\r\n"
				+ "		ON Account.Account_id = Profile.Account_id\r\n"
				+ "WHERE Account.Username = ? \r\n"
				+ "		AND Profile.Email = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, email);
			rs = pst.executeQuery();
			if (rs.next()) {
				user = new User();
				transformer(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return user;
	}

	@Override
	public User getLogin(String username, String password) {
		User user = null;
		String sql = "SELECT Account.Account_id, \r\n"
				+ "			Username, \r\n"
				+ "			Password, \r\n"
				+ "			Fullname, \r\n"
				+ "			Email, \r\n"
				+ "			Phone, \r\n"
				+ "			Gender, \r\n"
				+ "			DoB, \r\n"
				+ "			Avatar, \r\n"
				+ "			IsActive, \r\n"
				+ "			IsAdmin, \r\n"
				+ "			CreateDate \r\n"
				+ "FROM [Account] \r\n"
				+ "JOIN [Profile]\r\n"
				+ "		ON Account.Account_id = Profile.Account_id\r\n"
				+ "WHERE Account.Username = ? \r\n"
				+ "		AND Account.Password = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, password);
			rs = pst.executeQuery();
			if (rs.next()) {
				user = new User();
				transformer(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return user;
	}

	@Override
	public boolean isExistEmail(String email) {
		boolean isExist = false;
		String sql = "SELECT * \r\n"
				+ "FROM [Profile] \r\n"
				+ "WHERE [Email] = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			rs = pst.executeQuery();
			if (rs.next()) {
				isExist = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return isExist;
	}

	@Override
	public boolean isExistUsername(String username) {
		boolean isExist = false;
		String sql = "SELECT * \r\n"
				+ "FROM [Account] \r\n"
				+ "WHERE [Username] = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			rs = pst.executeQuery();
			if (rs.next()) {
				isExist = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return isExist;
	}

	@Override
	public boolean save(User user) {
		boolean isSaved = false;
		String sql = "{CALL [dbo].Register(?, ?, ?, ?)}";
		try {
			cs = conn.prepareCall(sql);
			cs.setString(1, user.getFullName());
			cs.setString(2, user.getUsername());
			cs.setString(3, user.getEmail());
			cs.setString(4, user.getPassword());
			isSaved = cs.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(cs);
		}
		return isSaved;
	}

	@Override
	public boolean saveFull(User user) {
		boolean isSaved = false;
		String sql = "INSERT INTO [Account] ([Username],[Password],[IsActive], [IsAdmin], [CreateDate])\r\n"
				+ "VALUES (?, ?, 1, ?, GETDATE())\r\n"
				+ "DECLARE @accountId  AS int \r\n"
				+ "SET @accountId = SCOPE_IDENTITY()\r\n"
				+ "INSERT INTO Profile ([Account_id],[Email],[Fullname],[Phone],[Gender],[DoB],[Avatar])\r\n"
				+ "VAlUES (@accountId, ?, ?, ?, ?, ?, ?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, user.getUsername());
			pst.setString(2, user.getPassword());
			pst.setInt(3, user.getIsAdmin());
			pst.setString(4, user.getEmail());
			pst.setString(5, user.getFullName());
			pst.setString(6, user.getPhone());
			pst.setInt(7, user.getGender());
			pst.setDate(8, user.getDob());
			pst.setString(9, user.getAvatar());
			isSaved = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(pst);
		}
		return isSaved;
	}

	@Override
	public boolean update(String fullName, String email, String phone, int gender, Date dob, int userId) {
		boolean isUpdated = false;
		String sql = "UPDATE [Profile]\r\n"
				+ "	SET [Fullname] = ?\r\n"
				+ "      ,[Email] = ?\r\n"
				+ "      ,[Phone] = ?\r\n"
				+ "      ,[Gender] = ?\r\n"
				+ "      ,[DoB] = ?\r\n"
				+ " WHERE [Account_id] = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, fullName);
			pst.setString(2, email);
			pst.setString(3, phone);
			pst.setInt(4, gender);
			pst.setDate(5, dob);
			pst.setInt(6, userId);
			isUpdated = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(pst);
		}
		return isUpdated;
	}

	@Override
	public boolean updateAvatar(int userId, String avatar) {
		boolean isUpdated = false;
		String sql = "UPDATE [Profile]\r\n"
				+ "	SET [Avatar] = ?\r\n"
				+ " WHERE [Account_id] = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, avatar);
			pst.setInt(2, userId);
			isUpdated = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(pst);
		}
		return isUpdated;
	}

	@Override
	public boolean updatePassword(int userId, String newPassword) {
		boolean isUpdated = false;
		String sql = "UPDATE [Account]\r\n"
				+ "	SET [Password] = ?\r\n"
				+ " WHERE [Account_id] = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, newPassword);
			pst.setInt(2, userId);
			isUpdated = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(pst);
		}
		return isUpdated;
	}

	@Override
	public boolean setAdmin(int userId) {
		boolean isUpdated = false;
		String sql = "UPDATE [Account]"
				+ "	SET [isAdmin] = 1"
				+ " WHERE [Account_id] = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, userId);
			isUpdated = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(pst);
		}
		return isUpdated;
	}

	@Override
	public boolean setUser(int userId) {
		boolean isUpdated = false;
		String sql = "UPDATE [Account]"
				+ "	SET [isAdmin] = 0"
				+ " WHERE [Account_id] = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, userId);
			isUpdated = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(pst);
		}
		return isUpdated;
	}

	@Override
	public boolean setActive(int userId) {
		boolean isUpdated = false;
		String sql = "UPDATE [Account]"
				+ "	SET [isActive] = 1"
				+ " WHERE [Account_id] = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, userId);
			isUpdated = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(pst);
		}
		return isUpdated;
	}

	@Override
	public boolean setBlock(int userId) {
		boolean isUpdated = false;
		String sql = "UPDATE [Account]"
				+ "	SET [isActive] = 0"
				+ " WHERE [Account_id] = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, userId);
			isUpdated = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(pst);
		}
		return isUpdated;
	}

	@Override
	public boolean delete(int userId) {
		return false;
	}
	
	private void transformer(User user) throws SQLException {
		user.setId(rs.getInt(1));
		user.setUsername(rs.getString(2));
		user.setPassword(rs.getString(3));
		user.setFullName(rs.getString(4));
		user.setEmail(rs.getString(5));
		user.setPhone(rs.getString(6));
		user.setGender(rs.getInt(7));
		user.setDob(rs.getDate(8));
		user.setAvatar(rs.getString(9));
		user.setIsActive(rs.getInt(10));
		user.setIsAdmin(rs.getInt(11));
		user.setCreateDate(rs.getDate(12));
	}

}
