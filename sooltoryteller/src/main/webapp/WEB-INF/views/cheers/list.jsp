<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/include/topmenu.jsp"%>

<html>
<head>
<meta charset="UTF-8">
<title>건배의광장-전체목록</title>
<style>

.bbst-main-img-container {
	height: 300px;
	width: 100%;
	margin-top: 20px;
	margin-bottom: 20px;
}

.bbst-main-img-div {
	height: 100%;
	width: 100%;
}

.bbst-main-tool {
	border: 1px solid black;
	margin: 0 auto;
	height: 50px;
	width: 800px;
	margin-top: 10px;
	margin-bottom: 10px;
}

.bbst-register-btn {
	width: 60px;
	margin-top: 14px;
	margin-left: 50px;
	border: none;
	cursor: pointer;
	transition: 0.3s;
	background-color: #b8a9c9;
	color: white;
}

.bbst-register-btn:hover {
	background-color: #622569;
}

.bbst-search-container {
	margin-top: 11px;
	margin-right: 50px;
	display: inline-block;
	float: right;
}

.bbst-container {
	border: 1px solid black;
	margin: 0 auto;
	height: 900px;
	width: 800px;
}

.bbst-item-container {
	height: 250px;
	width: 200px;
	margin-top: 35px;
	margin-left: 50px;
	display: inline-block;
	float: left;
}

.bbst-img {
	height: 200px;
	width: 200px;
}

.bbst-info-div {
	height: 50px;
	width: 200px;
	margin-top: 3px;
	font-size: 10px;
}

</style>
</head>

<body>

<!-- 게시판 메인 이미지 -->
<div class="bbst-main-img-container">
	<img class="bbst-main-img-div" src="/resources/img/bbst.jpg" />
</div>

<!-- 게시판 검색창 & 글쓰기 버튼 -->
<div class="bbst-main-tool">
	<!-- 글쓰기 버튼 -->
	<button class="bbst-register-btn">글쓰기</button>
	
	<!-- 검색창 -->
	<div class="bbst-search-container">
		<form>
			<input type="text" list="dateRange" placeholder="전체 기간">
			<datalist id="dateRange">
				<option value="전체 기간"></option>
				<option value="한달 전"></option>
				<option value="일주일 전"></option>
			</datalist>
			<input type="text" list="contentRange" placeholder="제목  + 내용">
			<datalist id="contentRange">
				<option value="제목 + 내용"></option>
				<option value="제목"></option>
				<option value="내용"></option>
				<option value="작성자"></option>
			</datalist>
			<input type="text" placeholder="검색어를 입력해주세요.">
			<button>검색</button>
		</form>
	</div>
</div>

<!-- 모든 게시글 조회 (무한스크롤) -->
<div class="bbst-container">
	<c:if test="${empty bbstList }">
		<p>작성된 게시글이 없습니다.</p>
	</c:if>
	<c:if test="${not empty bbstList }">
		<c:forEach items="${bbstList }" var="bbst" varStatus="status" begin="0" end="8">
			<div class="bbst-item-container">
				<div class="bbst-img-div">            
					<img class="bbst-img" src="/resources/img/<c:out value='${bbst.img }' />" />
				</div>
				<div class="bbst-info-div">
					<p style="font-weight: bold">제목: <c:out value="${bbst.title }" /></p>
					<p>작성자: <c:out value="${bbst.name }" /></p>
					<p>작성일시: <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${bbst.regdate }" /> </p>
					<p>조회수: <c:out value="${bbst.inqrNum }" /></p>
				</div>
			</div>
		</c:forEach>
	</c:if>
</div>

<script>
/* // 이전 스크롤 좌표
var lastScrollTop = 0;

// 1. 스크롤 이벤트 최초 발생
$(window).scroll(function() {
	
	// 현재 스크롤 좌표
	var currentScrollTop = $(window).scrollTop();
	
	// 다운 스크롤
	if (currentScrollTop - lastScrollTop > 0) {
		// 현재 스크롤 좌표를 이전 스크롤 좌표로 할당
		lastScrollTop = currentScrollTop;
	}
	// 업스크롤
	else {
		// 현재 스크롤 좌표를 이전 스크롤 좌표로 할당
		lastScrollTop = currentScrollTop;
	}
	
	// 2. 현재 스크롤의 위치가 화면의 보이는 위치보다 크면
	if ($(window).scrollTop() >= $(document.height() - $(window).height()) {
		
		// 3. ajax로 서버에 게시물글 데이터 요청
		
			// 4. DOM 핸들링
	}
}); */

</script>
</body>
</html>