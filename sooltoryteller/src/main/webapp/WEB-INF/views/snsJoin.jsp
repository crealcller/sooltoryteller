<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
 <%@include file="/WEB-INF/views/include/topmenu.jsp" %>
 <%@include file="/resources/css/joinHead.css" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
let msg = '${msg}';

if(msg != ""){
	alert(msg);
}

</script>
<body>

 <div class="h-body">
<div class="h-left"><img src="/resources/img/barsign.jpg" id="h-leftimg">
</div><div class="h-right">
  
  <div class="h-join-content">
    <div class="h-content">
    <h2 style="margin-left:50px;">회원가입</h2>
    <h4 style="margin-left:50px;">기본정보</h4>
    <form action="/snsJoin" method="POST" onsubmit="return validate()">
    <p class='h-join-p' style="margin-left:50px;">이메일 &nbsp<input type="email" id="email" name="email" value="<c:out value='${email }'/>"  readonly="readonly">
    <button type="button" id="h-checkId" class="id-overlapCheck">중복확인</button></p>
    <p class='h-join-p' style="margin-left:50px;">닉네임 &nbsp<input type="text" id="name" name="name">
    <button type="button" id="h-checkName" class="n-overlapCheck">중복확인</button></p>
    <p class='h-join-p' style="margin-left:25px;">핸드폰번호 &nbsp<input type="text" id="telno" name="telno" placeholder="01000000000" ></p>
    <input type="hidden" name="img" value="<c:out value='${img }'/>"> 
    <div class="h-fav-drink">
      <h5 style="margin:5px">선호하는 주종(2가지 선택)</h5>
    <p class='h-join-p'><input type="checkbox" class="h-drink" onclick = 'checkedCnt(this)' name='drink' value='1'>소주
  							    <input type="checkbox" class="h-drink" onclick = 'checkedCnt(this)' name='drink' value='2'>맥주
    						    <input type="checkbox" class="h-drink" onclick = 'checkedCnt(this)' name='drink' value='3'>막걸리
    							<input type="checkbox" class="h-drink" onclick = 'checkedCnt(this)' name='drink' value='4'>칵테일 </p>
    
    <p class='h-join-p'><input type="checkbox" class="h-drink" onclick = 'checkedCnt(this)' name="drink" value='5'>보드카
   							    <input type="checkbox" class="h-drink" onclick = 'checkedCnt(this)' name='drink' value='6'>양주
    							<input type="checkbox" class="h-drink" onclick = 'checkedCnt(this)' name='drink' value='7'>와인
    							<input type="checkbox" class="h-drink" onclick = 'checkedCnt(this)' name='drink' value='8'>기타 </p>
    							
    <p class='h-join-p' style="text-align: center; margin:0;"><button style="margin: 0" type="submit" class="join-btn"  disabled="disabled" id="reg">회원가입</button>
    <button type="button" class="join-btn" >취소</button></p>
    </div>
    </form>
    </div>
  </div>

</div>
  </div>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript">
  
  let jName = /^[가-힣]{2,8}$/; // 닉네임은 문자 제한없이 2~8자리  /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,8}$/;  
  let jTelno = /^01([0|1|6|7|8|9]?)([0-9]{3,4})([0-9]{4})$/;
  let blank = /\s/g;  //공백 정규식 미완
	

	//아이디 중복체크 확인
    $(function(){
		
		$(".id-overlapCheck").click(function(){
			
			let btn = document.getElementById("reg");
			let email = $("#email").val();
			
			 $.ajax({
				type : 'post',
				data : {'email' : email},
				url : "/idOverlapCheck",
				dataType: "json",
				success : function(data){
							if(data>0){
								alert("중복된 이메일이 존재합니다.");
					    	   	btn.disabled = "disabled";
						
							}else{
									alert("사용 가능한 이메일입니다.");
								    btn.disabled = false;
									}
						    }
	}) 
	})
    }) //아이디중복체크 end
    
  //닉네임 중복체크
  $(function(){
		$(".n-overlapCheck").click(function(){
			
			let btn = document.getElementById("reg");
			let name = $("#name").val();
			
			//입력했는지 검사
			if(name == ""){
				alert("닉네임을 입력하여 주세요");
	    		btn.disabled = "disabled";
			}else{
				//정규식으로 형식검사 +공백체크
				 if(!jName.test(name) || blank.test(name)){
					alert("닉네임은 한글로 2~8자리를 입력해주세요");
					btn.disabled = "disabled";
				}
			
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
					    	   	btn.disabled = "disabled";
						
							}else{
								if(jName.test(name) && !blank.test(name)){
									alert("사용 가능한 닉네임입니다.");
								    btn.disabled = false;
									}
						    }
					  } 
				}	
	}) 
	})
    }) //닉네임 중복체크 end
  
    
 
    //회원가입 버튼 클릭시 유효성 검사 한 번 더!!
    function validate() {   	
    	
    	//1. 닉네임 유효성 검사
    	if($("#name").val() == ""){
    		alert('닉네임을 입력하여 주세요');
    		$("#name").focus();
    		return false;
    	}
    	
    	if(!jName.test($("#name").val()) || blank.test($("#name").val())){
    		alert('닉네임은 한글로 2~8자리를 입력해주세요');
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