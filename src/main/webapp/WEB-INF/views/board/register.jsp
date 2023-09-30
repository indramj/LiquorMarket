<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$(".btnRegister").on("click" , function(){
			var operForm = $(".operForm");
			var title = operForm.find("input[name = title]").val();
			var writer = operForm.find("input[name = writer]").val();
			var content = operForm.find("textarea[name = content]").val();
			
			if(title === null || title.length === 0)
				{
					alert("제목을 입력하세요");
					return ;
				}
			if(writer === null || writer.length === 0)
			{
				alert("닉네임을 입력하세요");
				return ;
			}
			if(content === null || content.length === 0)
			{
				alert("내용을 입력하세요");
				return;
			}
			
			operForm.submit();
						
		});
		
	})
	

</script>


</head>
<body>
<form class = "operForm" method = "post" action = "/board/register">
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
	<button type = "button" class = "btnRegister">등록</button>
	<button type = "button" class = "btnCancel">취소</button>
</form>

</body>
</html>