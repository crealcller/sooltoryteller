
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<html>
<head>
<title>Home</title>
<link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
<div class="d-main-con">
<div class="d-main-img-con">
    <div class="h-logobar">
        <div class="h-logo">
       <a href="/" id="h-company-name"><img class="h-logo-img" src='/resources/img/Logo_1-1.png'>
        </a>

            <div id="h-dropdown" class="h-dropdown">
            <button id="h-dropbtn1" class="h-dropbtn" style="margin-left:10px;">전통주</button>
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

     </div>

    </div>
        
        
   
</body>
</html>