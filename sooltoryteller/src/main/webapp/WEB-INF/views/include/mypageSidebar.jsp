<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/topmenu.jsp"%>
<link rel="stylesheet" href="/resources/css/mypage.css">

</head>
<body>

<div class="s-main-background">
		<div class="d-mypage-wrapper">
			<div class="d-mypage-left">
				<div class="d-left-con">
					<div class="d-mypage-profile-con">
						<img class="d-mypage-profile" src='<c:out value="${member.img}" />'>
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
							<li class="d-mypage-li"><a href='/mypage/revw'>내가 작성한 리뷰
							</a></li>
							<li class="d-mypage-li"><a href='/mypage/like'>좋아요 누른 전통주 </a>
							</li>
						</ul>
					</ul>
					<ul class="d-mypage-menu-con">
						<li class="d-mypage-ref"><a href='/mypage/myactivity'>게시글 </a></li>
						<ul class="d-mypage-menu">
							<li class="d-mypage-li"><a href='/mypage/mypost'>내가 작성한
									게시글</a></li>
							<li class="d-mypage-li"><a href='/mypage/myreply'>내가
									작성한 댓글</a></li>
							<li class="d-mypage-li"><a href='/mypage/mylikedpost'>좋아요 누른
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
