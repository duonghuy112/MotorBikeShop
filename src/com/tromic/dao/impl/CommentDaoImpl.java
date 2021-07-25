package com.tromic.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tromic.connection.DatabaseConnection;
import com.tromic.dao.CommentDao;
import com.tromic.persistence.Comment;
import com.tromic.persistence.CommentRawData;
import com.tromic.utils.SqlUtils;

public class CommentDaoImpl implements CommentDao{

	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public CommentDaoImpl() {
		conn = DatabaseConnection.getConnection();
	}
	
	@Override
	public List<CommentRawData> getAll() {
		List<CommentRawData> list = new ArrayList<>();
		String sql = "SELECT * \r\n"
				+ "FROM [Comment]";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				CommentRawData comment = new CommentRawData();
				transformer(comment);
				list.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return list;
	}

	@Override
	public List<CommentRawData> getByProductId(int productId) {
		List<CommentRawData> list = new ArrayList<>();
		String sql = "SELECT * \r\n"
				+ "FROM [Comment] \r\n"
				+ "WHERE Product_id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, productId);
			rs = pst.executeQuery();
			while (rs.next()) {
				CommentRawData comment = new CommentRawData();
				transformer(comment);
				list.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return list;
	}

	@Override
	public CommentRawData get(int commentId) {
		CommentRawData comment = null;
		String sql = "SELECT * \r\n"
				+ "FROM [Comment] \r\n"
				+ "WHERE Comment_id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, commentId);
			rs = pst.executeQuery();
			if (rs.next()) {
				comment = new CommentRawData();
				transformer(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return comment;
	}

	@Override
	public boolean save(Comment comment) {
		boolean isSaved = false;
		String sql = "INSERT INTO [Comment]\r\n"
				+ "					([Product_id],\r\n"
				+ "					[Account_id],\r\n"
				+ "					[Content],\r\n"
				+ "					[CreateDate])\r\n"
				+ "VALUES ( ?, ?, ?, GETDATE())";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, comment.getProduct().getId());
			pst.setInt(2, comment.getUser().getId());
			pst.setString(3, comment.getContent());
			isSaved = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(pst);
		}
		return isSaved;
	}

	@Override
	public boolean delete(int commentId) {
		boolean isDeleted = false;
		String sql = "DELETE FROM [Comment] \r\n"
				+ "WHERE Comment_id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, commentId);
			isDeleted = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(pst);
		}
		return isDeleted;
	}
	
	private void transformer(CommentRawData comment) throws SQLException{
		comment.setId(rs.getInt(1));
		comment.setProductId(rs.getInt(2));
		comment.setUserId(rs.getInt(3));
		comment.setContent(rs.getString(4));
		comment.setCreateDate(rs.getDate(5));
	}
}
