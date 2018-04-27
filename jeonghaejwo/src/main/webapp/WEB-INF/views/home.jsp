<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<!-- 구글 로그인용 -->
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/home.css${ver}"/>
<script>
$(document).ready(function() {
			var tickr = ['Jeong Hae Jwo <ins>2</ins> .com',
						'갈까 말까 할 때는<ins>1</ins> 가라',
						'살까 말까 할 때는 <ins>1</ins><del>사지마라</del>사라',
						'말할까 말까 할 때는<ins>1</ins> 말하지마라',
						'줄까 말까 할 때는 줘라',
						'먹을까 말까 할 때는 <ins>1</ins><del>먹지마라</del>먹어라'];
				$('#main_msg').t(tickr.join(x = '<ins>2</ins><del>*</del>') + x, {
							speed : 200,
							repeat : true,
							pause_on_click : false
						});
			})
</script>
</head>
<body>
<div class='mainContainers'>
	<div class='login_containers'>
		<div class='contents2'>
			<div class=msg_container>
				<img class="msg_img1" src="${rPath}/imgs/left_quot.png" />
				<img class="msg_img2" src="${rPath}/imgs/right_quot.png" />
				<pre id='main_msg'></pre>
			</div>
		</div>
		<div class='contents4'>
		<div class='logintxt' id='logintxt'>Sign in or Sign up</div>
		<div class='loginMainLogo'><img id="mainLogo" src="${rPath}/imgs/mainlogo.jpg"></div>
		<div class='loginface' id='loginface'>
			<div class="fb-login-button" data-max-rows="1" data-size="large" 
			data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="true" 
			data-use-continue-as="false" onlogin="checkLoginState();"></div>
			<!-- <div id="fb-root"></div>
			<div id="status"></div> -->
		</div>
		<div class='logingoo' id='logingoo'>
			<div id="gSignInWrapper">
				<div id="customBtn" class="customGPlusSignIn">
					<span class="icon"></span><span class="buttonText">Sign up with Google</span>
				</div>
			</div>
		</div>
		<div class='logingit'></div>
		</div>
	</div>
	</div>
</body>
<script>
	startApp();
	$(document).ready(function(){
		var dtemp={
				"userId": getCookie("userId")
		}
		if(dtemp.userId!=""){
			$("#mainLogo").css('display', "block");
			$("#logingoo").css('display', "none");
			$("#loginface").css('display', "none");
			$("#logintxt").css('display', "none"); 
		}else{
			$("#mainLogo").css('display', "none");
		}
	})
</script>
</html>