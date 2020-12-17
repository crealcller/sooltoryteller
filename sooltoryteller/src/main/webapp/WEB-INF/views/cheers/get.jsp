<!-- jquery script src -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
<!-- fontawesome -->
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!-- ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<script type="text/javascript">
// 로그인이 안된 상태면 로그인페이지로 넘어가게
let msg = "${msg}";
	if(msg != ""){
		alert(msg);
		location.href = "/login";
}
	
	

</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/include/topmenu.jsp"%>

<link rel="stylesheet" href="/resources/css/cheers/get.css">

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
			<!-- 본인이 쓴 게시물만 수정 가능 -->
			<c:if test="${memberId == bbst.memberId }">
				<button data-oper="modify" class="s-listBtn" style="background-color: #6b5b95;">수정</button>
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
			<c:choose>
				<c:when test="${empty bbst.img }">
					<span class="s-writer-img-span"><i class="fas fa-user-circle" style="font-size:35px;"></i></span>
				</c:when>
				<c:when test="${not empty bbst.img }">
					<span class="s-writer-img-span"><img class="s-writer-img" src="<c:out value='${bbst.img }' />" /></span>
				</c:when>
			</c:choose>
		</div>
	</div>
	
	<!-- 게시글 내용 -->
	<div class="s-cn-container">
		<div class="s-bbst-cnImg-container">
			<div class="s-bbst-cnImg-div">
				<img class="s-bbst-cnImg" src="<c:out value='${bbst.cnImg }' />" />
			</div>
		</div>
		
		<div class="s-bbst-cn-div">
			<p>내용: <c:out value='${bbst.cn }' /></p>
		</div>
	</div>
</div>

<!-- 좋아요수, 댓글수 -->
<div class="s-bbst-cnt-container">
	<i class="far fa-heart" id="s-bbst-like"></i> 좋아요 <p id="s-bbst-likeCnt"><c:out value='${bbst.likeCnt }' /></p>
	<p><i class="far fa-comment-dots"> 댓글 <c:out value='${bbst.replyCnt }' /></i></p> 
</div>

<!-- 댓글 -->
<div class="s-bbstReplyList-container">
	<div class="s-bbstReplyList-top">
		<p>댓글</p>
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
			<h4>댓글</h4>
		</div>
		
		<div class="s-bbstReply-modal-body">
			<label id="s-bbstReply-name">작성자 </label><br />
			<input type="text" class="s-modal-name" name="s-modal-name" readonly="readonly" /><br />
			
			<label>댓글 내용</label><br />
			<input class="s-modal-replyCn" id="s-modal-replyCn" name="s-modal-replyCn" value="내용을 입력해주세요." /><br />
			
			<br /><label class="s-modal-regdate-title">댓글 등록 일자</label><br />
			<input class="s-modal-regdate" id="s-modal-regdate" name="s-modal-regdate" />
		</div>
		
		<div class="s-bbstReply-modal-footer">
			<button id="s-modal-registerBtn" type="button">등록</button>
			<button id="s-modal-cancelBtn" type="button">취소</button>
			<%-- <c:if test="${memberId == bbst.memberId }"> --%>
				<button id="s-modal-modifyBtn" type="button">수정</button>
				<button id="s-modal-removeBtn" type="button">삭제</button>
			<%-- </c:if> --%>	
		</div>
	</div>
</div>


