<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- 작성하는 페이지 -->

</head>

<!-- <script>
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
	  
</script> -->
<style>
.boardTextarea{
	width: 30vw; 
	height: 40vh;
	color:black;
	border: solid 1px #ffffff00;
	border-radius: 255px 10px 225px 10px/10px 225px 10px 255px;
    font-size: 1.5vw;
}
.boardTitle{
	color:black;
    font-size: 2vmin;
    margin-top: 5vh; 
}
.boartSaveBtn{
	color:white;
	width: 20vw;
    height: 5vh;
    font-size: 2vmin;
	margin-top: 3vh;
    background-color: rgba(255, 255, 255, 0);
	border: solid 1px #ffffff00;
	border-radius: 255px 15px 225px 15px/15px 225px 15px 255px;
}
.boartSaveBtn:hover{
	color:black;
	background-color: gray;
}
.boardHr{
	width:30vw;
}
.boardH1{
margin-top: 3vmax;
}
</style>
<body>

<div class='mainContainers'>
<h1 class="boardH1">글쓰기</h1>
		<form action=Write method=post name=writeform>
			<input class="boardTitle" type="text" size=50 name=title placeholder="제목을 입력해주세요"/>
			<hr class="boardHr">
			<textarea class="boardTextarea" name=content></textarea>
			<div><input class="boartSaveBtn" type=button onclick="check()" value="저장하기"/></div>
				
		</form>
 
</div>
</body>
</html>

<!-- private int idx;
	private String userId;
	private String title;
	private String content;
	private String regist;
	private int hit; -->