package com.tromic.service;

import java.util.List;

import com.tromic.persistence.Product;


public interface ProductService {
	
	List<Product> getAll();
	
	List<Product> getAllPagging(int pageIndex, int pageSize);
	
	List<Product> getByCategoryId(int categoryId, int pageIndex, int pageSize);
	
	List<Product> getBySupplierId(int supplierId, int pageIndex, int pageSize);
	
	List<Product> seachByName(String productName, int pageIndex, int pageSize);
	
	Product get(int productId);
	
	boolean save(Product product);
	
	boolean update(Product product);
	
	boolean delete(int productId);
	
	int countPage(int pageSize);
	
	int countPageCategory(int categoryId, int pageSize);
	
	int countPageSupplier(int supplierId, int pageSize);
	
	int countAllSearchName(String productName);
	
	int countPageSearchName(String productName, int pageSize);
}
