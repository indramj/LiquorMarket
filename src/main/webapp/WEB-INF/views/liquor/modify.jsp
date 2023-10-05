<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/goodsDetail.css">
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		var operForm = $("#operForm")
		$(".btnModify").on("click" , function(e){
			operForm.submit();
		});
		
		$(".btnRemove").on("click" , function(){
			operForm.attr("action" , "/liquor/remove" , "method" , "get");
			operForm.submit();
			
		});
		
		
	});

</script>
</head>
<body>
	<h1>상품 조회 페이지</h1>

	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>상품 상세</span>
		</div>

		<div class="admin_content_main">

			<div class="form_section">
				<div class="form_section_title">
					<label>주류 이름</label>
				</div>
				<div class="form_section_content">
					<input name="name" value="<c:out value="${liquor.name}"/>">
				</div>
			</div>

			<div class="form_section">
				<div class="form_section_title">
					<label>주류 카테고리</label>
					<input name="cateName" value="<c:out value="${liquor.cateName}"/>">
				</div>
<!-- 

				<div class="form_section_content">
					<div class="cate_wrap">
						<span>대분류</span> <select class="cate1" disabled>
							<option value="none">선택</option>
						</select>
					</div>
				</div> -->


				<div class="form_section">
					<div class="form_section_title">
						<label>주류 가격</label>
					</div>
					<div class="form_section_content">
						<input name="price" value="<c:out value="${liquor.price}"/>">
					</div>
				</div>


				<div class="form_section">
					<div class="form_section_title">
						<label>상품 재고</label>
					</div>
					<div class="form_section_content">
						<input name="stock" value="<c:out value="${liquor.stock}"/>">
					</div>
				</div>




				<div class="form_section">
					<div class="form_section_title">
						<label>주류 소개</label>
					</div>
					<div class="form_section_content bit">
						<textarea name="description" id="description_textarea">${liquor.description}</textarea>
					</div>
				</div>


				<div class="btn_section">
					<button id="cancelBtn" class="btn">상품 목록</button>
					<button class = "btnModify" type ="button">수정</button>
					<button class = "btnRemove" type = "button">삭제</button>
					<button class = "btnToCart">장바구니</button>
					<a href="/liquor/list?currentPage=<c:out value = '${cri.currentPage}'/>"><button
			class="btnList">취소</button></a>
				</div>
			</div>


			<form class="moveForm" action="/liquor/liquorList" method="get">
	<%-- 		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"> --%>
			</form>

		</div>
</body>
</html>