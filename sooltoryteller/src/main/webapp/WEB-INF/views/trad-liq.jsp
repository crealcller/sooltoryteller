<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/include/topmenu.jsp"  %>
<!DOCTYPE html>
<html>
<head>
<style>
.d-con {
	width: 100%;
	height: 100%;
	padding-top: 20px;
}
/* 구메정보부분 배경 */
.d-trad-liq-info {
	width: 70%;
	height: 400px;
	background-color: white;
	margin: 0 auto 25px auto;
	box-shadow: 10px 10px 13px -1px #c8c2c2;
}
/* 구메정보부분 */
.d-trad-liq-info-con {
	width: 800px;
	height: 100%;
	display: inline-block;
	margin-left: 120px;
}

.d-trad-liq-info-con-heart {
	float: right;
	width: 120px;
	height: 100%;
	padding-top: 30px;
	display: inline-block;
}

/* 구매정보부분 - 사진 */
.d-trad-liq-img-con {
	width: 230px;
	height: 320px;
	display: inline-block;
	float: left;
	margin: 40px;
}
/* 구매정보부분 - 글 */
.d-trad-liq-text-con {
	padding-top: 50px;
	width: 450px;
	height: 100%;
	display: inline-block;
	float: left;
}
.d-trad-liq-text-con p{
	padding:10px;
 }

/* 전통주상세 컨테이너 */
.d-trad-liq-con {
	margin: 0 auto;
	padding: 0;
	width: 70%;
}

/* 전통주상세 */
.d-trad-liq-column {
	width: 100%;
	border-bottom-style: solid;
	border-bottom-color: #844ce321;
	background-color: white;
	padding: 50px;
	margin-bottom: 20px;
}

.d-revw-wrapper {
	width: 100%;
	min-width: 1000px;
	overflow: auto;
}
/* 리뷰 부분 con*/
.d-revws-con {
	width: 600px;
	float: left;
	display: inline-block;
}
/* 리뷰  리스트*/
.d-revws {
	list-style: none;
	width: 600px;
}
/* 리뷰 */
.d-revw-con {
	box-shadow: 5px 5px 13px -1px #F2EFF9;
	border-style: solid;
	border-color: rgb(245, 245, 245);
	padding: 20px;
	margin: 40px;
}

.d-paging {
	float: right;
}

.d-paging ul {
	list-style: none;
}

.d-paging li {
	float: left;
	margin: 0;
}

.d-new-revw-con {
	float: left;
	width: 300px;
	height: 300px;
	display: inline-block;
	margin-top: 20px;
}

.d-new-revw-con ul {
	width: 260px;
	padding: 10px;
	list-style: none;
}

.d-new-revw-con li {
	border-bottom: solid 2px #F2EFF9;
	padding: 10px;
}

.d-new-revw-con button {
	float: left;
	background-color: Transparent;
	border: 0;
	outline: 0;
}

.d-new-revw-con img {
	float: left;
}

.d-revw-cnt {
	margin-left: 10px;
	font-size: 7px;
}

.d-revw-cnt-msg {
	font-size: 7px;
}

.d-revw-profile {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	border: solid 1px #ccaeff;
}

.d-revw-rate {
	font-size: 30px;
}

.d-paging-btn-active {
	text-align: center;
	width: 25px;
	height: 25px;
	background-color: rgb(181, 135, 189);
	border-radius: 50%;
	margin: 10px;
}

.d-paging-btn-active a {
	color: white;
}

.d-paging-btn-none {
	text-align: center;
	width: 25px;
	height: 25px;
	border-radius: 50%;
	margin: 10px;
}

/* The Modal (background) */
.d-revw-modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.d-revw-modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 500px;
	height: 600px;
}

/* The Close Button */
.d-revw-modal-close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.d-revw-modal-close:hover, .d-revw-modal-close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.d-star_grade span {
	text-decoration: none;
	font-size: 30px;
	color: grey;
}

.d-star_grade span.on {
	color: orange;
}

.star_grade span {
	text-decoration: none;
	font-size: 30px;
	color: grey;
}

.star_grade span.on {
	color: orange;
}

.star_grade :hover {
	cursor: pointer;
}

.d-revw-star {
	font-size: 20px;
	color: orange;
}

