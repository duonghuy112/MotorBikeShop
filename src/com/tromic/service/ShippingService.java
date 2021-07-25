package com.tromic.service;

import java.util.List;

import com.tromic.persistence.Shipping;


public interface ShippingService {
	
	List<Shipping> getAll();
	
	Shipping get(int shippingId);
	
	int saveReturnId(Shipping shipping);
	
	boolean delete(int shippingId);
}
