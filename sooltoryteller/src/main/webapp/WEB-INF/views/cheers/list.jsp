<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/include/topmenu.jsp"%>

<script>
// 로그인이 안된 상태면 로그인페이지로 넘어가게
let msg = "${msg}";
	if(msg != ""){
		alert(msg);
		location.href = "/login";
}
</script>

<!-- fontawesome -->
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!-- jquery script src -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

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
	margin: 10px auto 10px auto;
	height: 50px;
	width: 900px;
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

.s-bbst-search-cancel {
	width: 60px;
	border: none;
	cursor: pointer;
	transition: 0.3s;
	background-color: #990000ff;
	color: white;
}

.s-bbst-container {
	width: 900px;
	margin: 0 auto;
}

.s-bbst-item-container {
	height: 320px;
	width: 250px;
	margin: 20px 25px 20px 25px;
	display: inline-block;
	position: relative;
	float: left;
}

.s-bbst-img {
	height: 250px;
	width: 250px;
	display: block;
}

.s-bbst-item-overlay {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	height: 250px;
	width: 250px;
	opacity: 0;
	transition: .3s ease;
	background-color: rgb(181, 135, 189);
}

.s-bbst-item-container:hover .s-bbst-item-overlay {
	opacity: 0.9;
}

.s-bbst-item-overlay-info {
	font-size: 12px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	text-align: center;
	display: inline-block;
}

.s-bbst-info-div {
	height: 50px;
	width: 250px;
	margin-top: 3px;
	font-size: 11px;
}

.s-pagination {
	width: 800px;
	bottom: 0;
	display: block;
	overflow: hidden;
	list-style: none;
	margin: 25px auto 10px auto;
	text-align: center;
}

.s-pagination li {
	width: 20px;
	display: inline-block;
	cursor: pointer;
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
		<form id="s-searchForm" action="/cheers/list" method="get">
			<select name="type">
				<option value="T"
					<c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : '' }" />>제목</option>
				<option value="C"
					<c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : '' }" />>내용</option>
				<option value="W"
					<c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : '' }" />>작성자</option>
				<option value="TC"
					<c:out value="${pageMaker.cri.type eq 'TC' ? 'selected' : '' }" />>제목 or 내용</option>
				<option value="TW"
					<c:out value="${pageMaker.cri.type eq 'TW' ? 'selected' : '' }" />>제목 or 작성자</option>
				<option value="TWC"
					<c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected' : '' }" />>제목 or 내용 or 작성자</option>
			</select>
			<input type="text" name="keyword" value="<c:out value='${pageMaker.cri.keyword }' />" placeholder="검색어를 입력해주세요." />
			<input type="hidden" name="pageNum" value="<c:out value='${pageMaker.cri.pageNum }' />" />
			<input type="hidden" name="amount" value="<c:out value='${pageMaker.cri.amount }' />" />
			<button class="s-bbst-search-btn" style="background-color: rgb(181, 135, 189);">검색</button>
			<c:if test='${pageMaker.cri.keyword != null }'>
				<button class="s-bbst-search-cancel">취소</button>
			</c:if>
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
			<div class="s-bbst-item-container">
				<a class="move" href="<c:out value='${bbst.bbstId }' />">
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
<ul class="s-pagination">
	<c:if test="${pageMaker.prev }">
		<li class="s-paginate_button previous" style="width: 50px;">
			<a href="${pageMaker.startPage -1 }"><i class="fas fa-arrow-circle-left"></i></a>
		</li>
	</c:if>
	
	<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
		<li class="s-paginate_button ${pageMaker.cri.pageNum == num ? "active":"" } ">
			<a href="${num }">${num }</a>
		</li>
	</c:forEach>
	
	<c:if test="${pageMaker.next }">
		<li class="s-paginate_button next" style="width: 50px;">
			<a href="${pageMaker.endPage + 1 }"><i class="fas fa-arrow-circle-right"></i></a>
		</li>
	</c:if>
</ul>
		
<form id="s-actionForm" action="/cheers/list" method="get">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }" />
	<input type="hidden" name="amount" value="${pageMaker.cri.amount }" />
	<input type="hidden" name="type" value="${pageMaker.cri.type }" />
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }" />
</form>

<!-- Top으로 이동하는 버튼 만들기 (w3schools) -->
<!-- <button onclick="topFunction()" id="topBtn">Top</button> -->

<script type="text/javascript">

$(document).ready(function() {
	var actionForm = $("#s-actionForm");
	
	$(".s-paginate_button a").on("click", function(e) {
		e.preventDefault();
		console.log("click");
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	/* 게시물 클릭 시 이동하는 이벤트 처리 */
	$(".move").on("click", function(e) {
		e.preventDefault();
		actionForm.append("<input type='hidden' name='bbstId' value='"+$(this).attr("href") + "'>");
		actionForm.attr("action", "/cheers/get");
		actionForm.submit();
	});

	/* 검색 버튼 이벤트 처리 : 1페이지 보이기 + 검색 조건 및 검색어 보이기*/
	var searchForm = $("#s-searchForm");
	
	$("#s-searchForm button").on("click", function(e) {
		
		var keyword = searchForm.find("input[name='keyword']").val();
		var blank_pattern = /^\s+|\s+$/g;
		
		// 검색어 입력 안 한 경우
		if(!keyword) {
			alert("검색어를 입력해주세요.");
			return false;
		}
		
		// 검색어에 공백만 입력한 경우
		if(keyword.replace(blank_pattern, '') == "") {
		    alert("검색어 : 공백만 입력되었습니다.");
		    return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		
		searchForm.submit();
	});
	
	// 검색 취소 버튼 누를 경우
	$(".s-bbst-search-cancel").on("click", function() {
		// list로 되돌아가기
		location.href = "/cheers/list?"
			+ "pageNum=1"
			+ "&amount=9"
			+ "&type="
			+ "&keyword=";
		// 검색 취소 버튼 숨기기
		$(".s-bbst-search-cancel").hide();
	});
});

</script>

</body>
</html>