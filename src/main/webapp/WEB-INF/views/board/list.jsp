<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	
	//뒤로가기 문제 해결
	window.addEventListener('pageshow', function(event) {
		  if (event.persisted == true) {
		    // bfcache에서 페이지가 복원된 경우 또 다른 페이지 뷰로 보고
		    window.location.reload();
		  }
		});
	
	//엔터키로 검색시 생기는 문제 해결
	function srch()
	{
		var search = $(".searchForm");

		search.find("input[name='currentPage']").val("1");			
		search.submit();
	}		

	
	

	$(document).ready(function(){
		
		
		var actionForm = $("#actionForm");
		
		$(".read").on("click", function(e){
			e.preventDefault();
			var bno = $(this).data('bno');
			actionForm.append('<input type = "hidden" name = "bno" value = "'+bno+'">');
			actionForm.attr("action", "/board/get");
			actionForm.submit();
		});
		

		$(".btnPage a").click(function(e){
			e.preventDefault();
		
			actionForm.find("input[name = currentPage]").val($(this).attr("href"));
			actionForm.submit();
		})
		
		$(".btnList").click(function(e){
			e.preventDefault();
			actionForm.empty();
			actionForm.attr("action" , "/board/list");	
			actionForm.submit();
			});
	
});

	</script>

</head>
<body>
<form method = "get" action = "/board/register">

<div>
	<h2> List Page</h2>
	<a href = "../"><button type = "button">첫화면으로</button></a>
</div>
<div>
	<input type = "submit" value = "글쓰기">
	
</div>

</form>

<div>
	<table>
		<tr>
			<th>글번호</th>
			<th>글제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<c:forEach var="board" items = "${boardlist}" >
		<tr>
			<td>${board.bno}		
			<td><a class = "read" href = "${board.bno}" data-bno = "${board.bno}" ><c:out value = "${board.title}"/>[
			<c:out value = "${board.replyCnt}"/>]</a></td>
			<td>${board.writer}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate}"/></td>
		<tr>
		</c:forEach>
	</table>
	
	<!--  페이징 -->
	<ul class = "pageList">
		<c:if test = "${pageDTO.prev}">
			<li class = "btnPage prev"><a href = "${pageDTO.startPage-1}">prev</a></li>
		</c:if>
		<c:forEach var = "num" begin = "${pageDTO.startPage}" end = "${pageDTO.endPage}">
			<li class = btnPage><a href = "${num}" data-num = "${num}">${num}</a></li>
		</c:forEach>
		<c:if test = "${pageDTO.next}">
			<li class = "btnPage next"><a href = "${pageDTO.endPage+1}">next</a></li>
		</c:if>
	</ul>
	<form class = "searchForm" action = "/board/list" method = "get" >
		<select name = "type">
			<option value = "" <c:out value = "${pageDTO.cri.type == null? 'selected' : ''}"/>>--</option>
			<option value = "T" <c:out value = "${pageDTO.cri.type eq 'T'? 'selected' : ''}"/>>제목</option>
			<option value = "C" <c:out value = "${pageDTO.cri.type eq 'C'? 'selected' : ''}"/>>내용</option> 
			<option value = "W" <c:out value = "${pageDTO.cri.type eq 'W'? 'selected' : ''}"/>>작성자</option>
			<option value ="TC" <c:out value = "${pageDTO.cri.type eq 'TC'? 'selected' : ''}"/>>제목 및 내용</option>
		</select>
		<input type = "text" name = "keyword" size = "30px" onkeypress="if( event.keyCode == 13 ){srch();}" >
		<Button type = "button" class = "btnSearch" onclick = "srch();">검색</Button>
		<button type = "button" class = "btnList">전체글</button>
		<input type = "hidden" name = "currentPage">
	</form>
	
	<form id = "actionForm" action = "/board/list" method = "get">
		<input type = "hidden" name = "currentPage" value = "${pageDTO.cri.currentPage}">
		<input type = "hidden" name = "size" value = "${pageDTO.cri.size}">
		<input type = "hidden" name = "type" value = "${pageDTO.cri.type}">
		<input type = "hidden" name = "keyword" value = "${pageDTO.cri.keyword }">
		
	</form>

</div>
</body>
</html>
