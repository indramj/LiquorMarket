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
	<h1> 장바구니 </h1>
	<c:forEach var="cartItem" items="${cartList}">
    <h4>주류 이름: ${cartItem.liquor.name}</h4>
    <h4>카테고리: ${cartItem.liquor.cateName}</h4>
    <h4>가격: <span class="item-price" data-price="${cartItem.price}">${cartItem.price}원</span></h4>
    <h4>${cartItem.quantity}개</h4>
    <div>
        <p>
            물품 수량: <span class="quantity">${cartItem.quantity}</span>
        </p>
        <!-- 수량 증가 버튼 -->
        <button class="increase">+</button>
        <!-- 수량 감소 버튼 -->
        <button class="decrease">-</button>
        <!-- 총합 가격 -->
        <p>
            총합 가격: <span class="total_price">${cartItem.quantity * cartItem.price}원</span>
        </p>
    </div>
</c:forEach>

	
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
    const price = parseFloat(itemPrice.getAttribute('data-price')); // 가격 정보 가져오기

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
</body>
</html>

        
        