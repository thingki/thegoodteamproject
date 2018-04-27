package com.jeong.haejwo.service;

import java.util.List;
import java.util.Map;

public interface ReviewService {

	int writeReview(Map<String,Object> data);
	
	List<Map<String, Object>> getList(Map<String, Object> data);
}
