<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- fontawesome -->
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

button {
	cursor: pointer;
	outline: 0;
}

#h-company-name {
	padding: 20px;
}

a {
	text-decoration: none;
	color: black;
}

.h-logobar {
	width: 1520px;
	height: 90px;
	border-bottom: solid 2px #E1E1E1;
}

.h-logo-img {
	height: 60px;
	width: 145px;
	margin: 15px 0px 0px 30px;
}

.h-logo {
	width: 800px;
	text-align: left;
	display: inline-block;
	margin-bottom: 10px;
}

.h-dropbtn {
	background-color: Transparent;
	width: 120px;
	color: black;
	font-size: 15px;
	font-weight: bold;
	border: none;
}

.h-dropdown {
	display: inline-block;
}

.h-dropdown-content {
	display: none;
	position: absolute;
	background-color: white;
	width: 120px;
	z-index: 1;
}

.h-dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	font-size: 13px;
}

.d-main-con {
	width: 100%;
	height: 1000px;
}

#h-dropdown-content a:hover {
	background-color: #F2EFF9;
}

#h-dropdown:hover #h-dropdown-content {
	display: block;
}

#h-dropdown:hover .h-dropbtn {
	border-bottom: 3px solid purple;
}

.s-main-background {
	width: 1520px;
	background-color: rgb(250, 245, 255);
	/* 다울추가 */
	padding: 50px 0px 50px 0px;
}

.s-main-column {
	width: 1000px;
	background-color: white;
	margin: 0 auto;
}

.s-main-background {
	height: 615px;
	width: 1520px;
	background-color: rgb(250, 245, 255);
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
	background-color: rgb(134, 80, 143);
}
</style>
</head>
<body>
	<div class="h-logobar">
		<div class="h-logo">
			<a href="/" id="h-company-name"><img class="h-logo-img"
				src='/resources/img/Logo_1-2.png'></a>
			<div id="h-dropdown" class="h-dropdown">
				<button id="h-dropbtn1" class="h-dropbtn">전통주</button>
				<div id="h-dropdown-content" class="h-dropdown-content">
					<a href="/all-liq">전체</a> <a href="/liq-list?cate=탁주">탁주</a> <a
						href="/liq-list?cate=약주 청주">약주/청주</a> <a href="/liq-list?cate=과실주">과실주</a>
					<a href="/liq-list?cate=증류주 리큐르">증류주/리큐르</a>
				</div>
			</div>
			<div id="h-dropdown2" class="h-dropdown">
				<button id="h-dropbtn2" class="h-dropbtn">술BTI</button>
			</div>
			<div id="h-dropdown3" class="h-dropdown">
				<button id="h-dropbtn3" class="h-dropbtn">
					<a href="/cheers/list">건배의 광장</a>
				</button>
			</div>
			<div id="h-dropdown4" class="h-dropdown">
				<button id="h-dropbtn4" class="h-dropbtn">
					<a href="/about">About</a>
				</button>
			</div>
			<!-- ----------------------------------------------------------------------------------------------------- -->
		</div>
	</div>

	<div class="s-main-background">
		<div class="s-error-div">
			<i class="fas fa-exclamation-triangle"
				style="font-size: 100px; margin-bottom: 30px;"></i>
			<p style="margin-bottom: 50px;">잘못된 접근입니다.</p>
			<button class="s-mainBtn">
				<a href="/">메인으로 돌아가기</a>
			</button>
		</div>
	</div>
</body>
<%@include file="/WEB-INF/views/include/footer.jsp" %>
</html>