<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String email = (String) session.getAttribute("email");
String loginDisplay = "";
String logoutDisplay = "";

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
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<style>
@font-face {
	font-family: '전소민체';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/전소민체.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

button {
	cursor: pointer;
}

#h-company-name {
	padding:20px;
}

a {
	text-decoration: none;
	color: black;
}

.h-logobar {
	width: 1600px;
	height:90px;
	border-bottom:solid 2px #e1e1e1;
}

.h-logo-img {
	height: 60px;
	width: 145px;
	margin:15px 0px 0px 30px;
}

.h-logo {
	width: 900px;
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
	background-color: #f2eff9;
}

#h-dropdown:hover #h-dropdown-content {
	display: block;
}

#h-dropdown:hover .h-dropbtn {
	border-bottom: 3px solid purple;
}
</style>
</head>
<body>
	<div class="h-logobar">
        <div class="h-logo">
        <a href="#" id="h-company-name"><img class="h-logo-img" src='/resources/img/Logo_1-2.png'></a>

            <div id="h-dropdown" class="h-dropdown">
            <button id="h-dropbtn1" class="h-dropbtn">전통주</button>
            <div id="h-dropdown-content" class="h-dropdown-content">
                <a href="/all-liq">전체</a>
                <a href="/liq-list?kind=탁주">탁주</a>
                <a href="/liq-list?kind=약주 청주">약주/청주</a>
                <a href="/liq-list?kind=과실주">과실주</a>
                <a href="/liq-list?kind=증류주">증류주</a>
                <a href="/liq-list?kind=기타류">기타류</a>
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
            <a href='/login' style="display:<%=loginDisplay%>">로그인 ㅣ</a>
            <a href='/logout' style="display:<%=logoutDisplay%>" onclick="kakaoLogout()">로그아웃 ㅣ</a>
            <a href='/join' style="display:<%=loginDisplay%>">회원가입 ㅣ</a>
              <!-- 다울 추가 임시로 like 페이지로 연결 -->
            <a href='/mypage/like'>마이페이지 ㅣ</a>
            <a href='/help/faq'>고객센터</a>
        </div>
    </div>

</body>
</html>