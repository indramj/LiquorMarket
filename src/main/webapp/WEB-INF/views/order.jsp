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
		<div id="contents">
			<div class="titleArea">
				<h2>주문서</h2>
			</div>
			<div class="orderWrap">
				<div class="orderListArea">
					<h3 class="orderTitle">주문정보</h3>
					<div class="list-table">
						<table border="0">
							<colgroup>
								<col width="300">
								<col width="100">
								<col width="100">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">
										<div class="tb-sort">제품명</div>
									</th>
									<th scope="col">
										<div class="tb-sort">수량</div>
									</th>
									<th scope="col">
										<div class="tb-sort">가격</div>
									</th>
								</tr>
							</thead>
							<c:forEach var="cartItem" items = "${cartList}">
							<tbody class="">
							<tr class="cart-list">
									<td>
										<div class="tb-left tb-name">${cartItem.liquor.name}</div>
									</td>
									<td>
										<div class="tb-sort">${cartItem.quantity}개</div>
									</td>
									<td>
										<div class="tb-sort">${cartItem.itemTotalPrice}원</div>
									</td>
								</tr>
							</tbody>
							</c:forEach>
						</table>
					</div>
				</div>
				<div class="orderArea">
						<h3 class="orderTitle">회원정보</h3>
					<div class="order-table">
						<table>
							<colgroup>
								<col width="120px">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">
										<div class="tb-left-row">이름</div>
									</th>
									<td>
										<div class="orderTxt">${memberInfo.memberName}</div>
									</td>
								</tr>
								<tr>
									<th scope="row">
										<div class="tb-left-row">연락처</div>
									</th>
									<td>
										<div class="orderTxt">${memberInfo.memberPhone}</div>
									</td>
								</tr>
								<tr>
									<th scope="row">
										<div class="tb-left-row">주소</div>
									</th>
									<td>
										<div class="orderTxt">
											(${memberInfo.memberAddress1})
											${memberInfo.memberAddress2}
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">
										<div class="tb-left-row">주문시 요청사항</div>
									</th>
									<td>
										<textarea id="massage"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div id="btnArea">
					<button type="button" class="cancel_btn pay-btn">취소</button>
					<button type="button" class="pay_btn pay-btn">주문하기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>