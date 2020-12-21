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

<%@ include file="/WEB-INF/views/include/mypageSidebar.jsp"%>

<style>

.s-myBbstReply-ul {
	margin-top: 40px;
}

.s-bbstReply-li {
	width: 800px;
	height: 120px;
	margin: 15px auto;
	list-style: none;
	border-bottm: 1px solid black;
}

.s-bbstReply-item {
	width: 750px;
	height: 100%;
	margin: 0 auto;
}

.s-bbstReply-cnImg-div {
	margin-right: 25px;
	display: inline-block;
	float: left;
}

.s-bbstReply-cnImg {
	width: 120px;
	height: 120px;
	cursor: pointer;
}

.s-bbstReply-cn-div {
	width: 500px;
	height: 120px;
	display: inline-block;
	font-size: 14px;
}

.s-bbstReply-date-div {
	width: 100px;
	height: 120px;
	display: inline-block;
	font-size: 14px;
	text-align: right;
}

.d-paging {
	float: right;
}

.d-paging ul {
	list-style: none;
	margin: 10px;
}

.d-paging li {
	float: left;
}

.d-paging-btn-active {
	text-align: center;
	width: 25px;
	height: 25px;
	background-color: rgb(181, 135, 189);
	border-radius: 50%;
}

.d-paging-btn-active a {
	color: white;
}

.d-paging-btn-none {
	text-align: center;
	width: 25px;
	height: 25px;
	border-radius: 50%;
}
</style>
</head>
<body>
			<h2>내가 작성한 댓글</h2>
			<div class="s-myBbstReply-container">
				<ul class="s-myBbstReply-ul"></ul>
			</div>
			
			<!-- 페이징 처리 -->
			<div class="d-paging" style="width: 700px; margin-right: 35px;"></div>
		</div>
	</div>
</div>

<%-- <%@include file="/WEB-INF/views/include/footer.jsp" %> --%>

<div class="d-mypage-footer">
	<h1>footer</h1>
</div>

<script type="text/javascript" src="/resources/js/bbstReply.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var memberIdValue = "<c:out value='${member.memberId}' />";
	var myReplyUL = $(".s-myBbstReply-ul");
	var pageNum = 1;
	var paging = $(".d-paging");
	showMyList(1);
	
	// 페이지 번호 출력
	function showMyLikePage(myReplyCnt) {
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
				str += "<li class='s-bbstReply-li'>";
				str += "<div class='s-bbstReply-item'><div class='s-bbstReply-cnImg-div'><img class='s-bbstReply-cnImg' data-bbstid='" + myReplyList[i].bbstId + "'src='" + myReplyList[i].cnImg + "' /></div>";
				str += "<div class='s-bbstReply-cn-div'><p class='s-bbstReply-cn'>" + myReplyList[i].replyCn + "</p></div>";
				str += "<div class='s-bbstReply-date-div'><small class='s-bbstReply-regdate'>" + bbstReplyService.displayTime(myReplyList[i].regdate) + "</small></div></div></li>";
			}
			myReplyUL.html(str);
			showMyLikePage(myReplyCnt);
		});
	}
	
	// 댓글 선택 시 해당 게시글로 이동
	myReplyUL.on("click", ".s-bbstReply-cnImg", function(e) {
		var targetBbstId = $(this).data("bbstid");
		location.href = location.href = "/cheers/get?bbstId=" + targetBbstId;
	});
});

</script>

</body>
</html>