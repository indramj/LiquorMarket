<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$(".btnRegister").click(function(){
			var operForm = $(".operForm");
			var register = $(".register");
			var title = register.find("input[name = title]").val();
			var writer = register.find("input[name = writer]").val();
			var content = register.find("textarea[name = content]").val();
			
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
			operForm.append('<input type = "hidden" name = "title" value = "'+title+'">')
			operForm.append('<input type = "hidden" name = "writer" value = "'+writer+'">')
			operForm.append('<input type = "hidden" name = "content" value = "'+content+'">')
			
			operForm.submit();
						
		});
		
	})
	

</script>


</head>
<body>

<div class = "register">
<div class = "mb-3">
		<div class = "col-sm-3">
			<div class="input-group">	
			  <span class="input-group-text">닉네임</span>
			  <input type="text" name = "writer" aria-label="writer" class="form-control" value = "<sec:authentication property="principal.username"/>" readonly/>
			</div>
		</div>
	</div>
	<div class="mb-3" >
		<div class = "col-sm-5">
	  <input class="form-control form-control-lg" type="text" name = "title" placeholder="제목" aria-label=".form-control-lg example">
	  </div>
	</div>
	<div class="mb-3">
		<div class = "col-sm-7">
	  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
	  <textarea class="form-control" name = "content" id="exampleFormControlTextarea1" rows="15" style = "resize:none;"></textarea>
	  </div>
	</div>
	<div class = "mb-3">
		<div class= "col-sm-3">
			<button type="button" class="btn btn-secondary btnRegister">등록</button>
			<button type="button" class="btn btn-secondary btnCancel" onclick = "window.location.href = '../board/list'">취소</button>
		</div>
	</div>
</div>


<form class = "operForm" method = "post" action = "/board/register">
<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
</form>

</body>
</html>