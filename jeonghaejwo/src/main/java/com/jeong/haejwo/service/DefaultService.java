package com.jeong.haejwo.service;

import java.util.List;
import java.util.Map;

public interface DefaultService {

	int insert(Map<String,Object> data);
	
	Map<String,Object> getOne(Map<String,Object> data);
	
	List<Object> getList(Map<String,Object> data);
	
	int update(Map<String,Object> data);
	
	int delete(Map<String,Object> data);
}
