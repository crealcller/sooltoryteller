<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="shortcut icon" href="#">

<%
String email = (String) session.getAttribute("email");
String authority = (String) session.getAttribute("authority");
String loginDisplay = "";
String logoutDisplay = "";
String authorityDisplay = "";

//세션에 로그인 정보가 담겼다면 로그인/회원가입 버튼 비활성화
if (email != null) {
   loginDisplay = "none";
} else {
   logoutDisplay = "none";
}

//로그인한 회원의 권한이 관리자가 아니라면 관리자 페이지 비활성화 및 접근 막기
if(authority == null || !authority.equalsIgnoreCase("admin")){
	authorityDisplay = "none";
	out.println("<script>alert('접근 권한이 없는 사용자 입니다.'); location.href='/';</script>");
}

//로그아웃시 캐시삭제
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma", "no-cache");
%>

<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Nanum Gothic', sans-serif;
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
	height: 70px;
	position: sticky;
	top: 0px;
	background-color: white;
	box-shadow: 0px -2px 8px 5px #e1e1e1;
}

.h-logo-img {
	height: 60px;
	width: 145px;
	margin: 5px 0px 0px 30px;
}

.h-logo {
	width: 800px;
	text-align: left;
	display: inline-block;
	margin-bottom: 10px;
}

.h-usermenu {
	width: 700px;
	font-size: 13px;
	text-align: right;
	display: inline-block;
	float: right;
	padding: 40px 10px 0px 0px;
}

.h-dropbtn {
	background-color: Transparent;
	width: 120px;
	color: black;
	font-size: 15px;
	font-weight: bold;
	border: none;
	padding-bottom: 15px;
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

.h-imgarea {
	width: 1520px;
	height: 550px;
}

.h-centerImg {
	width: 1520px;
	height: 550px;
}

.h-body {
	width: 1520px;
	padding: 30px 0;
	background-color: rgb(225, 233, 255);
	display: inline-block;
}

.h-column {
	width: 1300px;
	margin: 0 auto;
	padding: 30px 0 10px 0;
	background-color: white;
}

.h-sidebar {
	margin: 0 0 0 20px;
	padding: 0;
	width: 200px;
	height: 500px;
	text-align: center;
	overflow: hidden;
	display: inline-block;
}

.h-sidebar a {
	display: block;
	color: black;
	padding: 16px;
	font-weight: bold;
	text-decoration: none;
}

.h-sidebar a:hover {
	background-color: rgb(80, 98, 140);
	color: white;
}

div.h-content {
	width: 1000px;
	height: 500px;
	margin-left: 25px;
	overflow: hidden;
	display: inline-block;
}

.d-logo-left-con {
	float: left;
}

.d-admin-con {
	width: 900px;
	height: 420px;
	margin: 50px;
	border: solid 10px #e1e9ff;
}

.d-admin-half-con {
	float: left;
	width: 453px;
	height: 385px;
	padding: 20px;
}

.d-admin-half-con p {
	padding: 5px 0px 5px 0px;
}

.d-admin-half-con textarea {
	width: 400px;
}

.d-admin-half-con span {
	width: 300px;
}

textarea {
	resize: none;
}
/* The Modal (background) */
.d-revw-modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
/* Modal Content */
.d-revw-modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 25px;
	width: 500px;
	height: 400px;
	border-radius: 10px;
}
/* The Close Button */
.d-revw-modal-close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.d-revw-modal-close:hover, .d-revw-modal-close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.d-co-list {
	margin: 20px auto 20px auto;
	width: 445px;
	height: 400px;
	overflow: auto;
	border: solid #e1e1e1;
}

.d-revw-modal-content h2 {
	background-color: #e1e9ff;
	padding: 20px;
}

.d-revw-modal-content button {
	outline: 0;
	border: 0;
	padding: 10px;
	background-color: #e1e9ff;
	font-weight: bold;
	display: inline;
	margin-left: -47px;
}

.d-modal-input {
	text-align: center;
	padding: 20px;
}

.d-modal-input input {
	width: 250px;
	line-height: 35px;
	display: inline;
	border: #e1e9ff solid;
}

