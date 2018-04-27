<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#map-canvas {
	height: 400px;
}
</style>
<script
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDFbONelL6n5CyJfPLkocOutqCZqwiFANA"
	type="text/javascript"></script>
</body>
</head>
<body>
	<div id="map-canvas"></div>
	<script>
		var directionDisplay;
		var directionsService = new google.maps.DirectionsService();
		var infowindow = new google.maps.InfoWindow();
		var map;
		var icons = {
			url : 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png',
			size : new google.maps.Size(20, 32),
			origin : new google.maps.Point(0, 0),
			anchor : new google.maps.Point(22, 32),
			scaledSize : new google.maps.Size(25, 25)
		};
		function initialize() {

			directionsDisplay = new google.maps.DirectionsRenderer({
				suppressMarkers : true
			});

			var mapOptions = {
				zoom : 3,
				mapTypeId : google.maps.MapTypeId.ROADMAP,
			}

			map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

			directionsDisplay.setMap(map);
			calcRoute();
		}

		function calcRoute() {

			var start = new google.maps.LatLng(43.786161, 11.250510);
			var end = new google.maps.LatLng(43.776030, 11.274929);

			createMarker(start, '<button>ㅎㅇ</button>');
			createMarker(end, 'end');

			var request = {
				origin : start,
				destination : end,
				optimizeWaypoints : true,
				travelMode : google.maps.DirectionsTravelMode.WALKING
			};

			directionsService.route(request, function(response, status) {
				if (status == google.maps.DirectionsStatus.OK) {
					directionsDisplay.setDirections(response);
					var route = response.routes[0];
				}
			});
		}

		function createMarker(latlng, title) {

			var marker = new google.maps.Marker({
				position : latlng,
				title : title,
				icon : icons,
				map : map
			});

			google.maps.event.addListener(marker, 'click', function() {
				infowindow.setContent(title);
				infowindow.open(map, marker);
			});
		}

		initialize();
	</script>
</html>