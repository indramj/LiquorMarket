<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix = "sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/order.css">
</head>
<body>
<div class="wrapper">
	<div id="container">
		<div id="contents" class="orderWrap">
			<div class="titleArea">
				<h2>주문서</h2>
			</div>
			<div class="orderListArea">
				<h3>주문정보</h3>
				<c:forEach var="cartItem" items = "${cartList}">
					이름 : ${cartItem.liquor.name }
					갯수 : ${cartItem.quantity }
					가격 : ${cartItem.itemTotalPrice }<br>
				</c:forEach>
			</div>
			<div class="orderArea">
				<div class="title">
					
				</div>
				<div class="orderTable">
					
				</div>
			</div>
			<div id="btnArea">
				<button type="button" class="pay_btn pay-btn">주문하기</button>
				<button type="button" class="cancel_btn pay-btn">취소</button>
			</div>
		</div>
	</div>
</div>


<div>

<h1>회원 정보</h1>
	<p>이름<span> ${memberInfo.memberName}</span></p>
	<p>전화번호<span> ${memberInfo.memberPhone}</span></p>
	<p>주소<span> ${memberInfo.memberAddress1}</span>
				<span> ${memberInfo.memberAddress2}</span></p>
	<textarea rows="1" cols="30">주문시 요청사항</textarea>
</div>
<div>
</div>

</body>
</html>