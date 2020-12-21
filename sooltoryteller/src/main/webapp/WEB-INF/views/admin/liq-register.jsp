<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/views/include/adminMenu.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="UTF-8">
<title>전통주 등록</title>
<style>
.select-img img{
	margin:20px 0;
}
</style>
</head>
<body>
<h3 style="margin-left: 20px;">[전통주 등록]</h3>
<strong><c:out value="${result}"/></strong>
<strong><c:out value="${error}"/></strong>
<strong><c:out value="${liqError}"/></strong>


<form role="form" action="/admin/liq-register" method="post" enctype="multipart/form-data">
<div class="inputArea">
<label for="liqImg">사진</label>
<input type="file" id="liqImg" name="file" required="required"/>
<div class="select-img"><img src=""/></div>
</div>
<p><label>양조장 : <input type="text" maxlength="20" name="liqCoNm" placeholder="1~20자" ></label></p>
<p><label>이름 : <input type="text" name="nm"  maxlength="12" placeholder="1~12자"></label></p>
<p class='h-join-p'>
<input type="checkbox" class="cate" onclick = 'checkedCnt(this)' name='cate' value='탁주'>탁주
<input type="checkbox" class="cate" onclick = 'checkedCnt(this)' name='cate' value='약주 청주'>약주 청주
<input type="checkbox" class="cate" onclick = 'checkedCnt(this)' name='cate' value='과실주'>과실주
<input type="checkbox" class="cate" onclick = 'checkedCnt(this)' name='cate' value='증류주'>증류주
<input type="checkbox" class="cate" onclick = 'checkedCnt(this)' name='cate' value='기타류'>기타류
 </p>
<p><label>용량 : <input type="text" name="capct" maxlength="6"  placeholder="숫자만 입력해주세요."></label></p>
<p><label>도수 : <input type="text" name="lv" maxlength="4" placeholder="숫자만 입력해주세요."></label></p>
<p><label>원재료 : <input type="text" name="irdnt" maxlength="60" placeholder="0~60자"></label></p>
<p><label>수상내역 : <input type="text" name="ards" maxlength="90" placeholder="0~90자"></label></p>
<p><label>소개 : <input type="text" name="liqCn.intro" maxlength="500" placeholder="1~500자"></label></p>
<p><label>맛 페어링 : <input type="text" name="liqCn.pair" maxlength="300" placeholder="0~300자"></label></p>
<input type="hidden" name="liqCnt.revwCnt" value=0>

<button type="submit">등록하기 </button>
</form>

<script>
	// 게시글 썸네일사진
	$("#liqImg").change(function(){
	
	if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
    $(".select-img img").attr("src", data.target.result).width(30);        
    }
    reader.readAsDataURL(this.files[0]);
    }
});
</script> 
<script type="text/javascript">
$(document).ready(function(){
	$("#d-liq-register").css('background-color', 'navy').css('color','white');
});

const maxCount = 1;
let count = 0;

function checkedCnt(cate){
	if(cate.checked){
		++count;
	}else{
		--count;
	}
	
	if(count > maxCount){
		cate.checked = false;
		--count;
	}
}
</script>
</body>
</html>