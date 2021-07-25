package com.tromic.persistence;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
	private Integer id;
	private Product product;
	private User user;
	private String content;
	private Date createDate;
}
