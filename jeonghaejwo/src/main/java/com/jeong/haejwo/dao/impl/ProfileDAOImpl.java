package com.jeong.haejwo.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.jeong.haejwo.dao.DefaultDAO;

@Component
@Qualifier("profile")
public class ProfileDAOImpl implements DefaultDAO{

	@Autowired
	SqlSessionFactory ssf;
	
	//방문기록 저장용이긴한데 구분자를 하나 추가해서 다른 기능할수도 있도록 수정중
	//1이 방문기록 2가 즐겨찾는곳
	@Override
	public int insert(Map<String, Object> data) {
		SqlSession ss=ssf.openSession();
		int toggle = Integer.parseInt((String) data.get("toggle"));
		int result=0;
		switch(toggle){
		case 1:
			result=ss.insert("profile.history",data);
		break;
		case 2:
			result=ss.insert("profile.insertFav",data);
		break;
		}
		
		ss.close();
		return result;
	}

	//유저정보 하나 받아옴
	@Override
	public Map<String, Object> selectOne(Map<String, Object> data) {
		SqlSession ss=ssf.openSession();
		Map<String,Object> result=new HashMap<String,Object>();
		result.put("result", ss.selectList("profile.selectOne",data));
		ss.close();
		return result;
	}

	//나중에 분기문 추가될듯 지금은 즐겨찾기만 가져옴
	@Override
	public List<Object> selectList(Map<String, Object> data) {
		SqlSession ss=ssf.openSession();
		List<Object> result = new ArrayList<Object>();
		result.add(ss.selectList("profile.selectFav",data));
		return result;
	}

	@Override
	public int update(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Map<String, Object> data) {
		SqlSession ss = ssf.openSession();
		int result = ss.delete("profile.deleteFav", data); 
		return result;
	}

}
