<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/include/topmenu.jsp"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/trad-list.css">
</head>
<body>

<div class="d-con">
<h1>증류주</h1>
<c:forEach items="${allLiq}" var="allLiq">

<div class="d-liq-con" OnClick="location.href ='/trad-liq?liqId=<c:out value="${allLiq.liqId}" />'" style="cursor:pointer;">
<img class="d-img-con" src='/resources/img/<c:out value="${allLiq.img}" />'>
<div class="d-text-con">
<h3><c:out value="${allLiq.nm}"/></h3>
가격 : \<fmt:formatNumber type="number" maxFractionDigits="3" value="${allLiq.prc}" /><br>
도수 : <c:out value="${allLiq.lv}"/>%<br>
원재료 : <c:out value="${allLiq.capct}"/>ml<br>
양조장 : <c:out value="${allLiq.liqCo.nm}"/><br>
</div>
</div>

</c:forEach>
</div>
</body>
</html>