.select-img {
	margin-bottom: 10px;
	width: 80px;
	height: 100px;
	background: url("/resources/img/bbst-bg.png");
	background-size: 80px 100px;
	display: inline-block;
	float: left;
}

.d-file-area {
	float: left;
	display: inline-block;
	width: 200px;
}

.inputArea {
	width: 300px;
	height: 120px;
}

.d-file-area {
	padding: 20px;
}

.d-file-area input {
	width: 200px;
}

.d-inputs input {
	width: 280px;
	line-height: 25px;
}

.d-co-search-btn {
	margin-left: -36px;
	border: none;
	padding: 5px;
	background-color: #e1e9ff;
}

.d-reg-btn {
	float: right;
	padding: 10px 10px 0px 0px;
	width: 70px;
	height: 300px;
}

.d-reg-btn button {
	padding: 10px;
	border: none;
	border-radius: 5px;
	background-color: #e1e9ff;
	margin: 3px;
}
</style>
  <body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
         <div class="h-logobar">
        <div class="h-logo">
         <div class="d-logo-left-con">
        <a href="/" id="h-company-name"><img class="h-logo-img" src='/resources/img/Logo_1-2.png'></a></div>
            <div class="d-logo-left-con" style="padding-top:35px;">
            <div id="h-dropdown" class="h-dropdown">
            <button id="h-dropbtn1" class="h-dropbtn">전통주</button>
            <div id="h-dropdown-content" class="h-dropdown-content">
                <a href="/liq-list">전체</a>
                <a href="/liq-list?cate=탁주">탁주</a>
                <a href="/liq-list?cate=약주 청주">약주/청주</a>
                <a href="/liq-list?cate=과실주">과실주</a>
                <a href="/liq-list?cate=증류주 리큐르">증류주</a>
            </div>
            
            </div>
            <div id="h-dropdown2" class="h-dropdown">
            <button id="h-dropbtn2" class="h-dropbtn">술BTI</button>
            </div>
            <div id="h-dropdown3" class="h-dropdown">
            <button id="h-dropbtn3" class="h-dropbtn"><a href="/cheers/list">건배의 광장</a></button>
            </div>
            <div id="h-dropdown4" class="h-dropdown">
            <button id="h-dropbtn4" class="h-dropbtn">About</button>
            </div>
            </div>
        <!-- ----------------------------------------------------------------------------------------------------- -->
        </div><div class='h-usermenu'>
        <!-- 현수 추가 관리자 페이지로 이동 -->
            <a href='/admin/' style="display:<%=authorityDisplay%>">관리자페이지 ㅣ</a>
            <a href='/login' style="display:<%=loginDisplay%>">로그인 ㅣ</a>
            <a href='/logout' style="display:<%=logoutDisplay%>" onclick="kakaoLogout()">로그아웃 ㅣ</a>
            <a href='/join' style="display:<%=loginDisplay%>">회원가입 ㅣ</a>
              <!-- 다울 추가 임시로 like 페이지로 연결 -->
            <a href='/mypage/like'>마이페이지 ㅣ</a>
            <a href='/help/faq'>고객센터 </a>
        </div>
    </div>
        
        <div class="h-imgarea">
            <img src='/resources/img/garrison.jpg' class="h-centerImg">
        </div>
        
        <div class="h-body">
        	<div class="h-column">
	            <div class="h-sidebar">
	              <a href="/admin/" id='h-admin-home'>Home</a>
	              <a href="/admin/memberlist" id='h-admin-list'>회원관리</a>
	              <!-- 다울 추가 12/12 --> 
	              <a href="/admin/liq-co-list" id='d-liq-co-list'>양조장관리</a>
	              <a href="/admin/liq-co-register" id='d-liq-co-register'>양조장 등록</a>
	              <a href="/admin/liq-list" id='d-liq-list'>전통주 관리</a>
	              <a href="/admin/liq-register" id='d-liq-register'>전통주 등록</a>
	              <a href="/admin/inquirylist" id='h-admin-inqlist'>1:1문의</a>
	              <a href="/admin/faqlist" id='h-admin-faq'>FAQ</a>
	            </div><div class="h-content">
 