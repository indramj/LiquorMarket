<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function(){
		
		var actionForm = $("#actionForm");
		
		$(".read").on("click", function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action", "/board/get");
			actionForm.submit();
		});	

	});
	
	
	</script>

</head>
<body>
<form method = "get" action = "/board/register">

<div>
	<h2> List Page</h2>
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
			<td><a class = "read" href = "${board.bno}"><c:out value = "${board.title}"/>[
			<c:out value = "${board.replyCnt}"/>]</a></td>
			<td>${board.writer}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate}"/></td>
		<tr>
		</c:forEach>
	</table>
	
	<ul>
		<c:if test = "${pageDTO.prev}">
			<li><a href = "/board/list?currentPage=<c:out value = '${pageDTO.startPage-1}'/>">prev</a></li>
		</c:if>
		<c:forEach var = "num" begin = "${pageDTO.startPage}" end = "${pageDTO.endPage}">
			<li><a href = "/board/list?currentPage=<c:out value = '${num}'/>">${num}</a></li>
		</c:forEach>
		<c:if test = "${pageDTO.next}">
			<li><a href = "/board/list?currentPage=<c:out value = '${pageDTO.endPage+1}'/>">next</a></li>
		</c:if>
	</ul>
	
	<form id = "actionForm" action = "/board/list" method = "get">
		<input type = "hidden" name = "currentPage" value = "${pageDTO.cri.currentPage}">
		<%-- <input type = "hidden" name = "bno" value = "${board.bno}"> --%>
	</form>

</div>
</body>
</html>
