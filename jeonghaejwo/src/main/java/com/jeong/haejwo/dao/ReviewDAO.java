package com.jeong.haejwo.dao;

import java.util.List;
import java.util.Map;

public interface ReviewDAO {
	
	int insertReview(Map<String,Object> data);
	
	int vaildReview(Map<String,Object> data);
	
	List<Map<String, Object>> selectList(Map<String,Object> data);
}
