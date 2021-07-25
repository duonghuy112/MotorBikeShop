package com.tromic.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import com.tromic.dao.ReviewDao;
import com.tromic.dao.impl.ReviewDaoImpl;
import com.tromic.persistence.Review;
import com.tromic.persistence.ReviewRawData;
import com.tromic.service.ReviewService;

public class ReviewServiceImpl implements ReviewService {

	private ReviewDao reviewDao;
	
	public ReviewServiceImpl() {
		reviewDao = new ReviewDaoImpl();
	}
	
	@Override
	public List<Review> getAll() {
		return reviewDao.getAll()
				.stream()
				.map(ReviewRawData::transfer)
				.collect(Collectors.toList());
	}

	@Override
	public boolean save(Review review) {
		return reviewDao.save(review);
	}

	@Override
	public boolean delete(int reviewId) {
		return reviewDao.delete(reviewId);
	}

	@Override
	public boolean updatePublish(int reviewId) {
		return reviewDao.updatePublish(reviewId);
	}

	@Override
	public boolean updateHidden(int reviewId) {
		return reviewDao.updateHidden(reviewId);
	}

}