.d-star-box {
	display: inline-block;
	padding: 3px 8px 3px 8px;
	background-color: #f9f7d6;
	border-style: none;
	border-radius: 10px 10px 10px 10px;
	margin: 10px;
}

#like {
	font-size: 30px;
}

li {
	list-style: none;
}

.clearfix {
	overflow: auto;
}

.clearfix::after {
	content: "";
	clear: both;
	display: table;
}

.clear {
	clear: both;
}

.gallery {
	width: 800px;
	height: 400px;
	margin: 20px auto;
	border: 1px solid #ccc;
	overflow: hidden;
	padding-left: 0;
}

.gallery ul {
	width: 300%;
	position: relative;
	left: -300px;
}

.gallery ul li {
	float: left;
	width: 220px;
	height: 400px;
	box-sizing: border-box;
	padding: 15px;
	text-align: center;
	line-height: 150px;
}

.gallery ul li .img {	
	width: 180px;
	height: 230px;
	border: 3px solid #ccc;
}

.g_item {
	width: 900px;
	margin: 0 auto;
	text-align: center;
}

.g_item ul li {
	display: inline-block;
	margin-right: 10px;
	background: #ccc;
	width: 10px;
	height: 10px;
	border-radius: 50%;
}

.g_item ul li.on {
	background: #f00;
}
</style>
<meta charset="UTF-8">
<title>전통주 상세</title>
</head>
<body>
<div class="s-main-background">
<div class="d-con">
	<div class="d-trad-liq-info">
		<div class="d-trad-liq-info-con">
			<img class="d-trad-liq-img-con" src="<c:out value='${liq.liqImg}'/>">
			<div class="d-trad-liq-text-con">
				
				<h1>
					<c:out value="${liq.nm}" />
				</h1>
				<div style="padding:10px;">
				<i class="fas fa-heart"  id="d-like-cnt"> <c:out value="${liq.liqCnt.likeCnt}" /></i>
				<i class="far fa-comment-dots" id="d-revw-cnt"> <c:out value="${liq.liqCnt.revwCnt}" /></i>
				<i class="fas fa-eye"> <c:out value="${liq.liqCnt.inqrCnt}" /></i>
				</div>
				<p>
				주종 : <c:out value="${liq.cate}" />
				</p>
				<p>
				용량 : <c:out value="${liq.capct}" />ml
				</p>
				<p>
				도수 : <c:out value="${liq.lv}" />%
				</p>
				<p>
				주재료 : <c:out value="${liq.irdnt}" />
				</p>
				<c:if test="${liq.ards ne null}">
				<p>
				수상내역 : <c:out value="${liq.ards}" />
				</p>
				</c:if>
				
				
				<!-- <button type="button" style="padding:0px 10px 0px 10px;">-</button>
				<input  type="text" style="width: 30px;" value="1">
				<button type="button" style="padding:0px 10px 0px 10px;">+</button>
				<br>
				<button type="submit">술바구니</button>
				<button type="submit">구매하기</button> -->
			</div>
		</div>
		<div class="d-trad-liq-info-con-heart">
		<i id='like' class="far fa-heart"></i>
		</div>
	</div>
	<div class="d-trad-liq-con">
		<div class="d-trad-liq-column">
		
		<h1>INTRO</h1><br>
		<p>
			<c:out value="${liq.liqCn.intro}" />
		</p>
		</div>
		<c:if test="${liq.liqCn.pair ne null}">
		<div class="d-trad-liq-column">
		<h1>TASTING NORE & PAIRING</h1><br>
		<p>
			<c:out value="${liq.liqCn.pair}" />
		</p>
		</div>
		</c:if>
		<div class="d-trad-liq-column">
		<div class="d-revw-wrapper">
			<h1>REVIEWS</h1><br>
			<div class="d-revws-con">
				<ul class="d-revws">
				</ul>
				<div class="d-paging">
				</div>
			</div>
			<div class="d-new-revw-con">
			<ul>
			<li><strong><c:out value="${liq.liqCnt.avgRate}" /></strong>
			<span class="d-revw-cnt"><c:out value="${liq.liqCnt.revwCnt}" /></span><span class="d-revw-cnt-msg">개의 리뷰</span></li>
			
			<li style="border:none;">
			지금 리뷰를 작성해보세요!
			</li>
      	<c:choose>
        	 <c:when test = "${member.img eq null}">
           		<img class='d-revw-profile' src='/resources/img/noprofile.png'>
         	 </c:when>
         	<c:otherwise>
            	<img class='d-revw-profile' src='/resources/img/<c:out value="${member.img}" />'>
         	</c:otherwise>
      	</c:choose>
			<button id='addRevwBtn' class="d-star_grade">
        	<span value=1>★</span>
        	<span value=2>★</span>
        	<span value=3>★</span>
        	<span value=4>★</span>
        	<span value=5>★</span>
    		</button>
			</ul>
			</div>	
		</div>
		</div>
		<div class="d-trad-liq-column">
			
			<h1>BREWERY INFO</h1><br>
			<div class="d-trad-liq-text-con">
			<p>
				<c:out value="${liq.liqCo.nm}" />
			</p>
			<p>
				<c:out value="${liq.liqCo.addr}" />
			</p>
			<p>
				<c:out value="${liq.liqCo.hmpg}" />
			</p>
			<p>
				<c:out value="${liq.liqCo.telno}" />
			</p>
			</div>
			<div id="map"
				style="width: 450px; height: 350px; display:inline-block; margin-left:50px;">
			</div>
		</div>
	</div>

