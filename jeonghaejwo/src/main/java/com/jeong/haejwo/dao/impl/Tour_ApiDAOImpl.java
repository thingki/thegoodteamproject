package com.jeong.haejwo.dao.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jeong.haejwo.dao.Tour_ApiDAO;

@Component
public class Tour_ApiDAOImpl implements Tour_ApiDAO {

	@Autowired
	SqlSessionFactory ssf;
	
	@Override
	public String requestAPI(String u) {
		URL url = null;
	    HttpURLConnection conn = null;
	    String jsonData = "";
	    BufferedReader br = null;
	    StringBuffer sb = null;
	    String returnText = "";
	    
	    try {
	    	//받은 주소를 url로 변환
	        url = new URL(u);
	        System.out.println(url);   
	        //커넥션 맺고 설정하고 연결
	        conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestProperty("Accept", "application/json");
	        conn.setRequestMethod("GET");
	        conn.connect();
	        
	        //버퍼리더로 받은거변환
	        br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	 
	        sb = new StringBuffer();
	 
	        //스트링버퍼에 변환한거 넣음
	        while ((jsonData = br.readLine()) != null) {
	            sb.append(jsonData);
	        }
	        //리턴텍스트에 스트링 버퍼에있는 값들 넣어줌
	        returnText = sb.toString();
	 
	    } catch (IOException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (br != null) br.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	    return returnText;
	}

	@Override
	public int insert(Map<String, Object> data) {
		SqlSession ss= ssf.openSession();
		int result= ss.insert("api.insert",data);
		return result;
	}

}
