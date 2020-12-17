<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/views/include/adminMenu.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양조장 관리</title>
</head>
<body>
<p><c:out value='${liqCo.nm }'/></p>
<p><c:out value='${liqCo.addr }'/></p>
<p><c:out value='${liqCo.telno }'/></p>
<p><c:out value='${liqCo.hmpg }'/></p>
</body>
</html>