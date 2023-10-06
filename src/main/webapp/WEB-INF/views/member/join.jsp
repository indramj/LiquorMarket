<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/resources/css/member/join.css">
<script
  src="https://code.jquery.com/jquery-3.7.1.js"
  integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
  crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
	<form id="join_form" method="post">
	<div class="wrap">
			<div class="subjecet">
				<span>CREATE ACCOUNT</span>
			</div>
			<div class="id_wrap">
				<div class="id_name">아이디</div>
				<div class="id_input_box">
					<input class="id_input" name="memberId">
				</div>
				<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
				<span class="id_input_re_2">이미 사용되고 있는 아이디입니다.</span>
				<span class="final_id_ck">아이디를 입력해주세요.</span>
			</div>
			<div class="pw_wrap">
				<div class="pw_name">비밀번호</div>
				<div class="pw_input_box">
					<input class="pw_input" name="memberPw">
				</div>
				<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
			</div>
			<div class="pwck_wrap">
				<div class="pwck_name">비밀번호 확인</div>
				<div class="pwck_input_box">
					<input class="pwck_input">
				</div>
				<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
				<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
                <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
			</div>
			<div class="user_wrap">
				<div class="user_name">이름</div>
				<div class="user_input_box">
					<input class="user_input" name="memberName">
				</div>
				<span class="final_name_ck">이름을 입력해주세요.</span>
			</div>
			<div class="phone_wrap">
				<div class="phone_name">연락처</div>
				<div class="phone_input_box">
					<input class="phone_input" name="memberPhone">
				</div>
				<span class="final_phone_ck">연락처를 입력해주세요.</span>
			</div>
			<div class="mail_wrap">
				<div class="mail_name">이메일</div> 
				<div class="mail_input_box">
					<input class="mail_input" name="memberEmail">
				</div>
				<span class="final_mail_ck">이메일을 입력해주세요.</span>
				<sapn class="mail_input_box_warn"></sapn>
				<div class="mail_check_wrap">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input class="mail_check_input" disabled="disabled">
					</div>
					<div class="mail_check_button">
						<span>인증번호</span>
					</div>
					<div class="clearfix"></div>
					<span id="mail_check_input_box_warn"></span>
				</div>
			</div>
			<div class="address_wrap">
				<div class="address_name">주소</div>
				<div class="address_input_1_wrap">
					<div class="address_input_1_box">
						<input class="address_input_1" name="memberAddress1" readonly="readonly">
					</div>
					<div class="address_button" onclick="execution_daum_address()">
						<span>검색</span>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class ="address_input_2_wrap">
					<div class="address_input_2_box">
						<input class="address_input_2" name="memberAddress2" readonly="readonly">
					</div>
					<span class="final_addr_ck">주소를 입력해주세요.</span>
				</div>
			</div>
			<div class="join_button_wrap">
				<input type="button" class="join_button" value="가입">
				<input type="button" class="mainhome_button" onclick="location.href='../'" value="취소">
			</div>
		</div>
	</form>
</div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>

var code = "";

/* 유효성 검사 통과유무 변수 */
var idCheck = false;
var idckCheck = false;
var pwCheck = false;
var pwckCheck = false;
var pwckcorCheck = false;
var nameCheck = false;
var mailCheck = false;
var mailnumCheck = false;
var addressCheck = false;

$(document).ready(function(){
	//회원가입 버튼 기능 작동
	$(".join_button").click(function(){
		 // 입력값 변수
        var id = $('.id_input').val();
        var pw = $('.pw_input').val();
        var pwck = $('.pwck_input').val();
        var name = $('.user_input').val();
        var phone = $('.phone_input').val();
        var mail = $('.mail_input').val();
        var addr = $('.address_input_2').val();
        
        // 유효성검사
        if(id == ""){
            $('.final_id_ck').css({'display':'block', 'color':'red'});
            idCheck = false;
        }else{
            $('.final_id_ck').css('display', 'none');
            idCheck = true;
        }
        
        if(pw == ""){
            $('.final_pw_ck').css({'display':'block', 'color':'red'});
            pwCheck = false;
        }else{
            $('.final_pw_ck').css('display', 'none');
            pwCheck = true;
        }
        
        if(pwck == ""){
            $('.final_pwck_ck').css({'display':'block', 'color':'red'});
            pwckCheck = false;
        }else{
            $('.final_pwck_ck').css('display', 'none');
            pwckCheck = true;
        }
        
        if(name == ""){
            $('.final_name_ck').css({'display':'block', 'color':'red'});
            nameCheck = false;
        }else{
            $('.final_name_ck').css('display', 'none');
            nameCheck = true;
        }
        
        if(phone == ""){
            $('.final_phone_ck').css({'display':'block', 'color':'red'});
            phoneCheck = false;
        }else{
            $('.final_addr_ck').css('display', 'none');
            phoneCheck = true;
        }
        
        if(mail == ""){
            $('.final_mail_ck').css({'display':'block', 'color':'red'});
            mailCheck = false;
        }else{
            $('.final_mail_ck').css('display', 'none');
            mailCheck = true;
        }
        
        if(addr == ""){
            $('.final_addr_ck').css({'display':'block', 'color':'red'});
            addressCheck = false;
        }else{
            $('.final_addr_ck').css('display', 'none');
            addressCheck = true;
        }
        
        // 최종 유효성 검사
        if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&phoneCheck&&mailCheck&&mailnumCheck&&addressCheck ){
 
        	$("#join_form").attr("action", "/member/join");
    		$("#join_form").submit();
        }
        
        return false;
		
	});
});

