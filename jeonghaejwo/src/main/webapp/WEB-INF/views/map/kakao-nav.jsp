<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="map" style="width: 500px; height: 400px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?
	appkey=f0d77be3e5e4fe4c3cb56452864ae096&libraries=services,clusterer,drawing"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(37.4978992118, 127.0276129349),
			level : 3
		};
		var map = new daum.maps.Map(container, options);
		var markerPosition = new daum.maps.LatLng(37.4978992118, 127.0276129349);
		var marker = new daum.maps.Marker({
			position : markerPosition
		});
		marker.setMap(map);
		var iwContent = '<div style="padding:5px;white-space: nowrap;">서울특별시 강남구 테헤란로<br><a href="http://map.daum.net/link/map/서울특별시 강남구 테헤란로,'+
		'37.4978992118,127.0276129349" style="color:blue" target="_blank">큰지도보기</a>'+
		' <a href="http://map.daum.net/link/to/Hello World!,37.4978992118,127.0276129349" style="color:blue" target="_blank">길찾기</a></div>',
		iwPosition = new daum.maps.LatLng(37.4978992118, 127.0276129349);
		var infowindow = new daum.maps.InfoWindow({
			position : iwPosition,
			content : iwContent
		});
		infowindow.open(map, marker);
	</script>
</body>
</html>