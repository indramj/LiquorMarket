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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

<link rel="stylesheet" href="../resources/css/liquor/regist.css">


<script src="http://code.jquery.com/jquery-3.4.1.js"></script>

<script type="text/javascript">


$(document).ready(function(){
	var operForm = $("#operForm");
	$("#Register").on("click" , function(e){
		e.preventDefault();
		
		var str = "";
		$(".uploadResult ul li").each(function(i, obj){
			var jobj = $(obj);
			console.dir(jobj);
			str += "<input type='hidden' name='imageList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			str += "<input type='hidden' name='imageList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			str += "<input type='hidden' name='imageList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
		});
		operForm.append(str).submit();
		
		;
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
	
	$("#uploadFile").on("change" , function(e){
		
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		
		var files = inputFile[0].files;
		
		console.log(files);
		
		for ( var i = 0; i < files.length; i++){
			if(!checkExtension(files[i].name , files[i].size)){
				return false;
			}
				
			formData.append("uploadFile" , files[i]);
		}
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
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
                 showUploadedfile(result);
             },
             error: function(jqXHR, textStatus, errorThrown){
                 console.log(textStatus);
             }
         }); //$.ajax
	}); //#uploadFile
	
	
	function showUploadedfile(uploadResultArr){
		
		var str = "";
		var uploadUL = $(".uploadResult ul");
		$(uploadResultArr).each(function(i , obj){
			
			var fileCallPath = encodeURIComponent( obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
			
			str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"'>";
			str += "<img src ='/display?fileName="+fileCallPath+"'></li>";
			
		});
		uploadUL.append(str);
	}
	
	
		
}); 	
		
</script>
</head>
<body>
<div class="wrapper">
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
						<input class="form-control" type = "text" name="name">
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
							<input class="form-control" type = "text" name="price" >
						</div>
					</div>
	
					<div class="form_section">
						<div class="form_section_title">
							<label>상품 재고</label>
						</div>
						<div class="form_section_content">
							<input class="form-control" type = "text" name="stock" >
						</div>
					</div>
	
					<div class="form_section">
						<div class="form_section_title">
							<label>주류 소개</label>
						</div>
						<div class="form_section_content bit">
							<textarea class="form-control" name="description" id="description_textarea" rows="5" style = "resize:none;">${liquor.description}</textarea>
							
						</div>
					
					<div class="panel-body">
	  				<div class="form-group uploadDiv">
	  					<input type="file" id = "uploadFile" name='uploadFile' multiple>
	  				</div>
	  				
	  				<div class='uploadResult'>
	  					<ul class='no_dot'>
	  						
	  					</ul>
	  				</div>
	  				</div>
	  				
					
			<div class = "regist-mb-3">
			<div class= "col-sm-3">
				<button type="button" class="btn btn-primary" id = "Register">등록</button>
				<button type="button" class="btn btn-primary btnCancel">취소</button>
				<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
			</div>
			</div>
		</div>
	</div>
	</div>
	</form>
</div>
		<!--  	<form id="moveForm" action="/admin/manageGoods" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
			</form>
-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<%@ include file="../include/footer.jsp" %>
</body>
</html>