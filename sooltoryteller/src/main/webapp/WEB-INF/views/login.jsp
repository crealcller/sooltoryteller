<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@include file="/WEB-INF/views/include/topmenu.jsp" %>
     <%@include file="/resources/css/loginHead.jsp" %>
     
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

<body>

 <div class="h-body">
<div class="h-left"><img src="/resources/img/barsign.jpg" id="h-leftimg">
</div><div class="h-right">
  
  <div class="h-login-content">
    <div class="h-content">
    <h2 style="margin:0 0 15px 50px;">로그인</h2>
    <form action="/login" method="POST">
    <p class="h-login-p" style="margin-left: 50px;">이메일 &nbsp<input type="text" id="email" name="email" value =<%=cookieVal !="" ? cookieVal : "" %>></p>
    <p class="h-login-p" style="margin-left: 35px;">비밀번호 &nbsp<input type="password" id="pwd" name="pwd"></p>
    <p  class="h-login-p"style="color:red">${msg }</p>
    <p style="text-align: center;"><input type="checkbox" name = "save"<%=cookieVal!=""?"checked" : ""%>>이메일 저장 ㅣ
    <a href="#">비밀번호 찾기</a></p>
    <p class="h-login-p" style="text-align: center;"><input type="submit" class="login-btn" value="로그인">
    <input type="button" class="login-btn" id="regbtn" value="회원가입"></p>
    <p class="h-login-p" style="text-align: center;"><a href="#" ><img src="/resources/img/kakao_login.png" class="snslogin"></a></p>
    <p class="h-login-p" style="text-align: center;"><a href="#" ><img src="/resources/img/naver_login.PNG" class="snslogin"></a></p>

    </form>
    </div>
  </div>

</div>
  </div>
</body>
</html>