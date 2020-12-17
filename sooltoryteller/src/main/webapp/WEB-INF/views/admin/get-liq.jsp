<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/views/include/adminMenu.jsp" %>    
<!DOCTYPE html>
<html>
<head>
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
<span><img class="d-img-con" src="/resources/img/<c:out value='${liq.img}'/>"></span>
<span><c:out value='${liq.nm }'/></span>
<p><c:out value='${liq.liqCn.intro }'/></p>
<p><c:out value='${liq.liqCn.pair }'/></p>
<span><c:out value='${liq.lv }'/>%</span>
<span><c:out value='${liq.capct }'/>ml</span>
<span><c:out value='${liq.cate}'/></span>
<span><c:out value='${liq.irdnt}'/></span>
<span><c:out value='${liq.ards}'/></span>
<span><c:out value='${liq.liqCo.nm}'/></span>

<form id="modify" action="/admin/remove-liq" method="post">
<input type="hidden" name="liqId" value="<c:out value='${liq.liqId }'/>" >
<button>삭제</button>
</form>
</div>
</body>
</html>
