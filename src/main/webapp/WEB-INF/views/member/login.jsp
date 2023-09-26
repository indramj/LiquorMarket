<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script
  src="https://code.jquery.com/jquery-3.7.1.js"
  integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/member/login.css">
</head>
<body>

<div class="wrapper">
	
	<div class="wrap">
		<form id="login_form" method="post">
			<div class="login_wrap"> 
				<div class="id_wrap">
					<div class="id_input_box">
						<input class="id_input" name="memberId">
					</div>
				</div>
				<div class="pw_wrap">
					<div class="pw_input_box">
						<input class="pw_iput" name="memberPw">
					</div>
				</div>
				
				<div class="login_button_wrap">
					<input type="button" class="login_button" value="로그인">
				</div>
				<!-- 뭐 때문인지 얘 css 적용이 안됨.................. 추후 수정 !!!!!!!!!!!!!!!!!!!!! -->
				<c:if test = "${result == 0 }">
                	<div class = "login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
            	</c:if>
				<div class="join_wrap">
					<span><a href="/member/join">회원이 아니신가요?</a></span>
				</div>
				
				<div class="mainhome_wrap">
					<span><a href="/mainhome">뒤로 가기</a></span>
				</div>			
			</div>
	    </form>
		
	</div>

</div>

<script>
 
    /* 로그인 버튼 클릭 메서드 */
    $(".login_button").click(function(){
        
    	/* 로그인 메서드 서버 요청 */
        $("#login_form").attr("action", "/member/login");
        $("#login_form").submit();
        
    });
 
</script>

</body>
</html>