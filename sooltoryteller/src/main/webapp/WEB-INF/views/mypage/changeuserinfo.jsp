<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/topmenu.jsp" %>
 <%@include file="/resources/css/changeUserInfoHead.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
    //로그인이 안된 상태면 로그인페이지로 넘어가게
	let msg = '${msg}';
		if(msg != ""){
			alert(msg);
			location.href = '/login';
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
<div class="h-back">
        <div class="h-imgarea">
        <img id="h-backImg" src="/resources/img/zzan.JPG">
        
        </div><div class="h-modify-content">
        <h3 style="margin-bottom: 15px;">회원정보 수정/ 회원탈퇴</h3>
        <form action ="/mypage/changeuserinfo" method="post" onsubmit="return validate()">
        <div class="h-photo"><img src=${member.img }></div>
        <p><input type="file" class="h-addfile"></p>
	    <p>이메일 : &nbsp<input type = "text" name="email" id="email" value="<c:out value='${member.email }'/>" readonly="readonly"></p>
	    <p>닉네임 : &nbsp<input type = "text" name="name" id="name" value="<c:out value='${member.name }'/> "></p>
	    <p>핸드폰번호 : <input type = "text" name="telno" id="telno" value="<c:out value='${member.telno }'/>"></p>
	    
	    <div class="h-fav-drink">
      <h5 style="margin:5px; text-align: left;">선호하는 주종(2가지 선택)</h5>
  	   <p><input type="checkbox" class="h-drink">소주<input type="checkbox" class="h-drink">맥주<input type="checkbox" class="h-drink">막걸리<input type="checkbox" class="h-drink">칵테일 </p>
   	   <p><input type="checkbox" class="h-drink">보드카<input type="checkbox" class="h-drink">양주<input type="checkbox" class="h-drink">와인<input type="checkbox" class="h-drink">기타 </p>
	   <p><button type="submit" class="h-modibtn">회원수정</button>	<button type="button" id="withdrawal" class="h-modibtn">회원탈퇴</button></p>
    </div>
	</form> 
    </div>
    </div>

	<div id="h-myModal" class="h-modal">
    <div class="h-modal-content">
    <span class="h-close">&times;</span>
	<p style="text-align: center;">정말 탈퇴하시겠습니까??</p>
	<p style="text-align: center;"><button type="button" class="h-btn" id="h-YESbtn">YES...</button> <button type="button" class="h-btn" id="h-NObtn">NO!!!!</button></p>
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