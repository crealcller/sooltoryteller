<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="include/topmenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.d-con{
	width:60%;
	margin:auto;
}
.d-liq-con{
	border-style:solid;
	border-color:rgba(138, 134, 134, 0.199);
	margin : 20px;
}
.d-imq-con{
	width : 150px;
	height : 200px;
	display :inline-block;
}
.d-text-con{
	display :inline-block;
	padding:10px;
	margin-left:50px;
}
</style>
</head>
<body>

<div class="d-con">
<h1>탁주</h1>
<c:forEach items="${allLiq}" var="allLiq">

<div class="d-liq-con" OnClick="location.href ='/trad-liq?liqSeq=<c:out value="${allLiq.liqSeq}" />'" style="cursor:pointer;">
<img class="d-imq-con" src='/resources/img/<c:out value="${allLiq.liqImg}" />'>
<div class="d-text-con">
<h3><c:out value="${allLiq.liqNm}"/></h3>
가격 : \<fmt:formatNumber type="number" maxFractionDigits="3" value="${allLiq.liqPrc}" /><br>
도수 : <c:out value="${allLiq.liqLv}"/>%<br>
원재료 : <c:out value="${allLiq.liqCapct}"/>ml<br>
양조장 : <c:out value="${allLiq.liqCo.liqCoNm}"/><br>
</div>
</div>

</c:forEach>
</div>
</body>
</html>