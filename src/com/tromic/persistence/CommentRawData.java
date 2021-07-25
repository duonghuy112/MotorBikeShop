package com.tromic.persistence;

import java.sql.Date;

import com.tromic.service.ProductService;
import com.tromic.service.UserService;
import com.tromic.service.impl.ProductServiceImpl;
import com.tromic.service.impl.UserServiceImpl;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentRawData {
	
	private static ProductService productService;
	private static UserService userService;
	
	static {
		productService = new ProductServiceImpl();
		userService = new UserServiceImpl();
	}
	
	private Integer id;
	private Integer productId;
	private Integer userId;
	private String content;
	private Date createDate;
	
	public static Comment transfer(CommentRawData commentRawData) {
		Comment comment = new Comment();
		comment.setId(commentRawData.getId());
		comment.setProduct(productService.get(commentRawData.getProductId()));
		comment.setUser(userService.get(commentRawData.getUserId()));
		comment.setContent(commentRawData.getContent());
		comment.setCreateDate(commentRawData.getCreateDate());
		return comment;
	}
}
