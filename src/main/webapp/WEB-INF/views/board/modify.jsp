<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		var operForm = $("#operForm")
		$(".btnModify").on("click" , function(e){
			operForm.submit();
		});
		
		$(".btnRemove").on("click" , function(e){
			operForm.attr("action" , "/board/remove" , "method" , "get");
			operForm.submit();
			
		})
		
		
	});

</script>

</head>
<body>
<form id = "operForm" action = "/board/modify" method = "post">
	<input type='hidden' name='currentPage' value='<c:out value="${cri.currentPage}"/>'>
	<div>
		제목 <input type="text" name="title" value="${board.title}">
		<input type = "text" name = "bno" value = "${board.bno}" readonly = "readonly">
	</div>
	<div>
		내용
		<textarea rows="20" cols="50" name="content"><c:out value = "${board.content}"/></textarea>
	</div>
	<div>
		작성자 <input type="text" name="writer" value="${board.writer}" readonly = "readonly">
	</div>
	
	<button class = "btnModify" type ="button">수정</button>
	<button class = "btnRemove" type = "button">삭제</button>

	<a href="/board/list?currentPage=<c:out value = '${cri.currentPage}'/>"><button
			class="btnList">취소</button></a>


	
</form>			

 
 
</body>
</html>