<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Now Do</title>
</head>

<script src="${root}/resources/js/haejwo.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/haejwo.css${ver}" />

<body>
<!-- 해야 할거 
1.설정이 모두 체크 안된 상태에서 버튼을 눌렀을 때 메세지 보여주기! -->
<div class='mainContainers'>
	<!-- 메인 컨테이너 -->
	<div class='jhj_container'>
		<!-- 지도 -->
		<div class='map' id='map'>지도</div><!-- 사용자 입력란 -->
		<div class='input_container'>
			<div class='user_setting'>
				<div class="location_input">
					<input class="location_input_text1" id="loInput" type="text">
					<span class="highlight"></span> <span class="bar"></span> <span><button
							class="loBtn"
							onclick="getLatLng($('#loInput')[0].value, $('#loInput')[0].id)">
							<i class="glyphicon glyphicon-search"></i>
						</button></span> <label>My Location</label>
				</div>
				<div id="network-popUp2" class="userFav_selectBox" style="display: block;">
					<div class="form-item form-item-node-type form-type-select select-group">
						<select class="form-control form-select select_userFav"
							id="userFavBox" name="node_type" onchange="userFavSelectBox()">
						</select>
					</div>
				</div>
				<div class="location_input">
					<input class="location_input_text2" id="desInput" type="text">
					<span class="highlight"></span> <span class="bar"></span> <span>
						<button class="deBtn"
							onclick="getLatLng($('#desInput')[0].value, $('#desInput')[0].id)">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</span> <label>Destination</label>
				</div>
				<!-- 목적지 선택 박스 -->
				<div id="network-popUp" class="destination_selectBox" style="display: block;">
					<div class="form-item form-item-node-type form-type-select select-group">
						<select class="form-control form-select select_destination"
							id="deSelectBox" name="node_type" onchange="deSelectBox()">
							<option value="-1" selected="selected">Select element</option>
							<option value="0">내위치로 돌아오기</option>
							<option value="1">Ramdom Box</option>
						</select>
					</div>
				</div>
			</div>
			<!-- 시간 -->
			<div id="time_div" class="time_div">
				<i class="fas fa-caret-left time_set" onclick="haejwo_minus()"></i>
				<input type="text" value="시간을 설정하세요" id="time_count"
					style="color: black; text-align: center" class="time_count">
			
					<i class="fas fa-caret-right time_set" onclick="haejwo_plus()"></i>
			
			</div>
			<!-- 반경 거리 -->
			<div class="funkyradio">
				<div class="funkyradio-info">
					<input type="radio" name="radio" id="radio1" disabled=true
						value=0.4 data-value='1000' /> <label for="radio1">반경 1km</label>
				</div>
				<div class="funkyradio-info">
					<input type="radio" name="radio" id="radio2" disabled=true
						value=0.4 data-value='3000' /> <label for="radio2">반경 3km</label>
				</div>
				<div class="funkyradio-info">
					<input type="radio" name="radio" id="radio3" disabled=true
						value=1.1 data-value='5000' /> <label for="radio3">반경 5km</label>
				</div>
				<div class="funkyradio-info">
					<input type="radio" name="radio" id="radio4" disabled=true
						value=1.4 data-value='10000' /> <label for="radio4">반경 10km</label>
				</div>
			</div>
			<div class='summit_btn'>
				<button id='test' class="btn loding_button"
					onclick="sendVariable($('#loInput')[0].value, $('#desInput')[0].value)">
					<!-- "window.location.href='${root}/path/map/show-way'" -->
					<span class="ladda-label"><i class="fas fa-search haejwoIcon"></i> Jeong Hae Jwo </span>
				</button>
			</div>
		</div>
	</div>
</div>
	
