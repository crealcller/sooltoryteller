<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="/WEB-INF/views/include/topmenu.jsp" %>

<html>
<head>
<meta charset="UTF-8">
<title>건배의광장-전체목록</title>
<style>

.bbst-container {
	height: 500px;
	width: 500px;
	display: block;
}

.bbst-img-div {
	height: 400px;
	width: 400px;
}

.bbst-info-div {
	height: 100px;
	width: 500px;
}

</style>
</head>

<body>

<h3>건배의 광장 - 전체목록</h3>

<div>
	<ul>
		<c:if test="${empty bbstList }">
			<p>작성된 게시글이 없습니다.</p>
		</c:if>
		<c:if test="${not empty bbstList }">
			<c:forEach items="${bbstList }" var="bbst" varStatus="status" begin="0" end="8">
				<div class="bbst-container">
					<div class="bbst-img-div">
						<img src="/resources/img/<c:out value='${bbst.img }' />" />
					</div>
					<div class="bbst-info-div">
						<p>제목: <c:out value="${bbst.title }" /></p>
						<p>작성자: <c:out value="${bbst.member.name }" /></p>
						<p>작성일시: <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${bbst.regdate }" /></p>
						<p>조회수: <c:out value="${bbst.inqrNum }" /></p>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</ul>
</div>

</body>
</html>