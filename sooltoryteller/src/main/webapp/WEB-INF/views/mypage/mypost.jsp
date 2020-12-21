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

.s-bbst-container {
	width: 100%;
	/* height: 750px; */
	height: auto;
	margin: 0 auto;
}

.s-bbst-item-container {
	height: 220px;
	width: 177px;
	margin: 10px 0 5px 80px;
	display: inline-block;
	border: 1px #f1f1f1 solid;
	position: relative;
	float: left;
	cursor: pointer;
}

.s-bbst-img {
	height: 175px;
	width: 175px;
	display: block;
}

.s-bbst-item-overlay {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	height: 175px;
	width: 175px;
	opacity: 0;
	transition: .3s ease;
	background-color: rgb(181, 135, 189);
}

.s-bbst-item-container:hover .s-bbst-item-overlay {
	opacity: 0.9;
}

.s-bbst-item-overlay-info {
	font-size: 14px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	text-align: center;
	display: inline-block;
}

.s-bbst-info-div {
	height: 35px;
	width: 175px;
	margin-top: 3px;
	font-size: 12px;
}

.s-bbst-item-overlay-info {
	width: 175px;
}

.s-bbst-item-overlay-span {
	color: white;
	font-size: 10px;
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
			<h2>내가 작성한 게시글</h2>
			<div class="s-bbst-container">
				<div class="s-bbst-container-box"></div>
			</div>
			
			<!-- 페이징 처리 -->
			<div class="d-paging" style="width: 700px; margin-right: 70px;"></div>
		</div>
	</div>
</div>

<%-- <%@include file="/WEB-INF/views/include/footer.jsp" %> --%>

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
	
	// 페이지 번호 출력
	function showMyBbstPage(myBbstCnt) {
		console.log(myBbstCnt);
		var endNum = Math.ceil(pageNum / 5.0) * 5;
		var startNum = endNum - 4;
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 5 >= myBbstCnt) {
			endNum = Math.ceil(myBbstCnt / 5.0);
		}
		if(endNum * 5 < myBbstCnt){
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
				str += '<div class="s-bbst-info-div"><p style="font-weight: bold">' + myBbstList[i].title + '</p>';
				str += '<p>' + myBbstService.displayTime(myBbstList[i].regdate) + '</p></div>';
				str += '<div class="s-bbst-item-overlay"><div class="s-bbst-item-overlay-info"><i class="fas fa-eye" style="color: white;"></i> <span class="s-bbst-item-overlay-span">' + myBbstList[i].viewCnt + '</span>&nbsp;';
				str += '<i class="fas fa-heart" style="color: white;"></i> <span class="s-bbst-item-overlay-span">' + myBbstList[i].likeCnt + '</span>&nbsp;';
				str += '<i class="fas fa-comment-dots" style="color: white;"></i> <span class="s-bbst-item-overlay-span">' + myBbstList[i].replyCnt + '</span></div></div></div>';
			}
			bbstBox.html(str);
			showMyBbstPage(myBbstCnt);
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