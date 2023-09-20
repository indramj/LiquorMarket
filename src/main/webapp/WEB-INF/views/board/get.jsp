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
	$(document).ready(function() {
		var bno = '<c:out value="${board.bno}"/>';
		
		var operForm = $("#operForm");
			$(".btnModify").on("click" , function(e){
				operForm.attr("action" , "/board/modify").submit();
			});
			
			$(".btnList").on("click" , function(e){
				operForm.attr("action" , "/board/list").submit();
			})
			
			var listGroup = $(".replyList");
			
			function formatTime(str){
                var date = new Date(str);
                return date.getFullYear() + '/' +
                (date.getMonth() + 1) + '/' +
                date.getDate() + ' ' +
                date.getHours() + ':' +
                date.getMinutes();
       }
			
				function loadJSONData(){
					$.getJSON('/replies/' + bno , function(arr){
					    
					    var str = "";
					   
					    $.each(arr , function(idx , reply){
					        console.log(reply);
					        str+= '<div class = "card-body" data-rno ="'+reply.rno+'"><b>'+reply.rno+'</b>';
					        str+= '<h5 class = "card-title">'+reply.text+'</h5>';
					        str+= '<h6 class = "card-subtitle mb-2 text-muted">'+reply.replyer+'</h6>';
					        str+= '<p class = "card-text">'+formatTime(reply.regDate)+'</p>';
					        str+= '</div>';
					    })
					    listGroup.html(str);
					});
				}
				
				loadJSONData();
				
				
	
	})
	

</script>

</head>
<body>

<div>
	제목
	<input type = "text" name = "title" value = "${board.title}" readonly = "readonly">
	<input type = "text" name = "bno" value = "${board.bno}" readonly = "readonly">
 </div>
<div>
내용
	<textarea rows="20" cols="50" name = "content" readonly = "readonly"><c:out value = "${board.content}"/></textarea>
</div>
<div>
작성자
	<input type = "text" name = "writer" readonly = "readonly" value = "${board.writer}">
</div>	

<button class = "btnModify">수정</button>
<button class = "btnList" >목록으로</button>

	<div>
		<div class="mt-4">
			<h5>
				<span class="addReply">Add Reply</span>
			</h5>
		</div>
		<div class="replyList">
		
		</div>
	</div>

	<form id = "operForm" action = "/board/list" method = "get">
	<input type = "hidden" name = "currentPage" value = "${cri.currentPage}">
	<input type = "hidden" name = "bno" value = "${board.bno}">
</form>

</body>
</html>