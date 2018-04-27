package com.jeong.haejwo.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeong.haejwo.dao.ReviewDAO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Autowired
	private SqlSessionFactory ssf;
	
	@Override
	public int insertReview(Map<String, Object> data) {
		SqlSession ss = ssf.openSession();
		int result=ss.insert("review.insertr",data);
		ss.close();
		return result;
	}

	@Override
	public List<Map<String, Object>> selectList(Map<String, Object> data) {
		SqlSession ss = ssf.openSession();
		String s=(String) data.get("startNo");
		Integer i=Integer.parseInt(s);
		data.put("startNo", i);
		List<Map<String, Object>> result = ss.selectList("review.selectList",data);
		ss.close();
		return result;
	}

	@Override
	public int vaildReview(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return 0;
	}

}