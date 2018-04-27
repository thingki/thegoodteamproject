package com.jeong.haejwo.dao.impl;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeong.haejwo.dao.UserInfoDAO;
import com.jeong.haejwo.vo.UserInfoVO;




@Repository
public class UserInfoDAOImpl implements UserInfoDAO {
	@Autowired
	private SqlSessionFactory  ssf;
	
	@Override
	public UserInfoVO selectUserInfo(UserInfoVO ui) {
		
		SqlSession ss = ssf.openSession();
		ui = ss.selectOne("user.selectUserInfo", ui);
		ss.close();
		return ui;
	}

	@Override
	public int insertUserInfo(UserInfoVO ui) {
		SqlSession ss = ssf.openSession();
		int result = ss.insert("user.insertUserInfo", ui);
		ss.close();
		return result;
	}

	//api 로그인 회원용
	@Override
	public Map<String,Object> selectUserInfo(Map<String, Object> data) {
		SqlSession ss = ssf.openSession();
		Map<String,Object> ui = ss.selectOne("user.selectApiUser",data);
		ss.close();
		return ui;
	}
	//api 회원가입 유저용
	@Override
	public int insertUserInfo(Map<String, Object> data) {
		SqlSession ss = ssf.openSession();
		int result = ss.insert("user.insertApiUser",data);
		ss.close();
		return result;
	}



}