<!-- 댓글 -->
<script type="text/javascript" src="/resources/js/bbstReply.js"></script>
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
	// 댓글 닉네임
	var replyName = replyModal.find("input[name='s-modal-name']");
	// 댓글 내용
	var replyCn = replyModal.find("input[name='s-modal-replyCn']");
	// 댓글 등록 일시
	var replyRegdateTitle = $(".s-modal-regdate-title");
	var replyRegdate = replyModal.find("input[name='s-modal-regdate']");
	// 모달 버튼
	var registerReplyBtn = $("#s-modal-registerBtn");
	var cancelReplyBtn = $("#s-modal-cancelBtn");
	var modifyReplyBtn = $("#s-modal-modifyBtn");
	var removeReplyBtn = $("#s-modal-removeBtn");
	
	var pageNum = 1;
	var replyPageFooter = $(".s-bbstReplyList-footer");
	
	showList(1);
	
	function showList(page) {
		console.log("SHOW BBST REPLY LIST PAGE: " + page);
		
		bbstReplyService.getList({bbstId : bbstIdValue, page : page || 1 }, function(replyCnt, list) {
			console.log("replyCnt: " + replyCnt);
			console.log("list: " + list);
			console.log(list);
		
			if(page == -1) {
				pageNum = Math.ceil(replyCnt / 10.0);
				showList(pageNum);
				return;
			}
			
			var str = "";
			
			if(list == null || list.length == 0) {
				replyUL.html("<p>등록된 댓글이 없습니다.</p><br />");
				return;
			}
			
			// 각 댓글에 보일 데이터
			for(var i = 0, len = list.length || 0; i < len; i++) {
				str += "<li class='s-bbstReply-item' data-bbstreplyid='" + list[i].bbstReplyId + "'>";
				if(list[i].img == null) {
					str += "<div><span class='s-writer-img-span'><i class='fas fa-user-circle' style='font-size:35px;'></i></span>";
				} else {
					str += "<div><div class='s-bbstReply-img-div'><img class='s-bbstReply-img' src='" + list[i].img + "' /></div>";
				}
				str += "<div class='s-bbstReply-info-div'><strong class='s-bbstReply-name'>" + list[i].name + "</strong>";
				str += "<p class='s-bbstReply-cn'>" + list[i].replyCn + "</p>";
				str += "<small class='s-bbstReply-regdate'>" + bbstReplyService.displayTime(list[i].regdate) + "</small></div></div></li><br /><hr /><br />"; 
			}
			replyUL.html(str);
			showReplyPage(replyCnt);
		});
	} // end showList
	
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
		// 로그인한 사용자 닉네임 가져오기
		replyName.val(loginName);
		
		// 모달 열기 실행
		replyModal.fadeIn(200);
	});
	
	// 등록 버튼 누르면
	registerReplyBtn.on("click", function(e) {
		if(confirm("댓글을 등록하시겠습니까?")) {
			var reply = {
				memberId : loginMemberId,
				replyCn : replyCn.val(),
				bbstId : bbstIdValue
			};
			
			bbstReplyService.add(reply, function(result) {
				alert("댓글이 성공적으로 등록되었습니다.");
				replyModal.val("");
				replyModal.fadeOut(200);
				showList(-1);
			});
		} else {
			replyModal.hide();
		}
		
	});
	
	// 취소 버튼 누르면 모달 닫힘
	cancelReplyBtn.on("click", function(e) {
		replyModal.fadeOut(100);
	});
	
	// 댓글 클릭 이벤트 처리
	replyUL.on("click", "li", function(e) {
		var bbstReplyId = $(this).data("bbstreplyid");

		bbstReplyService.get(bbstReplyId, function(reply) {
			replyName.val(reply.name);
			replyCn.val(reply.replyCn); // readonly 이상하게 작동하네...
			replyRegdate.val(bbstReplyService.displayTime(reply.regdate)).attr("readonly", "readonly");
			replyModal.data("bbstreplyid", reply.bbstReplyId);
			
			registerReplyBtn.hide();
			replyRegdateTitle.show();
			replyRegdate.show();
			modifyReplyBtn.show();
			removeReplyBtn.show();
			
			replyModal.fadeIn(100);
			
			// 모달 바깥부분 클릭하면
			$(document).on("click", function(e) {
				// 모달 닫기
				if(replyModal.is(e.target)) {
					replyModal.css({visibility : "hidden", opacity : 0});
				} else {
					replyModal.css({visibility : "visible", opacity : 1});
				}
			});
		});
	});
	
	// 수정 버튼 누르면
	modifyReplyBtn.on("click", function(e) {
		if(confirm("해당 댓글을 수정하시겠습니까?")) {
			var reply = {bbstReplyId : replyModal.data("bbstreplyid"), replyCn : replyCn.val()};
			
			bbstReplyService.update(reply, function(result) {
				alert("댓글이 성공적으로 수정되었습니다.");
				replyModal.fadeOut(200);
				showList(pageNum);
			});
		} else {
			replyModal.hide();
		}
	});
	
	// 삭제 버튼 누르면
	removeReplyBtn.on("click", function(e) {
		if(confirm("해당 댓글을 삭제하시겠습니까?")) {
			var bbstReplyId = replyModal.data("bbstreplyid");
			
			bbstReplyService.remove(bbstReplyId, function(result) {
				alert("댓글이 성공적으로 삭제되었습니다.");
				replyModal.fadeOut(200);
				showList(pageNum);
			});
		} else {
			replyModal.hide();
		}
	});
	
	// 댓글 페이지 번호 출력
	function showReplyPage(replyCnt) {
		
		var endNum = Math.ceil(pageNum / 10.0) * 10;
		var startNum = endNum - 9;
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 10 >= replyCnt) {
			endNum = Math.ceil(replyCnt / 10.0);
		}
		
		if(endNum * 10 < replyCnt){
			next = true;
		}
		
		var str = "<ul class='s-bbstReplyList-pageContainer'>";
		
		if(prev) {
			str += "<li class='s-bbstReplyList-pageItem'><a class='s-bbstReplyList-pageLink' href='" + (startNumm -1) + "'>이전</a></li>";
		}
		
		for(var i = startNum; i <= endNum; i++) {
			var active = pageNum == i ? "active" : "";
			
			str += "<li class='s-bbstReplyList-pageItem " + active + " '><a class='s-bbstReplyList-pageLink' href='" + i + "'>" + i + "</a></li>";
		}
		
		if(next) {
			str += "<li class='s-bbstReplyList-pageItem'><a class='s-bbstReplyList-pageLink' href='" + (endNum + 1) + "'>다음</a></li>";
		}
		
		str += "</ul></div>";
		
		console.log(str);
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
});
</script>

<!-- 좋아요 -->
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

</body>
</html>