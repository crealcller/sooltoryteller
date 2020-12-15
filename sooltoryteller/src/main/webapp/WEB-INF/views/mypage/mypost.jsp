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
	height: 235px;
	width: 190px;
	margin: 10px 0 0 65px;
	display: inline-block;
	position: relative;
	float: left;
	cursor: pointer;
}

.s-bbst-img {
	height: 190px;
	width: 190px;
	display: block;
}

.s-bbst-item-overlay {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	height: 190px;
	width: 190px;
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
	height: 45px;
	width: 190px;
	margin-top: 3px;
	font-size: 11px;
}

.s-paging-container {
	height: 30px;
	margin: 0 auto;
}

.s-paging-ul {
	display: inline-block;
}

.s-paging-ul li {
	height: 16px;
	width: 8px;
	list-style-type: none;
}

.s-paging-ul li>a {
	color: black;
	padding: 8px 16px;
}

.s-paging-ul li>a:hover {
	color: white;
	padding: 8px 16px;
	background-color: rgb(181, 135, 189);
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
					<li class="d-mypage-li"><a href='#'>관심사 변경?</a></li>
				</ul>
			</ul>
		</div>
	</div>
	
	<div class="d-mypage-right">
		<p>내가 작성한 게시글</p>
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

<script type="text/javascript" src="/resources/js/myBbst.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	var memberIdValue = "<c:out value='${member.memberId}' />";
	var bbstBox = $(".s-bbst-container-box");
	var pageNum = 1;
	var paging = $(".d-paging");
	showMyList(1);
	
	// 리스트 출력
	function showMyList(page) {
		myBbstService.getMyList({memberId : memberIdValue, page : page || 1},
			function(myBbstCnt, myBbstList) {
			
			if(page == -1) {
				pageNum = Math.ceil(myBbstCnt / 9.0);
				showMyList(pageNum);
				return;
			}
			
			var str = "";
			if(myBbstList == null || myBbstList.length == 0) {
				bbstBox.html("<p>작성된 게시글이 없습니다.</p><br />");
				return;
			}
			
			for(var i = 0, len = myBbstList.length || 0; i < len; i++) {
				str += '<div class="s-bbst-item-container" data-bbstid="' + myBbstList[i].bbstId + '">';
				str += '<div class="s-bbst-img-div"><img class="s-bbst-img" src="' + myBbstList[i].cnImg + '" /></div>';
				str += '<div class="s-bbst-info-div"><p style="font-weight: bold">제목:' + myBbstList[i].title + '</p>';
				str += '<p>작성일시:' + myBbstService.displayTime(myBbstList[i].regdate) + '</p>';
				str += '<p>조회수:' + myBbstList[i].inqrCnt + '</p></div>';
				str += '<div class="s-bbst-item-overlay"><div class="s-bbst-item-overlay-info"><p><i class="fas fa-heart" style="color: white;"></i>' + myBbstList[i].likeCnt + '</p>';
				str += '<p><i class="fas fa-comment-dots" style="color: white;"></i>' + myBbstList[i].replyCnt + '</p></div></div></a></div>';
			}
			bbstBox.html(str);
			showMyListPage(myBbstCnt);
		});
	}
	
	// 게시글 선택 시 해당 게시글로 이동
	bbstBox.on("click", ".s-bbst-item-container", function(e) {
		var targetBbstId = $(this).data("bbstid");
		location.href = location.href = "/cheers/get?bbstId=" + targetBbstId;
	});
	
	// ***** 페이징 처리 - 공통으로 적용 예정
	// 페이지 번호 출력
	function showMyLikePage(myBbstCnt){
		console.log(myBbstCnt);
		var endNum = Math.ceil(pageNum / 9.0) * 9;
		var startNum = endNum - 8;
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 9 >= myBbstCnt) {
			endNum = Math.ceil(myBbstCnt / 9.0);
		}
		
		if(endNum * 9 < myBbstCnt){
			next = true;
		}
		
		var str = "<ul>";
		
		if(prev){
			str += "<li class='d-paging-btn-none'><a href='" + (startNum - 1)+ "'>&#60;</a></li>";
		}
		for(var i=startNum; i <=endNum; i++){
			var active = pageNum == i? "active":"";
			str+="<li class='d-paging-btn-"+active +"'><a href="+i+">"+i+"</a></li>";
		}
		if(next){
			str+="<li class='d-paging-btn-none'><a href='"+ (endNum + 1)+"'>&#62;</a></li>";
		}
		str += "</ul>";
		paging.html(str);
	}
});

</script>

</body>
</html>