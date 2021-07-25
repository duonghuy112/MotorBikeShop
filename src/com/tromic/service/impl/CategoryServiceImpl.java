package com.tromic.service.impl;

import java.util.List;

import com.tromic.dao.CategoryDao;
import com.tromic.dao.impl.CategoryDaoImpl;
import com.tromic.persistence.Category;
import com.tromic.service.CategoryService;

public class CategoryServiceImpl implements CategoryService{
	
	private CategoryDao categoryDao;
	
	public CategoryServiceImpl() {
		categoryDao = new CategoryDaoImpl();
	}
	
	@Override
	public List<Category> getAll() {
		return categoryDao.getAll();
	}

	@Override
	public Category get(int categoryId) {
		return categoryDao.get(categoryId);
	}

}
