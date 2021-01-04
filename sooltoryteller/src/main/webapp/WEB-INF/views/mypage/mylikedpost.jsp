<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script type="text/javascript">
	// 로그인이 안된 상태면 로그인페이지로 넘어가게
	let msg = "${msg}";
	if (msg != "") {
		alert(msg);
		location.href = "/login";
	}
</script>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/include/mypageSidebar.jsp"%>

<html>
<head>
<title>내가 좋아요 누른 게시글</title>
<link rel="stylesheet" href="/resources/css/mypage/mylikedpost.css">
</head>

<body>
			<h2 style="width: 780px;">좋아요 누른 게시글</h2>
			<div class="s-bbst-container">
				<div class="s-bbst-container-box"></div>
			</div>
			
			<!-- 페이징 처리 -->
			<div class="d-paging" style="width: 700px; margin-right: 25px;"></div>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp" %>

<script type="text/javascript" src="/resources/js/bbstLike.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var memberIdValue = "<c:out value='${member.memberId}' />";
	var bbstBox = $(".s-bbst-container-box");
	var paging = $(".d-paging");
	var pageNum = 1;
	showMyList(1);
	
	// 페이지 번호 출력
	function showMyLikedPostPage(myLikeCnt) {
		console.log(myLikeCnt);
		var endNum = Math.ceil(pageNum / 5.0) * 5;
		var startNum = endNum - 4;
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 9 >= myLikeCnt) {
			endNum = Math.ceil(myLikeCnt / 9.0);
		}
		if(endNum * 9 < myLikeCnt){
			next = true;
		}
		
		var str = "<ul class='d-paging'>";
		if(prev){
			str += "<li class='d-paging-btn-none'><a href='" + (startNum - 1)+ "'>&#60;</a></li>";
		}
		for(let i=startNum; i <=endNum; i++){
			let active = pageNum == i? "active":"none";
			str+="<li class='d-paging-btn-"+active +"'><a href="+i+">"+i+"</a></li>";
		}
		if(next){
			str+="<li class='d-paging-btn-none'><a href='"+ (endNum + 1)+"'>&#62;</a></li>";
		}
		str += "</ul>";
		paging.html(str);
	}
	paging.on("click", "li a", function(e) {
		e.preventDefault();
		let targetPageNum =$(this).attr("href");
		pageNum = targetPageNum;
		showMyList(pageNum);
	});
	
	// 리스트 출력
	function showMyList(page) {
		bbstLikeService.getMyBbstLike({memberId : memberIdValue, page : page || 1},
			function(myLikeCnt, myLikeList) {
			
			if(page == -1) {
				pageNum = Math.ceil(myLikeCnt / 9.0);
				showMyList(pageNum);
				return;
			}
			
			var str = "";
			if(myLikeList == null || myLikeList.length == 0) {
				bbstBox.html("<p style='margin-top: 35px;'>좋아요를 누른 게시글이 없습니다.</p><br />");
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
			showMyLikedPostPage(myLikeCnt);
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