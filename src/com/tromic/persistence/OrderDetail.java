package com.tromic.persistence;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetail {
	private Integer id;
	private Order order;
	private Product product;
	private Integer quantity;
}
