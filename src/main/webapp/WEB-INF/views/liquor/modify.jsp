<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>

<link rel="stylesheet" href="../resources/css/admin/goodsDetail.css">
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	var lid = <c:out value = "${liquor.lid}"/>;
	var operForm = $("#operForm")
	$(".btnModify").on("click" , function(e){

		operForm.append("<input type = 'hidden' name = 'lid' value = '"+lid+"'>");
		operForm.submit();
		alert('수정되었습니다.');
	});
	
 	$(".btnRemove").on("click" , function(){
		operForm.attr("action" , "/liquor/remove");
		operForm.append("<input type = 'hidden' name = 'lid' value = '"+lid+"'>");
		operForm.submit();
		alert('삭제되었습니다.');
	});
	
$(".btnList").on("click" , function(e){
	operForm.empty();
	operForm.attr("action" , "/liquor/read");
	operForm.attr("method" , "get");
	operForm.append("<input type = 'hidden' name = 'lid' value = '"+lid+"'>");
	operForm.submit();
	alert('취소합니다.');
	/* window.history.back(); */

})


});         

	


</script>
</head>
<body>
<div class="wrapper">
	<form id = "operForm" action = "/liquor/modify" method = "post">
	<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
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
						<input class="form-control" name="name" value="<c:out value="${liquor.name}"/>" >
					</div>
				</div>
	
				<div class="form_section">
					<div class="form_section_title">
						<label>주류 카테고리</label>
					<select class="form-select" name = "cateName">			    
				    <option value="와인" >와인</option>
				    <option value="위스키">위스키</option>
				    <option value="소주" >소주</option>
				    <option value="맥주" >맥주</option>
			 		</select>
					</div>
				</div>
	
					<div class="form_section">
						<div class="form_section_title">
							<label>주류 가격</label>
						</div>
						<div class="form_section_content">
							<input class="form-control" name="price" value="<c:out value="${liquor.price}"/>">
						</div>
					</div>
	
	
					<div class="form_section">
						<div class="form_section_title">
							<label>상품 재고</label>
						</div>
						<div class="form_section_content">
							<input class="form-control" name="stock" value="<c:out value="${liquor.stock}"/>">
						</div>
					</div>
	
	
	
	
					<div class="form_section">
						<div class="form_section_title">
							<label>주류 소개</label>
						</div>
						<div class="form_section_content bit">
							<textarea class="form-control" name="description" id="description_textarea" rows="5" style = "resize:none;">${liquor.description}</textarea>
						</div>
					</div>
	
	
					<div class = "mb-3">
			<div class= "col-sm-3">
			
			
	
				<button type="button" class="btn btn-primary btnModify">등록</button>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">삭제</button>
				<button type="button" class="btn btn-primary btnList">취소</button>
			</div>
		</div>
	</div>
	</div>
	</form>
	
	<!-- 모달 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">삭제하시겠습니까?</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary-ex btnRemove">예</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
				</div>
			</div>
		</div>
	</div>
			
</div>

		<!--  	<form id="moveForm" action="/admin/manageGoods" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
			</form>
-->
		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<%@ include file="../include/footer.jsp" %>
</body>
</html>