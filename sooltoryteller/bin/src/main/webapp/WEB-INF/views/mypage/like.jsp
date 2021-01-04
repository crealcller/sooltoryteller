<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>

//로그인이 안된 상태면 로그인페이지로 넘어가게
let msg = '${msg}';
	if(msg != ""){
		alert(msg);
		location.href = '/login';
	}
</script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/views/include/mypageSidebar.jsp"%>


<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 > 좋아요</title>
<style>

.s-bbst-container {
	width: 800px;
	height: 700px;
	margin: 0 auto;
}

.s-bbst-item-container {
	height: 300px;
	width: 170px;
	margin: 20px 0 30px 60px;
	display: inline-block;
	position: relative;
	float: left;
	cursor: pointer;
	box-shadow: 5px 5px 13px -1px #938f8f;
}
.s-bbst-item-container h3{
	padding-bottom: 5px;
}
.s-bbst-img-div{
	height: 210px;
	width: 170px;
}
.s-bbst-img {
	height: 210px;
	width: 170px;
	display: block;
}
.s-bbst-info-div {
	height: 90px;
	width: 170px;
	display: block;
	color:#6d6d6d;
	overflow: auto;
	font-size:10px;
	padding:10px;
}
</style>
</head>
<body>
			<h2>좋아요 누른 전통주</h2>
			<div class="s-bbst-container">
				<div class="s-bbst-container-box"></div>
			</div>
			
			<!-- 페이징 처리 -->
			<div class="d-paging" style="width: 700px; margin-right: 25px;"></div>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp" %>    
    
<script type="text/javascript" src="/resources/js/like.js"></script>
<script>
$(document).ready(function(){
	var memberIdValue = '<c:out value="${member.memberId}"/>'
	var dLike = $(".s-bbst-container-box");
	var pageNum = 1;
	var paging = $(".d-paging");
	showMyList(1);
	function showMyLikePage(myLikeCnt){
		console.log(myLikeCnt);
		var endNum = Math.ceil(pageNum/5.0)*5;
		var startNum = endNum -4;
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum*6>=myLikeCnt){
			endNum = Math.ceil(myLikeCnt/6.0);
		}
		if(endNum*6<myLikeCnt){
			next =true;
		}
		var str = "<ul class='d-paging'>";
		
		if(prev){
			str += "<li class='d-paging-btn-none'><a href='" + (startNum - 1)+ "'>&#60;</a></li>";
		}
		for(var i=startNum; i <=endNum; i++){
			var active = pageNum == i? "active":"none";
			str+="<li class='d-paging-btn-"+active +"'><a href="+i+">"+i+"</a></li>";
		}
		if(next){
			str+="<li class='d-paging-btn-none'><a href='"+ (endNum + 1)+"'>&#62;</a></li>";
		}
		
		str += "</ul>";
		paging.html(str);
		
	}
	paging.on("click","li a",function(e){
		e.preventDefault();
		var targetPageNum =$(this).attr("href");
		pageNum = targetPageNum;
		showMyList(pageNum);
	
	});
	
	function showMyList(page){
		likeService.getMyList({memberId:memberIdValue,page: page||1},function(myLikeCnt,myList){
			if(page == -1){
				pageNum = Math.ceil(myLikeCnt/6.0);
				showMyList(pageNum);
				return;
			}
			var str="";
			if(myList == null || myList.length==0){
				return;
			}
			for(var i=0,len = myList.length || 0; i<len; i++){
				str += "<li id='move' class='s-bbst-item-container' style='cursor:pointer;' data-liqid='"+myList[i].liqId+"'>";
				str += "<div class='s-bbst-img-div'><img class='s-bbst-img' src='"+myList[i].liqThumb+"'/>";
				str += " <div class='s-bbst-info-div'><span class='d-like-cancel-btn' style='cursor:pointer;' data-liqid='"+myList[i].liqId+"' id='cancelLikeBtn'>&times;</span>";
				str += "<h3>"+myList[i].nm+"<span style='color:#ff8040;'>["+myList[i].cate+"]</span></h3>";
				str += "<span>도수 : "+myList[i].lv+" %</span><br>";
				str += "<span>용량 : "+myList[i].capct+"ml</span><br>";
				str += "<span>양조장  : "+myList[i].coName+"</span></li></div></div>";
				
			}
			dLike.html(str);
			showMyLikePage(myLikeCnt);
		});
	}
			//항목 선택시 상세페이지로 이동
			dLike.on("click","#move",function(e){
				let targetLiqId = $(this).data('liqid');
				location.href=location.href ="/trad-liq?liqId="+targetLiqId;
			});
			//X버튼 클릭시 좋아요 취소
			dLike.on("click","span",function(e){
				let targetLiqId = $(this).data('liqid');
				console.log(targetLiqId);
				likeService.cancelLike({memberId:memberIdValue,liqId:targetLiqId}, function(count){
					console.log("cancel");
						if(count === "success"){
							alert("좋아요 취소");
							//showMyList(1) 목록이 하나 있을때 적용이 안됨
							location.reload();
						}
				});
			});
			
	//X버튼을 누르면 해당 좋아요가 취소된다 
	//targetLiqId 와 memberId 필요
});
</script>
</body>
</html>
