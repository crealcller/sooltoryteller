<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@include file="/WEB-INF/views/include/topmenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>

<style type="text/css">
.h-body{
  height: 450px;
  width: 1260px;
  border: 1px solid;
  
}
.h-left{
  height: 450px;
  width: 300px;
  display: inline-block;
}
#h-leftimg{
  height: 450px;
  width: 300px;
  display: inline-block;
}
.h-right{
height: 450px;
width: 950px;
display: inline-block;
}
.h-login-content{
height: 400px;
width: 450px;
border: 1px solid purple;
border-radius: 25%;
display: inline-block;
margin: 0px 0px 23px 130px;
overflow: hidden;
}

.h-content{
  margin: 20px;
}
.login-btn{
  height: 38px;
  width: 190px;
  border: none;
  background-color: rgb(181, 135, 189);
}
.snslogin{
  height: 40px;
  width: 380px;
}
  </style>
</head>
<body>

 <div class="h-body">
<div class="h-left"><img src="/resources/img/bar.JPG" id="h-leftimg">
</div><div class="h-right">
  
  <div class="h-login-content">
    <div class="h-content">
    <h2 style="margin-left:50px;">로그인</h2>
    <form action="#" method="POST">
    <p style="margin-left: 50px;">이메일<input type="text" id="memberEmail" name="memberEmail"></p>
    <p style="margin-left: 35px;">비밀번호<input type="password" id="memberPwd" name="memberPwd"></p>
    <p style="text-align: center;"><input type="checkbox">이메일 저장 ㅣ
    <a href="#">비밀번호 찾기</a></p>
    <p style="text-align: center;"><input type="submit" class="login-btn" value="로그인">
    <input type="button" class="login-btn" id="regbtn" value="회원가입"></p>
    <p style="text-align: center;"><a href="#" ><img src="/resources/img/kakao_login.png" class="snslogin"></a></p>
    <p style="text-align: center;"><a href="#" ><img src="/resources/img/naver_login.PNG" class="snslogin"></a></p>

    </form>
    </div>
  </div>

</div>
  </div>
</body>
</html>