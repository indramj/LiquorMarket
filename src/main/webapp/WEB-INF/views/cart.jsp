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
					<table summary="제품명, 재고, 수량, 가격">
						<colgroup>
							<col width="55%">
							<col width="15%">
							<col width="5%">
							<col width="15%"> 					
						</colgroup>
						<thead>
							<tr>
								<th scope="col">
									<div class="tb-sort">제품명</div>
								</th>
								<th scope="col">
									<div class="tb-sort">재고</div>
								</th>
								<th scope="col">
									<div class="tb-sort">수량</div>
								</th>
								<th scope="col">
									<div class="tb-sort">가격</div>
								</th>
							</tr>
						</thead>
						<c:forEach var="cartItem" items="${cartList}">
						
						<tbody class="tb-body">
							<tr class="my-cart-list">
								<td>
									<div class="tb-left tb-name">${cartItem.liquor.name}</div>
									<div class="tb-left tb-cateName">${cartItem.liquor.cateName}</div>
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


</script>
<%@ include file="include/footer.jsp" %>
</body>
</html>