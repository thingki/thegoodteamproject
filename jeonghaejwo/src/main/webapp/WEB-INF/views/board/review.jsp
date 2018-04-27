<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${root}/resources/css/review.css${ver}"/>
<title>REVIEW</title>
</head>
<!-- 제목 내용 입력 체크 -->
<script>
	function check() {
		if ( !document.writeform.title.value ) {
			alert("제목을 입력해주세요");
			return;
		} else if ( !document.writeform.content.value ) {
			alert("내용을 입력해주세요");
			return;
		}
	
		document.writeform.submit();
	}  
</script>
<body>
<div class='mainContainers'>
<h1 style='margin-top: 1vw;margin-bottom: -2.5vw;color: black'>솔직 방문 후기</h1>
	<!-- Button trigger modal -->
<div id="review_containers">
		<div id="review_list">	
		</div>
		<div id="review_coments_modal" style="color:black"></div>
		<div style="text-align:right;">
		<button class='rank_nextBtn' onclick="nextReview()">next<i class="fas fa-angle-right rank_nextBtn_right"></i></button>
		</div>
	</div></div>
</body>
<script>
	$(function() {
		$("#uploadFile").on('change', function() {
			readURL(this);
		});
	});
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preview_img').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	$(document).ready(function(){
		getReview(1);
	});
	function nextReview(){
		var num=$("#review_list").children().last()[0].attributes.num.value;
		num*=1;
		num++;
		console.log(num);
		getReview(num);
	}
	function getReview(data){
		data*=1;
		var data={"startNo":data,
				"endNo":data+10};
		$.ajax({
			url : "/review/list",
			data : data,
			success : function(res){
				console.log(res);
				for(a of res){
					var degRandom = Math.floor((Math.random() * 40) - 20);
					var pin = Math.floor((Math.random() * 5) + 1);
					var temp="";
					var temp2="";
					temp+='<div class="review_container" num="'+a.recoNo+'" id="review'+a.recoNo+'">';
					temp+='<div class="photoAndLocation" style="transform: rotate('+degRandom+'deg)">';
					if(a.imgNo){
						temp+='<div class="grid-item photoPin"><img src="${rPath}/imgs/pins/pin'+pin+'.png" /></div>';
						temp+='<div class="grid-item reviewPhoto"><img data-toggle="modal" data-target="#reviewModal'+a.recoNo+'" src="'+a.imgPath+'" /></div>';
					}
					temp+='<div class="grid-item reviewPoint">'+a.point+'</div>';
					temp+='<div class="grid-item reviewLocation">'+a.placename+'</div></div>';
					temp+='</div>';
					temp2+='<div class="modal fade review" id="reviewModal'+a.recoNo+'" role="dialog"><div class="modal-dialog review">';
					temp2+='<div class="modal-content review"><div class="modal-header review"><button type="button" class="close" data-dismiss="modal">&times;</button>';
					temp2+='<h4 class="modal-title review">'+a.reTitle+'</h4></div>';
					temp2+='<div class="modal-body review"><p class=reviewUserId>'+a.userId+'</p>';
					temp2+='<p>'+a.comment+'</div>';
					temp2+='<div class="modal-footer review"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div>';
					$("#review_list").append(temp);
					$("#review_coments_modal").append(temp2);
				}
			}
		});
	}
	
</script>

</html>