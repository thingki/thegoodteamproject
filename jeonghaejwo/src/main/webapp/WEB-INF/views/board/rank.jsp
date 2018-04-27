<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${root}/resources/css/rank.css${ver}"/>
<title>Insert title here</title>
</head>

<body>
<div class='mainContainers' style='color:black;'>
	<div class="rank-container">
		<div class="rank1_grid">
			<i class="fas fa-chess-king rankIcon"></i> 랭킹1위
			<div class="rank-container2">
				<div class="photo_grid photo"><img src="${rPath}/imgs/img_sample.jpg" /></div>
				<div class="rankDivs recommend_grid recommend">추천수</div>
				<div class="rankDivs point_grid point">평점</div>
				<div class="rankDivs shopname_grid shopname">상호명</div>
				<div class="rankDivs address_grid address">주소</div>
				<div class="rankDivs tel_grid tel">연락처</div>
			</div>
		</div>
		<div class="rank2_grid">  
			<i class="fas fa-chess-queen rankIcon"></i>랭킹2위
			<div class="rank-container2">
				<div class="photo_grid photo"><img src="${rPath}/imgs/img_sample.jpg" style=/></div>
				<div class="rankDivs recommend_grid recommend">추천수</div>
				<div class="rankDivs point_grid point">평점</div>
				<div class="rankDivs shopname_grid shopname">상호명</div>
				<div class="rankDivs address_grid address">주소</div>
				<div class="rankDivs tel_grid tel">연락처</div>
			</div>

		</div>
		<div class="rank3_grid">
			<i class="fas fa-chess-rook rankIcon"></i>랭킹3위
			<div class="rank-container2">
				<div class="photo_grid photo"><img src="${rPath}/imgs/img_sample.jpg" style=/></div>
				<div class="rankDivs recommend_grid recommend">추천수</div>
				<div class="rankDivs point_grid point">평점</div>
				<div class="rankDivs shopname_grid shopname">상호명</div>
				<div class="rankDivs address_grid address">주소</div>
				<div class="rankDivs tel_grid tel">연락처</div>
			</div>
		</div>
		<div class="rank4_grid">
			랭킹4위
			<div class="rank-container3">
				<div class="photo_grid3 photo"><img src="${rPath}/imgs/img_sample.jpg" style=/></div>
				<div class="rankDivs shopname_grid3 shopname">상호명</div>
				<div class="rankDivs tel_grid3 tel">연락처</div>
				<div class="rankDivs address_grid3 address">주소</div>
			</div>
		</div>
		<div class="rank5_grid">
		랭킹5위
		<div class="rank-container3">
				<div class="photo_grid3 photo"><img src="${rPath}/imgs/img_sample.jpg" style=/></div>
				<div class="rankDivs shopname_grid3 shopname">상호명</div>
				<div class="rankDivs tel_grid3 tel">연락처</div>
				<div class="rankDivs address_grid3 address">주소</div>
			</div>
		</div>
		<div class="rank6_grid">랭킹6위
		<div class="rank-container3">
				<div class="photo_grid3 photo"><img src="${rPath}/imgs/img_sample.jpg" style=/></div>
				<div class="rankDivs shopname_grid3 shopname">상호명</div>
				<div class="rankDivs tel_grid3 tel">연락처</div>
				<div class="rankDivs address_grid3 address">주소</div>
			</div>
		</div>
		<div class="rank7_grid">랭킹7위
		<div class="rank-container3">
				<div class="photo_grid3 photo"><img src="${rPath}/imgs/img_sample.jpg" style=/></div>
				<div class="rankDivs shopname_grid3 shopname">상호명</div>
				<div class="rankDivs tel_grid3 tel">연락처</div>
				<div class="rankDivs address_grid3 address">주소</div>
			</div>
		</div>
		<div class="rank8_grid">랭킹8위
		<div class="rank-container3">
				<div class="photo_grid3 photo"><img src="${rPath}/imgs/img_sample.jpg" style=/></div>
				<div class="rankDivs shopname_grid3 shopname">상호명</div>
				<div class="rankDivs tel_grid3 tel">연락처</div>
				<div class="rankDivs address_grid3 address">주소</div>
			</div>
		</div>
		<div class="rank9_grid">랭킹9위
		<div class="rank-container3">
				<div class="photo_grid3 photo"><img src="${rPath}/imgs/img_sample.jpg" style=/></div>
				<div class="rankDivs shopname_grid3 shopname">상호명</div>
				<div class="rankDivs tel_grid3 tel">연락처</div>
				<div class="rankDivs address_grid3 address">주소</div>
			</div>
		</div>
	</div>
</div>
	<script>
	$.ajax({
		url : "/rank/list",
		success : function(res){  
			var temp = eval(res["rank"]["result"]);
			var tempCount = 1;
			for(vv of temp){
			    console.log(vv);
			    $(".rank"+tempCount+"_grid .shopname").html(vv.placename);
			    $(".rank"+tempCount+"_grid .recommend").html("추천 "+vv.count);
			    $(".rank"+tempCount+"_grid .point").html("평균"+vv.avg+"점");
			    $(".rank"+tempCount+"_grid .address").html(vv.addr);
			    $(".rank"+tempCount+"_grid .tel").html(vv.tel);
			    $(".rank"+tempCount+"_grid img").attr("src",vv.img);
			    $(".rank"+tempCount+"_grid img").attr("onError","this.src='/resources/imgs/img_sample.jpg';");
			    tempCount++;
			}
		}
	})
		
	</script>
</body>
</html>