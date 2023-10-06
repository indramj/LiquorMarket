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
		var bno = <c:out value = "${board.bno}"/>;
		var operForm = $("#operForm")
		$(".btnModify").on("click" , function(e){
			operForm.append("<input type = 'hidden' name = 'bno' value = '"+bno+"'>");
			operForm.submit();
		});
		
		$(".btnRemove").on("click" , function(){
			operForm.attr("action" , "/board/remove");
			operForm.append("<input type = 'hidden' name = 'bno' value = '"+bno+"'>");
			operForm.submit();
			
		});
		
		$(".btnList").on("click" , function(e){
			operForm.empty();
			operForm.attr("action" , "/board/get");
			operForm.attr("method" , "get");
			operForm.append("<input type = 'hidden' name = 'bno' value = '"+bno+"'>");
			operForm.submit();
			/* window.history.back(); */
	
		})
		
		
	});

</script>

</head>
<body>
<form id = "operForm" action = "/board/modify" method = "post">

<div class = "register">
	<div class="mb-3" >
		<div class = "col-sm-5">
	  <label for="exampleFormControlInput1" class="form-label">제목</label>
	  <input class="form-control form-control-lg" type="text" name = "title" value="${board.title}" aria-label=".form-control-lg example">
	  </div>
	</div>
	<div class="mb-3">
		<div class = "col-sm-9">
	  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
	  <textarea class="form-control" name = "content" id="exampleFormControlTextarea1" rows="10" style = "resize:none;"><c:out value = "${board.content}"/></textarea>
	  </div>
	</div>
	<div class = "mb-3">
		<div class = "col-sm-5">
			<div class="input-group">	
			  <span class="input-group-text">닉네임</span>
			  <input type="text" name = "writer" readonly class="form-control-plaintext" id="staticEmail" value="${board.writer}">
			</div>
		</div>
	</div>
	<div class = "mb-3">
		<div class= "col-sm-3">
			<button type="button" class="btn btn-secondary btnModify">등록</button>
			<button type="button" class="btn btn-secondary btnRemove">삭제</button>
			<button type="button" class="btn btn-secondary btnList">취소</button>
		</div>
	</div>
</div>

</form>			

 
 
</body>
</html>