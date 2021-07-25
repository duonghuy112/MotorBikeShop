package com.tromic.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tromic.connection.DatabaseConnection;
import com.tromic.dao.ReviewDao;
import com.tromic.persistence.Review;
import com.tromic.persistence.ReviewRawData;
import com.tromic.utils.SqlUtils;

public class ReviewDaoImpl implements ReviewDao {

	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public ReviewDaoImpl() {
		conn = DatabaseConnection.getConnection();
	}
	
	@Override
	public List<ReviewRawData> getAll() {
		List<ReviewRawData> list = new ArrayList<>();
		String sql = "SELECT * \r\n"
				+ "FROM [Review]";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				ReviewRawData review = new ReviewRawData();
				transformer(review);
				list.add(review);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return list;
	}

	@Override
	public boolean save(Review review) {
		boolean isSaved = false;
		String sql = "INSERT INTO [dbo].[Review]\r\n"
				+ "           ([Account_id]\r\n"
				+ "           ,[Content]\r\n"
				+ "           ,[isPublish]\r\n"
				+ "           ,[CreateDate])\r\n"
				+ "     VALUES ( ?, ?, 1, GETDATE())";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, review.getUser().getId());
			pst.setString(2, review.getContent());
			isSaved = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(pst);
		}
		return isSaved;
	}

	@Override
	public boolean delete(int reviewId) {
		return false;
	}

	@Override
	public boolean updatePublish(int reviewId) {
		boolean isUpdated = false;
		String sql = "UPDATE [Review]\r\n"
				+ "SET [isPublish] = 1\r\n"
				+ "WHERE [Review_id] = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, reviewId);
			isUpdated = pst.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			SqlUtils.close(pst);
		}
		return isUpdated;
	}

	@Override
	public boolean updateHidden(int reviewId) {
		boolean isUpdated = false;
		String sql = "UPDATE [Review]\r\n"
				+ "SET [isPublish] = 0\r\n"
				+ "WHERE [Review_id] = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, reviewId);
			isUpdated = pst.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			SqlUtils.close(pst);
		}
		return isUpdated;
	}
	
	private void transformer(ReviewRawData review) throws SQLException {
		review.setId(rs.getInt(1));
		review.setUserId(rs.getInt(2));
		review.setContent(rs.getString(3));
		review.setIsPublish(rs.getInt(4));
		review.setCreateDate(rs.getDate(5));
	}

}