</body>
<script>
$(document).ready(function(){
	dtemp={
			"userId":"103230395918627060836"
	}
	getFav();
})
function userFavSelectBox(){
	
	 var userFavSelectBoxValue = document.getElementById("userFavBox").value;
	 if(userFavSelectBoxValue!=-1){
		 $("#loInput")[0].value = userFavSelectBoxValue;
	 }else if(userFavSelectBoxValue==-1){
		 $("#loInput")[0].value = "";
	 }
}
var dtemp=[];
function getFav(){
	//즐겨찾기 보여주는곳, temp딴걸로 수정해야될듯
	$.ajax({
		url : "/profile/fav",
		data : dtemp,
		success : function(res){
			//userPositionList
			console.log(res);
			var favDiv = "<option value='-1' selected='selected'>Select element</option>";
			for(temp1 of res.result[0]){
				favDiv += "<option value='"+temp1.address+"'>"+temp1.address+"</option>"
				
			}
			$('#userFavBox').append(favDiv);
		}
	})
}
function reLoadPage(){
	window.location.reload();
}
$(function(){
	  $('#loInput').keypress(function(key){
		  if (key.keyCode == 13) {
		  getLatLng($('#loInput')[0].value, $('#loInput')[0].id);
		  }
	  });
	});
$(function(){
	  $('#desInput').keypress(function(key){
		  if (key.keyCode == 13) {
		  getLatLng($('#desInput')[0].value, $('#desInput')[0].id);
		  }
	  });
	});
/* 목적지 셀랙트 박스  */
 function deSelectBox(){
	 var selectBoxValue = document.getElementById("deSelectBox").value;
	 if(selectBoxValue==0){
		if($('#loInput')[0].value!=""){
			$("#desInput")[0].value = $('#loInput')[0].value;
			returnMyLocation = true;
			returnMyLocationAddr = $('#loInput')[0].value;
		}else{
			alert("내 위치를 먼저 입력하세요");
		}
	 }else if(selectBoxValue==1){
		 $("#desInput")[0].value = "랜덤으로 갑니다";
		 randomTimes=1;
		 returnMyLocation = false;
	 }else if(selectBoxValue==-1){
		 randomTimes=0;
		 returnMyLocation = false;
		 $("#desInput")[0].value = "";
	 }
	 
}
//변수 값 
var mapX, mapY, times, radius, code, dMapX, dMapY;
var nLat, nLng, waypoint;
var returnMyLocation = false;
var returnMyLocationAddr;
var randomTimes=0;
var data;
/* 횟수 구하기 */
function getTimes(){
	var hour;
	var disKm;
	hour = $('#time_count')[0].value;
	hour = Number(hour.replace(" 시간", ""));
	if(hour==1){
		hour=1.4;
	}else if(hour==2){
		hour=2.5;
	}else if(hour==3){
		hour=3.4;
	}else if(hour==4){
		hour=4.4;
	}else if(hour==5){
		hour=5.4;
	}
	disKm = Number($("input[type=radio][name=radio]:checked").val());
	if(hour==NaN||disKm==NaN){
		alert("시간 또는 거리를 설정하세요");
	}
	ramdomNum = Number(document.getElementById("deSelectBox").value);
	times=Math.floor(hour-disKm+ramdomNum)+randomTimes;
	radius=Number($("input[type=radio][name=radio]:checked")[0].getAttribute("data-value"));	
}
//현위치와 목적지 xy좌표 구하는 공통 함수
function getXYaddress(place,func){
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode({
		address : place,  
		region : 'ko'
	},function(results, status){
		if(status == google.maps.GeocoderStatus.OK){
			var bounds = new google.maps.LatLngBounds();
			for(var r of results) {
				if(r.geometry) {
					var result = r.geometry.location;
					func(result);
				} 
			} 
		}
	});
}
function loFunc(result){
	mapX = result.lat();
	mapY = result.lng();
}
function deFunc(result){
	dMapX = result.lat();
	dMapY = result.lng();
}
var ways="";

