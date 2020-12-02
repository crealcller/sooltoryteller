<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
 <%@include file="/WEB-INF/views/include/topmenu.jsp" %>
 <%@include file="/resources/css/joinHead.jsp" %>

<body>

 <div class="h-body">
<div class="h-left"><img src="/resources/img/barsign.jpg" id="h-leftimg">
</div><div class="h-right">
  
  <div class="h-join-content">
    <div class="h-content">
    <h2 style="margin-left:50px;">회원가입</h2>
    <h4 style="margin-left:50px;">기본정보</h4>
    
    <form action="/join" method="POST" onsubmit="return validate()">
    <p class='h-join-p' style="margin-left:50px;">이메일 &nbsp<input type="email" id="email" name="email"><button type="button" id="checkId" class="overlapCheck">중복확인</button></p>
    <p class='h-join-p' style="margin-left:50px;">닉네임 &nbsp<input type="text" id="name" name="name"></p>
    <p class='h-join-p' style="font-size:5px" id="nameMsg">닉네임은 2~8자리 입력해주세요</p>
    <p class='h-join-p' style="margin-left:35px;">비밀번호 &nbsp<input type="password" id="pwd" name="pwd"></p>
    <p class='h-join-p'>비밀번호 확인 &nbsp<input type="text" id="rePwd" onblur="checkPwd()"></p>
     <p class='h-join-p' style="font-size:5px" id="repwdMsg">비밀번호를 한 번 더 입력해주세요</p>
    <p class='h-join-p' style="margin-left:25px;">핸드폰번호 &nbsp<input type="text" id="telno" placeholder="01000000000"></p>
    
    <div class="h-fav-drink">
      <h5 style="margin:5px">선호하는 주종(2가지 선택)</h5>
    <p class='h-join-p'><input type="checkbox" class="h-drink">소주<input type="checkbox" class="h-drink">맥주<input type="checkbox" class="h-drink">막걸리<input type="checkbox" class="h-drink">칵테일 </p>
    <p class='h-join-p'><input type="checkbox" class="h-drink">보드카<input type="checkbox" class="h-drink">양주<input type="checkbox" class="h-drink">와인<input type="checkbox" class="h-drink">기타 </p>
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
  
	const jEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일
	const jPwd = /^(?=.*?[a-zA-Z])(?=.*?[#?!@$%^&*-]).{8,16}$/; // 대문자/소문자/특수문자 1개씩은 포함해서 8자리~16자리
	const jName = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,8}$/; // 닉네임은 문자 제한없이 2~8자리
	const jTelno = /^\d{3}\d{3,4}\d{4}$/; //전화번호 정규식 '-'빼고 숫자만 01063517402
	const blank = /\s/g;
/*  
	//아이디 중복체크 확인(보류)
    $(function(){
		
		$(".overlapCheck").click(function(){
			
			let btn = document.getElementById("reg");
			let email = $("#email").val();
			
			//입력했는지 검사
			if(email == ""){
				alert("이메일을 입력하여 주세요");
	    		btn.disabled = "disabled";
			}
			
			$.ajax({
				type : 'post',
				data : {'email' : email},
				url : "/overlapCheck",
				success : function(data){
					alert(data);
					if(email != ""){
						//정규식으로 형식검사 +공백체크
						if(!jEmail.test(email) || blank.test(email)){
							alert("이메일 형식에 맞지 않습니다.");
							btn.disabled = "disabled";
						}else{
						
							if(data>0){
								alert("중복된 아이디가 존재합니다.");
					    	   	btn.disabled = "disabled";
					    	   	
							}else{
								if(jEmail.test(email)){
									alert("사용 가능한 아이디입니다.");
								    btn.disabled = false;
							 	 }
						    }
					  } //else end
					}
				}	
					
		
	})
	})
	})
  
  */
  </script>
  
</body>
</html>