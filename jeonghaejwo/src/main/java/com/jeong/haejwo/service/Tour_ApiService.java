package com.jeong.haejwo.service;

import java.util.Map;

public interface Tour_ApiService {

	String requestAPI(String code, Map<String, Object> geo);
	
	int insert(Map<String,Object> data);
}
