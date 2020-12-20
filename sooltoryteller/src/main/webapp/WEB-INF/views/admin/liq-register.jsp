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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="UTF-8">
<title>전통주 등록</title>
<style>


.select-img img{
	margin:20px 0;
}
</style>
</head>
<body>
<h3 style="margin-left: 20px;">[전통주 등록]</h3>
<form role="form" action="/admin/liq-register" method="post" enctype="multipart/form-data">
<div class="inputArea">
<label for="liqImg">전통주 사진</label>
<input type="file" id="liqImg" name="file"/>
<div class="select-img"><img src=""/></div>
</div>
<span><label>양조장 : <input type="text" name="liqCoNm" required="required" ></label></span>
<span><label>이름 : <input type="text" name="nm" required="required"></label></span>
<span><label>소개 : <input type="text" name="intro" required="required"></label></span>
<span><label>맛 페어링 : <input type="text" name="pair" ></label></span>
<span><label>주종 : <input type="text" name="cate" required="required"></label></span>
<span><label>용량 : <input type="text" name="capct" required="required"></label></span>
<span><label>도수 : <input type="text" name="lv" required="required"></label></span>
<span><label>원재료 : <input type="text" name="irdnt" required="required"></label></span>
<span><label>수상내역 : <input type="text" name="ards" ></label></span>

<button type="submit">등록하기 </button>
</form>

<script>
	// 게시글 썸네일사진
	$("#liqImg").change(function(){
	
	if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
    $(".select-img img").attr("src", data.target.result).width(100);        
    }
    reader.readAsDataURL(this.files[0]);
    }
});
</script> 
<script type="text/javascript">
$(document).ready(function(){
	$("#d-liq-register").css('background-color', 'navy').css('color','white');
});
</script>
</body>
</html>