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

<html>
<head>
<title>건배의 광장 - 조회</title>
<link rel="stylesheet" href="/resources/css/cheers/get.css">
</head>

<body>
<%@ include file="/WEB-INF/views/include/topmenu.jsp"%>

<div class="s-main-background" style="background-color: #daebe8; padding: 50px 0 30px 0">
	<div class="s-main-column">
	
		<div class="s-bbst-container">
			<!-- 게시글 제목 -->
			<div class="s-title-container">
				<p class="s-title">제목</p> <p class="s-title-val"><c:out value='${bbst.title }' /></p>
			</div>
			
			<!-- 게시글 작성자 정보 -->
			<div class="s-writer-info-container">
				<div class="s-writer-info-btn-div">
					<button data-oper="list" class="s-listBtn" style="">목록</button>
					<!-- 본인이 쓴 게시물만 수정 가능 -->
					<c:if test="${memberId == bbst.memberId or admin eq 'ADMIN' }">
						<button data-oper="modify" class="s-modifyBtn">수정</button>
					</c:if>
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
					<p>조회수: <c:out value='${bbst.viewCnt }' /></p>
				</div>
				
				<!-- 회원 프로필 사진 -->
				<div class="s-writer-img-div">
					<span class="s-writer-img-span" style="margin: 4px 0 0 7px;">
						<img class="s-writer-img" src="<c:out value='${bbst.img }' />" />
					</span>
				</div>
			</div>
			
			<!-- 게시글 내용 -->
			<div class="s-cn-container">
				<div class="s-bbst-cn-div">
					<div class="s-bbst-cnImg-div">
						<img class="s-bbst-cnImg" src="<c:out value='${bbst.cnImg }' />" />
					</div>
					<div class="s-bbst-cnVal-div">
						<p class="s-bbst-cn">내용</p><p><c:out value='${bbst.cn }' /></p>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 좋아요수, 댓글수 -->
		<div class="s-bbst-cnt-container">
			<i class="far fa-heart" id="s-bbst-like" style="color: red;"></i>&nbsp;좋아요&nbsp;<p id="s-bbst-likeCnt"><c:out value='${bbst.likeCnt }' /></p>
			&nbsp;&nbsp;&nbsp;<i class="far fa-comment-dots"></i>&nbsp;댓글&nbsp;<p id="s-bbst-replyCnt"><c:out value='${bbst.replyCnt }' /></p> 
		</div>
		
		<!-- 댓글 -->
		<div class="s-bbstReplyList-container">
			<div class="s-bbstReplyList-top">
				<p class="s-bbstReply">댓글</p>
				<!-- 댓글 등록 버튼 -->
				<button class="s-bbstReply-openModalBtn" id="s-bbstReply-openModalBtn">댓글쓰기</button>
			</div>
			
			<ul class="s-bbstReplyList-body"></ul>
		</div>
		
		<div class="s-bbstReplyList-footer"></div>
		
		<!-- 댓글 등록 모달 -->
		<div class="s-bbstReply-modal-container" id="s-bbstReply-modal-container">
			<div class="s-bbstReply-modal-content">
				<div class="s-bbstReply-modal-top">
					<input class="s-modal-regdate" id="s-modal-regdate" name="s-modal-regdate" />
				</div>
				
				<div class="s-bbstReply-modal-body">
					<i class="fas fa-user"></i>&nbsp;<label id="s-bbstReply-name">작성자 </label><br />
					<input type="text" class="s-modal-name" name="s-modal-name" readonly="readonly" /><br />
					<input type="hidden" class="s-modal-memberId" name="s-modal-memberId" />
					
					<i class="fas fa-edit"></i>&nbsp;<label>내용</label><br />
					<textarea class="s-modal-replyCn" id="s-modal-replyCn" name="s-modal-replyCn"
					placeholder="내용을 입력해주세요." maxlength=100></textarea><br />
				</div>
				
				<div class="s-bbstReply-modal-footer">
					<button class="s-modalBtn" id="s-modal-cancelBtn" type="button">취소</button>
					<button class="s-modalBtn" id="s-modal-registerBtn" type="button">등록</button>
					<button class="s-modalBtn" id="s-modal-modifyBtn" type="button">수정</button>
					<button class="s-modalBtn" id="s-modal-removeBtn" type="button">삭제</button>
				</div>
			</div>
		</div>
