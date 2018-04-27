package com.jeong.haejwo.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeong.haejwo.service.RankService;

@Controller
@RequestMapping("/rank")
public class RankController {

	@Autowired
	RankService rank;
	
	//리뷰 랭킹을 받아오는 부분
	@RequestMapping("/list")
	public @ResponseBody Map<String,Object> rankList(Map<String,Object> map){
		map.put("rank", rank.getRank());
		return map;
	}
}
