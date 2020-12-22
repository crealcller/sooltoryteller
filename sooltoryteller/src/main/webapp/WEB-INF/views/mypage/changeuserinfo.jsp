<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/views/include/mypageSidebar.jsp"%>



<!DOCTYPE html>
<html>
<head>
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
<link rel="stylesheet" href="/resources/css/changeUserInfoHead.css">
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
        <h2>회원정보 수정 / 탈퇴</h2>
         <div class="h-con">
			<p style="font-size:12px; color:red; margin-bottom: 10px;">선호하는 주종 외에는 수정 버튼을 눌러야 반영이 됩니다.</p>
            <form action ="/mypage/changeuserinfo" method="post" enctype="multipart/form-data">
        <div class="h-photo">
        	<div class="h-profile-photo">
					<img class="d-mypage-profile"
					src='<c:out value="${member.img}" />'>
        	</div>
        </div>
        
       	<p style="margin-top:10px;">
	        <!-- 파일 확장자 설정해서 에러 막기 -->
			<input type="file" name="file" class="h-addfile" id="h-addfile" style="border:none;"
			accept="image/jpeg,image/gif,image/png" onchange="checkType(this)" value="<c:out value='${member.img }' />" />
			<script>
				// 게시글 썸네일사진
				$("#h-addfile").change(function(){
					if(this.files && this.files[0]) {
				    var reader = new FileReader;
				    reader.onload = function(data) {
				    $(".h-profile-photo img").attr("src", data.target.result).width(120);        
				    }
				    reader.readAsDataURL(this.files[0]);
				    }
				});
			</script>
        </p>
	        
	     <p style="margin:15px 0 15px 0; padding-right:45px;">이메일 : &nbsp<input type = "text" name="email" id="email" value="<c:out value='${member.email }'/>" readonly="readonly"></p>
             <p style="margin-bottom:20px;">닉네임 : &nbsp<input type = "text" name="name" id="name" value="<c:out value='${member.name }'/>" readonly="readonly">
             <button type="button" class="h-modibtn" id="modi-name-btn" >변경</button></p>
             <p style="margin-bottom:20px;">핸드폰 : &nbsp<input type = "text" name="telno" id="telno" value="<c:out value='${member.telno }'/>" readonly="readonly">
             <button type="button" class="h-modibtn" id="modi-telno-btn">변경</button></p>
             <span id="h-favalc">선호하는 주종 : 
             <c:forEach items="${favList}" var="alc">
             <c:out value="${alc}"/>
               </c:forEach></span><button style="margin-left:72px;" type="button" class="h-modibtn" id="modi-favalc-btn" >수정</button>
               <p><button type="submit" id="modify" class="h-withdrawal-btn" >수정</button><button type="button" id="withdrawal" class="h-withdrawal-btn">회원탈퇴</button></p>
            </form> 
            
         </div>
   </div>
</div> <!-- h-mypagebody end -->
	
    
	<!-- 회원 탈퇴 모달창 -->
	<div id="h-withdrawal-Modal" class="h-modal">
    <div class="h-modal-content">
    <span class="h-close" style="cursor: pointer;">&times;</span>
	<p style="text-align: center;">정말 탈퇴하시겠습니까??</p>
	<p style="text-align: center;"><button type="button" class="h-btn" id="h-YESbtn">YES...</button> <button type="button" class="h-btn" id="h-NObtn">NO!!!!</button></p>
   </div>
   </div>
   
   <!-- 닉네임 변경 모달창 -->
   <div id="h-name-Modal" class="h-modal">
    <div class="h-modal-content" >
    <span class="h-close" style="cursor: pointer;">&times;</span>
	<p style="margin: 20px 0 20px 0;">변경할 닉네임 &nbsp<input type="text" id="modi-name"><button type="button" class="h-overlap-btn">중복확인</button></p>
	<p style="text-align: center;"><button type="button" id="h-name-ok">확인</button></p>
   </div>
   </div>
   
   <!-- 핸드폰 번호 변경 모달창 -->
   <div id="h-telno-Modal" class="h-modal">
    <div class="h-modal-content">
    <span class="h-close" style="cursor: pointer;">&times;</span>
	<p style="margin: 20px 0 20px 0;">변경할 핸드폰 번호 &nbsp<input type="text" id="modi-telno"></p>
	<p style="text-align: center;"><button type="button" id="h-telno-ok">확인</button></p>
   </div>
   </div>
   
   <!-- 선호하는 주종 변경 모달창 -->
   <div id="h-favalc-Modal" class="h-modal">
    <div class="h-modal-content">
    <span class="h-close" style="cursor: pointer;">&times;</span>
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
	<p style="text-align: right;"><button type="button" id="h-favalc-ok">확인</button></p>
   </div>
</div>

</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp" %>

<!-- 이미지 확장자 타입 검사 -->
<script type="text/javascript">
function checkType(obj) {
	var file = $("#h-addfile").val().split(".").pop().toLowerCase();
	
	if($.inArray(file, ["jpg","gif","png","jpeg","bmp"]) == -1) {
		alert("이미지 파일만 선택하실 수 있습니다.");
		$("#h-addfile").val("");
		return false;
	}
}
</script>

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
	
	// 프로필사진을 수정하지 않을 경우
	var file = $('#h-addfile').val();
	if(file == "" || file.equalsIgnoreCase("user.png")) {
		$('#h-addfile').prop('type', 'text');
		var prevFile = $('#h-addfile').val();
	}
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
<%-- <%@include file="/WEB-INF/views/include/footer.jsp" %> --%>
</body>
</html>

