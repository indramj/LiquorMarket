<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

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
			});
			
			
			(function(){
				var lid = '<c:out value="${liquor.lid}"/>';
				$.getJSON("/liquor/getAttachList", {lid: lid}, function(arr){
					console.log(arr);
					var str = "";
					$(arr).each(function(i , obj){

						
						var fileCallPath = encodeURIComponent( obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
						str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"'><div>";
						str += "<img src='/display?fileName="+fileCallPath+"'>";
						str += "</div></li>";
					});
					$(".uploadResult ul").html(str);
			})			
		})();
	});
			
</script>
<link rel="stylesheet" href="/resources/css/liquor/read.css">
</head>
<body>
	<div id="content_wrap">
		<div id="container">
			<div id="contents">
				<div id="productDetail">
				<div class="detailArea">
					<div id="imgArea">
						<div class = "uploadResult">
							<ul>
				
							</ul>
						</div>
					</div>
					<div id="infoArea">
						<div class="form_section">
							<div class="form_section_content">
								<input id="name" name="name" value="<c:out value="${liquor.name}"/>" disabled>
							</div>
						</div>
						<div class="form_section">
							<div class="form_section_content">
								<input id="cateName" name="cateName" value="<c:out value="${liquor.cateName}"/>" disabled>
							</div>
						</div>
						<div class="form_section">
							<div class="form_section_content bit form_section_content">
								<textarea name="description" id="description_textarea" disabled>${liquor.description}</textarea>
							</div>
						</div>
						<form id = "operForm" action = "/liquor/liquorList" method = "get">
							<input type = "hidden" name = "currentPage" value = "${cri.currentPage}">
							<input type = "hidden" id = "lid" name = "lid" value = "${liquor.lid}">
							<input type = "hidden" id = "type" name = "type" value = "${cri.type}">
							<input type = "hidden" id = "keyword" name = "keyword" value = "${cri.keyword}"> 
						</form>

<!-- 
					<div class="form_section_content">
						<div class="cate_wrap">
							<span>대분류</span> <select class="cate1" disabled>
								<option value="none">선택</option>
							</select>
						</div>
					</div>
-->
						<div class="form_section">
							<div class="form_section_content">
								<label>가격</label>
								<input id="input_width" name="price" value="<c:out value="${liquor.price}"/>" disabled>
							</div>
						</div>
						<div class="form_section">
							<div class="form_section_content">
								<label>상품 재고</label>
								<input id="input_width" name="stock" value="<c:out value="${liquor.stock}"/>" disabled>
							</div>
						</div>
						<div class="btn_section">
						<a href = "/cart?lid=<c:out value = '${liquor.lid}'/>"><button class="cartBtn">장바구니</button></a>
						
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
				
				
				</div>
				</div>

			<form id="moveForm" action="/liquor/liquorList" method="get">
 				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"> 
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"> 
			</form> 

			</div>
		</div>
	</div>
</body>
</html>