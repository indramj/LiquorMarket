<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="./include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
<script
  src="https://code.jquery.com/jquery-3.7.1.js"
  integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
  crossorigin="anonymous"></script>
  
<script type="text/javascript">

$(document).ready(function(){
	$(".login_button").on("click", function(e){
		e.preventDefault();
		$("form").submit();
	});

})

</script>
<link rel="stylesheet" href="/resources/css/member/login.css?after">
</head>
<body>

<div class="wrapper">	
	<div class="wrap">
		<form role = "form" method="post" action = "/logout">
			<div class="logout_wrap">
				<div class="logo_wrap">
					<span>logout</span>
				</div>
				<div class = "login_warn">
						로그아웃 하시겠습니까
				</div>
			
				<div class="login_button_wrap">					
					<input type="submit" class="login_button" value="로그아웃">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</div>		
				<div class="join_wrap">
					<span><a href="javascript:history.back();">뒤로 가기</a></span>
				</div>		
			</div>
	    </form>
		
	</div>
</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>