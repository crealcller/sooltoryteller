<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/topmenu.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>

.s-main-background {
	height: 615px;
	width: 1520px;
	background-color: rgb(250 245 255);
	text-align: center;
}

.s-error-div {
	margin: 60px auto;
}
.s-mainBtn {
	padding: 10px 16px;
	border: 0;
	outline: 0;
	cursor: pointer;
	background-color: rgb(181, 135, 189);
	text-align: center;
	border-radius: 10px;
	transition: 0.3s;	
}

.s-mainBtn a {
	color: white;
	cursor: pointer;
}

.s-mainBtn:hover {
	background-color: rgb(134 80 143);
}

</style>
</head>

<body>

<div class="s-main-background">
	<div class="s-error-div">
		<i class="fas fa-exclamation-triangle" style="font-size: 100px; margin-bottom: 30px;"></i>
		<p style="margin-bottom: 50px;">잘못된 접근입니다.</p>
		<button class="s-mainBtn"><a href="/">메인으로 돌아가기</a></button>
	</div>
</div>
</body>
<%@include file="/WEB-INF/views/include/footer.jsp" %>
</html>