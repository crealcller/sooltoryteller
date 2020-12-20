<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
 <%@include file="/WEB-INF/views/include/topmenu.jsp" %>
 <link rel="stylesheet" href="/resources/css/joinHead.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
let msg = '${msg}';

if(msg != ""){
	alert(msg);
}


</script>

<body>

 <div class="s-main-background" ">
	<div class="s-main-column" style="height:750px; text-align: center;">
  
	  <div class="h-join-content">
	    <div class="h-content">
	    <h2 style="margin:50px 0 0 50px; width:300px; text-align: left;">회원가입</h2>
	    <h4 style="margin:15px 0 0 50px; width:300px; text-align: left;">기본정보</h4>
	    
	    <form action="/join" method="POST" onsubmit="return validate()">
	    <p class='h-join-p' style="margin-left:50px;">이메일 &nbsp<input type="text" id="email" name="email" value="<c:out value='${member.email }'/>">
	    <button type="button" id="h-checkId" class="id-overlapCheck">중복확인</button></p>
	    <p class='h-join-p' style="margin-left:50px;">닉네임 &nbsp<input type="text" id="name" name="name" maxlength="8" value="<c:out value='${member.name }'/>">
	    <button type="button" id="h-checkName" class="n-overlapCheck">중복확인</button></p>
	    <p class='h-join-p' style="font-size:12px; margin-left:70px;" id="nameMsg">닉네임은 한글로 2~8자로 입력해주세요</p>
	    <p class='h-join-p' style="margin-left:60px;text-align: left;">비밀번호 &nbsp<input type="password" id="pwd" name="pwd" maxlength="16" value="<c:out value='${member.pwd }'/>"></p>
	    <p class='h-join-p' style="margin-left:23px;text-align: left;">비밀번호 확인 &nbsp<input type="password" id="rePwd" onblur="checkPwd()"></p>
	     <p class='h-join-p' style="font-size:12px; margin-left:120px;" id="repwdMsg">비밀 번호는 영문자, 특수문자 포함해서 5~16자리</p>
	    <p class='h-join-p' style="margin-left:45px; text-align: left;">핸드폰번호 &nbsp<input type="text" id="telno" name="telno" placeholder="01000000000" value="<c:out value='${member.telno }'/>"></p>
	    
	    <div class="h-fav-drink">
	      <h5 style="margin:20px">선호하는 주종(2가지 선택)</h5>
	    <p class='h-join-p'><input type="checkbox" class="h-drink" onclick = 'checkedCnt(this)' name='drink' value='1' id='a'> <label for='a'>소주</label>
	  						<input type="checkbox" class="h-drink" onclick = 'checkedCnt(this)' name='drink' value='2' id='b'> <label for='b'>맥주</label>
	    					<input type="checkbox" class="h-drink" onclick = 'checkedCnt(this)' name='drink' value='3' id='c'> <label for='c'>막걸리</label>
	    					<input type="checkbox" class="h-drink" onclick = 'checkedCnt(this)' name='drink' value='4' id='d'> <label for='d'>칵테일</label> </p>
	    
	    <p class='h-join-p'><input type="checkbox" class="h-drink" onclick = 'checkedCnt(this)' name="drink" value='5' id='e'> <label for='e'>보드카</label>
	   						<input type="checkbox" class="h-drink" onclick = 'checkedCnt(this)' name='drink' value='6' id='f'> <label for='f'>양주</label>
	    					<input type="checkbox" class="h-drink" onclick = 'checkedCnt(this)' name='drink' value='7' id='g'> <label for='g'>와인</label>
	    					<input type="checkbox" class="h-drink" onclick = 'checkedCnt(this)' name='drink' value='8' id='h'> <label for='h'>기타</label> </p>
	    							
	    <p class='h-join-p' style="text-align: center; margin:20px;"><button type="submit" class="join-btn"  disabled="disabled" id="reg">회원가입</button>
	    <button type="button" class="join-btn" >취소</button></p>
	    </div>
	    </form>
	    </div>
	  </div>

