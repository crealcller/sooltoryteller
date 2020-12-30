<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 답변조회</title>
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
	<h3 style="margin-left: 50px;">[1:1문의 답변조회]</h3>
    <div class="h-inq-body">
        <div>
       		<p style="text-align: left; margin: 0;">번호</p>
            <p style="margin: 0;"><input class="h-inq-title" name="inquiryId" 
            value='<c:out value="${answer.inquiryId }"/>' readonly="readonly"></p>
        </div>
        
         <div>
            <p style="text-align: left; margin: 0;">내용</p>
            <p style="margin: 0;"><textarea class="h-inq-content" name="cn"
            readonly="readonly"><c:out value="${answer.cn }"/></textarea></p>
        </div>
        <div style="float: right; margin-right: 150px;">
            <button type="button" class="h-inq-btn" data-oper="list" onclick="location.href='/admin/inquirylist'">목록</button>
        </div>
     </div>

    </div>

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