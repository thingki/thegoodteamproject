package com.jeong.haejwo.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeong.haejwo.dao.ApiSend;

@Controller
@RequestMapping("/map")
public class MapController {
	@RequestMapping("/api")
	public @ResponseBody Map<String,Object> getPath(Map<String, Object> map, HttpSession hs){
		ApiSend ap=new ApiSend();
		map.put("json", ap.send());
		return map;
	}
}
