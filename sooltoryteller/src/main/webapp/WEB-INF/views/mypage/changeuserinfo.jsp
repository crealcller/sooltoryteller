<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/topmenu.jsp" %>
<link rel="stylesheet" href="/resources/css/changeUserInfoHead.css">
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
		
	let errorMsg = '${errorMsg}';
	if(errorMsg != ""){
	    alert(errorMsg);
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
        <h3 style="margin-bottom: 5px;">회원정보 수정/ 회원탈퇴</h3>
        <p style="font-size:12px; color:red;">선호하는 주종 외에는 수정 버튼을 눌러야 반영이 됩니다.</p>
        <form action ="/mypage/changeuserinfo" method="post">
        <div class="h-photo"><img src="${member.img }" class="h-profile-photo"></div>
        <p style="margin-top:10px;"><input type="file" class="h-addfile"></p>
	    <p style="margin:10px 0 10px 0; padding-right:45px;">이메일 : &nbsp<input type = "text" name="email" id="email" value="<c:out value='${member.email }'/>" readonly="readonly"></p>
	    <p style="margin-bottom:10px;">닉네임 : &nbsp<input type = "text" name="name" id="name" value="<c:out value='${member.name }'/>" readonly="readonly">
	    <button type="button" class="h-modibtn" id="modi-name-btn">변경</button></p>
	    <p style="margin-bottom:10px;">핸드폰 : &nbsp<input type = "text" name="telno" id="telno" value="<c:out value='${member.telno }'/>" readonly="readonly">
	    <button type="button" class="h-modibtn" id="modi-telno-btn">변경</button></p>
	    <span id="h-favalc">선호하는 주종 : 
	    <c:forEach items="${favList}" var="alc">
	    	<c:out value="${alc}"/>
	    </c:forEach></span><button style="margin-left:41px;" type="button" class="h-modibtn" id="modi-favalc-btn">수정</button>
	   <p><button type="submit" id="modify" class="h-withdrawal-btn">수정</button><button type="button" id="withdrawal" class="h-withdrawal-btn">회원탈퇴</button></p>
	</form> 
    </div>
    </div>
	<!-- 회원 탈퇴 모달창 -->
	<div id="h-withdrawal-Modal" class="h-modal">
    <div class="h-modal-content">
    <span class="h-close">&times;</span>
	<p style="text-align: center;">정말 탈퇴하시겠습니까??</p>
	<p style="text-align: center;"><button type="button" class="h-btn" id="h-YESbtn">YES...</button> <button type="button" class="h-btn" id="h-NObtn">NO!!!!</button></p>
   </div>
   </div>
   
   <!-- 닉네임 변경 모달창 -->
   <div id="h-name-Modal" class="h-modal">
    <div class="h-modal-content">
    <span class="h-close">&times;</span>
	<p>	변경할 닉네임 <input type="text" id="modi-name"><button type="button" class="h-overlap-btn">중복확인</button></p>
	<p style="text-align: center;"><button type="button" id="h-name-ok">확인</button></p>
   </div>
   </div>
   
   <!-- 핸드폰 번호 변경 모달창 -->
   <div id="h-telno-Modal" class="h-modal">
    <div class="h-modal-content">
    <span class="h-close">&times;</span>
	<p>	변경할 핸드폰 번호<input type="text" id="modi-telno"></p>
	<p style="text-align: center;"><button type="button" id="h-telno-ok">확인</button></p>
   </div>
   </div>
   
   <!-- 선호하는 주종 변경 모달창 -->
   <div id="h-favalc-Modal" class="h-modal">
    <div class="h-modal-content">
    <span class="h-close">&times;</span>
	<div class="h-fav-drink">
      <h5 style="margin:5px">선호하는 주종(2가지 선택)</h5>
    <p class='h-modi-p'><input type="checkbox" class="h-drink" onclick = 'checkedCnt(this)' name='drink' value='1'>소주
  							    <input type="checkbox" class="h-drink" onclick = 'checkedCnt(this)' name='drink' value='2'>맥주
    						    <input type="checkbox" class="h-drink" onclick = 'checkedCnt(this)' name='drink' value='3'>막걸리
    							<input type="checkbox" class="h-drink" onclick = 'checkedCnt(this)' name='drink' value='4'>칵테일 </p>
    
    <p class='h-modi-p'><input type="checkbox" class="h-drink" onclick = 'checkedCnt(this)' name="drink" value='5'>보드카
   							    <input type="checkbox" class="h-drink" onclick = 'checkedCnt(this)' name='drink' value='6'>양주
    							<input type="checkbox" class="h-drink" onclick = 'checkedCnt(this)' name='drink' value='7'>와인
    							<input type="checkbox" class="h-drink" onclick = 'checkedCnt(this)' name='drink' value='8'>기타 </p>
    </div>
	<p style="text-align: center;"><button type="button" id="h-favalc-ok">확인</button></p>
   </div>
</div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
//정규식
	const jName = /^[가-힣]{2,8}$/; // 닉네임은 문자 제한없이 2~8자리
	const jTelno = /^01([0|1|6|7|8|9]?)([0-9]{3,4})([0-9]{4})$/; //전화번호 정규식 '-'빼고 숫자만
	const blank = /\s/g;  //모든공백제거(앞뒤중간) ->/(\s*)/g;

	
	//닉네임 중복체크
	  $(function(){
			$(".h-overlap-btn").click(function(){
				
				let name = $("#modi-name").val();
				
				//입력했는지 검사
				if(name == ""){
					alert("닉네임을 입력하여 주세요");
					
				}else{
					//정규식으로 형식검사 +공백체크
					if(!jName.test(name) || blank.test(name)){
						alert("닉네임은 한글로 2~8자리를 입력해주세요");
					}
				}
				
				$.ajax({
					type : 'post',
					data : {'name' : name},
					url : "/nOverlapCheck",
					dataType: "json",
					success : function(data){
						if(name != ""){
							if(data == 0){
								if(jName.test(name) && !blank.test(name)){
									alert("사용 가능한 닉네임입니다.");
									}
						
							}else{
								alert("중복된 닉네임이 존재합니다.");
						    }
				     	}	
			      }
		}) 
		})
	    }) //닉네임 중복체크 end	

	
	
		
//회원 탈퇴 확인 모달창
let wModal = document.getElementById("h-withdrawal-Modal");
let nModal = document.getElementById("h-name-Modal");
let tModal = document.getElementById("h-telno-Modal");
let fModal = document.getElementById("h-favalc-Modal");

let wBtn = document.getElementById("withdrawal");
let nBtn = document.getElementById("modi-name-btn");
let tBtn = document.getElementById("modi-telno-btn");
let fBtn = document.getElementById("modi-favalc-btn");


let span = document.getElementsByClassName("h-close");
let NObtn = document.getElementById("h-NObtn");

let YESbtn = document.getElementById("h-YESbtn");
let nokBtn = document.getElementById("h-name-ok");
let tokBtn = document.getElementById("h-telno-ok");
let fokBtn = document.getElementById("h-favalc-ok");

/*----- 탈퇴 모달창 -----*/
// 탈퇴 모달창 오픈
wBtn.onclick = function() {
	wModal.style.display = "block";
}
//모달창 닫기 버튼
span[0].onclick = function() {
	wModal.style.display = "none";
}
//NO버튼
NObtn.onclick = function() {
	wModal.style.display = "none";
}
//YES버튼
YESbtn.onclick = function(){
	location.href="/withdrawal";
}


/*----- 닉네임 수정 모달창 -----*/
//닉네임 수정 모달창 오픈
nBtn.onclick = function() {
	nModal.style.display = "block";
}
//모달창 닫기 버튼
span[1].onclick = function() {
	nModal.style.display = "none";
}

//확인 버튼
nokBtn.onclick = function(){
	
	if($("#modi-name").val() == ""){
		alert('닉네임을 입력하여 주세요');
		$("#modi-name").focus();
		return false;
	}
	
	if(!jName.test($("#modi-name").val()) || blank.test($("#modi-name").val())){
		alert('닉네임은 한글로 2~8자리를 입력해주세요');
		$("#modi-name").val("");
		$("#modi-name").focus();
		return false;
	}
	
	$("#name").val($("#modi-name").val());
	nModal.style.display = "none";
}


/*----- 핸드폰번호 수정 모달창 -----*/
//핸드폰번호 수정 모달창 오픈
tBtn.onclick = function() {
	tModal.style.display = "block";
}
//모달창 닫기 버튼
span[2].onclick = function() {
	tModal.style.display = "none";
}

//확인 버튼
tokBtn.onclick = function(){
	
	if($("#modi-telno").val() == ""){
		alert('핸드폰 번호를 입력하여 주세요');
		$("#modi-telno").focus();
		return false;
	}
	
	if(!jTelno.test($("#modi-telno").val())){
		alert('핸드폰번호 형식에 맞지 않습니다');
		$("#modi-telno").val("");
		$("#modi-telno").focus();
		return false;
	}
	
	$("#telno").val($("#modi-telno").val());
	tModal.style.display = "none";
}


/*----- 선호하는 주종 수정 모달창 -----*/
//선호하는 주종 수정 모달창 오픈
fBtn.onclick = function() {
	fModal.style.display = "block";
}
//모달창 닫기 버튼
span[3].onclick = function() {
	fModal.style.display = "none";
}

//확인 버튼
fokBtn.onclick = function(){
		var favalc = [];	
	 $('input[name=drink]:checked').each(function(e) {
		 favalc.push($(this).val());
	});
	
	$.ajax({
		type : 'post',
		url : "/mypage/getFavAlc",
		dataType: "json",
		data : {"favalc" : favalc},
		success : function(data){
			alert("선호하는 주종이 변경되었습니다.");
			
			$("#h-favalc").html("선호하는 주종 : " + data);
		},
	    error:function(data){
	    }
}) 
	
	
	fModal.style.display = "none";
}

//선호하는 술 종류 2가지만 선택
const maxCount = 2;
let count = 0;

function checkedCnt(drink){
	if(drink.checked){
		++count;
	}else{
		--count;
	}
	
	if(count > maxCount){
		alert("선호하는 주종은 2가지만 가능합니다.");
		drink.checked = false;
		--count;
	}
}

</script>

</body>
</html>