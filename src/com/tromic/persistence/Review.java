package com.tromic.persistence;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {
	private Integer id;
	private User user;
	private String content;
	private Integer isPublish;
	private Date createDate;
}
