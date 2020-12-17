<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/include/topmenu.jsp"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전통주 리스트</title>
<link rel="stylesheet" href="/resources/css/trad-list.css">
</head>
<body>
<div class="s-bbst-container">
<h1>전체</h1>
<c:forEach items="${allLiq}" var="allLiq">

<div class="s-bbst-item-container" OnClick="location.href ='/trad-liq?liqId=<c:out value="${allLiq.liqId}" />'" style="cursor:pointer;">
<div class="s-bbst-img-div">   
<img class="d-img-con" src='/resources/img/<c:out value="${allLiq.img}" />' >
</div>
<div class="s-bbst-info-div">
<h3><c:out value="${allLiq.nm}"/></h3>
<span><c:out value="${allLiq.liqCnt.avgRate}"/>/<c:out value="${allLiq.liqCnt.revwCnt}"/>개</span>
<img class="d-liq-num-img" src='/resources/img/eye.png'><c:out value="${allLiq.liqCnt.inqrCnt}"/>
<p>가격 : \<fmt:formatNumber type="number" maxFractionDigits="3" value="${allLiq.prc}" /></p>
<p>도수 : <c:out value="${allLiq.lv}"/>%</p>
<p>원재료 : <c:out value="${allLiq.capct}"/>ml</p>
<p>양조장 : <c:out value="${allLiq.liqCo.nm}"/></p>
</div>
</div>

</c:forEach>
</div>
</body>
</html>