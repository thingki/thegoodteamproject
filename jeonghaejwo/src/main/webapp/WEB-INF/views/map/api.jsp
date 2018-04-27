<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	//갈곳을 받아오는 ajax
	$.ajax({
		url : "/map/api",
		type : "get",
		success : function(res){
			console.log(res.json);
			var api=JSON.parse(res.json);
			console.log(api);
		}
	});
</script>
</head>
<body>

</body>
</html>