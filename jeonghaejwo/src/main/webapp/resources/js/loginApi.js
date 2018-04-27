/* 구글 로그인 */
	var googleUser = {};
	var startApp = function() {
		gapi.load('auth2',function() {
							// Retrieve the singleton for the GoogleAuth library and set up the client.
							auth2 = gapi.auth2.init({
										client_id : '408126596281-jd85biotfj4v3ujka45l0u873n449i1q.apps.googleusercontent.com',
										cookiepolicy : 'single_host_origin',
									// Request scopes in addition to 'profile' and 'email'
									//scope: 'additional_scope'
									});
							attachSignin(document.getElementById('customBtn'));
						});
	};
	function attachSignin(element) {
		console.log(element.id);
		auth2.attachClickHandler(element, {}, 
			function(googleUser) {
			$(".f_text2").Html = "Signed in: " + googleUser.getBasicProfile().getName();
			var userId, userName, ImageURL, Email, loginApi;
			userId = googleUser.getBasicProfile().getId();
			userName = googleUser.getBasicProfile().getName();
			ImageURL = googleUser.getBasicProfile().getImageUrl();
			Email = googleUser.getBasicProfile().getEmail();
			loginApi = "google";
			var data = {
					'userId' : userId,
					'userName' : userName,
					'ImageURL' : ImageURL,
					'Email' : Email,
					'loginApi' : loginApi
				}
			$.ajax({
				url : "/user/uriLogin",
				type : "post",
				data : data,
				success : function(res) {
					alert("구글 로그인 되었습니다");
					$(".logoutGoo").css('display','block');
					setCookie("userId",res.user.userId);
				}
			})
		}, function(error) {
		  alert(JSON.stringify(error, undefined, 2));
		});
	}
	function signOutGoo() {
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function() {
			auth2.disconnect();
			alert('User signed out.');
		});
	}
	/* ,
	function(googleUser) {
	  document.getElementById('name').innerText = "Signed in: " +
	      googleUser.getBasicProfile().getName();
	}, function(error) {
	  alert(JSON.stringify(error, undefined, 2));
	} */

	/* 페이스북 로그인 */
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.12&appId=178623742931956&autoLogAppEvents=1';
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));

	function statusChangeCallback(response) {
		console.log('statusChangeCallback');
		console.log(response);
		if (response.status === 'connected') {
			testAPI();
		} else {
			/* document.getElementById('status').innerHTML = 'Please log '
					+ 'into this app.'; */
		}
	}
	function checkLoginState() {
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
	}
	
	window.fbAsyncInit = function() {
	    FB.init({
	      appId      : '178623742931956',
	      cookie     : true,  // enable cookies to allow the server to access 
	                          // the session
	      xfbml      : true,  // parse social plugins on this page
	      version    : 'v2.8' // use graph api version 2.8
	    });

	    // Now that we've initialized the JavaScript SDK, we call 
	    // FB.getLoginStatus().  This function gets the state of the
	    // person visiting this page and can return one of three states to
	    // the callback you provide.  They can be:
	    //
	    // 1. Logged into your app ('connected')
	    // 2. Logged into Facebook, but not your app ('not_authorized')
	    // 3. Not logged into Facebook and can't tell if they are logged into
	    //    your app or not.
	    //
	    // These three cases are handled in the callback function.

	    FB.getLoginStatus(function(response) {
	      statusChangeCallback(response);
	    });
	  };
	  
	  function testAPI() {
		    console.log('Welcome!  Fetching your information.... ');
		    FB.api('/me', function(response) {
		    console.log(response);
		    console.log('Successful login for: ' + response.name);
		    var userId, userName, loginApi;
			userId = response.id;
			userName = response.name;
			loginApi = "facebook";
			var data = {
					'userId' : userId,
					'userName' : userName,
					'loginApi' : loginApi
				}
			$.ajax({
				url : "/user/uriLogin",
				type : "post",
				data : data,
				success : function(res) {
					setCookie("userId",res.user.userId);
				}
			})
		      $(".logoutFace").css('display','block')
		      /* document.getElementById('status').innerHTML =
		        'Thanks for logging in, ' + response.name + '!'; */
		    }); 
		  } 