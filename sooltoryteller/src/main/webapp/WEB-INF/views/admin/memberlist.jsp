<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
<link rel="stylesheet" href="/resources/css/memberListHead.css">
<meta charset="UTF-8">
<title>회원관리</title>
</head>
<body>
    <h3 style="margin: 0 0 10px 15px;">[ 회원관리 ]</h3>
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
         <%-- <td><a class='h-move' href="<c:out value='${member.memberId }'/>"><c:out value="${member.email }"/></a></td> --%>
		 <td class="s-email"><c:out value="${member.email }"/></td>
         <td><c:out value="${member.name }"/></td>
         <td><c:out value="${member.telno }"/></td>
         <td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.regdate }"/></td>
         <td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.updatedate }"/></td>
         <td>

         <c:choose>
        		 <c:when test="${member.regstus  == 'JN'.toString()}">
        		 	<a class="h-admin-withdraw" href="<c:out value='${member.memberId }'/>">가입</a>
        		 </c:when>
        		 <c:when test="${member.regstus  == 'WD'.toString()}">
        		      탈퇴
        		 </c:when>	
        	 </c:choose>
         
         </td>
         </tr>
         </c:forEach>
        </table>
        
         <!-- 검색   -->
        <div class='h-search-content'>
           <form id='h-searchForm' action="/admin/memberlist" method='get'>
           	<select name='type'>
           		<option value="" <c:out value="${pageMaker.adCri.type == null ? 'selected' : '' }"/>>--</option>
           		<option value="E" <c:out value="${pageMaker.adCri.type eq 'E' ? 'selected' : '' }"/>>이메일</option>
           		<option value="N" <c:out value="${pageMaker.adCri.type eq 'N' ? 'selected' : '' }"/>>닉네임</option>
           		<option value="T" <c:out value="${pageMaker.adCri.type eq 'T' ? 'selected' : '' }"/>>전화번호</option>
           	</select>
             <input type='text' id ='h-keyword' name='keyword' maxlength="30"
             value='<c:out value="${pageMaker.adCri.keyword}"/>'/>
             <input type="hidden" name='pageNum' value='<c:out value="${pageMaker.adCri.pageNum}"/>'/>
          	 <input type="hidden" name='amount' value='<c:out value="${pageMaker.adCri.amount}"/>'/>
          	 <button type='submit' class="h-faq-searchbtn">검색</button>
           </form>
        </div>
        
        
        
        
        
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
			<input type="hidden" name="type" value='<c:out value="${pageMaker.adCri.type }"/>'>
			<input type="hidden" name="keywoed" value='<c:out value="${pageMaker.adCri.keyword }"/>'>
		</form>

	</div><!--인크루드 하는 페이지에 넣기-->
    </div><!--인크루드 하는 페이지에 넣기-->
    </div><!--인크루드 하는 페이지에 넣기-->
    
    
    <!-- 회원 탈퇴 모달창 -->
	<div id="h-withdrawal-Modal" class="h-modal">
    <div class="h-modal-content">
    <span class="h-close"  style="cursor: pointer; margin-right: 10px">&times;</span>
	<p style="text-align: center; margin: 30px 0 10px 0;">해당 회원을 탈퇴 시키겠습니까??</p>
	<p style="text-align: center;"><button type="button" class="h-btn" id="h-YESbtn">YES</button> <button type="button" class="h-btn" id="h-NObtn">NO</button></p>
   </div>
   </div>
   
	<%-- <!-- 회원 게시글 모달창 -->
	<div class="s-bbst-modal">
		<table>
			<thead>
				<!-- 제목, 작성일시, 조회수, 좋아요수, 댓글수 -->
				<tr>	
					<th>제목</th>
					<th>작성일시</th>
					<th>조회수</th>
					<th>좋아요수</th>
					<th>댓글수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:if test="${ }"
					<td><c:out value="${}"</td>
					<td><c:out value="${}"</td>
					<td><c:out value="${}"</td>
					<td><c:out value="${}"</td>
				</tr>
			</tbody>
		</table>
	</div> --%>
   
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 <script type="text/javascript">
 
 
    $(document).ready(function(){
    	//회원관리 버튼 눌린 표시
		document.getElementById("h-admin-list").style="background-color: rgb(10, 29, 74); color: white;";
		
		var actionForm = $("#h-actionForm");
		
		//회원 탈퇴 모달창 열기
		$(".h-admin-withdraw").on("click", function(e){
			e.preventDefault();
			actionForm.empty();
			actionForm.append("<input type='hidden' name='memberId' value='"+$(this).attr("href")+"'>");
			$("#h-withdrawal-Modal").show();
		});
		
		//모달창 닫기 버튼
		$(".h-close").on("click", function(e){
			$("#h-withdrawal-Modal").hide();
		});
		
		//NO버튼
		$("#h-NObtn").on("click", function(e){
			$("#h-withdrawal-Modal").hide();
		});
		
		//YES버튼
		$("#h-YESbtn").on("click", function(e){
        	e.preventDefault();
			actionForm.attr("action", "/admin/withdraw");
			actionForm.submit();
		});
		
    	$(".h-paginate_button a").on("click", function(e){
    		
    		e.preventDefault();
    		
    		console.log('click');
    		
    		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    		actionForm.submit();
    	});
    	
 /*   회원 게시물, 댓글 조회(보류)
      $(".h-move").on("click", function(e){
    	e.preventDefault();
    	actionForm.append("<input type='hidden' name='memberId' value='"+$(this).attr("href")+"'>");
    	actionForm.attr("action", "/admin/faqget");
    	actionForm.submit();
    }); 
 */
 	
 
    	//검색 유효성 검사
    	$("#h-searchForm button").on("click", function(e){
    		
    	let searchForm = $("#h-searchForm");
    	let keyword = $("#h-keyword").val();
    	
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