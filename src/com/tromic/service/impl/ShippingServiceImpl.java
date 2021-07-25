package com.tromic.service.impl;

import java.util.List;

import com.tromic.dao.ShippingDao;
import com.tromic.dao.impl.ShippingDaoImpl;
import com.tromic.persistence.Shipping;
import com.tromic.service.ShippingService;

public class ShippingServiceImpl implements ShippingService {

	private ShippingDao shippingDao;
	
	public ShippingServiceImpl() {
		shippingDao = new ShippingDaoImpl();
	}
	
	@Override
	public List<Shipping> getAll() {
		return shippingDao.getAll();
	}

	@Override
	public Shipping get(int shippingId) {
		return shippingDao.get(shippingId);
	}

	@Override
	public int saveReturnId(Shipping shipping) {
		return shippingDao.saveReturnId(shipping);
	}

	@Override
	public boolean delete(int shippingId) {
		return shippingDao.delete(shippingId);
	}

}
