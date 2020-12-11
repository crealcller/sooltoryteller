<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
    <%
	String email = (String) session.getAttribute("email");
	String loginDisplay = ""; 
	String logoutDisplay = ""; 
	
//세션에 로그인 정보가 담겼다면 로그인/회원가입 버튼 비활성화
if (email != null) {
	loginDisplay = "none";
} else {
	logoutDisplay =  "none";
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

a {
	text-decoration: none;
	color: black;
}

button {
	cursor: pointer;
}

#h-company-name {
	font-family: '전소민체';
	font-size: 40px;
	font-weight: bold;
}

.h-logobar {
	width: 100%;
	height: 60px;
	border-bottom: 1px solid;
}

.h-logo-img {
	height: 50px;
	width: 40px;
}

.h-logo {
	width: 55%;
	text-align: right;
	display: inline-block;
}

.h-usermenu {
	width: 45%;
	font-size: 13px;
	text-align: right;
	padding-right: 10px;
	display: inline-block;
}

.h-mainMenu {
	display: block;
}

.h-dropbtn {
	background-color: white;
	color: black;
	font-size: 20px;
	padding: 10px;
	border: none;
}

.h-dropdown {
	display: inline-block;
	margin-left: 15%;
}

.h-dropdown-content {
	display: none;
	position: absolute;
	background-color: white;
	min-width: 160px;
	z-index: 1;
}

.h-dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

#h-dropdown-content1 a:hover {
	background-color: #f2eff9;
}

#h-dropdown-content2 a:hover {
	background-color: #f2eff9;
}

#h-dropdown-content3 a:hover {
	background-color: #f2eff9;
}

#h-dropdown-content4 a:hover {
	background-color: #f2eff9;
}

#h-dropdown1:hover #h-dropdown-content1 {
	border-top: 3px solid purple;
	display: block;
}

#h-dropdown2:hover #h-dropdown-content2 {
	border-top: 3px solid purple;
	display: block;
}

#h-dropdown3:hover #h-dropdown-content3 {
	border-top: 3px solid purple;
	display: block;
}

#h-dropdown4:hover #h-dropdown-content4 {
	border-top: 3px solid purple;
	display: block;
}
</style>
</head>
<body>
    <div class="h-logobar">
        <div class="h-logo">
        <img class="h-logo-img" src='/resources/img/logo.png'>
        <a href="/" id="h-company-name">술토리텔러</a>
        </div><div class='h-usermenu'>
            <a href='/login' style="display:<%=loginDisplay%>">로그인 ㅣ</a>
            <a href='/logout' style="display:<%=logoutDisplay%>" onclick="kakaoLogout()">로그아웃 ㅣ</a>
            <a href='/join' style="display:<%=loginDisplay%>">회원가입 ㅣ</a>
           	<!-- 다울 추가 임시로 like 페이지로 연결 -->
            <a href='/mypage/like'>마이페이지 ㅣ</a>
            <a href='#'>고객센터</a>
        </div>
    </div>
    <div class="h-mainMenu">
        <div id="h-dropdown1" class="h-dropdown">
        <button id="h-dropbtn1" class="h-dropbtn">전통주</button>
        <div id="h-dropdown-content1" class="h-dropdown-content">
            <!-- 다울변경 -->
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
        <div id="h-dropdown-content2" class="h-dropdown-content">
            <a href="#">Link 1</a>
            <a href="#">Link 2</a>
            <a href="#">Link 3</a>
        </div>
    </div>
        <div id="h-dropdown3" class="h-dropdown">
        <button id="h-dropbtn3" class="h-dropbtn"><a href="/cheers/list">건배의 광장</a></button>
    </div>
        <div id="h-dropdown4" class="h-dropdown">
        <button id="h-dropbtn4" class="h-dropbtn">About</button>
        <div id="h-dropdown-content4" class="h-dropdown-content">
            <a href="#">Link 1</a>
            <a href="#">Link 2</a>
            <a href="#">Link 3</a>
        </div>
    </div>
</div>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
/* function kakaoLogout(){
Kakao.Auth.logout(function(){
	setTimeout(function(){
		Kakao.init();
		location.href='/logout'
	}, 1000);
	});
} */

</script>
</body>
</html>