package com.tromic.persistence;

import java.sql.Date;

import com.tromic.service.UserService;
import com.tromic.service.impl.UserServiceImpl;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewRawData {
	
	private static UserService userService;
	
	static {
		userService = new UserServiceImpl();
	}
	
	private Integer id;
	private Integer userId;
	private String content;
	private Integer isPublish;
	private Date createDate;
	
	public static Review transfer(ReviewRawData reviewRawData) {
		Review review = new Review();
		review.setId(reviewRawData.getId());
		review.setUser(userService.get(reviewRawData.getUserId()));
		review.setContent(reviewRawData.getContent());
		review.setIsPublish(reviewRawData.getIsPublish());
		review.setCreateDate(reviewRawData.getCreateDate());
		return review;
	}
}
