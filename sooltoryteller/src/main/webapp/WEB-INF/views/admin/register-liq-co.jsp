<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<style>
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
.d-admin-half-con input{
	line-height: 25px;
	width: 280px;
}
</style>
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
<h3 style="margin: 0 0 10px 15px;">[ 양조장 등록 ]</h3>
<div class="d-admin-con">
<form action="/admin/register-liq-co" method="post">
<div class="d-admin-half-con">
이름<p><input type="text" name="nm" maxlength="20" placeholder="1~20자" required="required"></p>
주소<p><input type="text" name="addr" maxlength="30" placeholder="1~30자" required="required"></p>
홈페이지<p><input type="url" name="hmpg" maxlength="100" placeholder="0~100자"></p>
전화번호<p><input type="number" name="telno" maxlength="15" placeholder="숫자만 입력해주세요." required="required"></p>
</div>
<div class="d-reg-btn" >
<button type="submit">등록 </button>
</div>

</form>
</div>
</div><!--인크루드 하는 페이지에 넣기-->
</div><!--인크루드 하는 페이지에 넣기-->
</div><!--인크루드 하는 페이지에 넣기-->
<%@include file="/WEB-INF/views/include/footer.jsp" %>     
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#d-liq-co-register").css('background-color', 'rgb(10, 29, 74)').css('color','white');
});
</script>
</body>
</html>