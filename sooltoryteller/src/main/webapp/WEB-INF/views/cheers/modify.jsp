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

<!-- jquery script src -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<style>

.s-register-container {
	border: 1px solid black;
	height: 900px;
	width: 800px;
	margin: 0 auto;
	margin-top: 50px;
}

.s-register-topbar {
	height: 30px;
	width: 100%;
	display: inline-block;
}

.s-topbar-title-div {
	height: 100%;
	width: 580px;
	float: left;
}
.s-topbar-btn-div {
	height: 100%;
	width: 210px;
	float: right;
}

.s-topbar-btn {
	width: 60px;
	margin-left: 10px;
	border: none;
	cursor: pointer;
	transition: 0.3s;
	float: right;
	color: white;
}

.s-topbar-btn a {
	color: white;
}

.s-form-title-div {
	height: 30px;
	width: 100%;
	margin-bottom: 10px;
	border: 1px rgb(245, 245, 245) solid;
}

.s-form-cnImg-div {
	height: 380px;
	width: 100%;
	margin: 0 auto;
	margin-bottom: 10px;
	border: 1px rgb(245, 245, 245) solid;
}

.s-select-cnImg {
	height: 280px;
	width: 280px;
	margin: 0 auto;
	background: url("/resources/img/bbst-bg.png");
	background-repeat: no-repeat;
	background-size: 280px 280px;
}

.s-select-cnImg img {
	min-height: 280px;
	min-width: 280px;
	max-height: 280px;
	max-width: 280px;
}

.s-form-cn-div {
	height: 380px;
	width: 100%;
	border: 1px rgb(245, 245, 245) solid;
}

.s-form-cn-innerdiv {
	height: 350px;
	width: 760px;
	margin: 0 auto;
	margin-top: 15px;
}

</style>
<body>

<!-- onsubmit="return checkSubmit(this);" -->
<form role="form" id="modifyform" action="/cheers/modify" method="post"
enctype="multipart/form-data" onclick="checkForm();">
	<div class="s-register-container">
		<div class="s-register-topbar">
			<div class="s-topbar-title-div">
				<p>건배의 광장 게시글 수정</p>
			</div>
			<div class="s-topbar-btn-div">
				<button type="submit" data-oper="cancel" class="s-topbar-btn"
				style="background-color: rgb(181, 135, 189);">취소</button>
				<button type="submit" data-oper="modify" class="s-topbar-btn" id="s-modifyBtn"
				style="background-color: #6b5b95;">수정</button>
				<button type="submit" data-oper="remove" class="s-topbar-btn"
				style="background-color: #990000ff;">삭제</button>
			</div>
		</div>
		
		<!-- 제목 -->
		<div class="s-form-title-div">
			<input type="text" class="s-form-title" name="title" style="border:none"
			value="<c:out value='${bbst.title }' />" required onclick="checkTitle();" /> 
		</div>
		
		<!-- 사진 -->
		<div class="s-form-cnImg-div">
			<div class="s-select-cnImg">
				<img src="<c:out value='${bbst.cnImg }' />" />
			</div>
			
			<input type="file" name="file" class="s-form-cnImg" id="s-form-cnImg"
			style="border:none;" value="<c:out value='${bbst.cnImg }' />" />
			<input type="hidden" name="cnImg" value="<c:out value='${bbst.cnImg }' />" />
			 
			<script>
				// 게시글 썸네일사진
				$("#s-form-cnImg").change(function(){
					if(this.files && this.files[0]) {
				    var reader = new FileReader;
				    reader.onload = function(data) {
				    $(".s-select-cnImg img").attr("src", data.target.result).width(500);        
				    }
				    reader.readAsDataURL(this.files[0]);
				    }
				});
			</script>
		</div>
		
		<!-- 내용 -->
		<div class="s-form-cn-div">
			<div class="s-form-cn-innerdiv">
				<textarea class="s-form-cn" name="cn" rows="10" placeholder="내용을 입력해주세요."
				style="border: 1px rgb(245, 245, 245) solid;" required onclick="checkCn();"><c:out value='${bbst.cn }' /></textarea>
			</div>
		</div>
	</div>
	
	<!-- hidden으로 보낼 데이터 -->
	<input type="hidden" name="bbstId" value="<c:out value='${bbst.bbstId}' />" />
	<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum}' />" />
	<input type="hidden" name="amount" value="<c:out value='${cri.amount}' />" />
	<input type="hidden" name="type" value="<c:out value='${cri.type}' />" />
	<input type="hidden" name="keyword" value="<c:out value='${cri.keyword}' />" />
