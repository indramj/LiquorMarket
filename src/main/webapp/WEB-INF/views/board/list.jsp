<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<td><a href = "/board/get?bno=<c:out value ='${board.bno}'/>">${board.title }</a></td>
			<td>${board.writer}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate}"/></td>
		<tr>
		</c:forEach>
	</table>
	
	<ul>
		<c:if test = "${pageDTO.prev}">
			<li><a href = "#" >prev</a></li>
		</c:if>
		<c:forEach var = "num" begin = "${pageDTO.startPage}" end = "${pageDTO.endPage}" >
			<li><a href = "/board/list?currentPage=<c:out value = '${num}'/>">${num}</a></li>
		</c:forEach>
	</ul>

</div>
</body>
</html>
