<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%@include file="/WEB-INF/views/include/adminMenu.jsp" %> 
<meta charset="UTF-8">
<title>양조장 리스트</title>
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
      background-color: rgb(238 243 255);
    }
    
    ul{
      list-style:none;
    }   
    
    a{
      text-decoration: none;
      color: black;
    }
    
    .pull-right{
      padding-top: 13px;
      text-align: right;
    }
    
	.h-pagination {
  	  display: inline-block;
	}
	
	.h-pagination li {
  	  color: black;
  	  float: left;
  	  padding: 4px 10px;
  	}
  	
  	.h-pagination li.active{
  	  background-color: rgb(10, 29, 74);
  	}
  	
	.h-pagination li.active >a {
  	  font-weight:bold;
  	  color: white;
	}

.h-pagination li:hover:not(.active) {background-color: rgb(80 98 140);}
</style>
</head>
<body>

 <h3 style="margin: 0 0 10px 15px;">[ 양조장 관리 ]</h3>
        <table>
        <thead>
          <tr>
          	<th>양조장 일련번호</th>
            <th>이름</th>
            <th>연락처</th>
            <th>등록일시</th>
            <th>변경일시</th>
          </tr>
         </thead>
         
         <c:forEach items="${liqCo }" var="liqCo">
         <tr>
         <td><c:out value='${liqCo.liqCoId }'/></td>
         <!-- 251p get 만들어야함 -->
         <td><a class='h-move' href="<c:out value='${liqCo.liqCoId }'/>"><c:out value="${liqCo.nm }"/></a></td>
         <td><c:out value="${liqCo.telno }"/></td>
         <td><fmt:formatDate pattern="yyyy-MM-dd" value="${liqCo.regdate }"/></td>
         <td><fmt:formatDate pattern="yyyy-MM-dd" value="${liqCo.updatedate }"/></td>
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

	<form id="h-actionForm" action="/admin/liq-co-list" method='get'>
			<input type="hidden" name="pageNum" value="${pageMaker.adCri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.adCri.amount }">
	</form>
		
</div><!--인크루드 하는 페이지에 넣기-->
</div><!--인크루드 하는 페이지에 넣기-->
</div><!--인크루드 하는 페이지에 넣기-->
<%@include file="/WEB-INF/views/include/footer.jsp" %>
        
 <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 <script type="text/javascript">
 
    $(document).ready(function(){
    	
		$("#d-liq-co-list").css('background-color', 'rgb(10, 29, 74)').css('color','white');
		
    	$(".h-paginate_button a").on("click", function(e){
    		
    		e.preventDefault();
    		
    		console.log('click');
    		
    		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    		actionForm.submit();
    	});
    	
    	var actionForm = $("#h-actionForm");
    	
      $(".h-move").on("click", function(e){
    	e.preventDefault();
    	actionForm.append("<input type='hidden' name='liqCoId' value='"+$(this).attr("href")+"'>");
    	actionForm.attr("action", "/admin/get-liq-co");
    	actionForm.submit();
    	}); 
    });	
    
    </script>
</body>
</html>