</form>

<input type="hidden" name="regdate" value="<fmt:formatDate pattern='yyyy/MM/dd' value='${bbst.regdate }' />" readonly="readonly" />
<input type="hidden" name="updatedate" value="<fmt:formatDate pattern='yyyy/MM/dd' value='${bbst.updatedate }' />" readonly="readonly" />

<script type="text/javascript">

$(document).ready(function() {
	
	
	// 폼 가져오기
	var formObj = $("#modifyform");

	$("button").on("click", function(e) {
		e.preventDefault();
		
		var operation = $(this).data("oper");
		console.log(operation);
		
		// 취소 버튼 클릭 시
		if(operation === "cancel") {
			// list로 이동
			formObj.attr("action", "/cheers/list").attr("method", "get");
			
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var typeTag = $("input[name='type']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			
			// form의 다른 내용들 삭제 및 pageNum, amount만 추가 
			formObj.empty();
			
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(typeTag);
			formObj.append(keywordTag);

		// 수정 버튼 클릭 시
		} else if(operation === "modify") {
			
			/* //게시글 입력항목 유효성 검사
			function checkForm() {
				
				// 1. 게시글 제목
				var title = document.getElementById("s-form-title");
				
				// 공백만 입력
				var blank_pattern = /^\s+|\s+$/g;
				if(title.value.replace(blank_pattern, '') == "") {
				    alert("제목 : 공백만 입력되었습니다.");
				    return false;
				}
				
				// 앞뒤 공백 제거하고 글자수 세기
				
				// 최소 5자
				if(title.value.length < 5) {
					alert("제목 : 최소 5자 이상 입력하셔야 합니다.");
					return false;
				}
				// 최대 30자
				if(title.value.length > 30) {
					alert("제목 : 최대 30자까지 입력하실 수 있습니다.");
					return false;
				}
				
				// 2. 게시글 내용
				var cn = document.getElementById("s-form-cn");
				cn = cn.trim();
				
				// 공백만 입력
				if(cn.value.replace(blank_pattern, '') == "") {
				    alert("내용 : 공백만 입력되었습니다.");
				    return false;
				}
				
				// 최소 10자
				if(cn.value.length < 10) {
					alert("내용 : 최소 10자 이상 입력하셔야 합니다.");
					return false;
				}
				// 최대 500자
				if(cn.value.length > 500) {
					alert("내용 : 최대 500자까지 입력하실 수 있습니다.");
					return false;
				}
				
				// document.registerForm.submit();
				return true;
			} */

			// 게시글 사진을 수정하지 않을 경우
			var file = $('#s-form-cnImg').val();
			if(file == "") {
				$('#s-form-cnImg').prop('type', 'text');
				var prevFile = $('#s-form-cnImg').val();
			}
			
			alert("게시글이 수정되었습니다.");
			formObj.attr("action", "/cheers/modify");
			
		} else if(operation === "remove") {
			// 게시글 삭제 전 확인
			var chk = confirm("해당 게시글을 삭제하시겠습니까?");
			if(chk) {
				formObj.attr("action", "/cheers/remove");
			}
		}
		formObj.submit();
	});	
});

	
</script>

</body>
</html>