<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/include/topmenu.jsp"%>

<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<style>

.s-bbst-main-img-container {
	height: 300px;
	width: 100%;
	margin-top: 20px;
	margin-bottom: 20px;
}

.s-bbst-main-img-div {
	height: 100%;
	width: 100%;
}

.s-bbst-main-tool {
	border: 1px solid black;
	margin: 0 auto;
	height: 50px;
	width: 800px;
	margin-top: 10px;
	margin-bottom: 10px;
}

.s-bbst-register-btn {
	width: 60px;
	margin-top: 14px;
	margin-left: 50px;
	border: none;
	cursor: pointer;
	transition: 0.3s;
	background-color: #6b5b95;
}

.s-bbst-register-btn a {
	color: white;
}

.s-bbst-search-container {
	margin-top: 11px;
	margin-right: 50px;
	display: inline-block;
	float: right;
}

.s-bbst-search-btn {
	width: 60px;
	border: none;
	cursor: pointer;
	transition: 0.3s;
	background-color: rgb(181, 135, 189);
	color: white;
}

.s-bbst-container {
	border: 1px solid black;
	margin: 0 auto;
	height: 900px;
	width: 800px;
}

.s-bbst-item-container {
	height: 250px;
	width: 200px;
	margin-top: 35px;
	margin-left: 50px;
	display: inline-block;
	position: relative;
	float: left;
}

.s-bbst-img {
	height: 200px;
	width: 200px;
	display: block;
}

.s-bbst-item-overlay {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	height: 200px;
	width: 200px;
	opacity: 0;
	transition: .3s ease;
	background-color: rgb(181, 135, 189);
}

.s-bbst-item-container:hover .s-bbst-item-overlay {
	opacity: 0.9;
}

.s-bbst-item-overlay-info {
	font-size: 10px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	text-align: center;
	display: inline-block;
}

.s-bbst-info-div {
	height: 50px;
	width: 200px;
	margin-top: 3px;
	font-size: 10px;
}

.s-pagination-container {
	border: 1px solid black;
	height: 30px;
	width: 330px;
	margin: 0 auto;
	margin-bottom: 20px;
}

.s-pagination {
	list-style: none;
	margin: auto;
	text-align: center;
}

.s-pagination li {
	width: 20px;
	display: inline-block;
}

.s-pagination li a:hover {
	color: rgb(181, 135, 189);
	font-weight: bold;
}

</style>
</head>

<body>

<!-- 게시판 메인 이미지 -->
<div class="s-bbst-main-img-container">
	<img class="s-bbst-main-img-div" src="/resources/img/bbst.jpg" />
</div>

<!-- 게시판 검색창 & 글쓰기 버튼 -->
<div class="s-bbst-main-tool">
	<!-- 글쓰기 버튼 -->
	<button class="s-bbst-register-btn"><a href="/cheers/register">글쓰기</a></button>
	
	<!-- 검색창 -->
	<div class="s-bbst-search-container">
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
			<button class="s-bbst-search-btn">검색</button>
		</form>
	</div>
</div>

<!-- 모든 게시글 조회 -->

<div class="s-bbst-container">
	<c:if test="${empty bbstList }">
		<p>작성된 게시글이 없습니다.</p>
	</c:if>
	<c:if test="${not empty bbstList }">
		<c:forEach items="${bbstList }" var="bbst" varStatus="status" begin="0" end="8">
			<div class="s-bbst-item-container"><a href="/cheers/get?bbstId=<c:out value='${bbst.bbstId }' />">
				<div class="s-bbst-img-div">            
					<img class="s-bbst-img" src="<c:out value='${bbst.cnImg }' />" />
				</div>
				<div class="s-bbst-info-div">
					<p style="font-weight: bold">제목: <c:out value="${bbst.title }" /></p>
					<p>작성자: <c:out value="${bbst.name }" /></p>
					<p>작성일시: <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${bbst.regdate }" /> </p>
					<p>조회수: <c:out value="${bbst.inqrNum }" /></p>
				</div>
				<div class="s-bbst-item-overlay">
					<div class="s-bbst-item-overlay-info">
						<p><i class="fas fa-heart" style="color: white;"></i> <c:out value="${bbst.likesNum }" /></p>
						<p><i class="fas fa-comment-dots" style="color: white;"></i> <c:out value="${bbst.replyNum }" /></p>
					</div>
				</div>
			</a></div>
		</c:forEach>
	</c:if>
</div>

<!-- 페이징 처리 -->
<div class="s-pagination-container">
	<ul class="s-pagination">
		<c:if test="${pageMaker.prev }">
			<li class="s-paginate_button previous" style="width: 50px;">
				<a href="${pageMaker.startPage -1 }">이전</a>
			</li>
		</c:if>
		
		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
			<li class="s-paginate_button ${pageMaker.cri.pageNum == num ? "active":"" } ">
				<a href="${num }">${num }</a>
			</li>
		</c:forEach>
		
		<c:if test="${pageMaker.next }">
			<li class="s-paginate_button next" style="width: 50px;">
				<a href="${pageMaker.endPage + 1 }">다음</a>
			</li>
		</c:if>
		
		<form id="activeForm" action="/cheers/list" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }" />
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }" />
		</form>
	</ul>
</div>


<!-- Top으로 이동하는 버튼 만들기 (w3schools) -->
<!-- <button onclick="topFunction()" id="topBtn">Top</button> -->

<script type="text/javascript">
	
</script>
</body>
</html>