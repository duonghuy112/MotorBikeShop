package com.tromic.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import com.tromic.dao.ProductDao;
import com.tromic.dao.impl.ProductDaoImpl;
import com.tromic.persistence.Product;
import com.tromic.persistence.ProductRawData;
import com.tromic.service.ProductService;

public class ProductServiceImpl implements ProductService{
	
	private ProductDao productDao;
	
	public ProductServiceImpl() {
		productDao = new ProductDaoImpl();
	}

	@Override
	public List<Product> getAll() {
		return productDao.getAll();
	}

	@Override
	public List<Product> getAllPagging(int pageIndex, int pageSize) {
		return productDao.getAllPagging(pageIndex, pageSize)
				.stream()
				.map(ProductRawData::transfer)
				.collect(Collectors.toList());
	}

	@Override
	public List<Product> getByCategoryId(int categoryId, int pageIndex, int pageSize) {
		return productDao.getByCategoryId(categoryId, pageIndex, pageSize)
				.stream()
				.map(ProductRawData::transfer)
				.collect(Collectors.toList());
	}

	@Override
	public List<Product> getBySupplierId(int supplierId, int pageIndex, int pageSize) {
		return productDao.getBySupplierId(supplierId, pageIndex, pageSize)
				.stream()
				.map(ProductRawData::transfer)
				.collect(Collectors.toList());
	}

	@Override
	public List<Product> seachByName(String productName, int pageIndex, int pageSize) {
		return productDao.seachByName(productName, pageIndex, pageSize)
				.stream()
				.map(ProductRawData::transfer)
				.collect(Collectors.toList());
	}

	@Override
	public Product get(int productId) {
		return ProductRawData.transfer(productDao.get(productId));
	}

	@Override
	public boolean save(Product product) {
		return productDao.save(product);
	}

	@Override
	public boolean update(Product product) {
		return productDao.update(product);
	}

	@Override
	public boolean delete(int productId) {
		return productDao.delete(productId);
	}

	@Override
	public int countPage(int pageSize) {
		return productDao.countPage(pageSize);
	}

	@Override
	public int countPageCategory(int categoryId, int pageSize) {
		return productDao.countPageCategory(categoryId, pageSize);
	}

	@Override
	public int countPageSupplier(int supplierId, int pageSize) {
		return productDao.countPageSupplier(supplierId, pageSize);
	}

	@Override
	public int countAllSearchName(String productName) {
		return productDao.countAllSearchName(productName);
	}

	@Override
	public int countPageSearchName(String productName, int pageSize) {
		return productDao.countPageSearchName(productName, pageSize);
	}
	
	public static void main(String[] args) {
		ProductService service = new ProductServiceImpl();
		Product p = service.get(1);
		System.out.println(p);
	}
}