//아이디 중복검사
$('.id_input').on("propertychange change keyup paste input", function(){	

	var memberId = $('.id_input').val();
	var data = {memberId : memberId}
	
	$.ajax({
		type : "post",
		url : "/member/memberIdChk",
		data : data,
		success : function(result){
			if(result != 'fail'){
				$('.id_input_re_1').css("display","inline-block");
				$('.id_input_re_2').css("display", "none");
				idckCheck = true;
			} else {
				$('.id_input_re_2').css("display","inline-block");
				$('.id_input_re_1').css("display", "none");
				idckCheck = false;
			}
		}
	}); // ajax 종료	
});

/* 인증번호 이메일 전송 */
$(".mail_check_button").click(function(){
    
	var email = $(".mail_input").val();
	var ceBox = $(".mail_check_input");
    var boxWrap = $(".mail_check_input_box");
    var warnMsg = $(".mail_input_box_warn");		//메일 입력 경고글
	
    /* 이메일 형식 유효성 검사 */
    if(checkMailForm(email)){
        warnMsg.html("확인 이메일이 전송되었습니다. 이메일을 확인해주세요.");
        warnMsg.css("display", "inline-block");
    } else {
        warnMsg.html("이메일 형식을 다시 확인해주세요.");
        warnMsg.css('display', 'inline-block');
        return false;
    }
    
	$.ajax({
        
        type:"GET",
        url:"mailCheck?email=" + email,
        success:function(data){
        	
            ceBox.attr("disabled",false);
            boxWrap.attr("id", "mail_check_input_box_true");
            code =data;
            
            }
	});
});

/* 인증번호 비교 */
$(".mail_check_input").blur(function(){
    
	var inputCode = $(".mail_check_input").val();   
    var checkResult = $("#mail_check_input_box_warn");
    
    if(inputCode == code){
        checkResult.html("인증번호가 확인되었습니다.");
        checkResult.css('color','green');
        mailnumCheck = true;
    } else {
        checkResult.html("인증번호를 다시 확인해주세요.");
        checkResult.css('color','red');
        mailnumCheck = false;
    }
    
});

/* 주소 연동 */
function execution_daum_address(){
	
	//https://postcode.map.daum.net/guide#usage 에서 주석 확인 가능
	new daum.Postcode({
        oncomplete: function(data) {

            var addr = ''; 
            var extraAddr = ''; 

            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                addr += extraAddr;
            
            } else {
            	addr += ' ';
            }

            $(".address_input_1").val(data.zonecode);
            $(".address_input_2").val(addr);
            $(".address_input_2").attr("readonly",false);
            $(".address_input_2").focus();
          	
        }
    }).open(); 
}

/* 비밀번호 확인 일치 유효성 검사 */

$('.pwck_input').on("propertychange change keyup paste input", function(){
        
	var pw = $('.pw_input').val();
    var pwck = $('.pwck_input').val();
    $('.final_pwck_ck').css('display', 'none');
    
    if(pw == pwck){
        $('.pwck_input_re_1').css('display','block');
        $('.pwck_input_re_2').css('display','none');
        pwckcorCheck = true;
    }else{
        $('.pwck_input_re_1').css('display','none');
        $('.pwck_input_re_2').css('display','block');
        pwckcorCheck = false;
    }
    
});

/* 이메일 형식 유효성 검사 */
function checkMailForm(email){
	var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;	//정규표현식
	return form.test(email);
}

</script>

</body>
</html>