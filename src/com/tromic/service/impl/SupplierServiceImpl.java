package com.tromic.service.impl;

import java.util.List;

import com.tromic.dao.SupplierDao;
import com.tromic.dao.impl.SupplierDaoImpl;
import com.tromic.persistence.Supplier;
import com.tromic.service.SupplierService;

public class SupplierServiceImpl implements SupplierService {

	private SupplierDao supplierDao;
	
	public SupplierServiceImpl() {
		supplierDao = new SupplierDaoImpl();
	}
	
	@Override
	public List<Supplier> getAll() {
		return supplierDao.getAll();
	}

	@Override
	public Supplier get(int supplierId) {
		return supplierDao.get(supplierId);
	}

}
