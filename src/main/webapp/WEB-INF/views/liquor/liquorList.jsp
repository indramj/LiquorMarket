<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	
function srch()
{
	var search = $(".searchForm");

	search.find("input[name='currentPage']").val("1");			
	search.submit();
}	
	
$(document).ready(function(){
	var moveForm = $(".move");
	
	$(".goods_table a").on("click" , function(e){
		e.preventDefault();
		var lid = $(this).data('lid');
		moveForm.append("<input type ='hidden' name = 'lid' value = '"+lid+"' >");
		moveForm.submit();
	});
	
	$(".btnRegist").on("click" , function(e){
		e.preventDefault();
		moveForm.attr("action" , "/liquor/regist")
		moveForm.submit();
	});
	
	$(".btnPage a").click(function(e){
		e.preventDefault();
	
		moveForm.find("input[name = currentPage]").val($(this).attr("href"));
		moveForm.attr("action" , "/liquor/liquorList")
		moveForm.submit();
	})
	
	str = "";
	

	<c:forEach items= "${liquorList}" var = "liquor">
		var lid = ${liquor.lid}
		$.getJSON("/liquor/getAttachList", {lid:lid}, function(arr){
			var str = "";
			console.log(arr[0].uuid)
			obj = arr[0];
			var targetLid = arr[0].lid;
			var fileCallPath = encodeURIComponent( obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
			var targetImage = $('img[data-lid="' + targetLid + '"]');
			str += '/display?fileName=';
			str += ''+fileCallPath+'';
			targetImage.attr('src', str);
		});
	</c:forEach>



});//ready
	
	
</script>
<link rel="stylesheet" href="/resources/css/liquor/liquorlist.css">
</head>
<body>
<div class="wrapper">
	<div class="admin_content_wrap">
		<div class="goods_table_wrap">
			<!-- 상품 리스트 O -->
			<div class="admin_content_subject">
				<span>추천 상품</span>
			</div>
			<c:if test="${listcheck != 'empty'}">
				<form class = "move" action = "/liquor/read/" method = "get">
					<ul class="goods_table">
						<c:forEach items="${liquorList}" var="liquorList">
							<li>
								<div class="goods_images">
									
									<a data-lid ='<c:out value = "${liquorList.lid}"/>' href = "">
										
										<img data-lid = "${liquorList.lid}" class="liquor_img_s" src="#" alt="상품 이미지">
									</a>
								</div>
								<div class="goods-detail">
									<div><a data-lid ='<c:out value = "${liquorList.lid}"/>' href = "">${liquorList.name}</a></div>
									<div>${liquorList.description}</div>
									<div><c:out value="${liquorList.cateName}" ></c:out></div>
									<div>${liquorList.price}</div>
								</div>
							</li>
						</c:forEach>
					</ul>
					<div class="add_menu">
						<sec:authorize access = "isAuthenticated()">
							<button type ="button" class = "btnRegist">등록</button>
						</sec:authorize> 	
					</div>			
					<nav aria-label="Page navigation example">
						<div class="page-list">
						  <ul class="pagination pageList page-list-1">
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
						</div>
					</nav>
					<input type = "hidden" name = "currentPage" value = "${pageDTO.cri.currentPage}">
					<input type = "hidden" name = "size" value = "${pageDTO.cri.size}">
 					<input type = "hidden" name = "type" value = "${pageDTO.cri.type}">
					<input type = "hidden" name = "keyword" value = "${pageDTO.cri.keyword }">
				</form>
			</c:if>
			<div class = "mb-3 board_list_search">
				<form class = "searchForm" action = "/liquor/liquorList" method = "get" >
					<div class="input-group mb-3 search-2">
					  <select class="form-select" id="inputGroupSelect04" name = "type">
					    <option value = "" <c:out value = "${pageDTO.cri.type == null? 'selected' : ''}"/> >...</option>
					    <option value="N" <c:out value = "${pageDTO.cri.type eq 'N'? 'selected' : ''}"/>>이름</option>
					    <option value="C" <c:out value = "${pageDTO.cri.type eq 'C'? 'selected' : ''}"/>>카테고리</option>
					    <option value="P" <c:out value = "${pageDTO.cri.type eq 'P'? 'selected' : ''}"/>>가격</option>
					    <option value="NC" <c:out value = "${pageDTO.cri.type eq 'P'? 'selected' : ''}"/>>이름+카테고리</option> 
					  </select>
				 		<input class = "col-sm-3" type = "text" name = "keyword" onkeypress="if( event.keyCode == 13 ){srch();}">
				  	<button class="btn btn-outline-secondary btnSearch" type="button" onclick = "srch();">검색</button>
					</div>
						<input type = "hidden" name = "currentPage">
				</form>
			</div>
		</div>
		<!-- 상품 리스트 X -->
		<c:if test="${listCheck == 'empty'}">
			<div class="table_empty">등록된 상품이 없습니다.</div>
		</c:if>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>