function sendVariable(loInput, desInput){
	if($(".location_input_text1")[0].value==""){
		alert("현재 위치를 입력하세요.");
		return;	
	}else if($(".location_input_text2")[0].value==""){
		alert("목적지를 입력하세요.");
		return;	
	}else if($('input:radio[name=radio]').is(':checked')==false){
		alert("거리를 입력하세요~");
		return;
	}else if($(".time_count")[0].value=="시간을 설정하세요"){
		alert("시간을 입력하세요");
		return;
	}
	lodingSt();
	getXYaddress(loInput, loFunc);
	getXYaddress(desInput, deFunc);
	getTimes();
	//setTimeout은 데이터 흐름을 queue에 넣으므로 순서를 정할 수 있다
	setDatas();
	findRoute();
}

function setDatas(){
	setTimeout(function(){
		data={
				'mapX':mapX,
				'mapY':mapY,
				'times':times,
				'radius':radius,
				'dMapX':dMapX,
				'dMapY':dMapY
			}
	},1000);
}
function reFindRoute(){
	lodingSt();
	setDatas();
	routeSegment = 0;
	findRoute();
}
function findRoute(){
	waypts = [];
	setTimeout(function(){
		$.ajax({
			url : "/api/tour_api",
			type : "post",
			data : data,
			success : function(res) {
				//console.log(res.json);
				var keys=Object.keys(res).length;
				waypoint=[];
				for(key=1;key<=keys;key++){
					var temp=JSON.parse(res[key]);
					//console.log(temp);
					
					var tempLength = temp.response.body.items.item.length;
					temp=temp.response.body.items.item[Math.floor(Math.random()*tempLength)];
					waypoint.push(temp);
				}
				console.log(waypoint);//<<<랜덤추출 결과가 들어옴!!
				$(".input_container").html("");
				var result_temp="";
				var idx=1;
				for(var wayp of waypoint){
					result_temp +="<div class='haejwo resultLine"+idx+" result_num"+idx+"'>"+idx+"</div>";
					result_temp +="<div class='haejwo resultLine"+idx+" result_name"+idx+"'>"+wayp.title+"</div>";
					result_temp +="<div class='haejwo resultLine"+idx+" result_address"+idx+"'>"+wayp.addr1+"</div>";
					if(wayp.tel==null){
						wayp.tel="<i class='fas fa-exclamation-circle haejwoIcon'></i>전화번호가 없어요";
						result_temp +="<div class='haejwo resultLine"+idx+" result_tel"+idx+"'>"+wayp.tel+"</div>";
					}else{
						result_temp +="<div class='haejwo resultLine"+idx+" result_tel"+idx+"'>"+wayp.tel+"</div>";
					}
					idx++;
				}
				if(returnMyLocation==true){
					result_temp +="<div class='haejwo resultLine"+idx+" result_num"+idx+"'>"+idx+"</div>";
					result_temp +="<div class='haejwo resultLine"+idx+" result_name"+idx+"'>"+"내 위치로 돌아오기"+"</div>";
					result_temp +="<div class='haejwo resultLine"+idx+" result_address"+idx+"'>"+returnMyLocationAddr+"</div>";
					result_temp +="<div class='haejwo resultLine"+idx+" result_tel"+idx+"'>"+"----"+"</div>";
				}
				result_temp +="<div class='haejwobtn backhaejwo'><button class='backhaejwoBtn' onclick='reLoadPage()'><i class='fas fa-reply haejwoIcon'></i>뒤로 가기</button></div>"
				result_temp +="<div class='haejwobtn retryhaejwo'><button class='retryhaejwoBtn' onclick='reFindRoute()'><i class='fas fa-redo haejwoIcon'></i>다시 찾기</button></div>"
				$('.input_container').append(result_temp);
				waypts=[];
				waypts.push({
					location : mapX+", "+mapY,
					stopover : true
				});
				for(var v of waypoint){
					waypts.push({
						location : v.addr1,
						stopover : true
					});
				}
				waypts.push({
					location : dMapX+", "+dMapY,
					stopover : true
				});
				
				calculateAndDisplayRoute(1);
				
				/* waypoint = JSON.parse(res.json);
				waypoint = waypoint.response.body.items.item;
				console.log(waypoint); */
			}
		});
	},2000);
	}


