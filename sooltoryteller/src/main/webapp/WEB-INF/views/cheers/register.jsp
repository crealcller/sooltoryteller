<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/include/topmenu.jsp"%>

<html>
<head>
<script type="text/javascript">
// 로그인이 안된 상태면 로그인페이지로 넘어가게
let msg = "${msg}";
	if(msg != ""){
		alert(msg);
		location.href = "/login";
}
</script>
<link rel="stylesheet" href="/resources/css/cheers/register.css">
</head>

<body>
<div class="s-main-background">
	<div class="s-main-column">

		<form role="form" name="registerForm" action="/cheers/register" method="post"
		enctype="multipart/form-data" onsubmit="return checkForm();">
		
			<div class="s-register-container">
				<div class="s-register-topbar">
					<div class="s-topbar-title-div">
						<p class="s-title">글쓰기</p>
					</div>
					<div class="s-topbar-btn-div">
						<input type="button" class="s-topbar-btn" id="s-bbst-cancelBtn" onclick="location.href='/cheers/list'" value="취소" />
						<input type="submit" class="s-topbar-btn" id="s-bbst-registerBtn" value="등록" />
					</div>
				</div>
				
				<!-- 제목 -->
				<div class="s-form-title-div">
					<input type="text" class="s-form-title" id="s-form-title" name="title" placeholder="제목을 입력해주세요." 
					style="border:none; height:27px; width:794px;" value="<c:out value='${bbst.title }' />" required />
				</div>
				
				<!-- 게시글 내용 -->
				<div class="s-cn-container">
					<!-- 사진 -->
					<div class="s-form-cnImg-div">
						<div class="s-select-cnImg"><img src="" /></div>
						<p class="s-cnImg-required">* 사진 첨부는 필수입니다.</p>
						<!-- 파일 확장자 설정해서 에러 막기 -->
						<input type="file" name="file" class="s-form-cnImg" id="s-form-cnImg" style="border:none;"
						accept="image/jpeg,image/gif,image/png" onchange="checkType(this)" value="<c:out value='${bbst.cnImg }' />" required />
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
						<textarea class="s-form-cn" id="s-form-cn" name="cn" placeholder="내용을 입력해주세요."
						style="border: 1px rgb(245, 245, 245) solid;" required><c:out value='${bbst.cn }' /></textarea>
				</div>
			</div>
		</form>
	</div>
</div>

</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp" %>

<!-- 이미지 확장자 타입 검사 -->
<script type="text/javascript">
function checkType(obj) {
	var file = $("#s-form-cnImg").val().split(".").pop().toLowerCase();
	
	if($.inArray(file, ["jpg","gif","png","jpeg","bmp"]) == -1) {
		alert("이미지 파일만 선택하실 수 있습니다.");
		$("#s-form-cnImg").val("");
		return false;
	}
}
</script>

<!-- 게시글 입력항목 유효성 검사 -->
<script type="text/javascript">
function checkForm() {
	// 1. 게시글 제목
	var title = $(".s-form-title");
	// 공백만 입력
	if($.trim(title.val()).length == 0) {
		alert("제목 : 공백만 입력되었습니다.");
		return false;
	}
	// 최소 3자
	if($.trim(title.val()).length < 3) {
		alert("제목 : 최소 3자 이상 입력해주세요.");
		return false;
	}
	// 최대 30자
	if($.trim(title.val()).length > 30) {
		alert("제목 : 최대 30자까지 입력하실 수 있습니다.");
		return false;
	}

	// 2. 게시글 내용
	var cn = $(".s-form-cn");
	// 공백만 입력
	if($.trim(cn.val()) == 0) {
	    alert("내용 : 공백만 입력되었습니다.");
	    return false;
	}
	// 최소 5자
	if($.trim(cn.val()).length < 5) {
		alert("내용 : 최소 5자 이상 입력해주세요.");
		return false; 
	}
	// 최대 500자
	if($.trim(cn.val()).length > 500) {
		alert("내용 : 최대 500자까지 입력하실 수 있습니다.");
		return false;
	}
	
	var chk = confirm("게시글을 등록하시겠습니까?");
	if(chk) {
		alert("게시글이 등록되었습니다.");
		history.replaceState({}, null, "register");
		formObj.attr("action", "/cheers/list");
		formObj.submit();
	}
}
</script>

<!-- 서버단 유효성 검사 -->
<!-- <script type="text/javascript">
let errorMsg = "${errorMsg}";
	if(errorMsg != "") {
		alert(errorMsg);
	}
</script> -->
</body>
</html>