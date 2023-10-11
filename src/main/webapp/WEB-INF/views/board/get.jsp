<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../include/header.jsp" %>



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
			
			//댓글 제목 내용 작성자 체크
			function checkReply()
			{
				
				var regReply = $(".regReply");
				
				var replyer = regReply.find("input[name = replyer]").val();
				var reply = regReply.find("textarea[name = reply]").val();
				
				if(replyer === null || replyer.length === 0)
					{				
						alert("닉네임을 입력하세요");						
						return -1;
					}
				if(reply === null || reply.length === 0)
				{	
					alert("댓글을 입력하세요");
					return -1;
				}
			}
			

				//댓글 표시
				function loadJSONData(){
				$.getJSON('/replies/' + bno , function(arr){
				    
				    var str = "";
						var loginedUser = null;
						<sec:authorize access="isAuthenticated()">		
							loginedUser = '<sec:authentication property="principal.username"/>';
						</sec:authorize>
				    
				   
				    $.each(arr , function(idx , reply){
				    	  var replyDate = reply.regDate;
						    var updateDate = reply.updateDate;
						    if(updateDate > replyDate)
						    	{
						    		replyDate = updateDate;
						    	}
							   
				        console.log(reply);
				        console.log(reply.rno);
 				        /* str += '<div class = "list-body" >'; */
				        /* str += '<input type = "text" data-rno = "'+reply.rno+'" value = "'+reply.replyer+'" readonly = "true">'; */
				        /* str += '<textarea rows="1" cols="20" readonly = "true" data-rno = "'+reply.rno+'">'+reply.reply+ '</textarea>'; */ 
				        /*str += ''+formatTime(replyDate)+'';
				        str += '<button type = "button" class = "removeReply" data-rno = "'+reply.rno+'">삭제</button>';
				        str += '<button type = "button" class = "modifyReply" data-rno = "'+reply.rno+'">수정</button>'; */
				        
				      
	 			        str += '<tr><td><input type = "text" class = "form-control" name = "replyer" data-rno = "'+reply.rno+'" value = "'+reply.replyer+'" readonly></td>';
	 			        str += '<td>'+formatTime(replyDate)+'</td></tr>';
	 			        str += '<tr><td colspan = "2"><textarea class = "form-control" rows="3" data-rno = "'+reply.rno+'" style = "resize:none;" readonly>'+reply.reply+ '</textarea></td></tr>';
								
	 			        if ( loginedUser === reply.replyer)
	 			        	{
	 			        	str += '<tr class = "list-body"><td><button type = "button" class = "btn btn-success modifyReply" data-rno = "'+reply.rno+'">수정</button></td>';
		 			        str += '<td><button type = "button" class = "btn btn-danger removeReply" data-rno = "'+reply.rno+'">삭제</button></td></tr>';	
	 			        	}
	
				    })
				    listGroup.html(str);
				});
			} 

				loadJSONData();
				
				var csrfHeaderName = "${_csrf.headerName}";
				var csrfTokenValue = "${_csrf.token}";
				
				$(document).ajaxSend(function(e, xhr, options) { 
				    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
				  });
				
				//댓글 추가 버튼 클릭시
				$(".addReply").on("click" , function(e){
					
					<sec:authorize access="isAuthenticated()">		
						loginedUser = '<sec:authentication property="principal.username"/>';
					</sec:authorize>
				
					if (checkReply() === -1)
					{
						return;
					}
					
					var reply = {
							bno : bno,
							reply : $('textarea[name = "reply"]').val(),
							replyer : loginedUser
						
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
							alert(newRno + "댓글 등록");
							
							loadJSONData();
						}
					});
				});	
				
				
				// 댓글 삭제버튼 클릭시
				$(".replyList").on("click", ".list-body .removeReply" , function(){
									
					var rno = $(this).data('rno');
					var thisReplyer = $('input[data-rno = '+rno+']').val();
					
					console.log("remove rno : " +rno);
	
						$.ajax({
	             url : '/replies/'+rno+'?replyer='+thisReplyer,
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
		 			$(this).attr("class" , "btn btn-success submitReply");  //자신의클래스 이름만 변경
				})
				
				//댓글 내용 수정후 다시 버튼 클릭 할경우 처리
 				$(".replyList").on("click", ".list-body .submitReply" , function(){
					var rno = $(this).data('rno');
					console.log("modify rno : " +rno);
					
					var reply = $('textarea[data-rno = '+rno+']').val();
					if(reply === null || reply.length === 0)
					{
						alert("댓글을 입력하세요");
						return;
					}
	
					var reply = {
							rno : rno,
							bno : bno,
							reply : reply,
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


<div class = "register">
	<div class="mb-3" >
		<div class = "col-sm-5">
	  <label for="boardTitle" class="form-label">제목</label>
	  <input class="form-control form-control-lg" id = "boardTitle" type="text" name = "title" value = "${board.title}" aria-label=".form-control-lg example" readonly>
	  </div>
	</div>
	<div class="mb-3">
		<div class = "col-sm-7">
	  <label for="boardcontent" class="form-label">내용</label>
	  <textarea class="form-control" name = "content" id="boardcontent" rows="15" style = "resize:none;" readonly><c:out value = "${board.content}"/></textarea>
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
		<sec:authorize access = "isAuthenticated()">
		<sec:authentication property="principal" var="logined"/>
			<c:if test = "${logined.username eq board.writer}"> 
				<button class = "btn btn-secondary btnModify">수정</button>
			</c:if>
		</sec:authorize>
			<button class = "btn btn-secondary btnList" >목록으로</button>
		</div>
	</div>
</div>

	<!--  댓글을 출력하기 위한 div -->
<div class = "mb-3">
	<table class = "table col-sm-7" >
		<tbody class = "replyList">
			
		</tbody>
	</table>
</div>

<sec:authorize access = "isAuthenticated()">
<div class = "regReply">
	<div class="col-sm-5">
	  <input type="text" class="form-control" name = "replyer" id="exampleFormControlInput1" value = "<sec:authentication property="principal.username"/>" readonly>
	</div>
	<div class="mb-3 col-sm-7">
	  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
	  <textarea class="form-control" name = "reply" id="exampleFormControlTextarea1" rows="3" style = "resize:none;"></textarea>
	  <button type = "button" class = "btn btn-primary addReply">등록</button>
	</div>
</div>
</sec:authorize>
<form id = "operForm" action = "/board/list" method = "get">
	<input type = "hidden" name = "currentPage" value = "${cri.currentPage}">
	<input type = "hidden" id = "bno" name = "bno" value = "${board.bno}">
	<input type = "hidden" id = "type" name = "type" value = "${cri.type}">
	<input type = "hidden" id = "keyword" name = "keyword" value = "${cri.keyword}"> 
	<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
</form>

<div class="modal fade" id = "removeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        삭제 하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니요</button>
        <button type="button" class="btn btn-primary">네</button>
      </div>
    </div>
  </div>
</div>




</body>
</html>