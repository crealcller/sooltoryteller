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
</head>
<body>
<form action="/shop/order" method="post">
<c:forEach items="${basket}" var="basket" varStatus="status">
<p>liqId : <input name="items[${status.index}].liqId" value="<c:out value='${basket.liqId}'/>"></p>
<p>qty : <input name="items[${status.index}].qty" value="<c:out value='${basket.qty}'/>"></p>
<p>prc : <input name="items[${status.index}].prc" value="2000"></p>
</c:forEach>
<button type="submit">주문하기</button>
</form>
</body>
</html>