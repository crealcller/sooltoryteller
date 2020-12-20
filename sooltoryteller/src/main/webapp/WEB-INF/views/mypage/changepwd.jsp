<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@include file="/WEB-INF/views/include/topmenu.jsp" %>
<script>

//로그인이 안된 상태면 로그인페이지로 넘어가게
let msg = '${msg}';
	if(msg != ""){
		alert(msg);
		location.href = '/login';
	}
	
//비밀번호 변경 성공, 실패여부 메세지
let success = '${success}';
	if(success != ""){
		alert(success);
}
</script>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/changePwdHead.css">
<link rel="stylesheet" href="/resources/css/mypage.css">
<meta charset="UTF-8">
<title>마이페이지 - 비밀번호 변경</title>

</head>
<body>
   <!--  <div class="h-back">
        <div class="h-imgarea">
        <img id="h-backImg" src="/resources/img/zzan.JPG">
 -->
<div class="h-mypageBody" style="width: 1520px;">	
	<div class="d-mypage-wrapper">
        <div class="d-mypage-left">
            <div class="d-left-con">
                <div class="d-mypage-profile-con">
                <c:set var="tmp" value="${member.img}"/>
                <c:set var='imgsrc' value="${fn:substring(tmp, 0, 4)}"/>
                <c:choose>
                <c:when test="${imgsrc == 'http'.toString()}">
                <img class="d-mypage-profile" src='<c:out value="${member.img}" />'>
                </c:when>
                
                <c:otherwise>
                <img class="d-mypage-profile" src='/resources/img/<c:out value="${member.img}" />'>
                </c:otherwise>
                </c:choose>
                <div class="d-mypage-info">
                   <h1><c:out value="${member.name}" />님</h1>
                </div>
                </div>
                <ul class="d-mypage-menu-con">
                <li class="d-mypage-ref"><a href='/mypage/like'>전통주</a> </li>
                <ul class="d-mypage-menu">
                    <li class="d-mypage-li">
                        <a href='/mypage/like'>좋아요한 전통주 </a> 
                    </li> 
                    <li class="d-mypage-li">
                        <a href='/mypage/revw'>내가 작성한 리뷰 </a> 
                    </li>     
                </ul> 
                </ul>
                <ul class="d-mypage-menu-con">
                    <li class="d-mypage-ref"><a href='#'>게시글 </a></li>
                    <ul class="d-mypage-menu">
                        <li class="d-mypage-li">
                            <a href='/mypage/mypost'>내가 작성한 게시글</a>
                        </li>
                        <li class="d-mypage-li">
                            <a href='/mypage/mycomment'>내가 작성한 댓글</a>
                        </li>  
                        <li class="d-mypage-li">
                            <a href='/mypage/mylikedpost'>좋아요한 게시글</a> 
                        </li>     
                    </ul> 
                    </ul>
                    <ul class="d-mypage-menu-con" style="border-style: none;">
                        <li class="d-mypage-ref"><a href='/mypage/changeuserinfo'>회원정보</a> </li>
                        <ul class="d-mypage-menu">
                            <li class="d-mypage-li">
                                <a href='/mypage/changeuserinfo'>회원정보수정 </a> 
                            </li> 
                            <li class="d-mypage-li">
                                <a href='/mypage/changepwd'>비밀번호 변경 </a> 
                            </li>    
                        </ul> 
                        </ul>

            </div>
        </div>
        <div class="d-mypage-right">
			<h2>비밀번호 변경</h2>
			<div class="h-con">

            <h3 style="margin: 40px 0 40px 0;">비밀번호 변경</h3>
            <form action="/mypage/changepwd" method="post" onsubmit="return validate()">
                <p class="h-pwd-p"><input type="password" id ="pwd" name="pwd" placeholder="현재 비밀번호"></p>
                <p class="h-pwd-p" style="font-size:15px;">비밀번호는 대문자 또는 소문자 및 특수문자 1개 이상 포함해서 5자리~16자리로 입력하여주세요</p>
                <p class="h-pwd-p"><input type="password" id ="newpwd" name="newpwd" placeholder="새 비밀번호"></p>
                <p class="h-pwd-p"><input type="password" id="repwd" placeholder="새 비밀번호 확인" onblur="checkPwd()"></p>
                <p class="h-pwd-p" id="repwdmsg"></p>
                <div style="text-align: center;"><button type="submit" class="h-passbtn">변경</button> <button type="button" class="h-passbtn" onclick="location.href='/mypage/like'">취소</button></div>
            </form>
        </div>
        </div>
        </div>
        </div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		const jPwd = /^(?=.*?[a-zA-Z])(?=.*?[#?!@$%^&*-]).{5,16}$/; // 대문자 OR 소문자,특수문자 1개씩은 포함해서 5자리~16자리
		const blank = /\s/g;
    
		//1. 비밀번호와 비밀번호 확인이 일치하는지 확인
		function checkPwd(){
			if($("#repwd").val() == ""){
				 document.getElementById("repwdmsg").innerHTML = "비밀번호 확인을 입력해주세요";
			     document.getElementById("repwdmsg").style.color = 'red'; 
			     
			}else{
				
				if($("#newpwd").val() == $("#repwd").val()){
					document.getElementById("repwdmsg").innerHTML = "비밀번호가 일치합니다.";
		    		document.getElementById("repwdmsg").style.color = 'red'; 
				} 
			
				if($("#newpwd").val() != $("#repwd").val()){
					$("#repwd").val("");
					document.getElementById("repwdmsg").innerHTML = "비밀번호가 일치하지 않습니다 다시 입력해주세요";
		    		document.getElementById("repwdmsg").style.color = 'red'; 
				}
			}//else end
		}//fun end
		
		//2. 비밀번호 유효성검사
		function validate() {	
			
			if($("#pwd").val() == ""){
				alert('현재 비밀번호를 입력하여 주세요');
				$("#pwd").focus();
				return false;
			}
			
			 if(!jPwd.test($("#newpwd").val()) && blank.test($("#newpwd").val())){
				alert('비밀번호 형식에 맞지 않습니다');
				$("#newpwd").val("");
				$("#newpwd").focus();
				return false;
			}
			
			if($("#newpwd").val() != $("#repwd").val()){
				alert('비밀번호 확인과 일치하지 않습니다.');
				$("#repwd").val("");
				$("#repwd").focus();
				return false;
			} 
			return true;
		}
    </script>
</body>
<%@include file="/WEB-INF/views/include/footer.jsp" %>
</html>