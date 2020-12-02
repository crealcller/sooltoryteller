<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/topmenu.jsp" %>
<script>
    //로그인이 안된 상태면 로그인페이지로 넘어가게
	let msg = '${msg}';
		if(msg != ""){
			alert(msg);
			location.href = '/login';
		}
</script>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
<button type = "button" onclick="location.href='/mypage/changeuserinfo'">회원정보수정</button>
<button type = "button" onclick="location.href='/mypage/changepwd'">비밀번호 변경</button>
</body>
</html>