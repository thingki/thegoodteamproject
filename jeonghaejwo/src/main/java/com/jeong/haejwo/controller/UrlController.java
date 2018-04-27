package com.jeong.haejwo.controller;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
public class UrlController {
	
	private static final Logger log = LoggerFactory.getLogger(UrlController.class);

	private String getUrl(String url, String rootPath) {
		return url.replace(rootPath + "/path", "");
	}
	@RequestMapping("/path/**")
	public ModelAndView goJsp(HttpServletRequest req, ModelAndView mav, HttpSession hs) {
		String url = req.getRequestURI();
		String rootPath = req.getContextPath();
		url = getUrl(url, rootPath);
		if(hs.getAttribute("isLogin")==null){
			hs.setAttribute("isLogin", false);
		}
		log.info("path =>{}", url);
		mav.setViewName(url);
		return mav;
	}

	@RequestMapping("/")
	public ModelAndView goIndex(ModelAndView mav, HttpSession hs) {
		mav.setViewName("home");
		if(hs.getAttribute("isLogin")==null){
			hs.setAttribute("isLogin", false);
		}
		return mav;
	}
}