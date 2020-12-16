<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/views/include/adminMenu.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<style>

	table {
      border-collapse: collapse;
      width: 1000px;
      margin-left: 20px;
    }
        
    td, th {
      border-bottom: 1px solid #dddddd;
      text-align: left;
      padding: 8px;
    }
        
    tr:nth-child(even) {
      background-color: #d8e1f1;;
    }
    
    ul{
      list-style:none;
    }   
    
    a{
      text-decoration: none;
      color: black;
    }
    
	.h-pagination {
  	  display: inline-block;
	}
	
	.h-pagination li {
  	  color: black;
  	  float: left;
  	  padding: 8px 16px;
  	}
  	
  	.h-pagination li.active{
  	  background-color: navy;
  	}
  	
	.h-pagination li.active >a {
  	  font-weight:bold;
  	  color: white;
	}

.h-pagination li:hover:not(.active) {background-color: #ddd;}
</style>
</head>
<body>
    <h3 style="margin-left: 20px;">[회원관리]</h3>
        <table>
        <thead>
          <tr>
          	<th>회원 일련번호</th>
            <th>이메일</th>
            <th>닉네임</th>
            <th>전화번호</th>
            <th>가입일시</th>
            <th>변경일시</th>
            <th>가입상태</th>
          </tr>
         </thead>
         
         <c:forEach items="${memberlist }" var="member">
         <tr>
         <td><c:out value='${member.memberId }'/></td>
         <!-- 251p get 만들어야함 [보류]-->
         <!-- <td><a class='h-move' href="<c:out value='${member.memberId }'/>"><c:out value="${member.email }"/></a></td> -->
		 <td><c:out value="${member.email }"/></td>
         <td><c:out value="${member.name }"/></td>
         <td><c:out value="${member.telno }"/></td>
         <td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.regdate }"/></td>
         <td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.updatedate }"/></td>
         <td><c:out value="${member.regstus }"/></td>
         </tr>
         </c:forEach>
        </table>
        
        <div class="pull-right">
        	<ul class="h-pagination">
        	
        	<c:if test="${pageMaker.prev}">
        	  <li class="h-paginate_button previous"><a href="${pageMaker.startPage -1}">&laquo;</a>
        	  </li>
        	  </c:if>
        	  
        	  <c:forEach var="num" begin="${pageMaker.startPage}"
        	  	end="${pageMaker.endPage }">
        	  <li class="h-paginate_button ${pageMaker.adCri.pageNum == num ? "active":""}"><a href="${num}">${num}</a></li>
        	  </c:forEach>
        	  
        	  <c:if test="${pageMaker.next }">
        	  <li class="h-paginate_button next"><a href="${pageMaker.endPage +1}">&raquo;</a></li>
        	  </c:if>
        	</ul>
		</div>
		<form id="h-actionForm" action="/admin/memberlist" method='get'>
			<input type="hidden" name="pageNum" value="${pageMaker.adCri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.adCri.amount }">
		</form>

    </div><!--인크루드 하는 페이지에 넣기-->
    </div><!--인크루드 하는 페이지에 넣기-->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 <script type="text/javascript">
 
 
    $(document).ready(function(){
    	//회원관리 버튼 눌린 표시
		document.getElementById("h-admin-list").style="background-color: navy;color: white;";
	 
    	var actionForm = $("#h-actionForm");
    	
    	$(".h-paginate_button a").on("click", function(e){
    		
    		e.preventDefault();
    		
    		console.log('click');
    		
    		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    		actionForm.submit();
    	});
    	
      $(".h-move").on("click", function(e){
    	e.preventDefault();
    	actionForm.append("<input type='hidden' name='memberId' value='"+$(this).attr("href")+"'>");
    	actionForm.attr("action", "/admin/faqget");
    	actionForm.submit();
    }); 
    });	
    		
    
    
    </script>
</body>
</html>