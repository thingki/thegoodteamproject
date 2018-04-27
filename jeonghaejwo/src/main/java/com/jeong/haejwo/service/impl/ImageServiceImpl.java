package com.jeong.haejwo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.jeong.haejwo.service.DefaultService;

@Service
@Qualifier("image")
public class ImageServiceImpl implements DefaultService {

	@Override
	public int insert(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String, Object> getOne(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> getList(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return 0;
	}

}
