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
		
		$(".btnRegister").click(function(e){
			e.preventDefault();
			actionForm.empty();
			actionForm.attr("action" , "/board/register")
			actionForm.submit();
		})
	
});

	</script>

</head>
<body>

<div class = "m-5">
	<h3> 상품 문의 게시판</h3>
	<table class="table table-hover">
  <thead>
    <tr>
      <th class = "col-sm-1" scope="col">글번호</th>
      <th scope="col">글제목</th>
      <th scope="col">작성자</th>
      <th scope="col">작성일</th>
      <th class = "col-sm-1" scope= "col">조회수</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="board" items = "${boardlist}" >
    <tr>
      <th scope="row">${board.bno}</th>
      <td><a class = "read" href = "${board.bno}" data-bno = "${board.bno}" ><c:out value = "${board.title}"/>[
			<c:out value = "${board.replyCnt}"/>]</a></td>
      <td>${board.writer}</td>
      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate}"/></td>
    </tr>
    </c:forEach>
  </tbody>
</table>

<nav aria-label="Page navigation example">
  <ul class="pagination pageList">
  	<c:if test = "${pageDTO.prev}">
    	<li class="page-item btnPage prev"><a class="page-link" href="${pageDTO.startPage-1}">Previous</a></li>
    </c:if>
    <c:forEach var = "num" begin = "${pageDTO.startPage}" end = "${pageDTO.endPage}">
    	<li class="page-item btnPage ${pageDTO.cri.currentPage == num? "active" : ""}"><a class="page-link" href="${num}" data-num = "${num}">${num}</a></li>
    </c:forEach>
		<c:if test = "${pageDTO.next}">
    	<li class="page-item btnPage next"><a class="page-link" href="${pageDTO.endPage+1}">Next</a></li>
    </c:if>
  </ul>
</nav>
<div class = "mb-3">
	<form class = "searchForm" action = "/board/list" method = "get" >
		<div class="input-group mb-3">
		  <select class="form-select" id="inputGroupSelect04" aria-label="Example select with button addon" name = "type">
		    <option value = "" <c:out value = "${pageDTO.cri.type == null? 'selected' : ''}"/> >...</option>
		    <option value="T" <c:out value = "${pageDTO.cri.type eq 'T'? 'selected' : ''}"/>>제목</option>
		    <option value="C" <c:out value = "${pageDTO.cri.type eq 'C'? 'selected' : ''}"/>>내용</option>
		    <option value="W" <c:out value = "${pageDTO.cri.type eq 'W'? 'selected' : ''}"/>>작성자</option>
		    <option value="TC" <c:out value = "${pageDTO.cri.type eq 'TC'? 'selected' : ''}"/>>제목+내용</option>
		  </select>
	 		<input class = "col-sm-3" type = "text" name = "keyword" onkeypress="if( event.keyCode == 13 ){srch();}">
	  	<button class="btn btn-outline-secondary btnSearch" type="button" onclick = "srch();">검색</button>
		</div>
		<div class = "mb-3">
			<button type="button" class="btn btn-outline-primary btnRegister">글쓰기</button>
			<button type = "button" class = "btn btn-outline-primary btnList">전체글</button>
			<input type = "hidden" name = "currentPage">
		</div>
	</form>
</div>
	<form id = "actionForm" action = "/board/list" method = "get">
		<input type = "hidden" name = "currentPage" value = "${pageDTO.cri.currentPage}">
		<input type = "hidden" name = "size" value = "${pageDTO.cri.size}">
		<input type = "hidden" name = "type" value = "${pageDTO.cri.type}">
		<input type = "hidden" name = "keyword" value = "${pageDTO.cri.keyword }">
	</form>

</div>
</body>
</html>
