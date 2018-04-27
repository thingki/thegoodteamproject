<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script >
		function check(){
			if(!$("#title").val()){
				alert("제목을 입력해주세요");
				return;
			}else if(!$("#content").val()){
				alert("내용을 입력해주세요");
				return;
			}
			$("form[id='writeForm']").submit();
		}
</script>
<style>
.boardUpdateTitle{
	color:black;
    font-size: 2vmin;
	    margin-top: 6vh;
}
.boardHr{
	width:30vw;
}
.boardUpdateTextarea{
	width: 30vw; 
	height: 40vh;
	color:black;
	border: solid 1px #ffffff00;
	border-radius: 255px 10px 225px 10px/10px 225px 10px 255px;
    font-size: 1.5vw;
}
.boardUpdateBtnDiv{
	width:35vw;
	margin:auto;
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
.boardUpdateBtn:hover{
	color:black;
	background-color: gray;
}
.boardUpdateWriter{
    width: 35vw;
    text-align: right;
    margin: auto;
}
</style>
<body>
<div class='mainContainers'>
		<form class="boardUpdateForm" id="writeForm" action=/path/board/Update method=post >
			<input type=hidden value="${board.idx}" name="idx"/>
			제목: 
			<input class="boardUpdateTitle" id="title" type="text" size=50 value="${board.title}" name='title'/>
			<hr class="boardHr">
			<textarea class="boardUpdateTextarea" id="content" name='content' >${board.content}</textarea>
			<div class="boardUpdateBtnDiv"><input class="boardUpdateBtn" type='submit' onclick="check();" value="작성하기"/></div>
		</form>
		<hr class="boardHr">
		<div class="boardUpdateWriter">글쓴이 : ${board.userName}</div>
		
		
		<%-- <body>
		<form action=Write method=post name=writeform>
			제목:<input type="text" size=50 value="${board.title}" style="color:black";name=title placeholder="제목을 입력해주세요"/>
			<hr>
			<textarea style="width: 395px; height: 230px;color:black;" name=content >${board.content }</textarea>
			<input type=button onclick="check();" style="color:black" value="저장하기"/>		
		</form>
		<hr>
		글쓴이 : ${sessionScope.userName}


</body> --%>
</div>
</body>
</html>

<!-- private int idx;
	private String userId;
	private String title;
	private String content;
	private String regist;
	private int hit; -->