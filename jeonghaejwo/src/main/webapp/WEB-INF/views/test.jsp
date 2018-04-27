<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button onclick="aj()">123</button>

</body>
<script>
	var v = 1;

	var module = {
		v : 821,
		getV : function() {
			return v;
		}
	}
	
	var geM=module.getV;
	//alert(geM);
	
	
	var boundget=geM.bind(module);
	//alert(boundget);

	function aj() {
		var obj = $('<button id="btn'+v+'" value="'+v+'">Button' + v + '</button>').appendTo('body')
		$("#btn"+v).click(function(){
			alert(this.value);
		});
		v++;
	}
</script>


</html>