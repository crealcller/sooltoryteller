<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/views/include/topmenu.jsp" %>
<%@include file="/WEB-INF/views/include/servicesidebar.jsp" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet" href="/resources/css/helpfaqHead.css">
</head>
<body>
<h3 style="margin: 0 0 10px 20px;">자주묻는 질문</h3>
        <table>
        <thead>
          <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성일</th>
            <th>변경일</th>
          </tr>
          </thead>
          <c:forEach items="${faq }" var="faq">
         <tr>
         <td><c:out value="${faq.faqId }"/></td>
         <td><a class="h-move" href='<c:out value="${faq.faqId}"/>'><c:out value="${faq.title }"/></a></td>
         <td><fmt:formatDate pattern="yyyy-MM-dd" value="${faq.regdate }"/></td>
         <td><fmt:formatDate pattern="yyyy-MM-dd" value="${faq.updatedate }"/></td>
         </tr>
         </c:forEach>
        </table>

		<!-- 검색   -->
        <div class='h-search-content'>
           <form id='h-searchForm' action="/help/faq" method='get'>
             <input type='text' id ='h-keyword' name='keyword' value='<c:out value="${pageMaker.adCri.keyword}"/>'>
             <input type="hidden" name='pageNum' value='<c:out value="${pageMaker.adCri.pageNum}"/>'>
          	 <input type="hidden" name='amount' value='<c:out value="${pageMaker.adCri.amount}"/>'>
          	 <button type='submit' class="h-faq-searchbtn">검색</button>
           </form>
        </div>

		<!-- 페이징처리 -->
		<div class="pull-right">
        	<ul class="h-pagination">
        	
        	<c:if test="${pageMaker.prev}">
        	  <li class="h-paginate_button previous"><a href="${pageMaker.startPage -1}">&laquo;</a>
        	  </li>
        	  </c:if>
        	  
        	  <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage }">
        	  <li class="h-paginate_button ${pageMaker.adCri.pageNum == num ? 'active':""}"><a href="${num}">${num}</a></li>
        	  </c:forEach>
        	  
        	  <c:if test="${pageMaker.next }">
        	  <li class="h-paginate_button next"><a href="${pageMaker.endPage +1}">&raquo;</a></li>
        	  </c:if>
        	</ul>
		</div>
		<form id="h-actionForm" action="/help/faq" method='get'>
			<input type="hidden" name="pageNum" value="${pageMaker.adCri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.adCri.amount }">
			<input type="hidden" name="keyword" value="${pageMaker.adCri.keyword }">
		</form>





    </div><!--인크루드 하는 페이지에 넣기-->
    </div><!--인크루드 하는 페이지에 넣기-->
    
    
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 <script type="text/javascript">
 $(document).ready(function(){
		document.getElementById("h-help-faq").style="background-color: rgb(181, 135, 189); color: white;";
		var actionForm = $("#h-actionForm");
		
    	//페이지 버튼
    	$(".h-paginate_button a").on("click", function(e){
    		
    		e.preventDefault();
    		
    		console.log('click');
    		
    		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    		actionForm.submit();
    	});
    	
    	//게시글 조회
    	$(".h-move").on("click", function(e){
        	e.preventDefault();
        	actionForm.append("<input type='hidden' name='faqId' value='"+$(this).attr("href")+"'>");
        	actionForm.attr("action", "/help/faqget");
        	actionForm.submit();
        }); 
    	
    	//검색 유효성 검사
    	let searchForm = $("#h-searchForm");
    	
    	$("#h-searchForm button").on("click", function(e){
    	let keyword = $("#h-keyword").val();
    		
    		if(!searchForm.find("input[name='keyword']").val()){
    			alert("키워드를 입력하세요");
    			return false;
    		}
    		
    	searchForm.find("input[name='pageNum']").val("1");
    	$('#h-keyword').val(keyword.trim());
    	e.preventDefault();
    	
    	searchForm.submit();
    		
    	});
 });
 </script>
</body>
</html>