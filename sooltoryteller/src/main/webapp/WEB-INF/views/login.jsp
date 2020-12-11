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
<script>
let emailMsg ='${emailMsg}';
if(emailMsg != ""){
	alert(emailMsg);
}
</script>
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
    <a style = "cursor: pointer;" id="h-findPwd-btn">비밀번호 찾기</a></p>
    <p class="h-login-p" style="text-align: center;"><button type="submit" class="login-btn">로그인</button>
    <button type="button" class="login-btn" id="regbtn" onclick="location.href='/join'">회원가입</button></p>
    <p class="h-login-p" style="text-align: center;"><a href="https://kauth.kakao.com/oauth/authorize?client_id=c2b9a30db887beef318f21b381c92c26&redirect_uri=http://localhost:8181/Koauth&response_type=code">
    <img src="/resources/img/kakao_login.png" class="snslogin"></a></p>
    <p class="h-login-p" style="text-align: center;"><a href="#" ><img src="/resources/img/naver_login.PNG" class="snslogin"></a></p>
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
      </div><div class="h-modal-topright"><a class="h-close">&times;</a></div>
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
</html>