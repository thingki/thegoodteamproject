package com.jeong.haejwo.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeong.haejwo.dao.Tour_ApiDAO;
import com.jeong.haejwo.service.Tour_ApiService;

@Service
public class Tour_ApiServiceImpl implements Tour_ApiService {

	@Autowired
	Tour_ApiDAO tourDAO;

	@Override
	public String requestAPI(String code, Map<String, Object> data) {
		String base = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?serviceKey=";
		String key = "peWkmeOBUcoT4b1Oqd7%2FotBYLzAO%2BWBymO82ftCMolY%2Bs9AI1ppnNVO4U9a%2Blhohtj1X38Iy4ENC1ReL1aHKWg%3D%3D";

		// 페이지당 최대 갯수는 10개인듯 그리고 한페이지에 10개 않되면 뒤에거는 않잡힘
		String startPage = "&numOfRoews=10&pageNo=" + data.get("num") + "&startPage=1";

		// 환경하고 앱 이름, 없으면 않돌아감
		String environment = "&MobileOS=ETC&MobileApp=AppTest";

		// 카테고리 3레벨로 되어있는데 나중에 수정할것
		// 그리고 입력안하면 그냥 검색함
		// 현재는 않씀
		String category = "&cat3=" + code;

		// 카테고리 대신 사용할 컨텐츠 아이디
		String contenttype = "&contentTypeId=" + code;

		// 맨뒤에 리스트설정 분리해야됨
		// xy를 넣을때 반대로 해줘야 값이 나옴
		String geoInfo = "&arrange=A&mapX=" + data.get("mapY") + "&mapY=" + data.get("mapX") + "&radius=" + data.get("radius") + "&listYN=Y";

		// 일단 하나로 합침
		String url = base + key + startPage + environment + contenttype + geoInfo;

		return tourDAO.requestAPI(url);
	}

	@Override
	public int insert(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return tourDAO.insert(data);
	}
}
