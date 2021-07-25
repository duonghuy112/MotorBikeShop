package com.tromic.dao;

import java.util.List;

import com.tromic.persistence.Category;

public interface CategoryDao {
	
	List<Category> getAll();
	
	Category get(int categoryId);
}
