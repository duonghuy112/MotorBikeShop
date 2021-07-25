package com.tromic.service;

import java.util.List;

import com.tromic.persistence.Comment;


public interface CommentService {
	List<Comment> getAll();
	
	List<Comment> getByProductId(int productId);
	
	Comment get(int commentId);
	
	boolean save(Comment comment);
	
	boolean delete(int commentId);
	
}
