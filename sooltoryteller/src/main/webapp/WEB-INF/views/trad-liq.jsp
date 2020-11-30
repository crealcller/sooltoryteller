<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="include/topmenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
 <style>
        * {
           margin: 0;
           padding: 0;
           box-sizing: border-box;
       }
        
         /* 구메정보부분 배경 */
        .d-trad-liq-info{
            width:100%;
            background-color: rgb(230, 222, 236);
        }
        /* 구메정보부분 */
        .d-trad-liq-info-con{
        	width:50%;
        	margin:auto;
        }
        /* 구매정보부분 - 사진 */
        .d-trad-liq-img-con{
        	padding-top:50px;
        	width:200px;
        	height:400px;
        	display:inline-block;
        
        }
        /* 구매정보부분 - 글 */
        .d-trad-liq-text-con{
        	padding:30px;
        	height:100%;
        	display:inline-block;
        }
       	/* 전통주상세 컨테이너 */
        .d-trad-liq-con{
            margin:0 auto;
            padding:0;
            width:70%;
            height: 500px;
            
        }
        /* 전통주상세 */
        .d-trad-liq-column{
          
            width:100%;
          	border-bottom-style: solid;
			border-bottom-color: rgba(138, 134, 134, 0.199);
            background-color: white;
            padding:50px;
        }
       
         /* 리뷰 부분 con*/
        .d-revws-con{
        	position: relative;
        	width : 65%;
        	display:inline-block;
        	border-style : solid;
        	border-color: rgba(138, 134, 134, 0.199);
        }
        /* 리뷰  리스트*/
        .d-revws{
            list-style:none;
            width : 100%;
        }
        /* 리뷰 */
        .d-revw-con{
        	border-style : solid;
        	border-color: rgba(138, 134, 134, 0.199);
        	padding : 20px;
        	margin : 10px; 
        }
        
        .d-revw-footer {
         	float : right;
        }
        .d-revw-footer ul{
         	list-style:none;
        }
		.d-revw-footer li{
			float : left;
			margin : 10px; 
		}
		.d-new-revw-con{
			width:30%;
			display:inline-block;
			border-style : solid;
        	border-color: rgba(138, 134, 134, 0.199);
		}
		
		.d-new-revw-sticky {
			position: -webkit-sticky;
			position: sticky;
			display:inline-block;
			width: 20%;
			padding: 10px;
			border-style : solid;
        	border-color: rgba(138, 134, 134, 0.199);
        	top: 0;
		}
    </style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="d-trad-liq-info">
	
		<div class="d-trad-liq-info-con">
				<img class="d-trad-liq-img-con" src='/resources/img/<c:out value="${liq.liqImg}" />'>
		<div class="d-trad-liq-text-con">
		<button style="float:right;">하트</button><br>
		<h1>
			<c:out value="${liq.liqNm}" />
		</h1><br>
		<p>
		주종 : <c:out value="${liq.liqCate}" />
		</p>
		<p>
		용량 : <c:out value="${liq.liqCapct}" />ml
		</p>
		<p>
		도수 : <c:out value="${liq.liqLv}" />%
		</p>
		<p>
		주재료 : <c:out value="${liq.liqIrdnt}" />
		</p>
		<c:if test="${liq.liqArds ne null}">
		<p>
		수상내역 : <c:out value="${liq.liqArds}" />
		</p>
		</c:if>
		<p>
		가격 : 
			\
			<fmt:formatNumber type="number" maxFractionDigits="3"
				value="${liq.liqPrc}" />
		</p><br>
		<button type="button" style="padding:0px 10px 0px 10px;">-</button>
		<input  type="text" style="width: 30px;" value="1">
		<button type="button" style="padding:0px 10px 0px 10px;">+</button>
		<br>
		<button type="submit">술바구니</button>
		<button type="submit">구매하기</button>
	</div>
	</div>
	
	</div>
	<div class="d-trad-liq-con">
		<div class="d-trad-liq-column">
		
		<h1>INTRO</h1><br>
		<p>
			<c:out value="${liq.liqCn.liqIntro}" />
		</p>
		</div>
		<c:if test="${liq.liqCn.liqPair ne null}">
		<div class="d-trad-liq-column">
		<h1>TASTING NORE & PAIRING</h1><br>
		<p>
			<c:out value="${liq.liqCn.liqPair}" />
		</p>
		</div>
		</c:if>
		<div class="d-trad-liq-column">
			<div class="d-revws-con">
			<h1>REVIEWS</h1><br>
				<ul class="d-revws">
				</ul>
				<div class="d-revw-footer">
				</div>
			</div>
				<div class="d-new-revw-sticky">
				<h1>리뷰 작성 하기</h1>
				
				</div>
		</div>
		<div class="d-trad-liq-column">
			
			<h1>BREWERY INFO</h1><br>
			<div class="d-trad-liq-text-con">
			<p>
				<c:out value="${liq.liqCo.liqCoNm}" />
			</p>
			<p>
				<c:out value="${liq.liqCo.liqCoAddr}" />
			</p>
			<p>
				<c:out value="${liq.liqCo.liqCoHmpg}" />
			</p>
			<p>
				<c:out value="${liq.liqCo.liqCoTelno}" />
			</p>
			</div>
			<div id="map"
				style="width: 450px; height: 350px; display:inline-block">
			</div>
		</div>
	</div>

