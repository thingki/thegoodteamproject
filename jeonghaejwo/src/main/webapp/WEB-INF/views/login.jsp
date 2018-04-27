<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>RamBo의 잘하고 싶은 페이지</title>

<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>


<link rel="stylesheet" href="rPath/css/login/font-awesome.css" />
<link rel="stylesheet" href="rPath/css/login/style.css" />
<link rel="stylesheet" href="rPath/css/login/demo.css" />
</head>

<body>
<!-- 	<jsp:include page="/WEB-INF/view/common/header.jspf" flush="false" /> -->
	<div class="container">
		<div class="top">
			<h1 id="title" class="hidden">
				<span id="logo">Daily <span>UI</span></span>
			</h1>
		</div>
		<div class="login-box animated fadeInUp">
			<div class="box-header">
				<h2>Log In</h2>
			</div>
			<label for="Username">Username</label> <br /> 
			<input type="text" id="userId"> <br /> 
			<label for="password">Password</label> <br />
			<input type="password" id="userPwd"> <br/> 
			
			<input type="checkbox" id="saveId">save</br>
				
			<button type="button" id="loginBtn" value="Login"
				onclick="checkValue()">Sign In</button>
			<br /> <a href="/view/user/signin"><p class="small">Sign up</p></a>
		</div>
	</div>






</body>
<script>
function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

$(document).ready(function(){
   var userId = getCookie("userId");
   var saveId = getCookie("saveId");
   if(userId){
      $("#userId").val(userId);
      $("#saveId").prop("checked",true);
   }
});


function checkValue(){
	var objs = $(".container");
	var userId = $("#userId").val().trim();
	var userPwd = $("#userPwd").val().trim();
	var saveId = $("#saveId").prop("checked");
	
	if(userId.length<3){
		alert("유저아이디 확인해!!");
		$("#userId").focus();
		return;
	}
	if(userPwd.length<3){
		alert("비밀번호 확인해!!");
		$("#userPwd").focus();
		return;
	}
	
	
	var param = {uiId:userId, uiPwd:userPwd, saveId:saveId};
	
	param = "param=" + encodeURIComponent(JSON.stringify(param));
	$.ajax({
		url : 'root/views/login',
		data : param,
		type :'get',
		success:function(res){               
			var obj = JSON.parse(res);
			alert(obj.msg);
			if(obj.login=="ok"){
				location.href="root/";
				}
			}
		})
	}
</script>
</html>