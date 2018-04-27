package com.jeong.haejwo.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping("/changeDown")
	public @ResponseBody Map<String,Object> changeDown(){
		
		return null;
	}
}
