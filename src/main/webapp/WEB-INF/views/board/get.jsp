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
					        str += '<li>'+reply.replyer+' '+formatTime(reply.regDate)+' '+reply.reply; 
					        str += '</li>';
					    })
					    listGroup.html(str);
					});
				}
				
				loadJSONData();
				
				$(".addReply").on("click" , function(e){
					var reply = {
							bno : bno,
							reply : $('textarea[name = "reply"]').val(),
							replyer : $('input[name = "replyer"]').val()
					}
					
					$.ajax({
						url : '/replies/new',
						method : 'post',
						data : JSON.stringify(reply),
						contentType : 'application/json; charset=utf-8',
						dataType : 'json',
						success : function(data){
							loadJSONData();
						}
					})
				});	
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
		<ul class = "replyList">		
		</ul>	
	</div>
	
	<div>
		<div>
			작성자</b>
			<input type = "text" size = "10" name = "replyer">
		</div>
		<div>
			<textarea rows="3" cols="30" name = "reply"></textarea>
		</div>
		<div>
			<button type = "button" class = "addReply">addReply</button>
		</div>
	</div>
	

	<form id = "operForm" action = "/board/list" method = "get">
	<input type = "hidden" name = "currentPage" value = "${cri.currentPage}">
	<input type = "hidden" name = "bno" value = "${board.bno}">
</form>

</body>
</html>