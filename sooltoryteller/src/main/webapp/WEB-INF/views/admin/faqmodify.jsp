<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/views/include/adminMenu.jsp" %>
<%@include file="/resources/css/faqregisterHead.css" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ조회</title>



</head>
<body>
	<h3 style="margin-left: 50px;">[FAQ 수정하기]</h3>
    <div class="h-faq-body">
       <form action="/admin/faqmodify" method="post">
        <input type="hidden" name="pageNum" value='<c:out value="${adCri.pageNum }"/>'>
        <input type="hidden" name="amount" value='<c:out value="${adCri.amount }"/>'>
        <div>
       		<p style="text-align: left; margin: 0;">번호(일단 수기로 입력쓰)</p>
            <p style="margin: 0;"><input class="h-faq-title" name="faqId" 
            value='<c:out value="${faq.faqId }"/>' readonly="readonly"></p>
        </div>
        <div>
            <p style="text-align: left; margin: 0;">제목</p>
            <p style="margin: 0;"><input class="h-faq-title" name="title"
            value='<c:out value="${faq.title }"/>'></p>
        </div>
        <div>
            <p style="text-align: left; margin: 0;">내용</p>
            <p style="margin: 0;"><textarea class="h-faq-content" name="cn"><c:out value="${faq.cn }"/></textarea></p>
        </div>
        <div>
        	<p><input type="hidden" name="regdate"
        	 value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${faq.regdate}"/>' readonly="readonly">
        </div>
        <div>
        	<p><input type="hidden" name="updatedate"
        	 value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${faq.updatedate}"/>' readonly="readonly">
        </div>
        
        <div style="margin-top:20px;">
            <button type="submit" data-oper='modify' class="h-faq-btn">수정</button>
            <button type="button" data-oper='remove' class="h-faq-btn">삭제</button>
            <button type="button" data-oper='list' class="h-faq-btn">목록</button>
        </div>

    </div>
</form>
</div><!--인크루드 하는 페이지에 넣기-->
</div><!--인크루드 하는 페이지에 넣기-->


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 <script type="text/javascript">
 $(document).ready(function(){
	document.getElementById("h-admin-faq").style="background-color: navy;color: white;";
	
	var formObj = $("form");
	
	$('button').on("click", function(e){
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'remove'){
			formObj.attr("action", "/admin/faqremove");
		}else if(operation === 'list'){
			formObj.attr("action", "/admin/faqlist").attr("method", "get");
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
		}
		formObj.submit();
		
	})
	
		
		
 });
     </script>
</body>
</html>