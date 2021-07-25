package com.tromic.dao;

import java.util.List;

import com.tromic.persistence.Product;
import com.tromic.persistence.ProductRawData;



public interface ProductDao {
	
	List<Product> getAll();
	
	List<ProductRawData> getAllPagging(int pageIndex, int pageSize);
	
	List<ProductRawData> getByCategoryId(int categoryId, int pageIndex, int pageSize);
	
	List<ProductRawData> getBySupplierId(int supplierId, int pageIndex, int pageSize);
	
	List<ProductRawData> seachByName(String productName, int pageIndex, int pageSize);
	
	ProductRawData get(int productId);
	
	boolean save(Product product);
	
	boolean update(Product product);
	
	boolean delete(int productId);
	
	int countPage(int pageSize);
	
	int countPageCategory(int categoryId, int pageSize);
	
	int countPageSupplier(int supplierId, int pageSize);
	
	int countAllSearchName(String productName);
	
	int countPageSearchName(String productName, int pageSize);
}
