<!-- jquery script src -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- fontawesome -->
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<script type="text/javascript">
	// 로그인이 안된 상태면 로그인페이지로 넘어가게
	let msg = "${msg}";
	if (msg != "") {
		alert(msg);
		location.href = "/login";
	}
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/include/topmenu.jsp"%>

<link rel="stylesheet" href="/resources/css/mypage.css">

<style>

.s-bbst-container {
	width: 100%;
	height: 860px;
	margin: 0 auto;
}

.s-bbst-item-container {
	height: 180px;
	width: 180px;
	margin: 20px 0 0 20px;
	display: inline-block;
	position: relative;
	float: left;
	cursor: pointer;
}

.s-bbst-img {
	height: 180px;
	width: 180px;
	display: block;
}

.s-bbst-item-overlay {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	height: 180px;
	width: 180px;
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
	width: 180px;
	transform: translate(-50%, -50%);
	text-align: center;
	display: inline-block;
}

.s-bbst-item-overlay-span {
	color: white;
	font-size: 12px;
}

</style>
</head>
<body>

<div class="d-mypage-wrapper">
	<div class="d-mypage-left">
		<div class="d-left-con">
			<div class="d-mypage-profile-con">
				<img class="d-mypage-profile"
					src='/resources/img/<c:out value="${member.img}" />'>

				<div class="d-mypage-info">
					<h1>
						<c:out value="${member.name}" />
						님
					</h1>
				</div>
			</div>
			<ul class="d-mypage-menu-con">
				<li class="d-mypage-ref"><a href='/mypage/like'>전통주</a></li>
				<ul class="d-mypage-menu">
					<li class="d-mypage-li"><a href='/mypage/like'>좋아요한 전통주 </a>
					</li>
					<li class="d-mypage-li"><a href='/mypage/revw'>내가 작성한 리뷰
					</a></li>
				</ul>
			</ul>
			<ul class="d-mypage-menu-con">
				<li class="d-mypage-ref"><a href='#'>게시글 </a></li>
				<ul class="d-mypage-menu">
					<li class="d-mypage-li"><a href='/mypage/mypost'>내가 작성한
							게시글</a></li>
					<li class="d-mypage-li"><a href='/mypage/myreply'>내가
							작성한 댓글</a></li>
					<li class="d-mypage-li"><a href='/mypage/mylikedpost'>좋아요한
							게시글</a></li>
				</ul>
			</ul>
			<ul class="d-mypage-menu-con" style="border-style: none;">
				<li class="d-mypage-ref"><a href='/mypage/changeuserinfo'>회원정보</a>
				</li>
				<ul class="d-mypage-menu">
					<li class="d-mypage-li"><a href='/mypage/changeuserinfo'>회원정보수정
					</a></li>
					<li class="d-mypage-li"><a href='/mypage/changepwd'>비밀번호
							변경 </a></li>
				</ul>
			</ul>

		</div>
	</div>
	
	<div class="d-mypage-right">
		<p>내가 좋아요 누른 게시글</p>
		<div class="s-bbst-container">
			<div class="s-bbst-container-box"></div>
		</div>
		
		<!-- 페이징 처리 -->
		<div class="d-paging"></div>
	</div>
</div>
<div class="d-mypage-footer">
	<h1>footer</h1>
</div>

<script type="text/javascript" src="/resources/js/bbstLike.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	var memberIdValue = "<c:out value='${member.memberId}' />";
	var bbstBox = $(".s-bbst-container-box");
	var paging = $(".d-paging");
	showMyList(1);
	
	// 리스트 출력
	function showMyList(page) {
		bbstLikeService.getMyBbstLike({memberId : memberIdValue, page : page || 1},
			function(myLikeCnt, myLikeList) {
			
			if(page == -1) {
				pageNum = Math.ceil(myLikeCnt / 8.0);
				showMyList(pageNum);
				return;
			}
			
			var str = "";
			if(myLikeList == null || myLikeList.length == 0) {
				bbstBox.html("<p>좋아요를 누른 게시글이 없습니다.</p><br />");
				return;
			}
			
			for(var i = 0, len = myLikeList.length || 0; i < len; i++) {
				str += '<div class="s-bbst-item-container" data-bbstid="' + myLikeList[i].bbstId + '">';
				str += '<div class="s-bbst-img-div"><img class="s-bbst-img" src="' + myLikeList[i].cnImg + '" /></div>';
				str += '<div class="s-bbst-item-overlay"><div class="s-bbst-item-overlay-info"><i class="fas fa-eye" style="color: white;"></i> <span class="s-bbst-item-overlay-span">' + myLikeList[i].viewCnt + '</span>&nbsp;';
				str += '<i class="fas fa-heart" style="color: white;"></i> <span class="s-bbst-item-overlay-span">' + myLikeList[i].likeCnt + '</span>&nbsp;';
				str += '<i class="fas fa-comment-dots" style="color: white;"></i> <span class="s-bbst-item-overlay-span">' + myLikeList[i].replyCnt + '</span></div></div></div>';
			}
			bbstBox.html(str);
			showMyListPage(myLikeCnt);
		});
	}
	
	// 게시글 선택 시 해당 게시글로 이동
	bbstBox.on("click", ".s-bbst-item-container", function(e) {
		var targetBbstId = $(this).data("bbstid");
		location.href = location.href = "/cheers/get?bbstId=" + targetBbstId;
	});
});

</script>
</body>
</html>