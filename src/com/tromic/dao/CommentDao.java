package com.tromic.dao;

import java.util.List;

import com.tromic.persistence.Comment;
import com.tromic.persistence.CommentRawData;


public interface CommentDao {
	List<CommentRawData> getAll();
	
	List<CommentRawData> getByProductId(int productId);
	
	CommentRawData get(int commentId);
	
	boolean save(Comment comment);
	
	boolean delete(int commentId);
	
}
