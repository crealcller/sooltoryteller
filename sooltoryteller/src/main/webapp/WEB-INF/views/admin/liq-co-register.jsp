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
<title>양조장 등록</title>
</head>
<body>
<h3 style="margin-left: 20px;">[양조장 등록]</h3>
<form action="/admin/liq-co-register" method="post">
<p><label>이름 : <input type="text" name="nm" required="required"></label></p>
<p><label>주소 : <input type="text" name="addr" required="required"></label></p>
<p><label>홈페이지주소 : <input type="text" name="hmpg" ></label></p>
<p><label>전화번호 : <input type="text" name="telno" required="required"></label></p>
<button type="submit">등록하기 </button>
</form>
       
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#d-liq-co-register").css('background-color', 'navy').css('color','white');
});
</script>
</body>
</html>