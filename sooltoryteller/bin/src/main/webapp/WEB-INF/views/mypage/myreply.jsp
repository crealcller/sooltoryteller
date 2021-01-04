<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/include/mypageSidebar.jsp"%>

<html>
<head>
<title>내가 작성한 댓글</title>
<script type="text/javascript">
	// 로그인이 안된 상태면 로그인페이지로 넘어가게
	let msg = "${msg}";
	if (msg != "") {
		alert(msg);
		location.href = "/login";
	}
</script>
<link rel="stylesheet" href="/resources/css/mypage/myreply.css">
</head>
<body>
			<h2 style="width: 780px;">내가 작성한 댓글</h2>
			<div class="s-myBbstReply-container">
				<ul class="s-myBbstReply-ul"></ul>
			</div>
			
			<!-- 페이징 처리 -->
			<div class="d-paging" style="width: 700px; margin-right: 35px;"></div>
			
			<!-- 댓글 모달 -->
			<div class="s-bbstReply-modal-container" id="s-bbstReply-modal-container">
				<div class="s-bbstReply-modal-content">
					<div class="s-bbstReply-modal-top">
						<input class="s-modal-regdate" id="s-modal-regdate" name="s-modal-regdate" />
					</div>
					
					<div class="s-bbstReply-modal-body">
						<i class="fas fa-user"></i>&nbsp;<label id="s-bbstReply-name">작성자 </label><br />
						<input type="text" class="s-modal-name" name="s-modal-name" readonly="readonly" /><br />
						<input type="hidden" class="s-modal-memberId" name="s-modal-memberId" value="" />
						
						<i class="fas fa-edit"></i>&nbsp;<label>내용</label><br />
						<textarea class="s-modal-replyCn" id="s-modal-replyCn" name="s-modal-replyCn"
						placeholder="내용을 입력해주세요." maxlength=100></textarea><br />
					</div>
					
					<div class="s-bbstReply-modal-footer">
						<button class="s-modalBtn" id="s-modal-cancelBtn" type="button">취소</button>
						<!-- <button class="s-modalBtn" id="s-modal-registerBtn" type="button">등록</button> -->
						<button class="s-modalBtn" id="s-modal-modifyBtn" type="button">수정</button>
						<button class="s-modalBtn" id="s-modal-removeBtn" type="button">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp" %>

<script type="text/javascript" src="/resources/js/bbstReply.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	var memberIdValue = "<c:out value='${member.memberId}' />";
	var myReplyUL = $(".s-myBbstReply-ul");
	var myReply = $(".s-bbstReply-cn-div");
	var loginMemberId = "<c:out value='${memberId}' />";
	var loginName = "<c:out value='${name}' />";
	var paging = $(".d-paging");
	var pageNum = 1;
	showMyList(1);
	
	// 페이지 번호 출력
	function showMyReplyPage(myReplyCnt) {
		console.log(myReplyCnt);
		var endNum = Math.ceil(pageNum / 5.0) * 5;
		var startNum = endNum - 4;
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 5 >= myReplyCnt) {
			endNum = Math.ceil(myReplyCnt / 5.0);
		}
		if(endNum * 5 < myReplyCnt){
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
		bbstReplyService.getMyBbstReply({memberId : memberIdValue, page : page || 1},
			function(myReplyCnt, myReplyList) {
			
			if(page == -1) {
				pageNum = Math.ceil(myReplyCnt / 5.0);
				showMyList(pageNum);
				return;
			}
			
			var str = "";
			if(myReplyList == null || myReplyList.length == 0) {
				myReplyUL.html("<p>작성된 댓글이 없습니다.</p><br />");
				return;
			}
			
			for(var i = 0, len = myReplyList.length || 0; i < len; i++) {
				str += "<li class='s-bbstReply-li' id='s-bbstReply-li'>";
				str += "<div class='s-bbstReply-item'><div class='s-bbstReply-cnImg-div'><img class='s-bbstReply-cnImg' data-bbstid='" + myReplyList[i].bbstId + "'src='" + myReplyList[i].cnImg + "' /></div>";
				str += "<div class='s-bbstReply-cn-div' style='cursor:pointer;' data-bbstreplyid='" + myReplyList[i].bbstReplyId + "'><p class='s-bbstReply-cn'>" + myReplyList[i].replyCn + "</p></div>";
				str += "<div class='s-bbstReply-date-div'><small class='s-bbstReply-regdate'>" + bbstReplyService.displayTime(myReplyList[i].regdate) + "</small></div></div></li>";
			}
			myReplyUL.html(str);
			showMyReplyPage(myReplyCnt);
		});
	}
	
	// 댓글 선택 시 해당 게시글로 이동
	myReplyUL.on("click", ".s-bbstReply-cnImg", function(e) {
		var targetBbstId = $(this).data("bbstid");
		location.href = location.href = "/cheers/get?bbstId=" + targetBbstId;
	});
	
	// 내가 작성한 댓글 모달
	var replyModal = $("#s-bbstReply-modal-container");
	// 댓글 닉네임
	var replyName = replyModal.find("input[name='s-modal-name']");
	// 댓글 내용
	var replyCn = replyModal.find("textarea[name='s-modal-replyCn']");
	// 댓글 등록 일시
	var replyRegdateTitle = $(".s-modal-regdate-title");
	var replyRegdate = replyModal.find("input[name='s-modal-regdate']");
	// 모달 버튼
	/* var registerReplyBtn = $("#s-modal-registerBtn"); */
	var cancelReplyBtn = $("#s-modal-cancelBtn");
	var modifyReplyBtn = $("#s-modal-modifyBtn");
	var removeReplyBtn = $("#s-modal-removeBtn");
	
	// 내가 작성한 댓글 내용 클릭하면
	myReplyUL.on("click", ".s-bbstReply-cn-div", function(e) {
		var bbstReplyId = $(this).data("bbstreplyid");
		console.log("bbstReplyId: " + bbstReplyId);

		bbstReplyService.get(bbstReplyId, function(reply) {
			replyName.val(reply.name);
			replyCn.val(reply.replyCn);
			replyRegdate.val(bbstReplyService.displayTime(reply.regdate)).attr("readonly", "readonly");
			replyModal.data("bbstreplyid", reply.bbstReplyId);
			
			/* registerReplyBtn.hide(); */
			replyRegdateTitle.show();
			replyRegdate.show();
			
			if(loginMemberId == bbstReplyId) {
				modifyReplyBtn.show();
				removeReplyBtn.show();
			}
			replyModal.fadeIn(100);
		});
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
					showMyList(1);
					replyModal.fadeOut(200);
					alert("댓글이 성공적으로 수정되었습니다.");
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
				location.reload();
				replyModal.fadeOut(200);
				showMyList(pageNum);
				alert("댓글이 성공적으로 삭제되었습니다.");
			});
		} else {
			replyModal.hide();
		}
	});
});
</script>
</body>
</html>