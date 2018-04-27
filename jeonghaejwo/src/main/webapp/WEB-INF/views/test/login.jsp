<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="google-signin-client_id"
	content="408126596281-jd85biotfj4v3ujka45l0u873n449i1q.apps.googleusercontent.com">
<title>Insert title here</title>
</head>

<body>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<div class="g-signin2" data-onsuccess="onSignIn"></div>
	<a href="#" onclick="signOut();">Sign out</a>
	<a
		href="https://developers.google.com/identity/sign-in/web/sign-in#before_you_begin">참조</a>
	<script>
		function onSignIn(googleUser) {
			var profile = googleUser.getBasicProfile();
			var userId, userName, ImageURL, Email;
			userId = profile.getId();
			userName = profile.getName();
			ImageURL = profile.getImageUrl();
			Email = profile.getEmail();
			console.log('ID: ' + userId); // Do not send to your backend! Use an ID token instead.
			console.log('Name: ' + userName);
			console.log('Image URL: ' + ImageURL);
			console.log('Email: ' + Email); // This is null if the 'email' scope is not present.

			var data = {
				'userId' : userId,
				'userName' : userName,
				'ImageURL' : ImageURL,
				'Email' : Email
			}
			/* var data = [];
			data.push('userId',userId);
			data.push('userName',userName);
			data.push('ImageURL',ImageURL);
			data.push('Email',Email); */
			$.ajax({
				url : "/user/uriLogin",
				type : "post",
				data : data,
				success : function(res) {
					alert("구글 로그인 되었다")
				}
			})
		}

		function signOut() {
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.signOut().then(function() {
				auth2.disconnect();
				console.log('User signed out.');
			});
		}
		function renderButton() {
			gapi.signin2.render('my-signin2', {
				'scope' : 'profile email',
				'width' : 240,
				'height' : 50,
				'longtitle' : true,
				'theme' : 'dark',
				'onsuccess' : onSuccess,
				'onfailure' : onFailure
			});
		}
	</script>
</body>
</html>