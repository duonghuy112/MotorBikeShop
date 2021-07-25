package com.tromic.persistence;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
	private Integer id;
	private User user;
	private Shipping shipping;
	private Double totalPrice;
	private String note;
	private Integer status;
	private Date createDate;
}
