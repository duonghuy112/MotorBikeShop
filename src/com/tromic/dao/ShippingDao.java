package com.tromic.dao;

import java.util.List;

import com.tromic.persistence.Shipping;


public interface ShippingDao {
	
	List<Shipping> getAll();
	
	Shipping get(int shippingId);
	
	int saveReturnId(Shipping shipping);
	
	boolean delete(int shippingId);
}
