<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/include/topmenu.jsp"%>

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
	background: url("/resources/img/bbst-bg-img.png");
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
enctype="multipart/form-data">
	<div class="s-register-container">
		<div class="s-register-topbar">
			<div class="s-topbar-title-div">
				<p>건배의 광장 게시글 수정</p>
			</div>
			<div class="s-topbar-btn-div">
				<input type="button" class="s-topbar-btn" style="background-color: rgb(181, 135, 189);"
				onclick="location.href='/cheers/list'" value="취소" />
				<input type="submit" class="s-topbar-btn" id="s-modifyBtn"
				style="background-color: #6b5b95;" value="수정" />
			</div>
		</div>
		
		<!-- 제목 -->
		<div class="s-form-title-div">
			<input type="text" class="s-form-title" name="title" style="border:none"
			value="<c:out value='${bbst.title }' />" required /> 
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
				style="border: 1px rgb(245, 245, 245) solid;" required><c:out value='${bbst.cn }' /></textarea>
			</div>
		</div>
	</div>
	
	<!-- hidden으로 보낼 데이터 -->
	<input type="hidden" name="bbstId" value="<c:out value='${bbst.bbstId}' />" />
</form>

<script type="text/javascript">

// 폼 가져오기

$(document).ready(function() {
var formObj = $("#modifyform");
	
	// 게시글 입력항목 유효성 검사
	// 게시글 제목

	// 수정 버튼 클릭 시
	$("#s-modifyBtn").on("click", function(e) {
		e.preventDefault();
		
		// 게시글 사진을 수정하지 않을 경우
		var file = $('#s-form-cnImg').val();
		if(file == "") {
			$('#s-form-cnImg').prop('type', 'text');
			var prevFile = $('#s-form-cnImg').val();
			alert(prevFile);
		}
		
		/* formObj.attr("action", "/cheers/modify"); */
		formObj.submit();
	});
});

	
</script>

</body>
</html>