<!-- 리뷰 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/revw.js"></script>
<script>
$(document).ready(function(){
	var liqSeqValue = '<c:out value="${liq.liqSeq}"/>'
	var revwUL = $(".d-revws");
	var pageNum = 1;
	var revwPageFooter =$(".d-revw-footer");
	showList(1);
	
	function showRevwPage(revwCnt){
		var endNum = Math.ceil(pageNum/5.0)*5;
		var startNum = endNum -4;
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum*5>=revwCnt){
			endNum = Math.ceil(revwCnt/5.0);
		}
		if(endNum *5<revwCnt){
			next =true;
		}
		var str = "<ul>";
		
		if(prev){
			str+="<li><a href='"+(startNum-1)+"'>Previous</a></li>";
		}
		for(var i=startNum; i <=endNum; i++){
			var active = pageNum == i? "active":"";
			str+="<li '"+active+"'><a href="+i+">"+i+"</a></li>";
		}
		if(next){
			str+="<li '"+active+"'><a href='"+i+">Next</a></li>";
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
		revwService.getList({liqSeq:liqSeqValue,page: page||1},function(revwCnt,list){
			if(page == -1){
				pageNum = Math.ceil(revwCnt/10.0);
				showList(pageNum);
				return;
			}
			var str="";
			if(list == null || list.length==0){
				revwUL.html("아직 등록된 리뷰가 없습니다.");
				return;
			}
			for(var i=0,len = list.length || 0; i<len; i++){
				str += "<li class='d-revw-con' data-revwSeq = '"+list[i].revwSeq+"'>";
				str += "<div><div class='header'><img src='/resources/img/"+list[i].member.memberImg+"'>";
				str += "<strong>"+list[i].memberName+"</strong>";
				str += "<small>"+list[i].revwRate+"</small>"
				str += "<small>"+revwService.displayTime(list[i].regdate)+"</small></div>";
				
				str += "<p>"+list[i].revwCn+"</p></div></li>"
			}
			revwUL.html(str);
			showRevwPage(revwCnt);
		})
	}
});
</script>

	<!--카카오 지도 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e7b9cd1679ce3dedf526e66a6c1a860&libraries=services,clusterer,drawing"></script>
	<script>
	var lat =${liq.liqCo.liqCoLat};
	var lng =${liq.liqCo.liqCoLng};
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(lat, lng); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	</script>
</body>
</html>