<div id="addRevw" class="d-revw-modal">

  <!-- Modal content -->
  <div class="d-revw-modal-content">
    <span class="d-revw-modal-close">&times;</span>
	<div><img style='width:100px;height:150px;' src='<c:out value="${liq.liqThumb}" />'><c:out value="${liq.nm}" /></div>
    
     <p class="star_grade">
        <span value=1>★</span>
        <span value=2>★</span>
        <span value=3>★</span>
        <span value=4>★</span>
        <span value=5>★</span>
    </p>
    <p><textarea maxlength="500" style='width:450px; resize: none;' rows='15' name='revwCn' placeholder='10자 이상 입력해주세요'></textarea></p>
    <button id='revwRegBtn' type='submit'>작성하기</button>
  </div>

</div>
</div>
</div>
<!-- 리뷰 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/revw.js"></script>
<script type="text/javascript" src="/resources/js/like.js"></script>
<script>
$(document).ready(function(){
	var liqIdValue = '<c:out value="${liq.liqId}"/>'
	var revwUL = $(".d-revws");
	var pageNum = 1;
	var revwPageFooter =$(".d-paging");
	showList(1);
	
	function showRevwPage(revwCnt){
		var endNum = Math.ceil(pageNum/5.0)*5;
		var startNum = endNum -4;
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum*3>=revwCnt){
			endNum = Math.ceil(revwCnt/3.0);
		}
		if(endNum*3<revwCnt){
			next =true;
		}
		var str = "<ul>";
		
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
		revwPageFooter.html(str);
		
			
	}
	revwPageFooter.on("click","li a",function(e){
		e.preventDefault();
		var targetPageNum =$(this).attr("href");
		pageNum = targetPageNum;
		showList(pageNum);
	
	});
	
	function showList(page){
	
		revwService.getList({liqId:liqIdValue,page: page||1},function(revwCnt,list){
			console.log(revwCnt);
			if(page == -1){
				pageNum = Math.ceil(revwCnt/3.0);
				showList(pageNum);
				return;
			}
			var str="";
			if(list == null || list.length==0){
				revwUL.html("<li class='d-revw-con'>아직 등록된 리뷰가 없습니다.</li>");
				return;
			}
			for(var i=0,len = list.length || 0; i<len; i++){
				str += "<li class='d-revw-con' data-revwId = '"+list[i].revwId+"'>";
				str += "<div class='d-star-box'><span class='d-revw-star'>★</span>"+list[i].rate+"</div>"
				str += "<span>"+list[i].cn+"</span>"
				str += "<small style='float:right;'>"+revwService.displayTime(list[i].regdate)+"</small></div>";
				str += "<div><div class='d-revw-member'><img class='d-revw-profile' src='/resources/img/"+list[i].member.img+"'>";
				str += "<strong>"+list[i].member.name+"</strong></li></div></div>";
			}
			revwUL.html(str);
			showRevwPage(revwCnt);
		});
		//동적으로 생성된 node에 접근해야함 
		//load/ready 될떄 별점이 보여야함
	}
	//모달
	let revwModal = $('#addRevw');
	let addRevwBtn = $('#addRevwBtn');
	let closeBtn = $('.d-revw-modal-close');
	let newRevwRate = 0;
	let newRevwCn = revwModal.find("textarea[name='revwCn']");
	let star = $('.star_grade span');
	let revwRegBtn =$('#revwRegBtn');
	star.click(function(){
        $(this).parent().children("span").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
        $(this).addClass("on").prevAll("span").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
        newRevwRate = $(this).attr('value');
        console.log(newRevwRate);
    });
	
	$(".d-star_grade span").hover(function(){
        $(this).parent().children("span").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
        $(this).addClass("on").prevAll("span").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
    });
	

	$(".d-star_grade span").mouseleave(function(){
        $(this).parent().children("span").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
    });

	//리뷰작성하기 버튼
	addRevwBtn.on("click",function(e){
		if(memberIdValue!=-1){
			resetRevw();
			$('#addRevw').fadeIn(300);
		}else{
			alert("로그인이 필요합니다");
			window.location.href ='/login';
		}
	});
	
	//모달 끄기 버튼
	closeBtn.on("click",function(e){
	revwModal.fadeOut(300);
	});
	
	//리뷰 작성후 제출 버튼
	revwRegBtn.on("click",function(e){
		let revwCntHtml = $("#d-revw-cnt");
		let revwCnt = $(".d-revw-cnt");
		if(newRevwCn.val().trim().length==0){
			alert("내용을 입력해주세요 ");
			return;
		}
		
		if(newRevwCn.val().trim().length<10){
			alert("내용을 최소 10자 이상 작성해주세요 ");
			return;
		}
		
		if(newRevwRate == 0){
			alert("별점을 선택해주세요");
			return;
		}
		let revw={
				liqId:liqIdValue,
				memberId:memberIdValue,
				cn:newRevwCn.val(),
				rate:newRevwRate
		};
		revwService.add(revw,function(result){
			alert("리뷰가 등록 되었습니다");
			revwModal.fadeOut(100);
			revwCntHtml.html(Number(revwCntHtml.html())+1);
			revwCnt.html(Number(revwCnt.html())+1);
			showList(1);
		});
	});
	   
function resetRevw(){
	$('.star_grade span').parent().children("span").removeClass("on");
	newRevwCn.val("");
	newRevwRate =0;
}
	
});

