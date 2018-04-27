package com.jeong.haejwo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeong.haejwo.dao.ReviewDAO;
import com.jeong.haejwo.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDAO reDAO;
	
	@Override
	public int writeReview(Map<String, Object> data) {
		return reDAO.insertReview(data);
	}

	@Override
	public List<Map<String, Object>> getList(Map<String, Object> data) {
		return reDAO.selectList(data);
	}

}