/*  */
/* 길찾기 부분 */
/* 반쯤 폐기예정 */
	var routeSegment = 0;
 	var nLat, nLng, waypoint=[];
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
		var map = new google.maps.Map(document.getElementById('map'), 
		{
			zoom : 16, 
			center : {
				lat : 37.566535,
				lng : 126.97796919999999
			}
		});
		directionsDisplay.setMap(map);
		
		//맵 클릭시 이벤트적용
		google.maps.event.addListener(map, 'click', function(mouseEvent) {
			getAddress(mouseEvent.latLng);
		});
	}
	
	//클릭한곳 좌표와 주소를 가져와주는놈(맵 클릭)
	function getAddress(latlng){
		var geocoder = new google.maps.Geocoder();
		console.log("클릭했을 때 "+latlng);
		geocoder.geocode({
			latLng : latlng
		},function(result, status){
			if(status == google.maps.GeocoderStatus.OK){
				if(result[0].geometry){    
					var address = result[0].formatted_address;
					/* var marker = new google.maps.Marker({
						position : latlng,
						map : map
					}); */
					var latlng = result[0].geometry.location;
					console.log(latlng.lat()+","+latlng.lng());
					if($('#loInput')[0]!=null){
						$('#loInput')[0].value = address;	
					}else{
						return;
					}
					}
			}
		})
	}
	

	
	//입력 주소를 검색하는부분(버튼)
	function getLatLng(place, id){
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({
			address : place,  
			region : 'ko'
		},function(results, status){
			if(status == google.maps.GeocoderStatus.OK){
				var bounds = new google.maps.LatLngBounds();
				for (var r of results) {
					console.log(r);
					if (r.geometry) {
						var latlng = r.geometry.location;
						var address = r.formatted_address;
						console.log(latlng.lat()+","+latlng.lng());
						$( "#"+id)[0].value = address;
					}
				}
			}
		});
	}
	
	//경로를 구하는 부분
	function calculateAndDisplayRoute(onsoff,idx) {
		if(!idx){
			idx = 0;
		}
		if(idx==waypts.length-1&&onsoff==1){  
			calculateAndDisplayRoute(0);
			lodingEnd();
			return;
		}
		console.log(idx);
		if(waypts[idx+1].location==null){
			alert("길찾기를 할 수 없습니다.");
			lodingEnd();
			return;
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
					routeSegment++;
					ways = '<div class="haejwo resultLine'+routeSegment+' result_btn'+routeSegment+' result_btn_div">';
					ways += '<button id="button'+routeSegment+'" value="'+routeSegment+'"><i class="fas fa-bus haejwoIcon"></i>'+route.legs[0].distance.text+'</button></div>';
					$('.input_container').append(ways);
					$("#button"+routeSegment).click(function(){
						calculateAndDisplayRoute(0,this.value-1); 
					});
					var test=waypts.length;
					if(waypoint.length>idx){
						apiInsert(waypoint[idx]);	
					}
					calculateAndDisplayRoute(1,idx+1);
				}
				
				if(waypts.length==idx)return;
				
			} else {
				window.alert('경로를 찾지 못했습니다 ' + status);
				lodingEnd();
				return;
			}
		});
	}
	
	//api 데이터 저장
	function apiInsert(res){
		var dataAPI={
				'code' : res.contentid,
				'placename' : res.title,
				'mapx' : res.mapx,
				'mapy' : res.mapy,
				'tel' : res.tel,
				'img' : res.firstimage,
				'addr' : res.addr1,
				'modifiedtime' : res.modifiedtime
		}
		
		$.ajax({
			url : "/api/insert",
			data : dataAPI,
			success : function(res1){
				console.log(res1);
				history(res);
			}
		});
	}
	//history를 기록하는 부분
	function history(res){
		var code=''+res.contentid;
		var dataHistory={
				userId : getCookie("userId"),
				code : code,
				date : 180404,
				toggle : 2
		}
		$.ajax({
			url : "/history/insert",
			data : dataHistory,
			success : function(res){
				console.log(res);
			}
		});
	}
</script>

<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDFbONelL6n5CyJfPLkocOutqCZqwiFANA&callback=initMap"></script>

</html>