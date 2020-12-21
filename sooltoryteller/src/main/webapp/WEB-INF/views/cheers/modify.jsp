<!-- jquery script src -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

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

<link rel="stylesheet" href="/resources/css/cheers/modify.css">

<div class="s-main-background">
	<div class="s-main-column">
		<form role="form" id="modifyform" action="/cheers/modify" method="post"
		enctype="multipart/form-data">
			<div class="s-register-container">
				<div class="s-register-topbar">
					<div class="s-topbar-title-div">
						<p class="s-title">게시글 수정</p>
					</div>
					<div class="s-topbar-btn-div">
						<button type="button" data-oper="cancel" class="s-topbar-btn" id="s-cancelBtn">취소</button>
						<button type="submit" data-oper="modify" class="s-topbar-btn" id="s-modifyBtn">수정</button>
						<button type="button" data-oper="remove" class="s-topbar-btn" id="s-removeBtn">삭제</button>
					</div>
				</div>
				
				<!-- 제목 -->
				<div class="s-form-title-div">
					<input type="text" class="s-form-title" name="title" style="border:none; height:27px; width:794px;"
					value="<c:out value='${bbst.title }' />" required /> 
				</div>
				
				<!-- 게시글 내용 -->
				<div class="s-cn-container">
					<!-- 사진 -->
					<div class="s-form-cnImg-div">
						<div class="s-select-cnImg">
							<img src="<c:out value='${bbst.cnImg }' />" />
						</div>
						<!-- 파일 확장자 설정해서 에러 막기 -->
						<input type="file" name="file" class="s-form-cnImg" id="s-form-cnImg" style="border:none;"
						accept="image/jpeg,image/gif,image/png" value="<c:out value='${bbst.cnImg }' />"
						onchange="checkType(this)" required />
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
					<textarea class="s-form-cn" name="cn" rows="10" placeholder="내용을 입력해주세요."
					style="border: 1px rgb(245, 245, 245) solid;" required><c:out value='${bbst.cn }' /></textarea>
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
	</div>
</div>

<!-- 서버단 유효성 검사 -->
<script type="text/javascript">	
let errorMsg = "${errorMsg}";
if(errorMsg != "") {
	alert(errorMsg);
}
</script>

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
			
			formObj.submit();
			
		// 수정 버튼 클릭 시
		} else if(operation === "modify") {
			e.preventDefault();
			
			// 게시글 입력항목 유효성 검사
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
			
			// 게시글 사진을 수정하지 않을 경우
			var file = $('#s-form-cnImg').val();
			if(file == "") {
				$('#s-form-cnImg').prop('type', 'text');
				var prevFile = $('#s-form-cnImg').val();
			}
			
			var chk = confirm("게시글을 수정하시겠습니까?");
			if(chk) {
				alert("게시글이 수정되었습니다.");
				formObj.attr("action", "/cheers/modify");
				formObj.submit();
			}
		
		// 삭제 버튼 클릭 시
		} else if(operation === "remove") {
			
			var chk = confirm("게시글을 삭제하시겠습니까?");
			if(chk) {
				alert("게시글이 삭제되었습니다.");
				formObj.attr("action", "/cheers/remove");
				formObj.submit();
			}
		}
	});	
});
	
</script>

</body>
</html>