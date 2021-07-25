package com.tromic.persistence;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Shipping {
	private Integer id;
	private String fullname;
	private String phone;
	private String address;
	private Double totalPrice;
}
