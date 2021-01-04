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
<title>전통주 관리</title>
<style>
.d-con{
margin:50px;
}
.d-img-con{
width:80px;
}
</style>
</head>
<body>
<h3 style="margin: 0 0 10px 15px;">[ 전통주 수정/삭제 ]</h3>
<div class="d-admin-con">
<form id="modify" action="/admin/modify-liq" method="post" enctype="multipart/form-data">
<div class="d-admin-half-con" style="width: 350px; border:none;">
<div class="inputArea">
<div class="select-img"><img class="d-img-con" src="<c:out value='${liq.liqThumb}'/>"></div>
<div class="d-file-area">
<input type="file" name="file" id="liqImg" 
                  accept="image/jpeg,image/gif,image/png" value="<c:out value='${liq.liqThumb }' />"
                  onchange="checkType(this)" required />
<input type="hidden" name="liqImg" value="<c:out value='${liq.liqImg }' />" />
<input type="hidden" name="liqThumb" value="<c:out value='${liq.liqThumb }' />" />
</div>
</div>
<div>
</div>
<div class="d-inputs">
양조장<p><input type="text" class="liqCoNm" name='liqCoNm' value='<c:out value="${liq.liqCo.nm }"/>'> <button id='liqCoModal' type='button' class="d-co-search-btn" style="margin-left: -41px;">찾기</button></p>
이름<p><input type="text" name="nm"  maxlength="12" placeholder="1~12자" value="<c:out value='${liq.nm }'/>" readonly="readonly"></p>
용량<p><input type="text" name="capct" maxlength="6"  placeholder="숫자만 입력해주세요." value="<c:out value='${liq.capct }'/>">ml</p>
도수<p><input type="text" name="lv" maxlength="4" placeholder="숫자만 입력해주세요." value="<c:out value='${liq.lv }'/>">%</p>
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
원재료 <p><textarea rows="2" name="irdnt" maxlength="60" placeholder="0~60자" ><c:out value='${liq.irdnt}'/></textarea></p>
수상내역 <p><textarea rows="3" name="ards" maxlength="90" placeholder="0~90자" ><c:out value='${liq.ards}'/></textarea></p>
소개<p><textarea rows="3" name="liqCn.intro" maxlength="500" placeholder="1~500자" ><c:out value='${liq.liqCn.intro }'/></textarea></p>
맛 페어링<p><textarea rows="3" name="liqCn.pair" maxlength="300" placeholder="0~300자"><c:out value='${liq.liqCn.pair }'/></textarea></p>
<input type="hidden" name="liqCnt.revwCnt" value=0>


<input type="hidden" name="liqId" value="<c:out value='${liq.liqId }'/>" >
<input type="hidden" name="pageNum" value="<c:out value='${adCri.pageNum }'/>" >
<input type="hidden" name="amount" value="<c:out value='${adCri.amount }'/>" >
</div>
<div class="d-reg-btn" >
<button type="submit" data-oper='modify'>수정</button><button type="submit" data-oper='remove'>삭제</button><button type="submit" data-oper='list'>목록</button>
</div>
</form>
</div>
</div>
</div>
</div>
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
    $(".select-img img").attr("src", data.target.result).width(80);        
    }
    reader.readAsDataURL(this.files[0]);
    }
});
</script> 
<script>
$(document).ready(function(){

	$("#d-liq-list").css('background-color', 'rgb(10, 29, 74)').css('color','white');
	 $('input[name="cate"]:radio[value="${liq.cate}"]').prop('checked',true);

	var formObj = $("#modify");
	$('.d-reg-btn button').on("click", function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'remove'){
			formObj.attr("action","/admin/remove-liq");
			
		}else if(operation === 'list'){
			
			formObj.attr("action","/admin/liq-list").attr("method","get");
			
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
		}
		formObj.submit();
	});
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
