package com.tromic.dao;

import java.util.List;

import com.tromic.persistence.Review;
import com.tromic.persistence.ReviewRawData;

public interface ReviewDao {

	List<ReviewRawData> getAll();
	
	boolean save(Review review);
	
	boolean delete(int reviewId);
	
	boolean updatePublish(int reviewId);
	
	boolean updateHidden(int reviewId);
}
