<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<script>
//권한체크
let msg ='${msg}';

if(msg != ''){
	alert(msg);
	location.href = '/';
}
</script>
<meta charset="UTF-8">
<title>FAQ조회</title>
<link rel="stylesheet" href="/resources/css/faqregisterHead.css">
<!-- 관리자 페이지   -->
<%@include file="/WEB-INF/views/include/adminMenu.jsp" %>
<style>
.h-faq-body {
	margin-left: 100px;
}
</style>
</head>
<body>
	<h3 style="margin: 0 0 10px 15px;">[ FAQ 조회하기 ]</h3>
    <div class="h-faq-body">
        <div style="margin-bottom: 10px;">
       		<p style="text-align: left; margin: 0;">번호</p>
            <p style="margin: 0;"><input class="h-faq-title" name="faqId" 
            value='<c:out value="${faq.faqId }"/>' readonly="readonly"></p>
        </div>
        <div style="margin-bottom: 10px;">
            <p style="text-align: left; margin: 0;">제목</p>
            <p style="margin: 0;"><input class="h-faq-title" name="title"
            value='<c:out value="${faq.title }"/>' readonly="readonly"></p>
        </div>
        <div style="margin-bottom: 10px;">
            <p style="text-align: left; margin: 0;">내용</p>
            <p style="margin: 0;"><textarea class="h-faq-content" name="cn"
            readonly="readonly"><c:out value="${faq.cn }"/></textarea></p>
        </div>
        <div style="margin:15px 150px 0 0; float: right;">
            <button type="button" class="h-faq-btn" data-oper="modify"
            onclick="location.href='/admin/faqmodify?faqId=<c:out value="${faq.faqId}"/>'">수정</button>
            <button type="button" class="h-faq-btn" data-oper="list" onclick="location.href='/admin/faqlist'">목록</button>
        
          <form id="operForm" action="/admin/faqmodify" method="get">
          	<input type="hidden" id="faqId" name="faqId" value='<c:out value="${faq.faqId }"/>'>
          	<input type="hidden" name='pageNum' value='<c:out value="${adCri.pageNum}"/>'>
          	<input type="hidden" name='amount' value='<c:out value="${adCri.amount}"/>'>
          	<input type="hidden" name='keyword' value='<c:out value="${adCri.keyword}"/>'>
          </form>
        </div>
    </div>
</div><!--인크루드 하는 페이지에 넣기-->
</div><!--인크루드 하는 페이지에 넣기-->
</div><!--인크루드 하는 페이지에 넣기-->

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 <script type="text/javascript">
 $(document).ready(function(){
	document.getElementById("h-admin-faq").style="background-color: rgb(10, 29, 74); color: white;";
	
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function(e){
		
		operForm.attr("action", "/admin/faqmodify").submit();
		
	});
	
	$("button[data-oper='list']").on("click", function(e){
		operForm.find('#faqId').remove();
		operForm.attr("action", "/admin/faqlist")
		operForm.submit();
	})
 });
     </script>
</body>
<%@include file="/WEB-INF/views/include/footer.jsp" %>
</html>