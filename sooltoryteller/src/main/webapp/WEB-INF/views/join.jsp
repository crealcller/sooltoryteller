<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
 <%@include file="/WEB-INF/views/include/topmenu.jsp" %>
 <%@include file="/resources/css/joinHead.jsp" %>

<body>

 <div class="h-body">
<div class="h-left"><img src="/resources/img/bar.JPG" id="h-leftimg">
</div><div class="h-right">
  
  <div class="h-join-content">
    <div class="h-content">
    <h2 style="margin-left:50px;">회원가입</h2>
    <h4 style="margin-left:50px;">기본정보</h4>
    <form action="/join" method="POST">
    <p style="margin-left:50px;">이메일 &nbsp<input type="email" id="email" name="email"><button id="checkId">중복확인</button></p>
    <p style="margin-left:50px;">닉네임 &nbsp<input type="text" id="name" name="name"></p>
    <p style="margin-left:35px;">비밀번호 &nbsp<input type="password" id="pwd" name="pwd"></p>
    <p>비밀번호 확인 &nbsp<input type="text" id="rePwd"></p>
    <p style="margin-left:25px;">핸드폰번호 &nbsp<input type="text" id="telno" placeholder="01000000000"></p>
    <div class="h-fav-drink">
      <h5 style="margin:5px">선호하는 주종(2가지 선택)</h5>
    <p><input type="checkbox" class="drink">소주<input type="checkbox" class="drink">맥주<input type="checkbox" class="drink">막걸리<input type="checkbox" class="drink">칵테일 </p>
    <p><input type="checkbox" class="drink">보드카<input type="checkbox" class="drink">양주<input type="checkbox" class="drink">와인<input type="checkbox" class="drink">기타 </p>
    <p style="text-align: center;"><input type="submit" class="join-btn" value="회원가입">
    <input type="button" class="join-btn" value="취소"></p>
    </div>
    </form>
    </div>
  </div>

</div>
  </div>
</body>
</html>