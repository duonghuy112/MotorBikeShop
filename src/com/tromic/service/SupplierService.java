package com.tromic.service;

import java.util.List;

import com.tromic.persistence.Supplier;

public interface SupplierService {
	
	List<Supplier> getAll();
	
	Supplier get(int supplierId);
}
