<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	$(document).ready(function(){
		
		$(".move a").click(function(e){
			var moveForm = $(".move");
			e.preventDefault();
			var lid = $(this).data('lid');
			moveForm.append("<input type ='hidden' name = 'lid' value = '"+lid+"' >");
			moveForm.submit();
		});
		
	})
	
	
</script>
<link rel="stylesheet" href="/resources/css/liquor/liquorlist.css">
</head>
<body>
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>Liquorlist</span>
		</div>
		<div class="goods_table_wrap">
			<!-- 상품 리스트 O -->
			<c:if test="${listcheck != 'empty'}">
				<form class = "move" action = "/liquor/read/" method = "get">
					<ul class="goods_table">
						<c:forEach items="${liquorList}" var="liquorList">
							<li>
								<div class="goods_images">
									<a data-lid ='<c:out value = "${liquorList.lid}"/>' href = "">
										<img class="liquor_img_s" src="/resources/images/liquor/liquor1.jpg" alt="상품 이미지">
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
				</form>
			</c:if>
			<!-- 상품 리스트 X -->
			<c:if test="${listCheck == 'empty'}">
				<div class="table_empty">등록된 상품이 없습니다.</div>
			</c:if>
		</div>
	</div>
</body>
</html>