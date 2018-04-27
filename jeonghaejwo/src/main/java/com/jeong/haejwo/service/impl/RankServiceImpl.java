package com.jeong.haejwo.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeong.haejwo.dao.RankDAO;
import com.jeong.haejwo.service.RankService;

@Service
public class RankServiceImpl implements RankService {

	@Autowired
	RankDAO ranDAO;
	
	@Override
	public Map<String, Object> getRank() {
		return ranDAO.selectRank();
	}

}
