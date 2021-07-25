package com.tromic.service;

import java.util.List;

import com.tromic.persistence.Category;

public interface CategoryService {
	
	List<Category> getAll();
	
	Category get(int categoryId);
}
