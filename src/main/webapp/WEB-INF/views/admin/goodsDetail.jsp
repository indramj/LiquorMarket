<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="../resources/css/admin/goodsDetail.css">
<script
 src="http://code.jquery.com/jquery-3.4.1.js"
 integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
 crossorigin="anonymous">
</script>
</head>
<body>
<h1>상품 조회 페이지</h1>

                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>상품 상세</span></div>

                    <div class="admin_content_main">

                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>주류 이름</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="drinkName" value="<c:out value="${goodsInfo.drinkName}"/>" disabled>
                    			</div>
                    		</div>
 		
                    		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>최근 수정 날짜</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input value="<fmt:formatDate value='${goodsInfo.updateDate}' pattern='yyyy-MM-dd'/>" disabled>
                    			</div>
                    		</div>       
                    		
          		
                    		    
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>주류 카테고리</label>
                    			</div>
                    			
                    			
                    			<div class="form_section_content">
                    				<div class="cate_wrap">
                    					<span>대분류</span>
                    					<select class="cate1" disabled>
                    						<option  value="none">선택</option>
                    					</select>           				                    				
                    			</div>
                    		</div>          
                    		
                    		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>주류 가격</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="drinkPrice" value="<c:out value="${goodsInfo.drinkPrice}"/>" disabled>
                    			</div>
                    		</div>          
                    		
                    		     
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 재고</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="drinkStock" value="<c:out value="${goodsInfo.drinkStock}"/>" disabled>
                    			</div>
                    		</div>        
                    		
                    		  
        		
                    		     		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>주류 소개</label>
                    			</div>
                    			<div class="form_section_content bit">
                    				<textarea name="drinkIntro" id="drinkIntro_textarea" disabled>${goodsInfo.drinkIntro}</textarea>
                    			</div>
                    		</div>      
    
    
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">상품 목록</button>
	                    		<button id="enrollBtn" class="btn enroll_btn">수정 </button>
	                    	</div> 
                    </div>      

                	
                	<form id="moveForm" action="/admin/manageGoods" method="get" >
 						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                	</form>
                	
                </div>
 			
</body>
</html>