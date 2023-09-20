<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/goodsManage.css">
 
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
                          <a class="admin_list_01" href="/admin/goodsEnroll">상품 등록</a>
                      </li>
                      <li>
                          <a class="admin_list_02" href="/admin/goodsManage">상품 관리</a>
                      </li>
    
                      <lI>
                          <a class="admin_list_05">회원 관리</a>                            
                      </lI>                                                                                             
                  </ul>
                </div>              
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>상품 관리</span></div>
                </div>
                <div class="clearfix"></div>
            </div>  
    </div>    <!-- class="wrap" -->
</div>    <!-- class="wrapper" -->
 <script>
$(document).ready(function(){
	
	let eResult = '<c:out value="${enroll_result}"/>';
	
	checkResult(eResult);
	
	function checkResult(result){
		
		if(result === ''){
			return;
		}
		
		alert("상품'"+ eResult +"'을 등록하였습니다.");
		
	}

});
</script>
</body>
</html>