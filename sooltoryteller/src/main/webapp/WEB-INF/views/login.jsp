<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@include file="/WEB-INF/views/include/topmenu.jsp" %>
     
     <%
           Cookie[] cookies = request.getCookies(); 
           String cookieVal ="";
            
            if(cookies !=null){
            	for(Cookie i : cookies){
                    if(i.getName().equals("email")){
                        cookieVal=i.getValue();
                    }
                }
            }
            %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>

<style type="text/css">
p{
  padding: 8.5px;
}
.h-body{
  height: 500px;
  width: 1277px;
  background-color: rgb(245, 245, 245);
  
}
.h-left{
  height: 450px;
  width: 300px;
  display: inline-block;
}
#h-leftimg{
  height: 480px;
  width: 300px;
  display: inline-block;
}
.h-right{
height: 450px;
width: 950px;
display: inline-block;
}
.h-login-content{
height: 450px;
width: 450px;
border: 3px solid purple;
border-radius: 25%;
display: inline-block;
margin-left: 170px;
overflow: hidden;
}

.h-content{
  margin: 20px;
}
.login-btn{
  height: 40px;
  width: 160px;
  border: none;
  margin: 10px;
  border-radius: 5%;
  background-color: rgb(181, 135, 189);
}
.snslogin{
  height: 40px;
  width: 350px;
}
  </style>
</head>
<body>

 <div class="h-body">
<div class="h-left"><img src="/resources/img/bar.JPG" id="h-leftimg">
</div><div class="h-right">
  
  <div class="h-login-content">
    <div class="h-content">
    <h2 style="margin:0 0 15px 50px;">로그인</h2>
    <form action="/login" method="POST">
    <p style="margin-left: 50px;">이메일 &nbsp<input type="text" id="email" name="email" value =<%=cookieVal !="" ? cookieVal : "" %>></p>
    <p style="margin-left: 35px;">비밀번호 &nbsp<input type="password" id="pwd" name="pwd"></p>
    <p style="color:red">${msg }</p>
    <p style="text-align: center;"><input type="checkbox" name = "save"<%=cookieVal!=""?"checked" : ""%>>이메일 저장 ㅣ
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