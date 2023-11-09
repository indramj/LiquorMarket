<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix = "sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/order.css">
<script>
	$(document).ready(function(){
		
		var orderForm = $(".orderForm");
		$(".pay_btn").on("click", function(e){
			e.preventDefault();
			orderForm.submit();
		})
		
	})
</script>


</head>
<body>
<form class = "orderForm" action = "/order/confirm" method = "post">
<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
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
							<tbody>
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
					<div class="totalArea">
						<div class="finalPrice">
							<h5>총 상품금액</h5>
							= <span><c:out value = "${totalCartPrice}"/></span> 원
						</div>
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
					<button type="button" class="cancel_btn pay-btn-2" onclick="location.href='/cart?memberId=kmm'">취소</button>
					<button type="button" class="btn btn-primary pay-btn-2" data-bs-toggle="modal" data-bs-target="#exampleModal">주문하기</button>
				</div>
			</div>
			
			<!-- 모달 -->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">주문을 확정하시겠습니까?</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary pay_btn">예</button>
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
<%@ include file="../include/footer.jsp" %>
</body>
</html>