<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="include/header.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 페이지</title>
<link rel="stylesheet" href="/resources/css/cart.css">

</head>
<body>
<div class="wrapper">
	<div id="container">
		<div id="contents" class="cartWrap">
			<div class="titleArea">
				<h2> 장바구니 </h2>
			</div>
			<div id="myCartWrap">
				<div class="list-table">
					<table summary="제품명, 가격, 재고, 수량, 총 가격">
						<colgroup>
							<col width="10%">
							<col width="45%">
							<col width="10%">
							<col width="15%">
							<col width="5%">
							<col width="15%">					
						</colgroup>
						<thead>
							<tr>
								<th scope="col">
									<input type="checkbox" class="all_checked">전체선택</div>
								<th scope="col">
									<div class="tb-sort">제품명</div>
								</th>
								<th scope="col">
									<div class="tb-sort">가격</div>
								</th>
								<th scope="col">
									<div class="tb-sort">재고</div>
								</th>
								<th scope="col">
									<div class="tb-sort">수량</div>
								</th>
								<th scope="col">
									<div class="tb-sort">총 가격</div>
								</th>
							</tr>
						</thead>
						<c:forEach var="cartItem" items="${cartList}">
						
						<tbody class="tb-body">
							<tr class="my-cart-list">
								<td>
									<input type="checkbox" class="cartCheckbox" value="${cartItem.liquor.lid}">
								</td>
								<td>
									<div class="tb-left tb-name">${cartItem.liquor.name}</div>
									<div class="tb-left tb-cateName">${cartItem.liquor.cateName}</div>
								</td>
								<td>
									<span class="item-price" data-price="${cartItem.liquor.price}">${cartItem.liquor.price}원</span>
								</td>
								<td>
									<div class="tb-sort">${cartItem.quantity}개</div>
								</td>
								<td>
									<div class="tb-sort">
										<span class="quantity">${cartItem.quantity * 0 + 1}</span>
								        <button class="tb-btn increase">+</button>
					      			 	<button class="tb-btn decrease">-</button>
					      			 	<button class="tb-change-btn">변경</button>
									</div>
								</td>
								<td>
									<div class="tb-right">
										<span class="item-price" data-price="${cartItem.liquor.price}" style="display:none">${cartItem.liquor.price}원</span>
										<span class="total_price">${cartItem.itemTotalPrice}원</span>
									</div>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 주문 form -->

<form action="/order/${member.memberId}" method="get" class="order_form">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />


</form>
	

	<div class = "mb-3">
		<div class= "col-sm-3">
			<button type="button" class="btn btn-primary order_btn">주문하기</button>
			<button id="deleteSelected">선택된 물품 삭제</button>
		</div>
	
	
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">

 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	
	//뒤로가기 문제 해결
	window.addEventListener('pageshow', function(event) {
		  if (event.persisted == true) {
		    // bfcache에서 페이지가 복원된 경우 또 다른 페이지 뷰로 보고
		    window.location.reload();
		  }
		});

		
const quantityElements = document.querySelectorAll('.quantity');
const totalElements = document.querySelectorAll('.total_price');
const increaseButtons = document.querySelectorAll('.increase');
const decreaseButtons = document.querySelectorAll('.decrease');
const itemPrices = document.querySelectorAll('.item-price');

increaseButtons.forEach((button, index) => {
    button.addEventListener('click', () => {
        updateQuantity(index, 'increase');
    });
});

decreaseButtons.forEach((button, index) => {
    button.addEventListener('click', () => {
        updateQuantity(index, 'decrease');
    });
});

function updateQuantity(index, operation) {
    const quantityElement = quantityElements[index];
    const totalElement = totalElements[index];
    const itemPrice = itemPrices[index];

    let quantity = parseInt(quantityElement.textContent);
    const price = parseFloat(itemPrice.getAttribute('data-price'));

    if (operation === 'increase') {
        quantity += 1;
    } else if (operation === 'decrease' && quantity > 1) {
        quantity -= 1;
    }

    // 총합 가격 업데이트
    totalElement.textContent = (quantity * price).toFixed(2) + '원';

    // 수량 업데이트
    quantityElement.textContent = quantity;
}

/* 주문 페이지 이동 */	
$(".order_btn").on("click", function(){


	$(".order_form").submit();
	
});

$("#deleteSelected").click(function () {
            var selectedLids = [];

            // 선택된 체크 박스의 값을 가져와서 배열에 추가
            $(".cartCheckbox:checked").each(function () {
                selectedLids.push($(this).val());
            });

            // 선택된 물품을 서버로 전송하여 삭제
            $.post('/cart/delete', { lids: selectedLids }, function (data) {
                // 성공적으로 삭제되었을 때, 페이지 리로딩
                window.location.reload();
            });
        });

</script>
<%@ include file="include/footer.jsp" %>
</body>
</html>   