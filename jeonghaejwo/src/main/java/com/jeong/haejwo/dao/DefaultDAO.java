package com.jeong.haejwo.dao;

import java.util.List;
import java.util.Map;

//이거 기준으로 다 통합시킬거
public interface DefaultDAO {

	int insert(Map<String,Object> data);
	
	Map<String,Object> selectOne(Map<String,Object> data);
	
	List<Object> selectList(Map<String,Object> data);
	
	int update(Map<String,Object> data);
	
	int delete(Map<String,Object> data);
}
