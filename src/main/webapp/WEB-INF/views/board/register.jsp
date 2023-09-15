<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method = "post" action = "/board/register">
<div>
	제목
	<input type = "text" name = "title">
</div>
<div>
내용
	<textarea rows="20" cols="50" name = "content"></textarea>
</div>
<div>
작성자
	<input type = "text" name = "writer">
</div>	
	<input type = "submit" value = "작성 완료">
</form>

</body>
</html>