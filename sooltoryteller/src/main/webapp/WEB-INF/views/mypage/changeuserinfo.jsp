<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/topmenu.jsp" %>
 <%@include file="/resources/css/changeUserInfoHead.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
    //로그인이 안된 상태면 메인페이지로 넘어가게
	let msg = '${msg}';
		if(msg != ""){
			alert(msg);
			location.href = '/';
		}
		
		let success = '${success}';
		if(success != ""){
			alert(success);
		}
</script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
<h1>회원정보 수정/ 회원탈퇴</h1>
<div class="modify-content">
<form action ="/mypage/changeuserinfo" method="post" onsubmit="return validate()">
<p>이메일 : <input type = "text" name="email" id="email"value="<c:out value = "${member.email }"/>" readonly="readonly">
<p>닉네임 : <input type = "text" name="name" id="name" value="<c:out value = "${member.name }"/>" >
<p>핸드폰번호 : <input type = "text" name="telno" id="telno"value="<c:out value = "${member.telno }"/>" >
<p>프로필사진 : <input type = "text" name="img" id="img"value="<c:out value = "${member.img }"/>" ><button type="button">첨부</button>

<div><button type="submit">회원수정</button>
	<button type="button" id="withdrawal" >회원탈퇴</button></div>
	
	</form>

	<div id="h-myModal" class="h-modal">
    <div class="h-modal-content">
    <span class="h-close">&times;</span>
	<p style="text-align: center;">정말 탈퇴하시겠습니까??</p>
	<p style="text-align: center;"><button type="button" class="h-btn" id="h-YESbtn">YES...</button> <button type="button" class="h-btn" id="h-NObtn">NO!!!!</button></p>
   </div>

</div>
</div>
<script>
//회원 탈퇴 확인 모달창
let modal = document.getElementById("h-myModal");
let btn = document.getElementById("withdrawal");
let span = document.getElementsByClassName("h-close")[0];
let NObtn = document.getElementById("h-NObtn");
let YESbtn = document.getElementById("h-YESbtn");


//모달창 오픈
btn.onclick = function() {
  modal.style.display = "block";
}
//모달창 닫기 버튼
span.onclick = function() {
  modal.style.display = "none";
}
//NO버튼
NObtn.onclick = function() {
  modal.style.display = "none";
}
//YES버튼
YESbtn.onclick = function(){
	location.href="/withdrawal";
}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>

</body>
</html>