</script>


<!-- 좋아요 버튼 회원에 따라 페이지로 들어왔을 때 상태 보여줌 --> 
<script>
	var memberIdValue = '${member.memberId}' ==''? -1:'${member.memberId}';
	var liqIdValue = ${liq.liqId};
$(document).ready(function(){
	likeService.checkLike({memberId:memberIdValue,liqId:liqIdValue},function(data){
		if(data){
			$('#like').attr('class', 'fas fa-heart');
		}else{
			$('#like').attr('class', 'far fa-heart');
		}
	});
});
</script>
<!-- 버튼 눌렀을때 좋아요/취소 --> 
<script>
$('#like').on({'click': function() {
	var like= $("#d-like-cnt")
	if(memberIdValue != -1){
	likeService.checkLike({memberId:memberIdValue,liqId:liqIdValue},function(data){
		if(data){
			likeService.cancelLike({memberId:memberIdValue,liqId:liqIdValue}, function(count){
				console.log("cancel");
					if(count === "success"){
						like.html(" "+(Number(like.html())-1));
						$('#like').attr('class', 'far fa-heart');
					}
				});
			return;
			
		}else{
			likeService.like({memberId:memberIdValue,liqId:liqIdValue}, function(count){
				console.log("like");
					if(count === "success"){
						like.html(" "+(Number(like.html())+1));
						$('#like').attr('class', 'fas fa-heart');
					}
				});
		}
	});
	}else{
		alert("로그인이 필요합니다.")
		window.location.href ='/login';
	}
}	
});
</script>

	<!--카카오 지도 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12d8a59ec91065369e7c717d28c1c667&libraries=services,clusterer,drawing"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
var targetAddr = '${liq.liqCo.addr}';
var targetNm = '${liq.liqCo.nm}';
// 주소로 좌표를 검색합니다
geocoder.addressSearch(targetAddr , function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+targetNm+'</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
</body>
</html>