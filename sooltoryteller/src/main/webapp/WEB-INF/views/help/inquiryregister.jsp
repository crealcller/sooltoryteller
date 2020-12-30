<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/views/include/topmenu.jsp" %>
<%@include file="/WEB-INF/views/include/servicesidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 등록</title>

<link rel="stylesheet" href="/resources/css/helpinquiryHead.css">
<script>
//로그인이 안된 상태면 로그인페이지로 넘어가게
let msg = '${msg}';
	if(msg != ""){
		alert(msg);
		location.href = '/login';
	}
	
let errorMsg = '<c:out value="${errorMsg}"/>';
	if(errorMsg != ""){
		alert(errorMsg);
	}
</script>
</head>
<body>
<h3 style="margin: 0 0 10px 20px;">[1:1 문의 등록]</h3>
        <div class="h-inq-body">
          <form action="/help/inquiryregister" id='h-inqRegForm' method="POST">
          <div>
              <p style="text-align: left; margin: 5px 0 5px 0;">제목</p>
              <p style="margin: 0;"><input class="h-inq-title" name="title" id='title' maxlength="30"></p>
          </div>
          <div>
              <p style="text-align: left; margin: 5px 0 5px 0;">내용</p>
              <p style="margin: 0;"><textarea class="h-inq-content" name="cn" id='cn' maxlength="330"></textarea></p>
          </div>
          <input type="hidden" name="memberId" value="${memberId }">
          <div style="margin:20px 180px 0 0; float: right;">
              <button type="submit" class="h-inq-btn" id="h-reg-btn" style="background-color: rgb(10, 29, 74);">등록</button>
              <input type="reset" class="h-inq-btn" value='취소' style="background-color: rgb(10, 29, 74);">
          </div>
          </form>
  
      </div>
    </div><!--인크루드 하는 페이지에 넣기-->
    </div><!--인크루드 하는 페이지에 넣기-->

<!-- Modal  추가 -->
<div id="h-myModal" class="h-modal">
  <div class="h-modal-content">
    <span class="h-close">&times;</span>
   <p style="text-align: center;" class="h-modal-body">1:1 문의가 접수되었습니다.</p>
   <p style="text-align: center;"><button type="button" class="h-btn" id="h-YESbtn">확인</button></p>
   </div>
</div>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
$(document).ready(function(){
	document.getElementById("h-help-inquiry").style="background-color: rgb(10 29 74); color: white;";
	
	var result = '<c:out value="${result}"/>';
	var modal = document.getElementById("h-myModal");
	var span = document.getElementsByClassName("h-close")[0];
	var YESbtn = document.getElementById("h-YESbtn");
	
	checkModal(result);
	
	function checkModal(result){
		
		if(result === '' || history.state){
			return;
		}
		
		if(parseInt(result) > 0){
			$(".h-modal-body").html("1:1문의 "+parseInt(result)+" 번이 전송 되었습니다.");
		}
		modal.style.display = "block";
		
	}
	//모달창 닫기버튼
	span.onclick = function() { modal.style.display = "none";}
	YESbtn.onclick = function(){modal.style.display = "none";}
	
	//제목 글자수 30자가 넘으면 경고창	
	$("#title").keyup(function(){
		
	 	if($(this).val().lenght > $(this).attr('maxlength')){
 			alert("제목은 30자 이내로 입력하여 주시기 바랍니다.");
 			$(this).val($(this).val().substr(0, $(this).attr('maxlength')));
 		}
 
	});
	
	$("#cn").keyup(function(){
		
	 	if($(this).val().lenght > $(this).attr('maxlength')){
 			alert("내용은 330자 이내로 입력하여 주시기 바랍니다.");
 			$(this).val($(this).val().substr(0, $(this).attr('maxlength')));
 		}
 
	});
	
	//입력 형식 검사
	let inqRegForm = $("#h-inqRegForm");
    	
    	$("#h-inqRegForm button").on("click", function(e){
    		let title = $("#title").val();
    		
    		if($("#title").val() == ""){
    			alert("제목을 입력해 주시기 바랍니다.");
    			return false;
    		}
    		
    		if($("#cn").val() == ""){
    			alert("내용을 입력해 주시기 바랍니다.");
    			return false;
    		}
    		
    		$('#title').val(title.trim());
    		e.preventDefault();
    		
    		inqRegForm.submit();
    	 });
 });
 
</script>
</body>
<%@include file="/WEB-INF/views/include/footer.jsp" %>
</html>