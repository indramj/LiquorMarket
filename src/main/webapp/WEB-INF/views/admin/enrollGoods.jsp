<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/enrollGoods.css">
 
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
</head>
<body>
 
    <div class="wrapper">
        <div class="wrap">
          
            <!-- top_subject_area -->
            <div class="admin_top_wrap">
                <span>관리자 페이지</span>
                
            </div>
            <!-- contents-area -->
            <div class="admin_wrap">
                <!-- 네비영역 -->
                <div class="admin_navi_wrap">
                  <ul>
                      <li >
                          <a class="admin_list_01" href="/admin/enrollGoods">상품 등록</a>
                      </li>
                      <li>
                          <a class="admin_list_02" href="/admin/manageGoods">상품 관리</a>
                      </li>
    
                      <lI>
                          <a class="admin_list_05">회원 관리</a>                            
                      </lI>                                                                                             
                  </ul>
                </div>
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>상품 등록</span></div>
                     <div class="admin_content_main">
                    	<form action="/admin/enrollGoods" method="post" id="enrollForm">
                    	
                    	                  		
                    		           
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>주류 id</label>
                    			</div>
                    			
                    			<div class="form_section_content">
                    				<input name="drinkId" value="0">
                    			</div>
                    		</div>     
  		
  		
  		
                    	
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>주류 이름</label>
                    			</div>
                    			
                    			<div class="form_section_content">
                    				<input name="drinkName">
                    			</div>
                    		</div>
  		 
  
        		                		  
      		                		        
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>주류 카테고리</label>
                    			</div>
                    			
                    			<div class="form_section_content">
                    				<input name="cateCode">
                    			</div>
                    		</div>   
                    		
                    				 
  		 
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>카테고리 이름</label>
                    			</div>
                    			
                    			<div class="form_section_content">
                    				<input name="cateName">
                    			</div>
                    		</div>          
      		                		  

                    		
                    		       
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>주류 가격</label>
                    			</div>
                    			
                    			<div class="form_section_content">
                    				<input name="drinkPrice" value="0">
                    			</div>
                    		</div>    
                    		
  
                    		        		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>주류 소개</label>
                    			</div>
                    			
                    			<div class="form_section_content">
                    				<input name="drinkIntro">
                    			</div>
                    		</div>        		
                    		
         		
                    		
                   		</form>
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">취 소</button>
	                    		<button id="enrollBtn" class="btn enroll_btn">등 록</button>
	                    	</div> 
                    </div>  
                </div>
                <script>

	let enrollForm = $("#enrollForm")
	
/* 취소 버튼 */
$("#cancelBtn").click(function(){
	
	location.href="/admin/manageGoods"
	
});

/* 상품 등록 버튼 */
$("#enrollBtn").on("click",function(e){
	
	e.preventDefault();
	
	enrollForm.submit();
	
});

</script> 
                <div class="clearfix"></div>
            </div>
        
 
</body>
</html>