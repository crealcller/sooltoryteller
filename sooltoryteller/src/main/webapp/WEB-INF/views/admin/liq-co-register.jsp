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
<style>
.d-admin-con{
margin-left:20px;
}
.d-admin-con input{
	width:200px;
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
</style>
</head>
<body>
<div class="d-admin-con">
<h3 style="margin-left: 20px;">[양조장 등록]</h3>
<strong><c:out value="${result}"/></strong>
<strong><c:out value="${error}"/></strong>
<form action="/admin/liq-co-register" method="post">
<p><label>이름 : <input type="text" name="nm" maxlength="20" placeholder="1~20자" required="required"></label></p>
<p><label>주소 : <input type="text" name="addr" maxlength="30" placeholder="1~30자" required="required"></label></p>
<p><label>홈페이지주소 : <input type="url" name="hmpg" maxlength="100" placeholder="0~100자"></label></p>
<p><label>전화번호 : <input type="number" name="telno" maxlength="15" placeholder="숫자만 입력해주세요." required="required"></label></p>
<button type="submit">등록하기 </button>
</form>
 </div>     
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#d-liq-co-register").css('background-color', 'navy').css('color','white');
});
</script>
</body>
</html>