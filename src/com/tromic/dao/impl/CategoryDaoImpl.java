package com.tromic.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tromic.connection.DatabaseConnection;
import com.tromic.dao.CategoryDao;
import com.tromic.persistence.Category;
import com.tromic.utils.SqlUtils;

public class CategoryDaoImpl implements CategoryDao{
	
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public CategoryDaoImpl() {
		conn = DatabaseConnection.getConnection();
	}
	
	@Override
	public List<Category> getAll() {
		List<Category> list = new ArrayList<>();
		String sql = "SELECT * \r\n"
				+ "FROM [Category]";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				Category category = new Category();
				transformer(category);
				list.add(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return list;
	}

	@Override
	public Category get(int categoryId) {
		Category category = null;
		String sql = "SELECT * \r\n"
				+ "FROM [Category] \r\n"
				+ "WHERE Category_id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, categoryId);
			rs = pst.executeQuery();
			if (rs.next()) {
				category = new Category();
				transformer(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return category;
	}
	
	private void transformer(Category category) throws SQLException {
		category.setId(rs.getInt(1));
		category.setName(rs.getString(2));
	}
}
