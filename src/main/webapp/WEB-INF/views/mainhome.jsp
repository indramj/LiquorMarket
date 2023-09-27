<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>술을 파는 사람들</title>
<link rel="stylesheet" href="/resources/css/mainhome.css?after"> 
</head>
<body>
<div class="wrapper">
	<div class="wrap">
		<div class="top_gnb_area">
			<h1> 상단메뉴 </h1>
		</div>
		<div class="top_area">
			<div class="logo_area">
				<h1>홈페이지 로고</h1>
			</div>
			<div class="search_area">
				<h1>검색</h1>
			</div>
			<div class="login_area">
			
				<!-- 로그인 하지 않은 상태 -->
				<c:if test = "${member == null }">
                    <div class="login_button"><a href="/member/login">로그인</a></div>
                    <span><a href="/member/join">회원가입</a></span>                
                </c:if>
                
                <!-- 로그인한 상태 -->
                <c:if test="${ member != null }">
                    <div class="login_success_area">
                        <span>회원 : ${member.memberName}</span>
                        <span>금액 : <fmt:formatNumber value="${member.money }" pattern="\#,###.##"/></span>
                        <a href="/member/logout.do">로그아웃</a>
                    </div>
                </c:if>
                
			</div>
			<div class="clearfix"></div>			
		</div>
		<div class="navi_bar_area">
			<h1>메뉴바</h1>
		</div>
		<div class="content_area">
			<h1>대충 술 파는 사진들</h1>
		</div>
	</div>
</div>

</body>
</html>