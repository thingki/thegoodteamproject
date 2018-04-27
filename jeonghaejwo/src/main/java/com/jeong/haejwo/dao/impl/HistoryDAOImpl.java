package com.jeong.haejwo.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.jeong.haejwo.dao.DefaultDAO;

@Component
@Qualifier("history")
public class HistoryDAOImpl implements DefaultDAO {

	@Autowired
	SqlSessionFactory ssf;
	
	
	//분기문 추가 
	//1: user_plan
	//2: history
	//다른 DAO로 나눠야됨
	@Override
	public int insert(Map<String, Object> data) {
		System.out.println(data.get("title"));
		SqlSession ss= ssf.openSession();
		int result=0;
		int toggle=Integer.parseInt((String) data.get("toggle"));
		switch(toggle) {
		case 1:
			result=ss.insert("history.todoIn",data);
			break;
		case 2:
			System.out.println(data);
			result=ss.insert("history.insert",data);
			break;
		}
		ss.close();
		return result;
	}

	@Override
	public Map<String, Object> selectOne(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return null;
	}

	//분기문 추가 
	//1: user_plan
	//2: history
	//코드 너무 지저분함
	@Override
	public List<Object> selectList(Map<String, Object> data) {
		SqlSession ss= ssf.openSession();
		List<Object> result=new ArrayList<Object>();
		String toggle=(String) (data.get("toggle"));
		data.put("cnt", new Integer(0));
		if(toggle.equals("1")) {
			result.add(ss.selectList("history.list",data));
		}else {
			String s=(String) data.get("st");
			Integer i=Integer.parseInt(s);
			data.put("st", i);
			result.add(ss.selectList("history.select",data));
			String temp=(String) data.get("userId");
			result.add(ss.selectList("history.hisCount",temp));
		}
		ss.close();
		return result;
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
