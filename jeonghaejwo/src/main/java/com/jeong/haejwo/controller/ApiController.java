package com.jeong.haejwo.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jeong.haejwo.service.Tour_ApiService;

@Controller
@RequestMapping("/api")
public class ApiController {

	@Autowired
	Tour_ApiService tourService;

	private static final Logger log = LoggerFactory.getLogger(ApiController.class); 
	//여기서 현재위치, 카테고리, 반경설정을 받아와서 서비스에 넘기도록 수정해야됨
	//맵으로 현재위치, 반경설정을 받아옴
	@RequestMapping("/tour_api")
	public @ResponseBody Map<String,Object> getPath(@RequestParam Map<String, Object> data, Map<String, Object> map, HttpSession hs){
		//음식관련은 뭐든간에 1번만
		map.put("1", tourService.requestAPI("39", data));
		//일단은 이렇게 해놓긴 하는데 여기서 갯수를 개산하거나 웹에서 갯수를 계산해서 던져주게 해놔야됨
		log.info("데이타 :{}", data);
		int times=Integer.parseInt((String) data.get("times"));
		for(int i=2;i<=times;i++) {
			//i번째 경유지 그런식으로 해서 할거
			//따로 코드를 넣는다던가 하는 방식으로 할때는 좀 수정이 필요할듯
			//num 에 넣은 i는 페이지를 변경할때 쓸거
			data.put("num", i);
			map.put(""+i, tourService.requestAPI("", data));
		}
		
		return map;
	}
//	데이터가 오류인 경우 다시 한번 api 호출하기
	@RequestMapping("/tour_apiOne")
	public @ResponseBody Map<String,Object> getPathOne(@RequestParam Map<String, Object> data, Map<String, Object> map, HttpSession hs){
		//숫자 1대신 다른것이 필요!
		map.put("1", tourService.requestAPI("", data));
		
		
		return map;
	}
	@RequestMapping("/insert")
	public @ResponseBody Map<String,Object> insert(@RequestParam Map<String,Object> data){
		Map<String,Object> result= new HashMap<String,Object>();
		result.put("result", (tourService.insert(data)==1)? true:false);
		return result; 
	}
	
	
	@RequestMapping("/test")
	public @ResponseBody Map<String,Object> test(@RequestParam Map<String, Object> map, HttpSession hs){
		System.out.println(map);
		System.out.println("온거");
		return map;
	}
	
	@RequestMapping("/show-way")
	public ModelAndView goIndex(ModelAndView mav, 
			@RequestParam Map<String, Object> data, Map<String, Object> map,
			HttpSession hs, HttpServletRequest req) {
		String url = req.getRequestURI();
		mav.setViewName("/path/map/show-way");

		log.info("url :{}", url);
		log.info("data :{}", data);
		log.info("map :{}", map);
		log.info("mav :{}", mav);
		return mav;

	}
	
}
