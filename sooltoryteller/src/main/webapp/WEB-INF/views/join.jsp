<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@include file="/WEB-INF/views/include/topmenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<style type="text/css">
p{
  margin: 10px;
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
.h-join-content{
height: 450px;
width: 450px;
border: 3px solid rgb(181, 135, 189);
border-radius: 25%;
display: inline-block;
margin-left: 170px;
overflow: hidden;
}

.h-content{
  margin: 20px;
}
.join-btn{
  height: 30px;
  width: 70px;
  border: none;
  border-radius: 5%;
  margin: 10px;
  font-weight: bold;
  background-color: rgb(181, 135, 189);
}
.h-fav-drink{
    margin-top: 25px;
    border-top: 1.5px solid rgb(181, 135, 189);
}
.drink{
    margin-left: 35px;
}
#checkId{
  height: 25px;
  width: 60px;
  font-size: 5px;
  border: none;
  border-radius: 5%;
  font-weight: bold;
  margin-left: 5px;
  background-color: rgb(181, 135, 189);
}
  </style>
</head>
<body>

 <div class="h-body">
<div class="h-left"><img src="/resources/img/bar.JPG" id="h-leftimg">
</div><div class="h-right">
  
  <div class="h-join-content">
    <div class="h-content">
    <h2 style="margin-left:50px;">회원가입</h2>
    <h4 style="margin-left:50px;">기본정보</h4>
    <form action="/join" method="POST">
    <p style="margin-left:50px;">이메일 &nbsp<input type="email" id="memberEmail" name="memberEmail"><button id="checkId">중복확인</button></p>
    <p style="margin-left:50px;">닉네임 &nbsp<input type="text" id="memberName" name="memberName"></p>
    <p style="margin-left:35px;">비밀번호 &nbsp<input type="password" id="memberPwd" name="memberPwd"></p>
    <p>비밀번호 확인 &nbsp<input type="text" id="rePwd"></p>
    <p style="margin-left:25px;">핸드폰번호 &nbsp<input type="text" id="memberTelno" placeholder="01000000000"></p>
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