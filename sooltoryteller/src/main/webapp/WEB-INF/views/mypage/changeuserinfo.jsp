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
	    <p style='margin:10px;'>이메일 : &nbsp<input type = "text" name="email" id="email" value="<c:out value='${member.email }'/>" readonly="readonly"></p>
	    <p style='margin:10px;'>닉네임 : &nbsp<input type = "text" name="name" id="name" value="<c:out value='${member.name }'/>">
	    <button type="button" id="h-checkName" class="n-overlapCheck">중복확인</button></p>
	    <p style='margin:10px;'>핸드폰번호 : <input type = "text" name="telno" id="telno" value="<c:out value='${member.telno }'/>"></p>
	    
	   <p><button type="submit" class="h-modibtn" >회원수정</button>	<button type="button" id="withdrawal" class="h-modibtn">회원탈퇴</button></p>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
//정규식
	const jName = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,8}$/; // 닉네임은 문자 제한없이 2~8자리
	const jTelno = /^01([0|1|6|7|8|9]?)([0-9]{3,4})([0-9]{4})$/; //전화번호 정규식 '-'빼고 숫자만
	const blank = /(\s*)/g; //모든공백제거(앞뒤중간)

	
	//닉네임 중복체크
	  $(function(){
			$(".n-overlapCheck").click(function(){
				
				let name = $("#name").val();
				
				//입력했는지 검사
				if(name == ""){
					alert("닉네임을 입력하여 주세요");
				}
				
				//정규식으로 형식검사 +공백체크
				if(!jName.test(name) || blank.test(name)){
					alert("닉네임 형식에 맞지 않습니다.");
				}
				
				$.ajax({
					type : 'post',
					data : {'name' : name},
					url : "/nOverlapCheck",
					dataType: "json",
					success : function(data){
						if(name != ""){
								if(data>0){
									alert("중복된 닉네임이 존재합니다.");
							
								}else{
									if(jName.test(name) && !blank.test(name)){
										alert("사용 가능한 닉네임입니다.");
										}
							    }
						  } 
					}	
		}) 
		})
	    }) //닉네임 중복체크 end	
	
	  //회원수정 버튼 클릭시 유효성 검사 한 번 더!!
	    function validate() {   	   
		//1. 닉네임 유효성 검사
	    	if($("#name").val() == ""){
	    		alert('닉네임을 입력하여 주세요');
	    		$("#name").focus();
	    		return false;
	    	}
	    	
	    	if(!jName.test($("#name").val()) || blank.test($("#name").val())){
	    		alert('닉네임은 문자 제한없이 2~8자리를 입력해주세요');
	    		$("#name").val("");
	    		$("#name").focus();
	    		return false;
	    	}
	    	
	    	//2. 전화번호 유효성검사
	    	if($("#telno").val() == ""){
	    		alert('핸드폰 번호를 입력하여 주세요');
	    		$("#telno").focus();
	    		return false;
	    	}
	    	
	    	if(!jTelno.test($("#telno").val())){
	    		alert('핸드폰번호 형식에 맞지 않습니다');
	    		$("#telno").val("");
	    		$("#telno").focus();
	    		return false;
	    	}
	}
	
	
		
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