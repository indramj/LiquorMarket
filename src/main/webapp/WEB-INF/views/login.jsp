<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="./include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
		<form role = "form" method="post" action = "/login">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="login_wrap">
				<div class="logo_wrap">
					<span>LOGIN</span>
				</div>
				
				<div class="id_wrap">
					<div class="id_input_box">
						<input class="id_input" name="username" placeholder="아이디">
					</div>
				</div>
				<div class="pw_wrap">
					<div class="pw_input_box">
						<input type = "password" class="pw_iput" name="password" placeholder="비밀번호">
					</div>
				</div>
				
				<div class="login_button_wrap">
					<input type="submit" class="login_button" value="로그인">
					
					<c:if test="${param.error eq 'true'}">
          <div class="login_warn">
              아이디나 비밀번호가 잘못되었습니다.
          </div>
        </c:if>
				</div>
				
				

				<div class="join_wrap">
					<span><a href="/member/join">회원가입</a></span>
					<span><a href="../">뒤로 가기</a></span>
				</div>		
			</div>
	    </form>
		
	</div>

</div>


</body>
</html>