</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp" %>

<!-- 댓글 javascript -->
<script type="text/javascript" src="/resources/js/bbstReply.js"></script>

<!-- 서버단 유효성 검사 -->
<script type="text/javascript">	
let errorMsg = "${errorMsg}";
if(errorMsg != "") {
	alert(errorMsg);
}
</script>

<!-- 댓글 모달 작업 -->
<script type="text/javascript">
$(document).ready(function() {
	
	var bbstIdValue = "<c:out value='${bbst.bbstId}' />";
	var img = "<c:out value='{bbst.img}' />";
	var replyUL = $(".s-bbstReplyList-body");
	var loginMemberId = "<c:out value='${memberId}' />";
	var loginName = "<c:out value='${name}' />";
	
	// 모달 열기 버튼
	var openModalBtn = $("#s-bbstReply-openModalBtn");
	// 모달
	var replyModal = $("#s-bbstReply-modal-container");
	// 댓글 작성자 닉네임
	var replyName = replyModal.find("input[name='s-modal-name']");
	// 댓글 내용
	var replyCn = replyModal.find("textarea[name='s-modal-replyCn']");
	// 댓글 등록 일시
	var replyRegdateTitle = $(".s-modal-regdate-title");
	var replyRegdate = replyModal.find("input[name='s-modal-regdate']");
	// 모달 버튼
	var registerReplyBtn = $("#s-modal-registerBtn");
	var cancelReplyBtn = $("#s-modal-cancelBtn");
	var modifyReplyBtn = $("#s-modal-modifyBtn");
	var removeReplyBtn = $("#s-modal-removeBtn");
	// 댓글수
	var replyCnt = $("#s-bbst-replyCnt").html();
	
	var pageNum = 1;
	var replyPageFooter = $(".s-bbstReplyList-footer");
	showList(1);
	
	// 댓글 페이지 번호 출력
	function showReplyPage(replyCnt) {
		var endNum = Math.ceil(pageNum / 5.0) * 5;
		var startNum = endNum - 4;
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 5 >= replyCnt) {
			endNum = Math.ceil(replyCnt / 5.0);
		}
		if(endNum * 5 < replyCnt){
			next = true;
		}
		var str = "<ul class='s-bbstReplyList-pageContainer'>";
		
		if(prev) {
			str += "<li class='s-bbstReplyList-pageItem previous'><a class='s-bbstReplyList-pageLink' href='" + (startNumm -1) + "'><i class='fas fa-arrow-circle-left'></i></a></li>";
		}
		for(var i = startNum; i <= endNum; i++) {
			var active = pageNum == i ? "active" : "";
			str += "<li class='s-bbstReplyList-pageItem " + active + " '><a class='s-bbstReplyList-pageLink' href='" + i + "'>" + i + "</a></li>";
		}
		if(next) {
			str += "<li class='s-bbstReplyList-pageItem next'><a class='s-bbstReplyList-pageLink' href='" + (endNum + 1) + "'><i class='fas fa-arrow-circle-right'></i></a></li>";
		}
		str += "</ul></div>";
		replyPageFooter.html(str);
	}
	
	// 댓글 페이지 번호 클릭 시 새로운 댓글 가져오기
	replyPageFooter.on("click", "li a", function(e) {
		e.preventDefault();
		console.log("BBST REPLY PAGE CLICK");
		
		var targetPageNum = $(this).attr("href");
		console.log("targetPageNum: " + targetPageNum);
		pageNum = targetPageNum;
		
		showList(pageNum);
	});
	
	// 댓글 리스트
	function showList(page) {
		console.log("SHOW BBST REPLY LIST PAGE: " + page);
		
		bbstReplyService.getList({bbstId : bbstIdValue, page : page || 1 },
			function(replyCnt, list) {
			console.log("list: " + list);
		
			if(page == -1) {
				pageNum = Math.ceil(replyCnt / 5.0);
				showList(pageNum);
				return;
			}
			
			var str = "";
			if(list == null || list.length == 0) {
				replyUL.html("<p style='font-size: 15px;'>등록된 댓글이 없습니다.</p><br />");
				return;
			}
			// 각 댓글에 보일 데이터
			for(var i = 0, len = list.length || 0; i < len; i++) {
				str += "<li class='s-bbstReply-item' data-bbstreplyid='" + list[i].bbstReplyId + "'>";
				str += "<div class='s-bbstReply-img-div'><span class='s-writer-img-span' style='margin-top: 5px;'><img class='s-writer-img' src=" + list[i].img + " /></span></div>"
				str += "<div class='s-bbstReply-info-div'><strong class='s-bbstReply-name'>" + list[i].name + "</strong>";
				str += "<p class='s-bbstReply-cn'>" + list[i].replyCn + "</p>";
				str += "<small class='s-bbstReply-regdate'>" + bbstReplyService.displayTime(list[i].regdate) + "</small></div></li>"; 
			}
			replyUL.html(str);
			showReplyPage(replyCnt);
		});
	} // end showList
	
	// 댓글 클릭 이벤트 처리
	replyUL.on("click", "li", function(e) {
		var bbstReplyId = $(this).data("bbstreplyid");
		
		bbstReplyService.get(bbstReplyId, function(reply) {
			if(reply.memberId != loginMemberId) {
				modifyReplyBtn.hide();
				removeReplyBtn.hide();
			} else {
				modifyReplyBtn.show();
				removeReplyBtn.show();
			}
			
			replyName.val(reply.name);
			replyCn.val(reply.replyCn);
			replyRegdate.val(bbstReplyService.displayTime(reply.regdate)).attr("readonly", "readonly");
			replyModal.data("bbstreplyid", reply.bbstReplyId);
			
			registerReplyBtn.hide();
			replyRegdateTitle.show();
			replyRegdate.show();
			
			replyModal.fadeIn(100);
		});
	});
	
	// 댓글 등록 모달
	// 댓글쓰기 버튼 누르면 모달 열림
	openModalBtn.on("click", function() {
		// 보일 항목
		registerReplyBtn.show();
		// 숨길 항목
		replyRegdateTitle.hide();
		replyRegdate.hide();
		modifyReplyBtn.hide();
		removeReplyBtn.hide();
		
		// input 데이터 비우기
		replyModal.find("input").val("");
		$("#s-modal-replyCn").val("");
		
		// 로그인한 사용자 닉네임 가져오기
		replyName.val(loginName);
		
		// 모달 열기 실행
		replyModal.fadeIn(200);
	});
	
	// 등록 버튼 누르면
	registerReplyBtn.on("click", function(e) {
		// 유효성 검사
		if($.trim(replyCn.val()).length < 2) {
			alert("최소 2자 이상의 댓글을 입력해주세요.");
			replyCn.val();
			return false;
		} else if($.trim(replyCn.val()).length > 100) {
			alert("최대 100자 이하의 댓글을 입력해주세요.");
			replyCn.val();
			return false;
		} else {
			if(confirm("댓글을 등록하시겠습니까?")) {
				var reply = {
					memberId : loginMemberId,
					replyCn : replyCn.val(),
					bbstId : bbstIdValue
				};
				
				bbstReplyService.add(reply, function(result) {
					alert("댓글이 성공적으로 등록되었습니다.");
					$("#s-bbst-replyCnt").html(Number(replyCnt) + 1);
					replyModal.val("");
					replyModal.fadeOut(200);
					showList(-1);
				});
			} else {
				replyModal.hide();
			}
		}
	});
	
	// 취소 버튼 누르면 모달 닫힘
	cancelReplyBtn.on("click", function(e) {
		replyModal.fadeOut(100);
	});
	
	// 수정 버튼 누르면
	modifyReplyBtn.on("click", function(e) {
		// 유효성 검사
		if($.trim(replyCn.val()).length < 2) {
			alert("최소 2자 이상의 댓글을 입력해주세요.");
			replyCn.val();
			return false;
		} else if($.trim(replyCn.val()).length > 100) {
			alert("최대 100자 이하의 댓글을 입력해주세요.");
			replyCn.val();
			return false;
		} else {
			if(confirm("해당 댓글을 수정하시겠습니까?")) {
				var reply = {bbstReplyId : replyModal.data("bbstreplyid"), replyCn : replyCn.val()};
				
				bbstReplyService.update(reply, function(result) {
					if(result === success) {
						alert("댓글이 성공적으로 수정되었습니다.");
						replyModal.fadeOut(200);
						showList(pageNum);
					}
				});
			} else {
				replyModal.hide();
			}
		}
	});
	
	// 삭제 버튼 누르면
	removeReplyBtn.on("click", function(e) {
		
		if(confirm("해당 댓글을 삭제하시겠습니까?")) {
			var bbstReplyId = replyModal.data("bbstreplyid");
			
			bbstReplyService.remove(bbstReplyId, function(result) {
				if(result === success) {
					$("#s-bbst-replyCnt").html(Number(replyCnt) - 1);
					replyModal.fadeOut(200);
					showList(pageNum);
					alert("댓글이 성공적으로 삭제되었습니다.");
				}
			});
		} else {
			replyModal.hide();
		}
	});
});
</script>

