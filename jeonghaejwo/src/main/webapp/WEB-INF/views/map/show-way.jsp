<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="map" style="width: 500px; height: 500px"></div>
	<div id="right-panel"></div>
	<input type="submit" id="submit">
	<div id="directions-panel"></div>
</body>

<script>
	var nLat, nLng, waypoint;
	var routeSegment = 0, ways;
	var waypts = [];
	var directionsService;
	var directionsDisplay;
	
	//현재 위치를 받아오는 부분
	function getLocation() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showPosition);

		} else {
			alert("Geolocation is not supported by this browser.");
		}
	}
	function showPosition(position) {
		nLat = position.coords.latitude;
		nLng = position.coords.longitude;
	}
	//이걸로 현재위치를 받아오는걸 호출
	getLocation();

	//api에서 경유지를 받아옴
	//현재 되어있는 url은 테스트용 url이므로/api/tour_api 로 변경할것
	//ajax 필요 데이터 : 현재위치, 횟수, 범위, 컨텐츠id
	//현재위치: mapX, mapY ,횟수:times, 범위: radius , 컨텐츠id: code, 
	
	$.ajax({
		url : "/map/api",
		type : "get",
		success : function(res) {
			//console.log(res.json);
			waypoint = JSON.parse(res.json);
			waypoint = waypoint.response.body.items.item;
			console.log(waypoint);
		}
	});

	//지도를 현재위치로 이동시키고 길찾기 서비스를 호출시킴
	function initMap() {
		directionsService = new google.maps.DirectionsService;
		directionsDisplay = new google.maps.DirectionsRenderer;
		//center부분이 현재위치인데 geoloation으로 받아온 위치로 변경해놔야됨
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 16, 
			center : {
				lat : 37.566535,
				lng : 126.97796919999999
			}
		});
		directionsDisplay.setMap(map);

		document.getElementById('submit').addEventListener('click', function() {
			//nLat이랑 nLng이 위의getLocation을 이용해 받아온 현재위치
			//하지만 학원에서는 않먹힘
			var nowP=nLat+", "+nLng;
			
			//출발지점이랑 도착지점은 그냥 현재위치로 잡혀있음
			waypts.push({
				location : nowP,
				stopover : true
			});
			
			for(var v of waypoint){
				waypts.push({
					location : v.addr1,
					stopover : true
				});
			}
			waypts.push({
				location : nowP,
				stopover : true
			});
			calculateAndDisplayRoute(1);
		});
	}
	
	//경로를 구하는 부분
	function calculateAndDisplayRoute(onsoff,idx) {
		if(!idx){
			idx = 0;
		}
		if(idx==waypts.length-1&&onsoff==1){
			calculateAndDisplayRoute(0,0);
		}  
		directionsService.route({
			origin : waypts[idx].location, 
			destination : waypts[idx+1].location,
			optimizeWaypoints : true,
			travelMode : 'TRANSIT'  
		}, function(response, status) {
			if (status === 'OK') {
				directionsDisplay.setDirections(response);
				var route = response.routes[0];
				//onsoff가 1일때만 경로를 웹에 찍어주도록
				if(onsoff==1){
					for (var i = 0; i < route.legs.length; i++) {
						routeSegment++;
						ways = '<b>Route Segment: ' + routeSegment + '</b><br>';
						ways += route.legs[i].start_address + ' to ';
						ways += route.legs[i].end_address + '<br>';
						ways += route.legs[i].distance.text + '<br>';
						ways += '<button id="button'+routeSegment+'" value="'+routeSegment+'">길 보기</button><br>';
						$(ways).appendTo('#directions-panel');
						$("#button"+routeSegment).click(function(){
							calculateAndDisplayRoute(0,this.value-1);
						});
					}
					calculateAndDisplayRoute(1,idx+1);
				}
				
				if(waypts.length==idx)return;
				
			} else {
				window.alert('Directions request failed due to ' + status);
			}
		});
	}
</script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDFbONelL6n5CyJfPLkocOutqCZqwiFANA&callback=initMap"></script>
</html>