<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/views/include/topmenu.jsp" %>
<%@include file="/WEB-INF/views/include/servicesidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 FAQ 조회</title>
<link rel="stylesheet" href="/resources/css/faqregisterHead.css">
<style>
.h-column {
	height: 420px;
	margin-bottom: 25px;
}
</style>
</head>
<body>
	<h3 style="margin: 0 0 10px 15px;">[ 자주 묻는 질문 ]</h3>
    <div class="h-faq-body" style="margin: 0 0 0 50px;">
        <div>
       		<p style="text-align: left; margin: 0 0 5px 0;">번호</p>
            <p style="margin: 0 0 5px 0; font-size: 15px;"><input class="h-faq-title" name="faqId" id="faqId" style="font-size: 15px;"
            value='<c:out value="${faq.faqId }"/>' readonly="readonly"></p>
        </div>
        <div>
            <p style="text-align: left; margin: 0 0 5px 0;">제목</p>
            <p style="margin: 0 0 5px 0;"><input class="h-faq-title" name="title" id="title" style="font-size: 15px;"
            value='<c:out value="${faq.title }"/>' readonly="readonly"></p>
        </div>
        <div>
            <p style="text-align: left; margin: 0 0 5px 0;">내용</p>
            <p style="margin: 0;"><textarea class="h-faq-content" name="cn" id="cn" style="height: 163px; font-size: 15px;"
            readonly="readonly"><c:out value="${faq.cn }"/></textarea></p>
        </div>
        <div style="margin:15px 150px 0 0; float: right;">
            <button type="button" class="h-faq-btn" data-oper="list" onclick="location.href='/help/faq'">목록</button>
		  
		  <form id="operForm" action="/help/faq" method="get">
          	<input type="hidden" id="faqId" name="faqId" value='<c:out value="${faq.faqId }"/>'>
          	<input type="hidden" name='pageNum' value='<c:out value="${adCri.pageNum}"/>'>
          	<input type="hidden" name='amount' value='<c:out value="${adCri.amount}"/>'>
          	<input type="hidden" name='keyword' value='<c:out value="${adCri.keyword}"/>'>
          </form>
        </div>
    </div>
</div><!--인크루드 하는 페이지에 넣기-->
</div><!--인크루드 하는 페이지에 넣기-->

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 <script type="text/javascript">
 $(document).ready(function(){
	document.getElementById("h-help-faq").style="background-color: rgb(10 29 74); color: white;";
	
	var operForm = $("#operForm");
	
	$("button[data-oper='list']").on("click", function(e){
		operForm.find('#faqId').remove();
		operForm.attr("action", "/help/faq")
		operForm.submit();
	});
 });
</script>
</body>
<%@include file="/WEB-INF/views/include/footer.jsp" %>
</html>