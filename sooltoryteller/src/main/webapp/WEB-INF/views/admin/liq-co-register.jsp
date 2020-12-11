<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>양조장 등록</p>
<form action="/admin/liq-co-register" method="post">
<p><label>이름 : <input type="text" name="nm" ></label></p>
<p><label>주소 : <input type="text" name="addr" ></label></p>
<p><label>홈페이지주소 : <input type="text" name="hmpg" ></label></p>
<p><label>전화번호 : <input type="text" name="telno" ></label></p>
<button type="submit">등록하기 </button>

</form>
</body>
</html>