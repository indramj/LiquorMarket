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
			<div class="content_subject"><span>장바구니</span></div>
			<!-- 장바구니 리스트 -->
			
			<div class="content_middle_section"></div>
			<!-- 장바구니 가격 합계 -->
			
			<!-- cartInfo -->
			<div class="content_totalCount_section">
				
				<table class="subject_table">
					<caption>표 제목 부분</caption>
					<colgruop>
						<col width="50">
						<col width="80">
						<col width="*">
						<col width="90">
						<col width="90">
					</colgruop>
					<tbody>
						<tr>
							<tr class="head">
								<th scope="col" class="all-select-event">
									<labal>
										<input title="모든 상품을 결쟤상품으로 결정" type="checkBox"
										checked="checked" class="all-deal-selcet">
										<span> 전체선택</span>
									</labal>
								</th>
								<th scope="colgroup" id="th-product-box" colspan="2">상품정보
								</th>
								<th scope="col" id="th-unit-total-price">상품금액</th>
								<th scope="col" id="th-delivery-fee">배송비</th>
								</tr>
					</tbody>
				</table>
				<table class="cart_table">
					<caption>표 내용 부분</caption>
					<tbody>
						<c:forEach items="${cartInfo}" var="ci">
							<tr>
								<td class="td_width_1"></td>
								<td class="td_width_2"></td>
								<td class="td_width_3">${ci.drinkName}</td>
								<td class="td_width_4 price_td">
									<del>정가 : <fmt:formatNumber value="${ci.drinkPrice}" pattern="#,### 원" /></del><br>
									판매가 : <span class="red_color"><fmt:formatNumber value="${ci.salePrice}" pattern="#,### 원" /></span><br>
								</td>
								<td class="td_width_4 table_text_align_center">
									<div class="table_text_align_center quantity_div">
										<input type="text" value="${ci.drinkCount}" class="quantity_input">	
										<button class="quantity_btn plus_btn">+</button>
										<button class="quantity_btn minus_btn">-</button>
									</div>
									<a class="quantity_modify_btn">변경</a>
								</td>
								<td class="td_width_4 table_text_align_center">
									<fmt:formatNumber value="${ci.salePrice * ci.drinkCount}" pattern="#,### 원" />
								</td>
								<td class="td_width_4 table_text_align_center delete_btn"><button>삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table class="list_table">
				</table>
			</div>
			<!-- 가격 종합 -->
			<div class="content_total_section">
				<div class="total_wrap">
					<table>
						<tr>
							<td>
								<table>
									<tr>
										<td>총 상품 가격</td>
										<td>
											<span class="totalPrice_span">70000</span> 원
										</td>
									</tr>
									<tr>
										<td>배송비</td>
										<td>
											<span class="delivery_price">3000</span>원
										</td>
									</tr>									
									<tr>
										<td>총 주문 상품수</td>
										<td><span class="totalKind_span"></span>종 <span class="totalCount_span"></span></td>
									</tr>
								</table>
							</td>
							<td>
								<table>
									<tr>
										<td></td>
										<td></td>
									</tr>
								</table>							
							</td>
						</tr>
					</table>
					<div class="boundary_div">구분선</div>
					<table>
						<tr>
							<td>
								<table>
									<tbody>
										<tr>
											<td>
												<strong>총 결제 예상 금액</strong>
											</td>
											<td>
												<span class="finalTotalPrice_span">70000</span> 원
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 구매 버튼 영역 -->
			<div class="content_btn_section">
				<a>주문하기</a>
			</div>
</body>
</html>

        