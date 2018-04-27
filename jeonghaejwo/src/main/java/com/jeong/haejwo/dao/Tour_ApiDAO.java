package com.jeong.haejwo.dao;

import java.util.Map;

public interface Tour_ApiDAO {

	String requestAPI(String u);
	
	int insert(Map<String,Object> data);
}
