package com.jeong.haejwo.dao.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jeong.haejwo.dao.RankDAO;

@Component
public class RankDAOImpl implements RankDAO {

	@Autowired
	private SqlSessionFactory ssf;
	
	@Override
	public Map<String, Object> selectRank() {
		SqlSession ss = ssf.openSession();
		Map<String, Object> result = new HashMap<String,Object>();
		result.put("result", ss.selectList("rank.selectRankList"));
		return result;
	}

}
