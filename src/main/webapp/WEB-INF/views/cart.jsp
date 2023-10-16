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
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	
	//뒤로가기 문제 해결
	window.addEventListener('pageshow', function(event) {
		  if (event.persisted == true) {
		    // bfcache에서 페이지가 복원된 경우 또 다른 페이지 뷰로 보고
		    window.location.reload();
		  }
		});
	</script>
</head>
<body>
	<div class="cart_mark">
		<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-cart4" viewBox="0 0 16 16">
  <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
</svg>
<span class="cart_text">&nbsp;장바구니</span> 
</div>

${cartInfo}

<%-- 	<!-- 장바구니 리스트 -->
			<div class="content_middle_section"></div>
			
			
			<!-- cartInfo -->
	<table class="table table-hover table-responsive">
	<colgroup>
		<col width="120">
		<col width="50">
		<col width="*">
		<col width="90">
		<col width="90">
		<thead class="">
			<tr class="table align-middle">
				<th scope="col" class="all-select-event">
					<labal>
					<input title="모든 상품을 결제상품으로 결정" type="checkbox" checked="checked" class="all-deal-select">
					<span> 전체선택</span>
					</labal>
					</th>
				<th scope="colgroup" id="th-product-box" colspan="2">상품정보</th>
				<th scope="col">상품금액</th>
				<th scope="col">배송비</th>
			</tr>
		</thead>
		<tbody class="table-group-divider">
			<tr class="table align-middle">
				<td>&nbsp;배송상품</td>
			</tr>
			<tr class="table align-middle">
				<td class="product-select-event">
				 <input type="checkbox" title="" checked="checked" value="" class="dealSelectChk">				
				</td>
				<td>
				<figure class="figure">
						<figure class="figure">
							<img src="/LiquorMarket/src/main/webapp/resources/imege/exsoju.png" width="120" height="120" class="figure-img img-fluid rounded" alt="예시 소주">
							<figcaption class="figure-caption text-end">A caption for the above image.</figcaption>
						</figure>
						</td>
				<td>3</td>
				<td>4</td>
			</tr>
			<tr>
				
			</tr>
		</tbody>
	</table>  --%>
</body>
</html>

        