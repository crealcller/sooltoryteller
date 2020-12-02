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
	logoutDisplay =  "none";
}
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
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/전소민체.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
    * {
          margin: 0;
           padding: 0;
           box-sizing: border-box;
           }
        a{
            text-decoration: none;
            color: black;
        }

        #company-name{
            font-family: '전소민체';
            font-size: 40px;
            font-weight: bold;
        }
        
        .logobar{
            width: 100%;
            height: 60px;
            border-bottom: 1px solid;
        }
        img{
            height: 50px;
            width: 40px;
        }
        .logo{
            width: 55%;
            text-align: right;
            display: inline-block;
        }
        .usermenu{
            width: 45%;
            font-size: 13px;
            text-align: right;
            padding-right:10px;
            display: inline-block;
        }
        .mainMenu{
            display: block;
        }

        .dropbtn {
             background-color: white;
             color: black;
             font-size: 20px;
             padding: 10px;
             border: none;
        }
        .dropdown{
            display: inline-block;
            margin-left: 15%;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: white;
            min-width: 160px;
            z-index: 1;
        }

        .dropdown-content a{
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

#dropdown-content1 a:hover {background-color: #f2eff9;}
#dropdown-content2 a:hover {background-color: #f2eff9;}
#dropdown-content3 a:hover {background-color: #f2eff9;}
#dropdown-content4 a:hover {background-color: #f2eff9;}

#dropdown1:hover #dropdown-content1 {border-top: 3px solid purple; display: block;}
#dropdown2:hover #dropdown-content2 {border-top: 3px solid purple; display: block;}
#dropdown3:hover #dropdown-content3 {border-top: 3px solid purple; display: block;}
#dropdown4:hover #dropdown-content4 {border-top: 3px solid purple; display: block;}



    </style>
</head>
<body>
    <div class="logobar">
        <div class="logo">
        <img src='/resources/img/logo.png'>
        <a href="/" id="company-name">술토리텔러</a>
        </div><div class='usermenu'>
            <a href='/login' style="display:<%=loginDisplay%>">로그인 ㅣ</a>
            <a href='/logout' style="display:<%=logoutDisplay%>">로그아웃 ㅣ</a>
            <a href='/join' style="display:<%=loginDisplay%>">회원가입 ㅣ</a>
            <a href='#'>마이페이지 ㅣ</a>
            <a href='#'>고객센터</a>
        </div>

    </div>

    <div class="mainMenu">
        <!-- 다울추가 -->
        <div id="dropdown1" class="dropdown">
        <button id="dropbtn1" class="dropbtn">전통주</button>
        <div id="dropdown-content1" class="dropdown-content">
            <a href="/all-liq">전체</a>
            <a href="/takju">탁주</a>
            <a href="/yakju-cheongju">약주/청주</a>
            <a href="/fruit-wine">과실주</a>
            <a href="/distilled-spirits">증류주</a>
            <a href="/others">기타류</a>
         
        </div>
    </div>
        <div id="dropdown2" class="dropdown">
        <button id="dropbtn2" class="dropbtn">술BTI</button>
        <div id="dropdown-content2" class="dropdown-content">
            <a href="#">Link 1</a>
            <a href="#">Link 2</a>
            <a href="#">Link 3</a>
        </div>
    </div>
        <div id="dropdown3" class="dropdown">
        <button id="dropbtn3" class="dropbtn">건배의 광장</button>
        <div id="dropdown-content3" class="dropdown-content">
            <a href="#">Link 1</a>
            <a href="#">Link 2</a>
            <a href="#">Link 3</a>
        </div>
    </div>
        <div id="dropdown4" class="dropdown">
        <button id="dropbtn4" class="dropbtn">About</button>
        <div id="dropdown-content4" class="dropdown-content">
            <a href="#">Link 1</a>
            <a href="#">Link 2</a>
            <a href="#">Link 3</a>
        </div>
    </div>
    </div>
</body>
</html>