<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 조회</title>
<link rel="stylesheet" href="/resources/css/getinquiryHead.css">
<!-- 관리자 페이지   -->
<script>
//권한체크
let msg ='${msg}';

if(msg != ''){
	alert(msg);
	location.href = '/';
}
</script>
<%@include file="/WEB-INF/views/include/adminMenu.jsp" %>
</head>
<body>
	<h3 style="margin: 0 0 10px 15px;">[ 1:1 문의 조회 ]</h3>
    <div class="h-inq-body">
        <div style="margin-bottom: 10px;">
       		<p style="text-align: left; margin: 0;">번호</p>
            <p style="margin: 0;"><input class="h-inq-title" name="inquiryId" style="height: 24px;"
            value='<c:out value="${inq.inquiryId }"/>' readonly="readonly"></p>
        </div>
        <div style="margin-bottom: 10px;">
            <p style="text-align: left; margin: 0;">작성자</p>
            <p style="margin: 0;"><input class="h-inq-title" name="name" style="height: 24px;"
            value='<c:out value="${inq.name }"/>' readonly="readonly"></p>
        </div>
        <div style="margin-bottom: 10px;">
            <p style="text-align: left; margin: 0;">제목</p>
            <p style="margin: 0;"><input class="h-inq-title" name="title" style="height: 24px;"
            value='<c:out value="${inq.title }"/>' readonly="readonly"></p>
        </div>
         <div>
            <p style="text-align: left; margin: 0;">내용</p>
            <p style="margin: 0;"><textarea class="h-inq-content" name="cn" style="height: 160px;"
            readonly="readonly"><c:out value="${inq.cn }"/></textarea></p>
        </div>
        <div style="margin:20px 150px 0 0; float: right;">
        <!-- 답변 완료 상태면 답변 버튼 숨기기 -->
        <c:choose>
        		 <c:when test="${inq.inqstus == 'IC'.toString()}">
        		 	<button type="button" class="h-inq-btn" data-oper="answer"
          			  onclick="location.href='/admin/answer?inquiryId=<c:out value="${inq.inquiryId}"/>'" style="display:none;">답변</button>
        		 </c:when>
        		 <c:otherwise>
        		  <button type="button" class="h-inq-btn" data-oper="answer"
           			  onclick="location.href='/admin/answer?inquiryId=<c:out value="${inq.inquiryId}"/>'">답변</button>
        		 </c:otherwise>
        	 </c:choose>
        	 
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
</div><!--인크루드 하는 페이지에 넣기-->

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 <script type="text/javascript">
 $(document).ready(function(){
		document.getElementById("h-admin-inqlist").style="background-color: rgb(10 29 74); color: white;";
 
 });
</script>
</body>
<%@include file="/WEB-INF/views/include/footer.jsp" %>
</html>