<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/spin.js/2.3.2/spin.js"></script>
<script> 
var spinner;
var opts = {
		  lines: 13, // The number of lines to draw
		  length: 38, // The length of each line
		  width: 17, // The line thickness
		  radius: 45, // The radius of the inner circle
		  scale: 1, // Scales overall size of the spinner
		  corners: 1, // Corner roundness (0..1)
		  color: '#ffffff', // CSS color or array of colors
		  fadeColor: 'transparent', // CSS color or array of colors
		  opacity: 0.25, // Opacity of the lines
		  rotate: 0, // The rotation offset
		  direction: 1, // 1: clockwise, -1: counterclockwise
		  speed: 1, // Rounds per second
		  trail: 60, // Afterglow percentage
		  fps: 20, // Frames per second when using setTimeout() as a fallback in IE 9
		  zIndex: 2e9, // The z-index (defaults to 2000000000)
		  className: 'spinner', // The CSS class to assign to the spinner
		  top: '50%', // Top position relative to parent
		  left: '50%', // Left position relative to parent
		  shadow: 'black', // Box-shadow for the lines
		  position: 'absolute' // Element positioning
		};
jQuery(function(){
    spinner = new Spinner(opts).spin().el;
    jQuery(document.body).append(spinner);
});
</script>
<body> 

</body>
</html>