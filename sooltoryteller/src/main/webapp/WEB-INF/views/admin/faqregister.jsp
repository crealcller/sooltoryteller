<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/views/include/adminMenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ등록</title>
<link rel="stylesheet" href="/resources/css/faqregisterHead.css">
<script>
let errorMsg = '<c:out value="${errorMsg}"/>';
if(errorMsg != ""){
	alert(errorMsg);
}
</script>
</head>
<body>
	<h3 style="margin-left: 50px;">[FAQ 등록하기]</h3>
    <div class="h-faq-body">
        <form action="/admin/faqregister" id='h-faqRagForm' method="POST">
        <div>
       		<p style="text-align: left; margin: 0;">번호(일단 수기로 입력쓰)</p>
            <p style="margin: 0;"><input class="h-faq-title" name="faqId"></p>
        </div>
        <div>
            <p style="text-align: left; margin: 0;">제목</p>
            <p style="margin: 0;"><input class="h-faq-title" id="title" name="title" maxlength="30"></p>
        </div>
        <div>
            <p style="text-align: left; margin: 0;">내용</p>
            <p style="margin: 0;"><textarea class="h-faq-content" id="cn" name="cn" maxlength="330"></textarea></p>
        </div>
        <div style="margin-top:20px;">
            <button type="submit" class="h-faq-btn" id='regbtn'>등록</button>
            <button type="button" class="h-faq-btn" id='listbtn' onclick="location.href='/admin/faqlist'">목록</button>
        </div>
        </form>

    </div>

</div><!--인크루드 하는 페이지에 넣기-->
</div><!--인크루드 하는 페이지에 넣기-->


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 <script type="text/javascript">
 $(document).ready(function(){
		document.getElementById("h-admin-faq").style="background-color: navy;color: white;";

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
	//제목 공백제거
	let faqRagForm = $("#h-faqRagForm");
	
	$("#regbtn").on("click", function(e){
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
		
		faqRagForm.submit();
	 });
 });
 
     </script>
</body>
</html>