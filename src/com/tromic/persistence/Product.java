package com.tromic.persistence;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
	private Integer id;
	private Category category;
	private Supplier supplier;
	private String name;
	private Double price;
	private String description;
	private String image;
	private Integer status;
	private Date createDate;
}
