package com.jeong.haejwo.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeong.haejwo.service.DefaultService;

@Controller
@RequestMapping("/history")
public class HistoryController {

	@Autowired
	@Qualifier("history")
	DefaultService hiService;
	
	@RequestMapping("/todo")
	public @ResponseBody Map<String,Object> getToDo(@RequestParam Map<String,Object> data){
		Map<String,Object> result=new HashMap<String,Object>();
		data.put("toggle","1");
		result.put("result", hiService.getList(data));
		return result;
	}
	
	@RequestMapping("/todoIn")
	public @ResponseBody Map<String,Object> insertTodo(@RequestParam Map<String,Object> data){
		Map<String,Object> result=new HashMap<String,Object>();
		data.put("toggle","1");
		if(hiService.insert(data)==1) {
			result.put("result", true);
		}
		return result;
	}
	
	@RequestMapping("/insert")
	public @ResponseBody Map<String,Object> insert(@RequestParam Map<String,Object> data){
		Map<String,Object> result=new HashMap<String,Object>();
		Date date = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");
		String dateS = transFormat.format(date);
		data.put("date", dateS);
		result.put("result", (hiService.insert(data)==1)?true:false);
		return result;
	}
	
	@RequestMapping("/list")
	public @ResponseBody Map<String,Object> getList(@RequestParam Map<String,Object> data){
		Map<String,Object> result=new HashMap<String,Object>();
		result.put("result", hiService.getList(data));
		return result;
	}
}
