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
<link rel="stylesheet" href="../resources/css/admin/goodsDetail.css">
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>

<script type="text/javascript">


$(document).ready(function(){
	var operForm = $("#operForm");	

	$(".btnRegist").click(function(e){
		e.preventDefault();
		operForm.submit();
	})
	
	
	$(".btnCancel").on("click" , function(e){
	 	window.history.back();
	
	})
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; //5MB
	
	function checkExtension(fileName, fileSize) {
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 불가!");
			return false;
		}
		return true;
	}	
	
	$(".image-input").on("change" , function(){
		 var fileName = $(this).val().split("\\").pop();
		 var formData = new FormData();
		 var inputFile = $(this);
		 var files = inputFile[0].files;
		 
		 for(var i=0; i<files.length; i++){
				if(!checkExtension(files[i].name, files[i].size)){
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
		 
		 for(var value of formData.values()){console.log(value);}
		 
		 $.ajax({
             url: '/uploadAjax',
             processData: false,
             contentType: false,
             beforeSend: function(xhr){
							xhr.setRequestHeader(csrfHeaderName , csrfTokenValue);},
             data: formData,
             type: 'POST',
             dataType: 'json',
             success: function(result){
                 console.log(result);
                 showResult(result);
             },
             error: function(jqXHR, textStatus, errorThrown){
                 console.log(textStatus);
             }
         });
		 
		 
	})
	



});         

	


</script>
</head>
<body>
<form id = "operForm" action = "/liquor/regist" method = "post">
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>주류 등록</span>
		</div>

		<div class="admin_content_main">

			<div class="form_section">
				<div class="form_section_title">
					<label>주류 이름</label>
				</div>
				<div class="form_section_content">
					<input type = "text" name="name">
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

				<div class="form_section">
					<div class="form_section_title">
						<label>주류 가격</label>
					</div>
					<div class="form_section_content">
						<input type = "text" name="price" >
					</div>
				</div>

				<div class="form_section">
					<div class="form_section_title">
						<label>상품 재고</label>
					</div>
					<div class="form_section_content">
						<input type = "text" name="stock" >
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
				
				<div class="panel-body">
  				<div class="form-group uploadDiv">
  					<input type="file" class = "image-input" name='uploadFile' multiple>
  				</div>
  				
  				<div class='uploadResult'>
  					<ul>
  					
  					</ul>
  				</div>
  			</div>
				
		<div class = "mb-3">
		<div class= "col-sm-3">
			<button type="button" class="btn btn-secondary btnRegist">등록</button>
			<button type="button" class="btn btn-secondary btnCancel">취소</button>
			<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
		</div>
	</div>
</div>
</div>
</div>
</form>


		<!--  	<form id="moveForm" action="/admin/manageGoods" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
			</form>
-->
		</div>
</body>
</html>