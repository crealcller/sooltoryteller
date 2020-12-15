<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/views/include/adminMenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 답변</title>
<link rel="stylesheet" href="/resources/css/faqregisterHead.css">

<script>
let errorMsg = '<c:out value="${errorMsg}"/>';
if(errorMsg != ""){
	alert(errorMsg);
}
</script>

</head>
<body>
	<h3 style="margin-left: 50px;">[1:1문의 답변보내기]</h3>
    <div class="h-faq-body">
        <form action="/admin/answer" id='h-answerForm' method="POST" onsubmit="return blankcheck()">
        <div>
       		<p style="text-align: left; margin: 0;">번호</p>
            <p style="margin: 0;"><input class="h-faq-title" name="inquiryId" value='<c:out value="${inquiryId }"/>' readonly="readonly"></p>
        </div>
        <div>
            <p style="text-align: left; margin: 0;">내용</p>
            <p style="margin: 0;"><textarea class="h-faq-content" id="cn" name="cn" maxlength="330"></textarea></p>
        </div>
        <div style="margin-top:20px;">
            <button type="submit" class="h-faq-btn">등록</button>
            <button type="button" class="h-faq-btn" onclick="location.href='/admin/inquirylist'">목록</button>
        </div>
        </form>

    </div>

</div><!--인크루드 하는 페이지에 넣기-->
</div><!--인크루드 하는 페이지에 넣기-->
   


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 <script type="text/javascript">
 $(document).ready(function(){
		document.getElementById("h-admin-inqlist").style="background-color: navy;color: white;";

	//내용최대글자수 넘으면 더이상 쓰지 못 하게 막음	
	$("#cn").keyup(function(){
		
	 	if($(this).val().lenght > $(this).attr('maxlength')){
 			alert("내용은 330자 이내로 입력하여 주시기 바랍니다.");
 			$(this).val($(this).val().substr(0, $(this).attr('maxlength')));
 		}
 
	});
	
	
 });
 
 //아무내용도 입력하지 않고 등록버튼을 누른경우
	function blankcheck(){
		
		if($("#cn").val() == ""){
			alert("내용을 입력해 주시기 바랍니다.");
			return false;
		}
		
		return true;
			
	}
     </script>
</body>
</html>