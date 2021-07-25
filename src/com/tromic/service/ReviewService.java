package com.tromic.service;

import java.util.List;

import com.tromic.persistence.Review;

public interface ReviewService {

	List<Review> getAll();
	
	boolean save(Review review);
	
	boolean delete(int reviewId);
	
	boolean updatePublish(int reviewId);
	
	boolean updateHidden(int reviewId);
}
