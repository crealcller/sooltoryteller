<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/views/include/adminMenu.jsp" %>      
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
//권한체크
let msg ='${msg}';

if(msg != ''){
	alert(msg);
	location.href = '/';
}
</script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>전통주 등록</title>
</head>
<body>

<h3 style="margin: 0 0 10px 15px;">[ 전통주 등록 ]</h3>

<div class="d-admin-con">
<form id="registerForm" role="form" action="/admin/register-liq" method="post" enctype="multipart/form-data">
<div class="d-admin-half-con" style="width: 350px;">
<div class="inputArea">
<div class="select-img"><img src=""/></div>
<div class="d-file-area">
<input type="file" id="liqImg" name="file" onchange="checkType(this)" accept="image/jpeg,image/gif,image/png" required="required"/></div>
</div>
<div>
</div>
<div class="d-inputs">
양조장 <p> <input type="text" name="liqCoNm"  readonly="readonly"><button id='liqCoModal' type='button' class="d-co-search-btn">찾기</button></p>
이름<p><input type="text" name="nm"  maxlength="12" placeholder="1~12자"></p>
용량<p><input type="text" name="capct" maxlength="6"  placeholder="숫자만 입력해주세요."></p>
도수<p><input type="text" name="lv" maxlength="4" placeholder="숫자만 입력해주세요."></p>
</div>

</div>
<div class="d-admin-half-con">
주종
<p>
<input type="radio" class="cate" name='cate' value='탁주'>탁주
<input type="radio" class="cate"  name='cate' value='약주 청주'>약주/청주
<input type="radio" class="cate" name='cate' value='과실주'>과실주
<input type="radio" class="cate"  name='cate' value='증류주 리큐르'>증류주/리큐르
</p>
원재료 <p><textarea rows="2" name="irdnt" maxlength="60" placeholder="0~60자"></textarea></p>
수상내역 <p><textarea rows="3"  name="ards" maxlength="90" placeholder="0~90자"></textarea></p>
소개 <p><textarea rows="3" name="liqCn.intro" maxlength="500" placeholder="1~500자"></textarea></p>
맛 페어링<p><textarea rows="3" name="liqCn.pair" maxlength="300" placeholder="0~300자"></textarea></p>
<input type="hidden" name="liqCnt.revwCnt" value=0>
</div>
<div class="d-reg-btn" >
<button type="submit">등록</button>
</div>
</form>
</div>
</div><!--인크루드 하는 페이지에 넣기-->
</div><!--인크루드 하는 페이지에 넣기-->
</div><!--인크루드 하는 페이지에 넣기-->
<div id="liqCoList" class="d-revw-modal">
<div class="d-revw-modal-content">
<h2>양조장 선택<span class="d-revw-modal-close">&times;</span></h2>
<div class="d-modal-input">
<input id="auto" name="coNm"><button id="selectLiqCo" type='button'>선택</button></input>
</div>
</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp" %>     
<script>
	// 게시글 썸네일사진
	$("#liqImg").change(function(){
	
	if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
    $(".select-img img").attr("src", data.target.result).width(80).height(100);        
    }
    reader.readAsDataURL(this.files[0]);
    }
});
</script> 
<script type="text/javascript">
$(document).ready(function(){
	$("#d-liq-register").css('background-color', 'rgb(10, 29, 74)').css('color','white');
});
	var closeBtn =$(".d-revw-modal-close");
$(function() {
    
    var coList = [];
    var coNm
    <c:forEach items="${coList}" var="coList">
    coList.push("${coList}");
    </c:forEach>

 $("#auto").autocomplete({

        source: coList,

        select: function(event, ui) {

            console.log(ui.item);
        },

        focus: function(event, ui) {

            return false;
        }
    });
});

$("#liqCoModal").on("click",function(){

	$("#liqCoList").fadeIn(300);
  
});

$("#selectLiqCo").on("click",function(){
	var coNm = $("#liqCoList").find("input[name='coNm']").val();
	console.log("coNm :"+coNm);
	$("#registerForm").find("input[name='liqCoNm']").val(coNm);
	$("#liqCoList").fadeOut(300);
	$("#liqCoList").find("input[name='coNm']").val("");
});
//모달 끄기 버튼
closeBtn.on("click",function(e){
	$("#liqCoList").fadeOut(300);
	$("#liqCoList").find("input[name='coNm']").val("");
});
</script>
<!-- 이미지 확장자 타입 검사 -->
<script type="text/javascript">
function checkType(obj) {
   var file = $("#liqImg").val().split(".").pop().toLowerCase();
   
   if($.inArray(file, ["jpg","gif","png","jpeg","bmp"]) == -1) {
      alert("이미지 파일만 선택하실 수 있습니다.");
      $("#liqImg").val("");
      return false;
   }
}
</script>
</body>
</html>