<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.boardH1{
text-align: center;
margin-top: 7vh;
}
.boardContent{
    font-size: 2vmin;
}
.boardUpdateBtn{
color:white;
	width: 20vw;
    height: 5vh;
    font-size: 2vmin;
	margin-top: 3vh;
    background-color: rgba(255, 255, 255, 0);
	border: solid 1px #ffffff00;
	border-radius: 255px 15px 225px 15px/15px 225px 15px 255px;
}
.boardDeleteBtn{
color:white;
	width: 20vw;
    height: 5vh;
    font-size: 2vmin;
	margin-top: 3vh;
    background-color: rgba(255, 255, 255, 0);
	border: solid 1px #ffffff00;
	border-radius: 255px 15px 225px 15px/15px 225px 15px 255px;
}
.boardUpdateBtn:hover{
	color:black;
	background-color: gray;
}
.boardDeleteBtn:hover{
	color:black;
	    background-color: #ff8484;
}
.boardContentDiv{
width:45vw;
margin:auto;
}
.boardUserandtime{
text-align: right;
}
</style>

<body>

	<div class='mainContainers'>
		<h1 class="boardH1">${board.title}</h1>
		
		<div class="boardContentDiv">
		<hr>
		<p class="boardContent">${board.content}</p>
		<hr>
		<div class="boardUserandtime">글쓴이 : ${board.userName}<br> 작성시간 : ${board.regist}<br> </div>
		</div>
		
		
		<input class="boardUpdateBtn" type=button value=수정하기 onclick="window.location.assign('UpdateForm?idx=${board.idx}')" />
		<input class="boardDeleteBtn" type=button value=삭제하기 onclick="window.location.assign('Delete?idx=${board.idx}')" />
	</div>
</body>
</html>
