<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma", "no-cache");

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
//로그아웃시 캐시삭제
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma", "no-cache");

//로그인한 회원의 권한이 관리자가 아니라면 관리자 페이지 비활성화
if(authority == null || !authority.equalsIgnoreCase("admin")){
	authorityDisplay = "none";
}
%>
<!DOCTYPE html>
<html>
<head>

<!-- jquery script src -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
<!-- fontawesome -->
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!-- ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
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
   padding:20px;
}
a {
   text-decoration: none;
   color: black;
}
.h-logobar {
   width: 1520px;
   height:90px;
   border-bottom:solid 2px #E1E1E1;
}
.h-logo-img {
   height: 60px;
   width: 145px;
   margin:15px 0px 0px 30px;
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
	background-color: rgb(250 245 255);
}
.s-main-column {
	width: 1000px;
	background-color: white;
	margin: 0 auto;
}
</style>
</head>
<body>
   <div class="h-logobar">
        <div class="h-logo">
        <a href="/" id="h-company-name"><img class="h-logo-img" src='/resources/img/Logo_1-2.png'></a>
            <div id="h-dropdown" class="h-dropdown">
            <button id="h-dropbtn1" class="h-dropbtn">전통주</button>
            <div id="h-dropdown-content" class="h-dropdown-content">
                <a href="/all-liq">전체</a>
                <a href="/liq-list?cate=탁주">탁주</a>
                <a href="/liq-list?cate=약주 청주">약주/청주</a>
                <a href="/liq-list?cate=과실주">과실주</a>
                <a href="/liq-list?cate=증류주">증류주</a>
                <a href="/liq-list?cate=기타류">기타류</a>
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
        <!-- ----------------------------------------------------------------------------------------------------- -->
        </div><div class='h-usermenu'>
         <!-- 현수 추가 관리자 페이지로 이동 -->
            <a href='/admin/memberlist' style="display:<%=authorityDisplay%>">관리자페이지 ㅣ</a>
            <a href='/login' style="display:<%=loginDisplay%>">로그인 ㅣ</a>
            <a href='/logout' style="display:<%=logoutDisplay%>" onclick="kakaoLogout()">로그아웃 ㅣ</a>
            <a href='/join' style="display:<%=loginDisplay%>">회원가입 ㅣ</a>
              <!-- 다울 추가 임시로 like 페이지로 연결 -->
            <a href='/mypage/like'>마이페이지 ㅣ</a>
            <a href='/help/faq'>고객센터 </a>
        </div>
    </div>
