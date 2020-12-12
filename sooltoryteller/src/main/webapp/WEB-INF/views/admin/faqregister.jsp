<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/views/include/adminMenu.jsp" %>
<%@include file="/resources/css/faqregisterHead.css" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ등록</title>



</head>
<body>
	<h3 style="margin-left: 50px;">[FAQ 등록하기]</h3>
    <div class="h-faq-body">
        <form action="/admin/faqregister" method="POST">
        <div>
       		<p style="text-align: left; margin: 0;">번호(일단 수기로 입력쓰)</p>
            <p style="margin: 0;"><input class="h-faq-title" name="faqId"></p>
        </div>
        <div>
            <p style="text-align: left; margin: 0;">제목</p>
            <p style="margin: 0;"><input class="h-faq-title" name="title"></p>
        </div>
        <div>
            <p style="text-align: left; margin: 0;">내용</p>
            <p style="margin: 0;"><textarea class="h-faq-content" name="cn"></textarea></p>
        </div>
        <div style="margin-top:20px;">
            <button type="submit" class="h-faq-btn">등록</button>
            <button type="button" class="h-faq-btn" onclick="location.href='/admin/faqlist'">목록</button>
        </div>
        </form>

    </div>

</div><!--인크루드 하는 페이지에 넣기-->
</div><!--인크루드 하는 페이지에 넣기-->


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 <script type="text/javascript">
 $(document).ready(function(){
		document.getElementById("h-admin-faq").style="background-color: navy;color: white;";
 });
     </script>
</body>
</html>