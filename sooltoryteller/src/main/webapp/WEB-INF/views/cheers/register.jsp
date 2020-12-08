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

<!-- fontawesome -->
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
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
	width: 200px;
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

<form role="form" name="registerForm" action="/cheers/register" method="post"
enctype="multipart/form-data" onsubmit="return checkForm();">

	<div class="s-register-container">
		<div class="s-register-topbar">
			<div class="s-topbar-title-div">
				<p>건배의 광장 글쓰기</p>
			</div>
			<div class="s-topbar-btn-div">
				<input type="button" class="s-topbar-btn" style="background-color: rgb(181, 135, 189);"
				onclick="location.href='/cheers/list'" value="취소" />
				<input type="submit" class="s-topbar-btn" style="background-color: #6b5b95;" value="등록" />
			</div>
		</div>
		
		<!-- 제목 -->
		<div class="s-form-title-div">
			<input type="text" class="s-form-title" id="s-form-title" name="title" placeholder="제목을 입력해주세요." 
			style="border:none" required onclick="checkTitle();" />
		</div>
		
		<!-- 사진 -->
		<div class="s-form-cnImg-div">
			<div class="s-select-cnImg"><img src="" /></div>
			<p>사진 첨부는 필수입니다.</p> <br />
			<!-- 파일 확장자 설정해서 에러 막기 -->
			<input type="file" name="file" class="s-form-cnImg" id="s-form-cnImg"
			style="border:none;" required />
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
				<textarea class="s-form-cn" id="s-form-cn" name="cn" rows="10" placeholder="내용을 입력해주세요."
				style="border: 1px rgb(245, 245, 245) solid;" required onclick="checkCn();"></textarea>
			</div>
		</div>
	</div>
</form>

<script type="text/javascript">

// 게시글 입력항목 유효성 검사
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
		alert("제목 : 최소 5자 이상 입력해주세요.");
		return false;
	}
	// 최대 30자
	if(title.value.length > 30) {
		alert("제목 : 최대 30자까지 입력하실 수 있습니다.");
		return false;
	}
	
	// 2. 게시글 내용
	var cn = document.getElementById("s-form-cn");
	
	// 공백만 입력
	if(cn.value.replace(blank_pattern, '') == "") {
	    alert("내용 : 공백만 입력되었습니다.");
	    return false;
	}
	
	// 최소 10자
	if(cn.value.length < 10) {
		alert("내용 : 최소 10자 이상 입력해주세요.");
		return false; 
	}
	// 최대 500자
	if(cn.value.length > 500) {
		alert("내용 : 최대 500자까지 입력하실 수 있습니다.");
		return false;
	}
	
	document.registerForm.submit();
}

</script>

</body>
</html>