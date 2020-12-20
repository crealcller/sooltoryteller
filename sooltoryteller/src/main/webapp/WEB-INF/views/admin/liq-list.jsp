<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/views/include/adminMenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전통주 리스트</title>
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
<h3 style="margin-left: 20px;">[전통주 리스트]</h3>
        <table>
        <thead>
          <tr>
          	<th>전통주 일련번호</th>
            <th>이름</th>
            <th>주종</th>
            <th>양조장</th>
            <th>등록일시</th>
            <th>변경일시</th>
          </tr>
         </thead>
         
         <c:forEach items="${liq }" var="liq">
         <tr>
         <td><c:out value='${liq.liqId }'/></td>
         <td><a class='h-move' href="<c:out value='${liq.liqId }'/>"><c:out value="${liq.nm }"/></a></td>
         <td><c:out value='${liq.cate }'/></td>
         <td><c:out value="${liq.liqCo.nm }"/></td>
         <td><fmt:formatDate pattern="yyyy-MM-dd" value="${liq.regdate }"/></td>
         <td><fmt:formatDate pattern="yyyy-MM-dd" value="${liq.updatedate }"/></td>
         </tr>
         </c:forEach>
        </table>
	<div class="pull-right">
		<ul class="h-pagination">

			<c:if test="${pageMaker.prev}">
				<li class="h-paginate_button previous"><a
					href="${pageMaker.startPage -1}">&laquo;</a></li>
			</c:if>

			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage }">
				<li
					class="h-paginate_button ${pageMaker.adCri.pageNum == num ? 'active':""}"><a
					href="${num}">${num}</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next }">
				<li class="h-paginate_button next"><a
					href="${pageMaker.endPage +1}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
	<form id="h-actionForm" action="/admin/liq-list" method='get'>
			<input type="hidden" name="pageNum" value="${pageMaker.adCri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.adCri.amount }">
	</form>
        
 <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 <script type="text/javascript">
 
 
    $(document).ready(function(){
    	
    	$("#d-liq-list").css('background-color', 'navy').css('color','white');
		$(".h-paginate_button a").on("click", function(e){
    		
    		e.preventDefault();
    		
    		console.log('click');
    		
    		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    		actionForm.submit();
    	});
    	
    	var actionForm = $("#h-actionForm");
    	
      $(".h-move").on("click", function(e){
    	e.preventDefault();
    	actionForm.append("<input type='hidden' name='liqId' value='"+$(this).attr("href")+"'>");
    	actionForm.attr("action", "/admin/get-liq");
    	actionForm.submit();
    	}); 
    });	
    		
    
    
    </script>
</body>
</html>