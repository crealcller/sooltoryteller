<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/views/include/adminMenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 조회</title>
<link rel="stylesheet" href="/resources/css/getinquiryHead.css">
<!-- 관리자 페이지   -->


</head>
<body>
	<h3 style="margin-left: 50px;">[1:1문의 조회]</h3>
    <div class="h-inq-body">
        <div>
       		<p style="text-align: left; margin: 0;">번호(일단 수기로 입력쓰)</p>
            <p style="margin: 0;"><input class="h-inq-title" name="inquiryId" 
            value='<c:out value="${inq.inquiryId }"/>' readonly="readonly"></p>
        </div>
        <div>
            <p style="text-align: left; margin: 0;">작성자</p>
            <p style="margin: 0;"><input class="h-inq-title" name="name"
            value='<c:out value="${inq.name }"/>' readonly="readonly"></p>
        </div>
        <div>
            <p style="text-align: left; margin: 0;">제목</p>
            <p style="margin: 0;"><input class="h-inq-title" name="title"
            value='<c:out value="${inq.title }"/>' readonly="readonly"></p>
        </div>
         <div>
            <p style="text-align: left; margin: 0;">내용</p>
            <p style="margin: 0;"><textarea class="h-inq-content" name="cn"
            readonly="readonly"><c:out value="${inq.cn }"/></textarea></p>
        </div>
        <div style="margin-top:20px;">
            <button type="button" class="h-inq-btn" data-oper="answer"
            onclick="location.href='/admin/answer?inquiryId=<c:out value="${inq.inquiryId}"/>'">답변</button>
            <button type="button" class="h-inq-btn" data-oper="list" onclick="location.href='/admin/inquirylist'">목록</button>

         <form id="operForm" action="/admin/answer" method="get">
          	<input type="hidden" id="inquiryId" name="inquiryId" value='<c:out value="${inq.inquiryId}"/>'>
          	<input type="hidden" name='pageNum' value='<c:out value="${adCri.pageNum}"/>'>
          	<input type="hidden" name='amount' value='<c:out value="${adCri.amount}"/>'>
          </form>

        </div>
    </div>

</div><!--인크루드 하는 페이지에 넣기-->
</div><!--인크루드 하는 페이지에 넣기-->


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 <script type="text/javascript">
 $(document).ready(function(){
		document.getElementById("h-admin-inqlist").style="background-color: navy;color: white;";
 
 });
</script>
</body>
</html>