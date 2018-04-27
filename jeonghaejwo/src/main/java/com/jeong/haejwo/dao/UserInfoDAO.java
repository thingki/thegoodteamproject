package com.jeong.haejwo.dao;

import java.util.Map;

import com.jeong.haejwo.vo.UserInfoVO;

public interface UserInfoDAO {

	public UserInfoVO selectUserInfo(UserInfoVO ui);
	
	public int insertUserInfo(UserInfoVO ui);
	
	public int insertUserInfo(Map<String,Object> data);
	
	public Map<String,Object> selectUserInfo(Map<String,Object> data);
}
