<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/views/include/topmenu.jsp" %>
<%@include file="/WEB-INF/views/include/servicesidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 FAQ조회</title>
<link rel="stylesheet" href="/resources/css/faqregisterHead.css">

</head>
<body>
	<h3 style="margin-left: 50px;">[자주묻는 질문 조회하기]</h3>
    <div class="h-faq-body">
        <div>
       		<p style="text-align: left; margin: 0;">번호(일단 수기로 입력쓰)</p>
            <p style="margin: 0;"><input class="h-faq-title" name="faqId" 
            value='<c:out value="${faq.faqId }"/>' readonly="readonly"></p>
        </div>
        <div>
            <p style="text-align: left; margin: 0;">제목</p>
            <p style="margin: 0;"><input class="h-faq-title" name="title"
            value='<c:out value="${faq.title }"/>' readonly="readonly"></p>
        </div>
        <div>
            <p style="text-align: left; margin: 0;">내용</p>
            <p style="margin: 0;"><textarea class="h-faq-content" name="cn"
            readonly="readonly"><c:out value="${faq.cn }"/></textarea></p>
        </div>
        <div style="margin-top:20px;">
            <button type="button" class="h-faq-btn" style="background-color:rgb(181, 135, 189);" data-oper="list" onclick="location.href='/help/faq'">목록</button>
        </div>

    </div>

</div><!--인크루드 하는 페이지에 넣기-->
</div><!--인크루드 하는 페이지에 넣기-->


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 <script type="text/javascript">
 $(document).ready(function(){
	document.getElementById("h-help-faq").style="background-color: rgb(181, 135, 189); color: white;";
	
	
	$("button[data-oper='list']").on("click", function(e){
		operForm.find('#faqId').remove();
		operForm.attr("action", "/help/faq")
		operForm.submit();
		
	});
		
		
 });
     </script>
</body>
</html>