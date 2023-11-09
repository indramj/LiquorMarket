<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix = "sec" %>
<%@ include file="include/header.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 페이지</title>
<link rel="stylesheet" href="/resources/css/cart.css">

</head>
<body>
<form class = "orderForm" method = "get" action = "/order/orderList/${member.memberId}">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<div class="wrapper">
	<div id="container">
		<div id="contents" class="cartWrap">
			<div class="titleArea">
				<h2>장바구니</h2>
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
								<th scope = "col">
									<div class = "tb-sort"></div>
								</th>
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
							<tr class="my-cart-list" data-lid = "${cartItem.liquor.lid}">
								<td>
									<input type = "checkbox" name = "cartCheckList" value = "${cartItem.liquor.lid}"/>
								</td> 
								<td>
									<div class="tb-left tb-name">${cartItem.liquor.name}</div>
									<div class="tb-left tb-cateName">${cartItem.liquor.cateName}</div>
								</td>
								<td>
									<span class="item-price" data-price="${cartItem.liquor.price}">${cartItem.liquor.price}원</span>
								</td>
								<td>
									<div class="tb-sort">
										<span class = "stock" data-stock = "${cartItem.liquor.stock}">
										${cartItem.liquor.stock}</span>개</div>
								</td>
								<td>
									<div class="tb-sort">
										<span class="quantity" data-quantity = "${cartItem.quantity}">${cartItem.quantity}</span>
								        <button type = "button" class="tb-btn increase">+</button>
					      			 	<button type = "button" class="tb-btn decrease">-</button>
					      			 	<button type ="button"  class="tb-change-btn btnUpdateQty">변경</button>
									</div>
								</td>
								<td>
									<div class="tb-right">
										<span class="total_price">${cartItem.itemTotalPrice}</span>
									</div>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="totalArea">
					<div class="finalPrice">
						<h5>총 상품금액 =</h5>
						<span></span>
						<!-- 총합 가격 넣는곳 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--></div>
					</div>
				</div>
				<div class="butArea">
					<button type = "button" class = "btnOrder">주문하기</button>
					<button type = "button" class = "btnDelete">상품 제거</button>
				</div>
			</div>
		</div>
	</div>
</div>
</form>
	
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	
	//뒤로가기 문제 해결
	window.addEventListener('pageshow', function(event) {
		  if (event.persisted == true) {
		    // bfcache에서 페이지가 복원된 경우 또 다른 페이지 뷰로 보고
		    window.location.reload();
		  }
		});

	$(document).ready(function(){
		updateCartPrice();
		var orderForm = $(".orderForm");
		
		/* 주문 페이지 이동 */	
		$(".btnOrder").on("click", function(){
			var totalCartPrice =$(".finalPrice").find("span").text();
			orderForm.append("<input type = 'hidden' , name = 'totalCartPrice' value = '"+totalCartPrice+"'>");
			orderForm.submit();

		});
		
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		$(document).ajaxSend(function(e, xhr, options) { 
		    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
		  });

		$(".btnUpdateQty").on("click" , function(e){
			var item = $(this).parents(".my-cart-list");
			var price = item.find(".item-price").data("price");
			var itemTotalPrice = item.find(".tb-right").find("span");
			var quantity = $(this).siblings("span");
			var lid = item.data('lid');
			var stock = item.find(".tb-sort").find(".stock").data("stock");
			
			if(quantity.text() > stock ){
				alert("재고가 부족합니다.");
				item.find(".tb-sort").find(".quantity").text(stock);
				itemTotalPrice.text(stock * price);
			}
			var cartItem = {
					lid : lid,
					quantity : quantity.text(),
					itemTotalPrice : itemTotalPrice.text()			
			}		
			$.ajax({
				url : '/cart/updateQty',
				type : 'put',
				data : JSON.stringify(cartItem),
				contentType : 'application/json; charset=utf-8',
				dataType : 'text',
				success : function(result){
					alert ("수량이 변경되었습니다.");
					
				}
			});		
			updateCartPrice();
		})
		
		function updateCartPrice()
		{
			var cartPrice = 0;
			$(".total_price").each(function(idx , item){
				cartPrice += parseInt($(this).text());
			})
			$(".finalPrice").find("span").text(cartPrice);
			return cartPrice;
		}
		
		
		$(".btnDelete").on("click" , function(e){
			e.preventDefault();
			orderForm.attr("action" , "/cart/delete");
			orderForm.submit();
		})
		
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
		    totalElement.textContent = (quantity * price);

		    // 수량 업데이트
		    quantityElement.textContent = quantity; 
		}

	});
		





</script>
<%@ include file="include/footer.jsp" %>
</body>
</html> 