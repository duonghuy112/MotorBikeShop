package com.tromic.persistence;

import java.sql.Date;

import com.tromic.service.CategoryService;
import com.tromic.service.SupplierService;
import com.tromic.service.impl.CategoryServiceImpl;
import com.tromic.service.impl.SupplierServiceImpl;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductRawData {
	
	private static CategoryService categoryService;
	private static SupplierService supplierService;
	
	static {
		categoryService = new CategoryServiceImpl();
		supplierService = new SupplierServiceImpl();
	}
	
	private Integer id;
	private Integer categoryId;
	private Integer supplierId;
	private String name;
	private Double price;
	private String description;
	private String image;
	private Integer status;
	private Date createDate;
	
	public static Product transfer(ProductRawData productRawData) {
		Product product = new Product();
		product.setId(productRawData.getId());
		product.setCategory(categoryService.get(productRawData.getCategoryId()));
		product.setSupplier(supplierService.get(productRawData.getSupplierId()));
		product.setName(productRawData.getName());
		product.setPrice(productRawData.getPrice());
		product.setDescription(productRawData.getDescription());
		product.setImage(productRawData.getImage());
		product.setStatus(productRawData.getStatus());
		product.setCreateDate(productRawData.getCreateDate());
		return product;
	}
	
	
}