<!-- 좋아요 작업 -->
<script type="text/javascript" src="/resources/js/bbstLike.js"></script>
<script type="text/javascript">

var memberIdValue = "${memberId}" == "" ? -1 : "${memberId}";
var bbstIdValue = ${bbst.bbstId};

$(document).ready(function() {
	// 좋아요 상태
	bbstLikeService.likeStus({memberId : memberIdValue, bbstId : bbstIdValue}, function(data) {
		if(data) {
			$("#s-bbst-like").attr("class", "fas fa-heart");
		} else {
			$("#s-bbst-like").attr("class", "far fa-heart");
		}
	});
});

// 좋아요 or 좋아요 취소
$("#s-bbst-like").on({"click" : function() {
	
	var likeCnt = $("#s-bbst-likeCnt").html();
	
	if(memberIdValue != -1) {
		bbstLikeService.likeStus({memberId : memberIdValue, bbstId : bbstIdValue}, function(data) {
			if(data) {
				bbstLikeService.cancelLikeBbst({memberId : memberIdValue, bbstId : bbstIdValue}, function(count) {
					console.log("CANCEL LIKE BBST");
					
					if(count === "success") {
						$("#s-bbst-like").attr("class", "far fa-heart");
						$("#s-bbst-likeCnt").html(Number(likeCnt) - 1);
					}
				});
				return;
			} else {
				bbstLikeService.likeBbst({memberId : memberIdValue, bbstId : bbstIdValue}, function(count) {
					console.log("LIKE BBST");
					if(count === "result") {
						$("#s-bbst-like").attr("class", "fas fa-heart");
						$("#s-bbst-likeCnt").html(Number(likeCnt) + 1);
					}
				});
			}
		});
	} else {
		window.location.href = "/login";
	}
}});
</script>

<!-- 게시글 수정 및 삭제 버튼 -->
<script type="text/javascript">
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
</div>
</div>
</body>
</html>