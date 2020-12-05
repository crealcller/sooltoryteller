<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/include/topmenu.jsp"%>

<!-- fontawesome -->
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!-- jquery script src -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<style>

.s-bbst-container {
	border: 1px solid black;
	height: 900px;
	width: 800px;
	margin: 0 auto;
	margin-top: 50px;
}

.s-title-container {
	border: 1px solid black;
	height: 30px;
	width: 100%;
	margin: 5px 0;
}

.s-writer-info-container {
	border: 1px solid black;
	height: 50px;
	width: 100%;
}

.s-writer-info-div {
	border: 1px solid black;
	height: 100%;
	width: 500px;
	display: inline-block;
	font-size: 10px;
}

.s-writer-img-div {
	border: 1px solid black;
	height: 100%;
	width: 50px;
	display: inline-block;
	float: left;
}

.s-writer-img {
	margin-left: 6px;
}

.s-listBtn {
	width: 60px;
	border: none;
	margin-top: 15px;
	margin-right: 10px;
	cursor: pointer;
	float: right;
	color: white;
}

.s-listBtn a {
	color: white;
}

.s-cn-container {
	border: 1px solid #f2eff9;
	height: 760px;
	width: 95%;
	margin: 25px auto;
}

.s-bbst-cnImg-div {
	background-color: rgb(245, 245, 245);
}

.s-bbst-cnImg {
	height: 350px;
	width: 350px;
	margin: 0 auto;
}

.s-bbst-cnImg-src {
	height: 350px;
	width: 350px;
}

.s-bbst-cn-div {
	border: 1px solid black;
	height: 380px;
	width: 100%;
	margin-top: 30px;
	padding: 20px;
	background-color: rgb(245, 245, 245);
}

</style>

</head>
<body>
<div class="s-bbst-container">
	<!-- 게시글 제목 -->
	<div class="s-title-container">
		<p>게시글 제목: <c:out value='${bbst.title }' /></p>
	</div>
	
	<!-- 게시글 작성자 정보 -->
	<div class="s-writer-info-container">
		<div class="s-writer-info-btn-div">
			<button data-oper="list" class="s-listBtn" style="background-color: rgb(181, 135, 189);">목록</button>
			<button data-oper="modify" class="s-listBtn" style="background-color: #6b5b95;">수정</button>
			
			<!-- 데이터 이동시키기 -->
			<form id="operForm" action="/cheers/modify" method="get">
				<input type="hidden" id="bbstId" name="bbstId" value="<c:out value='${bbst.bbstId }' />" />
				<input type="hidden" id="pageNum" name="pageNum" value="<c:out value='${cri.pageNum }' />" />
				<input type="hidden" id="amount" name="amount" value="<c:out value='${cri.amount }' />" />
				<input type="hidden" id="type" name="type" value="<c:out value='${cri.type }' />" />
				<input type="hidden" id="keyword" name="keyword" value="<c:out value='${cri.keyword }' />" />
			</form>
		</div>
		
		<!-- 회원 및 게시글 정보 -->
		<div class="s-writer-info-div">
			<p style="font-weight: bold">작성자: <c:out value='${bbst.name }' /></p>
			<p>작성일시: <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${bbst.regdate }" /></p>
			<p>조회수: <c:out value='${bbst.inqrNum }' /></p>
		</div>
		
		<!-- 회원 프로필 사진 -->
		<div class="s-writer-img-div">
			<c:choose>
				<c:when test="${empty bbst.img }">
					<span class="s-writer-img"><i class="fas fa-user-circle" style="font-size:35px;"></i></span>
				</c:when>
				<c:when test="${not empty bbst.img }">
					<span class="s-writer-img"><c:out value='${bbst.img }' /></span>
				</c:when>
			</c:choose>
		</div>
	</div>
	
	<!-- 게시글 내용 -->
	<div class="s-cn-container">
		<div class="s-bbst-cnImg-div">
			<div class="s-bbst-cnImg">
				<img class="s-bbst-cnImg-src" src="<c:out value='${bbst.cnImg }' />" />
			</div>
		</div>
		
		<div class="s-bbst-cn-div">
			<p>내용: <c:out value='${bbst.cn }' /></p>
		</div>
	</div>
</div>

<!-- 좋아요 & 댓글 -->

<script>

$(document).ready(function() {
	
	var operForm = $("#operForm");
	
	$("button[data-oper='list']").on("click", function(e) {
		operForm.find("#bbstId").remove();
		operForm.attr("action", "/cheers/list");
		operForm.submit();
	});
	
	$("button[data-oper='modify']").on("click", function(e) {
		operForm.attr("action", "/cheers/modify").submit();
	});
});

</script>

</body>
</html>