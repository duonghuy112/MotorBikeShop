package com.tromic.dao;

import java.util.List;

import com.tromic.persistence.Supplier;

public interface SupplierDao {
	
	List<Supplier> getAll();
	
	Supplier get(int supplierId);
}
