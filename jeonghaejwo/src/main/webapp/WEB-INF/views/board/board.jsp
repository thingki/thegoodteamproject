<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 게시판 리스트를 확인하는 페이지 -->
<title>Board</title>
</head>
<script>
function goPost(id) {
		$("#goContentIdx").val(id);
		$("#goContent").submit();
	}
</script>
<style>
a {
	text-decoration: none;
}

.viewBoardListTable{
width: 75vw;
font-size: 2vmin;
}
.boardListWriteBtnDiv{
}
.boardListWriteBtn{
	color:white;
	width: 20vw;
    height: 5vh;
    font-size: 2vmin;
	margin-top: 3vh;
    background-color: rgba(255, 255, 255, 0);
	border: solid 1px #ffffff00;
	border-radius: 255px 15px 225px 15px/15px 225px 15px 255px;
}
.boardListWriteBtn:hover{
	color:black;
	background-color: gray;
}
.boardTableThead{
	border-bottom: solid 1px white !important;
}
.boardTableTbody{
border-bottom: solid #ffffff00;
}
.boardTableTbody>tr>td{
    padding: 18px !important;
    line-height: 1.42857143 !important;
    vertical-align: top !important;
    border-top: 1px solid rgba(255, 255, 255, 0) !important;
}
.boardTableTbody>tr:hover{
    color:black;
}
.boardTableDiv{
margin-top:2vh; 
}
.boardH1{
text-align: center;
margin-top: 7vh;
}

</style>
<body>
	<div class='mainContainers'>
		<h1 class="boardH1">Board</h1>
		<div class="boardTableDiv">
		<table class="table table-hover viewBoardListTable">
		<thead class="boardTableThead">
			<tr>
				<td width=10%>No</td>
				<td width=15%>아이디</td>
				<td width=50%>제목</td>
				<td width=15%>등록일수</td>
				<td width=10%>조회수</td>
			</tr>
			</thead>
			<tbody class="boardTableTbody">
			<c:forEach items="${board}" var="a">
				<tr id="${a.idx}" onclick="goPost(id)">
					<td>${a.idx}</td>
					<td>${a.userName}</td>
					<td>${a.title}</td>
					<td>${a.regist}</td>
					<td>${a.hit}</td> 
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
		<form id="goContent" action="/path/board/Get" method="get" style="display: none;">
			<input id="goContentIdx" name="idx">
		</form>

		<hr>
		<div class="boardListWriteBtnDiv">
		<input class="boardListWriteBtn" type="button" onclick="window.location.assign('WriteForm')"
			value="작성하기" />
			</div>
		
	</div>
</body>
</html>