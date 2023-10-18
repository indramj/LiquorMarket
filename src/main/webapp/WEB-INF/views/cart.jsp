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
	<h1> 장바구니 </h1>
	<input type = "text" name = "name" value = "${liquor.name}">
	<input type = "text" name = "price" value = "${liquor.price}">

</body>
</html>

        