</div>
  </div>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript">
  
  const jEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; // 이메일
  const jPwd = /^(?=.*?[a-zA-Z])(?=.*?[#?!@$%^&*-]).{5,16}$/; // 대문자,소문자,특수문자 1개씩은 포함해서 5자리~16자리
  const jName = /^[가-힣]{2,8}$/; // 닉네임은 한글만 2~8자리  /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,8}$/;  
  const jTelno = /^01([0|1|6|7|8|9]?)([0-9]{3,4})([0-9]{4})$/;
  const blank = /\s/g;  //공백 정규식 미완
	

	//아이디 중복체크 확인
    $(function(){
		
		$(".id-overlapCheck").click(function(){
			
			let btn = document.getElementById("reg");
			let email = $("#email").val();
			
			//입력했는지 검사
			if(email == ""){
				alert("이메일을 입력하여 주세요");
	    		btn.disabled = "disabled";
			}else{
			
				//정규식으로 형식검사 +공백체크
				if(!jEmail.test(email) || blank.test(email)){
					alert("이메일 형식에 맞지 않습니다.");
					btn.disabled = "disabled";
				}
			
			}
			
			 $.ajax({
				type : 'post',
				data : {'email' : email},
				url : "/idOverlapCheck",
				dataType: "json",
				success : function(data){
					if(email != ""){
							if(data>0){
								alert("중복된 이메일이 존재합니다.");
					    	   	btn.disabled = "disabled";
						
							}else{
								if(jEmail.test(email) && !blank.test(email)){
																		
									alert("사용 가능한 이메일입니다.");
								    btn.disabled = false;
								}
						    }
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
  
    
    
  //비밀번호와 비밀번호 확인이 일치하는지 확인
    function checkPwd(){
    	if($("#rePwd").val() == ""){
    		 document.getElementById("repwdMsg").innerHTML = "비밀번호 확인을 입력해주세요";
    	     document.getElementById("repwdMsg").style.color = 'red'; 
    	}else{
    		
    	if($("#pwd").val() == $("#rePwd").val()){
    			document.getElementById("repwdMsg").innerHTML = "비밀번호가 일치합니다.";
        		document.getElementById("repwdMsg").style.color = 'red'; 
    		} 
    	
    		if($("#pwd").val() != $("#rePwd").val()){
    			document.getElementById("repwdMsg").innerHTML = "비밀번호가 일치하지 않습니다 다시 입력해주세요";
        		document.getElementById("repwdMsg").style.color = 'red'; 
    		}
    		
    		if(!jPwd.test($("#pwd").val()) || blank.test($("#pwd").val())){
    			document.getElementById("repwdMsg").innerHTML = "비밀번호는 대문자 또는 소문자 및 특수문자 1개 이상 포함해서 5자리~16자리로 입력하여주세요";
        		document.getElementById("repwdMsg").style.color = 'red'; 
    		}
    	}//else end
    }//fun end
    
    
 
    //회원가입 버튼 클릭시 유효성 검사 한 번 더!!
    function validate() {   	
    	
    	//1. pwd 유효성검사
    	if($("#pwd").val() == ""){
    		alert('비밀번호를 입력하여 주세요');
    		$("#pwd").focus();
    		return false;
    	}
    	
    	if(!jPwd.test($("#pwd").val()) || blank.test($("#pwd").val())){
    		alert('비밀번호는 대문자 또는 소문자 및 특수문자 1개 이상 포함해서 5자리~16자리로 입력하여주세요');
    		$("#pwd").val("");
    		$("#pwd").focus();
    		return false;
    	}
    	
    	
    	//2. 비밀번호와 비밀번호 확인이 일치하는지 확인
    	if($("#rePwd").val() == ""){
    		alert('비밀번호 확인을 입력해주세요');
    		
    		return false;
    	}else{
    		if($("#pwd").val() != $("#rePwd").val()){
    			alert('비밀번호가 일치하지 않습니다 다시 입력해주세요');
    			$("#rePwd").val("");
    			$("#rePwd").focus();
    			return false;
    		}
    	}
    	
    	
    	//3. 닉네임 유효성 검사
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
    	
    	
    	
    	//4. 전화번호 유효성검사
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
    	
    	//5. 이메일 유효성검사
    	if($("#email").val() == ""){
    		alert('이메일을 입력하여 주세요');
    		$("#email").focus();
    		return false;
    	}
    	
    	if(!jEmail.test($("#email").val())){
    		alert('이메일 형식에 맞지 않습니다');
    		$("#email").val("");
    		$("#email").focus();
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
<%@include file="/WEB-INF/views/include/footer.jsp" %>
</html>