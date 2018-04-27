package com.jeong.haejwo.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jeong.haejwo.service.DefaultService;
import com.jeong.haejwo.service.ReviewService;
import com.jeong.haejwo.util.S3Uploader;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	ReviewService reService;
	
	@Autowired
	@Qualifier("image")
	DefaultService imageService;

	@RequestMapping("/addComment")
	public @ResponseBody Map<String, Object> addComment(MultipartHttpServletRequest multi) {
		//파일 업로드
		S3Uploader s3=new S3Uploader();
		String path=s3.upload(multi);
		
		Date date = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String dateS = transFormat.format(date);
		
		//코드 지저분하다 좀 고치자
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("userId", multi.getParameter("userId"));
		map.put("code", multi.getParameter("code"));
		map.put("point", multi.getParameter("points"));
		map.put("comment", multi.getParameter("comments"));
		map.put("date", dateS);
		map.put("reTitle", multi.getParameter("reTitle"));
		
		map.put("path", path);
		map.put("imgName", path.split("/")[3]);
		int imgNo= imageService.insert(map);
		map.put("imgNo",imgNo);
		
		int result= reService.writeReview(map);
		map=new HashMap<String,Object>();
		if(result==1) {
			map.put("result", "입력이 완료되었습니다");
		} else if(result==2) {
			map.put("result", "서버 에러가 감지되었습니다");
		} else if(result==0) {
			map.put("result", "입력실패");
		}
		return map;
	}
	
	@RequestMapping("/list")
	public @ResponseBody List<Map<String, Object>> getList(@RequestParam Map<String, Object> data, Map<String, Object> map, HttpSession hs){
		return reService.getList(data);
	}
	
	@RequestMapping("/test")
	public @ResponseBody List<Object> test(@RequestParam Map<String,Object> data){
		List<Object> test = new ArrayList<Object>();
		int num=Integer.parseInt((String) data.get("num"));
		Map<String,Object> temp;
		for(int i=num;i<num+10;i++) {
			temp=new HashMap<String, Object>();
			temp.put("writer", i);
			temp.put("location", i);
			temp.put("contents", i);
			temp.put("num", i);
			test.add(temp);
		}
		temp=new HashMap<String, Object>();
		temp.put("writer", 11);
		temp.put("location", 11);
		temp.put("contents", 11);
		temp.put("num", 11);
		temp.put("img", "https://www.google.co.kr/images/branding/googlelogo/2x/googlelogo_color_120x44dp.png");
		test.add(temp);
		return test;
	}

	
}
