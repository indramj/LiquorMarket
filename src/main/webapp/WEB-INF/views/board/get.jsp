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
				var bno = operForm.find("#bno");
				bno.remove();
 				var type = operForm.find("#type");
				var keyword = operForm.find("#keyword");
				if(type.val() === "")
					type.remove();
				if(keyword.val() === "")
					keyword.remove(); 
				
				
				
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
			

				//댓글 표시
				function loadJSONData(){
				$.getJSON('/replies/' + bno , function(arr){
				    
				    var str = "";
				    
				   
				    $.each(arr , function(idx , reply){
				    	  var replyDate = reply.regDate;
						    var updateDate = reply.updateDate;
						    if(updateDate > replyDate)
						    	{
						    		replyDate = updateDate;
						    	}
							   
				        console.log(reply);
				        console.log(reply.rno);
				        str += '<div class = "list-body" >';
				        str += '<input type = "text" data-rno = "'+reply.rno+'" value = "'+reply.replyer+'" readonly = "true">';
				        str += '<textarea rows="1" cols="20" readonly = "true" data-rno = "'+reply.rno+'">'+reply.reply+ '</textarea>'; 
				        str += ''+formatTime(replyDate)+'';
				        str += '<button type = "button" class = "removeReply" data-rno = "'+reply.rno+'">삭제</button>';
				        str += '<button type = "button" class = "modifyReply" data-rno = "'+reply.rno+'">수정</button>';
				        str += '</div>'
				        
				    })
				    listGroup.html(str);
				});
			} 

				loadJSONData();
				
				
				//댓글 추가 버튼 클릭시
				$(".addReply").on("click" , function(e){
					var reply = {
							bno : bno,
							reply : $('textarea[name = "reply"]').val(),
							replyer : $('input[name = "replyer"]').val(),
						
					}
					console.log(reply);
					
					$.ajax({
						url : '/replies/',
						type : 'post',
						data : JSON.stringify(reply),
						contentType : 'application/json; charset=utf-8',
						dataType : 'json',
						success : function(data){
							console.log(data);
							var newRno = parseInt(data);
							$('textarea[name = "reply"]').val("");
							$('input[name = "replyer"]').val("");
							alert(newRno + "댓글 등록");
							
							loadJSONData();
						}
					});
				});	
				
				
				// 댓글 삭제버튼 클릭시
				$(".replyList").on("click", ".list-body .removeReply" , function(){
					var rno = $(this).data('rno');
					
					console.log("remove rno : " +rno);
	
						$.ajax({
	             url : '/replies/'+rno,
	             type : 'DELETE' ,
	             contentType : 'application/json; charset=utf-8',
	             dataType : 'text',
	             success : function(result){
	                console.log("result : " + result);
	                alert("삭제 되었습니다.");
	                loadJSONData();
	             }
	         });
				
				});
				
				
				// 댓글 수정 버튼 누를 경우
		 		$(".replyList").on("click" , ".list-body .modifyReply" , function(){
		 			var rno = $(this).data('rno');
		 			
		 			$('textarea[data-rno = '+rno+']').removeAttr("readonly"); 
		 			$('textarea[data-rno = '+rno+']').focus();
		 			$(this).attr("class" , "submitReply");  //자신의클래스 이름만 변경
				})
				
				//댓글 내용 수정후 다시 버튼 클릭 할경우 처리
 				$(".replyList").on("click", ".list-body .submitReply" , function(){
					var rno = $(this).data('rno');
					console.log("modify rno : " +rno);
					
					var reply = {
							rno : rno,
							bno : bno,
							reply : $('textarea[data-rno = '+rno+']').val(),
							replyer : $('input[data-rno = '+rno+']').val()
					}
	
					$.ajax({
			        url : '/replies/',
			        type : 'PUT' ,
			        data : JSON.stringify(reply),
			        contentType : 'application/json; charset=utf-8',
			        dataType : 'text',
			        success : function(result){
			           console.log("result : " + result);
			           alert("수정 되었습니다.");
			           loadJSONData();
			        }
			    });
				
				});  
				
	})
	

</script>

</head>
<body>

<!--  글 상세 내용 -->
<div>
	<div>
		제목
		<input type = "text" name = "title" value = "${board.title}" readonly = "readonly">
		<input type = "text" name = "bno" value = "${board.bno}" readonly = "readonly">
	</div>
	
	<div>
		내용
		<textarea rows="20" cols="50" name = "content" readonly = "readonly" ><c:out value = "${board.content}"/></textarea>
	</div>
	
	<div>
		작성자
		<input type = "text" name = "writer" readonly = "readonly" value = "${board.writer}">
	</div>	
	
	<button class = "btnModify">수정</button>
	<button class = "btnList" >목록으로</button>

</div>
	<!--  //게시글 내용 -->
	
	<!--  댓글을 출력하기 위한 div -->
<div class = replyList>

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
	<input type = "hidden" id = "bno" name = "bno" value = "${board.bno}">
	<input type = "hidden" id = "type" name = "type" value = "${cri.type}">
	<input type = "hidden" id = "keyword" name = "keyword" value = "${cri.keyword}"> 
	
</form>

</body>
</html>