<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/goodsDetail.css">
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		var lid = '<c:out value="${liquor.lid}"/>';
		
		var operForm = $("#operForm");
			$(".btnModify").on("click" , function(e){
				operForm.attr("action" , "/liquor/modify").submit();
			});
			
			$(".btnList").on("click" , function(e){
				var lid = operForm.find("#lid");
				lid.remove();
 				var type = operForm.find("#type");
				var keyword = operForm.find("#keyword");
				if(type.val() === "")
					type.remove();
				if(keyword.val() === "")
					keyword.remove(); 
				
				
				
				operForm.attr("action" , "/liquor/liquorList").submit();
			})
			
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
					<input name="name" value="<c:out value="${liquor.name}"/>" disabled>
				</div>
			</div>

			<div class="form_section">
				<div class="form_section_title">
					<label>주류 카테고리</label>
					<input name="cateName" value="<c:out value="${liquor.cateName}"/>" disabled>
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
						<input name="price" value="<c:out value="${liquor.price}"/>" disabled>
					</div>
				</div>


				<div class="form_section">
					<div class="form_section_title">
						<label>상품 재고</label>
					</div>
					<div class="form_section_content">
						<input name="stock" value="<c:out value="${liquor.stock}"/>" disabled>
					</div>
				</div>




				<div class="form_section">
					<div class="form_section_title">
						<label>주류 소개</label>
					</div>
					<div class="form_section_content bit">
						<textarea name="description" id="description_textarea" disabled>${liquor.description}</textarea>
					</div>
				</div>

				 	
					
				<div class="btn_section">

					<a href = "/cart">장바구니</a>
					
					<!-- <button id="cartBtn" class ="btn_cart">장바구니</button>
					<a href="cart.jsp" id="cartPage" style="display: none;"></a>
					
					<script type="text/javascript">
					// 버튼 클릭 이벤트 처리
					document.getElementById('cartBtn').addEventListener('click',function() { 
					// 타겟 페이지 링크 클릭
					document.getElementById('cartPage').click(); });</script> --> 

					<a href = "/liquor/modify?lid=<c:out value ='${liquor.lid}'/>"><button class="btnModify">수정</button></a>

				</div>
		
			</div>

			<form id="moveForm" action="/admin/manageGoods" method="get">
 				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"> 
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"> 
			</form> 

		</div>
</body>
</html>