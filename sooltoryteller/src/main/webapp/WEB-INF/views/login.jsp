<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="/WEB-INF/views/include/topmenu.jsp" %>
     <link rel="stylesheet" href="/resources/css/loginHead.css">
<%
     	
String loginCheck = (String)session.getAttribute("email");     
     if(loginCheck != null){
    	 out.println("<script>alert('잘못된 접근입니다.'); location.href='/';</script>");
     }
Cookie[] cookies = request.getCookies();
          String cookieVal ="";
            if(cookies !=null){
            	for(Cookie i : cookies){
                    if(i.getName().equals("email")){
                        cookieVal=i.getValue();
                    }
                }
            }
            
     response.setHeader("Cache-Control", "no-cache");
     response.setHeader("Cache-Control", "no-store");
     response.setDateHeader("Expires", 0);
     response.setHeader("Pragma", "no-cache");

            %>
<script>
let emailMsg ='${emailMsg}';
if(emailMsg != ""){
	alert(emailMsg);
}

</script>
<body>
<div class="s-main-background">
	<div class="s-main-column" style="height:750px; text-align: center;">
	
	  <div class="h-login-content">
	    <div class="h-content">
	    <h2 style="margin:50px 0 0 50px; width:300px; text-align: left;">로그인</h2>
	    <form action="/login" method="POST">
	    <p class="h-login-p">이메일 &nbsp<input type="text" id="email" name="email" value =<%=cookieVal !="" ? cookieVal : "" %>></p>
	    <p class="h-login-p">비밀번호 &nbsp<input type="password" id="pwd" name="pwd"></p>
	    <p  class="h-login-p" style="color:red;"><c:out value='${msg }'/></p>
	    <p style="text-align: center; margin-bottom: 10px"><input type="checkbox" name = "save"<%=cookieVal!=""?"checked" : ""%>>이메일 저장 ㅣ
	    <a style = "cursor: pointer;" id="h-findPwd-btn">비밀번호 찾기</a></p>
	    <p class="h-login-p" style="text-align: center;"><button type="submit" class="login-btn">로그인</button></p>
	    <p class="h-login-p" style="text-align: center;"><button type="button" class="login-btn" id="regbtn" onclick="location.href='/join'">회원가입</button></p>
	    <p class="h-login-p" style="text-align: center;"><a href='${kakaoUrl}'>
	    <img src="/resources/img/kakao_login_medium.png" class="snslogin"></a>
	    <a href="${naverUrl }"><img src="/resources/img/Log in with NAVER_Short_Green.PNG" class="snslogin"></a></p>
	    </form>
    
    </div>
  </div>
</div>
  </div>
    <!-- The Modal -->
<div id="h-myModal" class="h-modal">
  <form action="/findPwd" method="POST">
  <!-- Modal content -->
  <div class="h-modal-content">
    <div class="h-modal-top">
      <div class="h-modal-topleft">비밀번호 찾기
      </div><div class="h-modal-topright"><a class="h-close" style="cursor: pointer;">&times;</a></div>
    </div> <!-- modal top -->
    <div class="h-modal-bottom">
      <p style="margin-bottom: 20px;">이메일 &nbsp<input type ='email' name='email'></p>
      <p><button type="submit" class="h-btn" id="h-sendbtn">이메일 전송</button> </p>
    </div>
  </div>
  </form>
</div>
<script>
  let modal = document.getElementById("h-myModal");
  let findPwdBtn = document.getElementById("h-findPwd-btn");
  let close = document.getElementsByClassName("h-close")[0];
  //비밀번호 찾기 버튼 클릭시 모달창 뜸
  findPwdBtn.onclick = function() {
    modal.style.display = "block";
  }
  //닫기 버튼
    close.onclick = function() {
    modal.style.display = "none";
  }
  window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }
  </script>

</body>
<%@include file="/WEB-INF/views/include/footer.jsp" %>
</html>