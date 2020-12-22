<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="/resources/css/inquirylistHead.css">
<meta charset="UTF-8">
<title>1:1문의</title>
<!-- 관리자   -->
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
<div>
    <h3 style="margin-left: 20px;">[1:1문의]</h3>
        
        <table>
        <thead>
          <tr>
          	<th>번호</th>
            <th>작성자</th>
            <th>제목</th>
            <th>문의 작성일</th>
            <th>답변 등록일</th>
            <th>답변 상태</th>
          </tr>
         </thead>
         
         <c:forEach items="${inquirylist }" var="inq">
         <tr>
         <td><c:out value="${inq.inquiryId }"/></td>
         <td><c:out value="${inq.name }"/></td>
         <td><a class="h-move" href='<c:out value="${inq.inquiryId}"/>'><c:out value="${inq.title }"/></a></td>
         <td><fmt:formatDate pattern="yyyy-MM-dd" value="${inq.inqRegdate }"/></td>
         <td><fmt:formatDate pattern="yyyy-MM-dd" value="${inq.anRegdate }"/></td>
         <td>
        	 <c:choose>
        		 <c:when test="${empty inq.anstus}">
        		 	미확인
        		 </c:when>
        		 <c:when test="${inq.anstus  == 'AW'.toString()}">
        		 	답변 대기
        		 </c:when>
        		 <c:when test="${inq.anstus  == 'AC'.toString()}">
        		 <a href="/admin/getanswer?inquiryId=<c:out value='${inq.inquiryId}'/>">답변 완료</a>
        		 </c:when>	
        	 </c:choose>
     	  	</td>
         </tr>
         </c:forEach>
        </table>
        
        <!-- 검색   -->
        <div class='h-search-content'>
           <form id='h-searchForm' action="/admin/inquirylist" method='get'>
           	<select name='type'>
           		<option value="" <c:out value="${pageMaker.adCri.type == null ? 'selected' : '' }"/>>--</option>
           		<option value="T" <c:out value="${pageMaker.adCri.type eq 'T' ? 'selected' : '' }"/>>제목</option>
           		<option value="N" <c:out value="${pageMaker.adCri.type eq 'C' ? 'selected' : '' }"/>>작성자</option>
           		<option value="TN" <c:out value="${pageMaker.adCri.type eq 'TC' ? 'selected' : '' }"/>>제목 or 작성자</option>
           	</select>
             <input type='text' id ='h-keyword' name='keyword' maxlength="30"
             value='<c:out value="${pageMaker.adCri.keyword}"/>'/>
             <input type="hidden" name='pageNum' value='<c:out value="${pageMaker.adCri.pageNum}"/>'/>
          	 <input type="hidden" name='amount' value='<c:out value="${pageMaker.adCri.amount}"/>'/>
          	 <button type='submit' class="h-faq-searchbtn">검색</button>
           </form>
        </div>
        
		<!-- 페이징 -->        
        <div class="pull-right">
        	<ul class="h-pagination">
        	
        	<c:if test="${pageMaker.prev}">
        	  <li class="h-paginate_button previous"><a href="${pageMaker.startPage -1}">&laquo;</a>
        	  </li>
        	  </c:if>
        	  
        	  <c:forEach var="num" begin="${pageMaker.startPage}"
        	  	end="${pageMaker.endPage }">
        	  <li class="h-paginate_button ${pageMaker.adCri.pageNum == num ? 'active':""}"><a href="${num}">${num}</a></li>
        	  </c:forEach>
        	  
        	  <c:if test="${pageMaker.next }">
        	  <li class="h-paginate_button next"><a href="${pageMaker.endPage +1}">&raquo;</a></li>
        	  </c:if>
        	</ul>
		</div>
		<form id="h-actionForm" action="/admin/inquirylist" method='get'>
			<input type="hidden" name="pageNum" value="${pageMaker.adCri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.adCri.amount }">
			<input type="hidden" name="type" value='<c:out value="${pageMaker.adCri.type }"/>'>
			<input type="hidden" name="keywoed" value='<c:out value="${pageMaker.adCri.keyword }"/>'>
			
			
		</form>


    </div><!--인크루드 하는 페이지에 넣기-->
    </div><!--인크루드 하는 페이지에 넣기-->
  <!-- Modal  추가 -->   
<div id="h-myModal" class="h-modal">
  <div class="h-modal-content">
    <span class="h-close">&times;</span>
   <p style="text-align: center;" class="h-modal-body">처리가 완료되었습니다.</p>
   <p style="text-align: center;"><button type="button" class="h-btn" id="h-YESbtn">확인</button></p>
   </div>
</div>
    
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 <script type="text/javascript">
 $(document).ready(function(){
		document.getElementById("h-admin-inqlist").style="background-color: navy;color: white;";
		
		var result = '<c:out value="${result}"/>';
		var modal = document.getElementById("h-myModal");
		var span = document.getElementsByClassName("h-close")[0];
		var YESbtn = document.getElementById("h-YESbtn");
		
		checkModal(result);
		
		history.replaceState({}, null, null);
		
		function checkModal(result){
			
			if(result === '' || history.state){
				return;
			}
			
			if(result){
				alert(result);
				$(".h-modal-body").html("문의 답변이  전송 되었습니다.");
				modal.style.display = "block";
			}
			
		}
		//모달창 닫기버튼
		span.onclick = function() { modal.style.display = "none";}
		YESbtn.onclick = function(){modal.style.display = "none";}
		
		
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
        	actionForm.append("<input type='hidden' name='inquiryId' value='"+$(this).attr("href")+"'>");
        	actionForm.attr("action", "/admin/getinquiry");
        	actionForm.submit();
        }); 
    	
  	
    	//검색 유효성 검사
    	
    	$("#h-searchForm button").on("click", function(e){
    		
    	let searchForm = $("#h-searchForm");
    	let keyword = $("#h-keyword").val();
    	
    	/*	if(!searchForm.find("option:selected").val()){
				alert("검색 종류를 선택하세요.");
				return false;
			}
    		if(!searchForm.find("input[name='keyword']").val()){
    			alert("키워드를 입력하세요");
    			return false;
    		}
    		*/
    		
    	searchForm.find("input[name='pageNum']").val("1");
    	$('#h-keyword').val(keyword.trim());
    	e.preventDefault();
    	
    	searchForm.submit();
    		
    	});
    	
    	$("#h-keyword").keyup(function(){
    		
    	 	if($(this).val().lenght > $(this).attr('maxlength')){
     			$(this).val($(this).val().substr(0, $(this).attr('maxlength')));
     		}
     
    	});
    	
  
 });
     </script>
</body>
<%@include file="/WEB-INF/views/include/footer.jsp" %>
</html>