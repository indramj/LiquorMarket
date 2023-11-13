<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	$(document).ready(function(){
		
		
		var adminForm = $(".admin");
		$(".btnRole").click(function(e){
			e.preventDefault();
	    adminForm.attr("action" , "/admin/addRole");
	    adminForm.submit();
			}); //btnRole.click
			
			$(".btnRemoveRole").click(function(e){
				e.preventDefault();
				adminForm.attr("action" , "/admin/removeRole");
			  adminForm.submit();
			}); //btnRemoveRole
			
			$(".btnRemoveMember").click(function(e){
				e.preventDefault();
				adminForm.attr("action" , "/admin/removeMember");
				adminForm.submit();
				
			});//btnRemoveMember
	});
</script>

</head>
<body>
<form class = "admin" action = "/admin/" method = "get">
<style>
    .btn-text-right{
        text-align: right;
        }
</style>
<div class="btn-text-right">
<button type = "button" class= "btn btn-primary btnRole">권한부여</button>
<button type = "button" class = "btn btn-secondary btnRemoveRole">권한 삭제</button>
<button type = "button" class = "btn btn-secondary btnRemoveMember">회원 삭제</button> 
</div>
<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
<table class="table table-striped table-hover">
	<thead>
		<th scope = "col">#</th>
		<th scope="col">아이디</th>
		<th scope="col">이름</th>
		<th scope="col">이메일</th>
		<th scope="col">생성일</th>
		<th scope="col">권한</th>
	</thead>
	<tbody>
	<c:forEach items = "${memberList}" var = "member">
		<tr>
		
		
			<td><input type = "checkbox" name = "checkList" value ="${member.memberId}"></td>
			
			
			<td>${member.memberId}</td>
			<td>${member.memberName}</td>
			<td>${member.memberEmail}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.regDate}"/></td>
			<td>
			<c:forEach items = "${member.authList}" var = "authList">
				<c:if test = "${authList.auth eq 'ROLE_ADMIN'}">
					관리자</br>
				</c:if>
				<c:if test = "${authList.auth eq 'ROLE_MANAGER'}">
					운영자</br>
				</c:if>
				<c:if test = "${authList.auth eq 'ROLE_USER'}">
					사용자</br>
				</c:if>
			</c:forEach>
			</td>	
		</tr>
	</c:forEach>
	</tbody>
</table>
</form>
</body>
</html>