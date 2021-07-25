package com.tromic.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import com.tromic.dao.CommentDao;
import com.tromic.dao.impl.CommentDaoImpl;
import com.tromic.persistence.Comment;
import com.tromic.persistence.CommentRawData;
import com.tromic.service.CommentService;

public class CommentServiceImpl implements CommentService{

	private CommentDao commentDao;
	
	public CommentServiceImpl() {
		commentDao = new CommentDaoImpl();
	}
	
	@Override
	public List<Comment> getAll() {
		return commentDao.getAll()
				.stream()
				.map(CommentRawData::transfer)
				.collect(Collectors.toList());
	}

	@Override
	public List<Comment> getByProductId(int productId) {
		return commentDao.getByProductId(productId)
				.stream()
				.map(CommentRawData::transfer)
				.collect(Collectors.toList());
	}

	@Override
	public Comment get(int commentId) {
		return CommentRawData.transfer(commentDao.get(commentId));
	}

	@Override
	public boolean save(Comment comment) {
		return commentDao.save(comment);
	}

	@Override
	public boolean delete(int commentId) {
		return commentDao.delete(commentId);
	}

}
