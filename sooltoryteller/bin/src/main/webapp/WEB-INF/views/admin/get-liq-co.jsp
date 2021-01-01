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
<title>양조장 관리</title>
</head>
<body>
<h3 style="margin: 0 0 10px 15px;">[ 양조장 수정/삭제 ]</h3>
<div class="d-admin-con">
<form id="modify" action="/admin/modify-liq-co" method="post">
<div class="d-admin-half-con">
<div class="d-inputs">
이름<p><input type="text" name="nm" value="<c:out value='${liqCo.nm }'/>"></p>
주소<p><input type="text" name="addr" value="<c:out value='${liqCo.addr }'/>"></p>
홈페이지<p><input type="text" name="hmpg" value="<c:out value='${liqCo.hmpg }'/>"></p>
전화번호<p><input type="text" name="telno" value="<c:out value='${liqCo.telno }'/>"></p>
</div>
</div>
<div class="d-reg-btn" >
<button type="submit" data-oper='modify'>수정</button><button type="submit" data-oper='remove'>삭제</button><button type="submit" data-oper='list'>목록</button>
</div>
<input type="hidden" name="liqCoId"value="<c:out value='${liqCo.liqCoId }'/>" >
<input type="hidden" name="pageNum" value="<c:out value='${adCri.pageNum }'/>" >
<input type="hidden" name="amount" value="<c:out value='${adCri.amount }'/>" >
</form>
</div>
</div>
</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp" %>
<script>
$(document).ready(function(){

	$("#d-liq-co-list").css('background-color', 'rgb(10, 29, 74)').css('color','white');
	
	var formObj = $("#modify");
	$('.d-reg-btn button').on("click", function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'remove'){
			formObj.attr("action","/admin/remove-liq-co");
			
		}else if(operation === 'list'){
			
			formObj.attr("action","/admin/liq-co-list").attr("method","get");
			
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
		}
		formObj.submit();
	});

});
</script>
</body>
</html>