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
<title>전통주 관리</title>
<style>
.d-con{
margin:100px;
}
.d-img-con{
width:90px;
height:150px;
}
</style>
</head>
<body>
<div class="d-con">

<div class="d-con">
<span><img class="d-img-con" src="<c:out value='${liq.liqThumb}'/>"></span>
<p>
<input type="text" class="liqCoNm" name='liqCoNm' value='<c:out value="${liqCo.nm }"/>'>
</p>
<p><label>이름 : <input type="text" name="nm"  maxlength="12" placeholder="1~12자"></label></p>
<p>
<input type="radio" class="cate" name='cate' value='탁주'>탁주
<input type="radio" class="cate"  name='cate' value='약주 청주'>약주/청주
<input type="radio" class="cate" name='cate' value='과실주'>과실주
<input type="radio" class="cate"  name='cate' value='증류주 리큐르'>증류주/리큐르
</p>
<p><label>용량 : <input type="text" name="capct" maxlength="6"  placeholder="숫자만 입력해주세요."></label></p>
<p><label>도수 : <input type="text" name="lv" maxlength="4" placeholder="숫자만 입력해주세요."></label></p>
<p><label>원재료 : <input type="text" name="irdnt" maxlength="60" placeholder="0~60자"></label></p>
<p><label>수상내역 : <input type="text" name="ards" maxlength="90" placeholder="0~90자"></label></p>
<p><label>소개 : <input type="text" name="liqCn.intro" maxlength="500" placeholder="1~500자"></label></p>
<p><label>맛 페어링 : <input type="text" name="liqCn.pair" maxlength="300" placeholder="0~300자"></label></p>
<input type="hidden" name="liqCnt.revwCnt" value=0>

<span><img class="d-img-con" src="<c:out value='${liq.liqThumb}'/>"></span>
<input name='nm' value="<c:out value='${liq.nm }'/>">
<p><c:out value='${liq.liqCn.intro }'/></p>
<p><c:out value='${liq.liqCn.pair }'/></p>
<span><c:out value='${liq.lv }'/>%</span>
<span><c:out value='${liq.capct }'/>ml</span>
<span><c:out value='${liq.cate}'/></span>
<span><c:out value='${liq.irdnt}'/></span>
<span><c:out value='${liq.ards}'/></span>
<span><c:out value='${liq.liqCo.nm}'/></span>

<form id="modify" action="/admin/modify-liq" method="post">
<input type="hidden" name="liqId" value="<c:out value='${liq.liqId }'/>" >
<button type="submit" data-oper='modify'>수정</button><button type="submit" data-oper='remove'>삭제</button><button type="submit" data-oper='list'>목록</button>
</form>
</div>
<script>
$(document).ready(function(){
	var formObj = $("#modify");
	$('button').on("click", function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'remove'){
			formObj.attr("action","/admin/remove-liq");
			
		}else if(operation === 'list'){
			
			formObj.attr("action","/board/list").attr("method","get");
			
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
