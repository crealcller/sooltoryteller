<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/include/topmenu.jsp"  %>
<!DOCTYPE html>
<html>
<head>
 <style>
        .d-con{
         width:100%;
        }
         /* 구메정보부분 배경 */
        .d-trad-liq-info{
            width:100%;
            height:400px;
            background-color: rgb(245, 245, 245);
        }
        /* 구메정보부분 */
        .d-trad-liq-info-con{
        	width:800px;
        	margin:auto;
        }
        /* 구매정보부분 - 사진 */
        .d-trad-liq-img-con{
        	width:200px;
        	height:300px;
        	display:inline-block;
        	float:left;
        	margin:50px;
        
        }
        /* 구매정보부분 - 글 */
        .d-trad-liq-text-con{
        	padding:50px;
        	width:500px;
        	height:100%;
        	display:inline-block;
        	float:left;
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
			border-bottom-color: rgb(181, 135, 189);
            background-color: white;
            padding:50px;
        }
       	.d-revw-wrapper{
       		width : 100%;
       		min-width : 1000px;
       		overflow: auto;
       	}
         /* 리뷰 부분 con*/
        .d-revws-con{
        	width : 600px;
        	float:left;
        	display:inline-block;
        	
        }
        /* 리뷰  리스트*/
        .d-revws{
            list-style:none;
            width : 600px;
        }
        /* 리뷰 */
        .d-revw-con{
        	box-shadow: 3px 3px 3px 3px  rgba(196, 150, 204, 0.151);
        	border-style : solid;
        	border-color: rgb(245, 245, 245);
        	padding : 20px;
        	margin : 40px; 
        }
        
        .d-paging {
         	float : right;
        }
        .d-paging ul{
         	list-style:none;
        }
		.d-paging li{
			float : left;
			margin : 0; 
		}
		.d-new-revw-con{
			float:left;
			width:230px;
			display:inline-block;
			border-style : solid;
        	border-color: rgb(245, 245, 245);
        	margin : 40px;
        	height: 300px;
		}
		
		.d-revw-profile{
			width: 50px;
            height: 50px;
            border-radius: 50%;
		}
		.d-paging-btn-active{
			text-align: center;
			width:25px;	
			height:25px;
			background-color:rgb(181, 135, 189);
			border-radius: 50%;
			margin:10px;
			
		}
		.d-paging-btn-active a{
			color:white;
		}
		.d-paging-btn-none{
			text-align: center;
			width:25px;	
			height:25px;
			border-radius: 50%;
			margin:10px;	
		}
	
    </style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="d-con">
	<div class="d-trad-liq-info">
	
		<div class="d-trad-liq-info-con">
				<img class="d-trad-liq-img-con" src='/resources/img/<c:out value="${liq.img}" />'>
		<div class="d-trad-liq-text-con">
		<img id='like' src='/resources/img/heart1.png' style="float:right;width:30px;height:30px;"><br>
		<h1>
			<c:out value="${liq.nm}" />
		</h1><br>
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
		<p>
		가격 : 
			\
			<fmt:formatNumber type="number" maxFractionDigits="3"
				value="${liq.prc}" />
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
				<div class="d-revw-count"></div>
				<h1>리뷰 작성 하기</h1>
				<button>리뷰</button>
				
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
				style="width: 450px; height: 350px; display:inline-block">
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
	$('.d-revw-count').html("<p>"+revwCnt+"개의 리뷰</p>");
		var endNum = Math.ceil(pageNum/5.0)*5;
		var startNum = endNum -4;
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum*5>=revwCnt){
			endNum = Math.ceil(revwCnt/5.0);
		}
		if(endNum*5<revwCnt){
			next =true;
		}
		var str = "<ul>";
		
		if(prev){
			str += "<li class='d-paging-btn-none'><a href='" + (startNum - 1)+ "'><</a></li>";
		}
		for(var i=startNum; i <=endNum; i++){
			var active = pageNum == i? "active":"none";
			str+="<li class='d-paging-btn-"+active +"'><a href="+i+">"+i+"</a></li>";
		}
		if(next){
			str+="<li class='d-paging-btn-none'><a href='"+ (endNum + 1)+"'>></a></li>";
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
			if(page == -1){
				pageNum = Math.ceil(revwCnt/5.0);
				showList(pageNum);
				return;
			}
			var str="";
			if(list == null || list.length==0){
				$('.d-revw-count').html("<p>0개의 리뷰</p>");
				revwUL.html("<li class='d-revw-con'>아직 등록된 리뷰가 없습니다.</li>");
				return;
			}
			for(var i=0,len = list.length || 0; i<len; i++){
				str += "<li class='d-revw-con' data-revwId = '"+list[i].revwId+"'>";
				str += "<div><div class='header'><img class='d-revw-profile' src='/resources/img/"+list[i].member.img+"'>";
				str += "<strong>"+list[i].member.name+"</strong>";
				str += "<small>"+list[i].rate+"</small>점"
				str += "<small style='float:right;'>"+revwService.displayTime(list[i].regdate)+"</small></div>";
				str += "<p>"+list[i].cn+"</p></div></li>"
			}
			revwUL.html(str);
			showRevwPage(revwCnt);
		})
	}
});
</script>


<!-- 좋아요 버튼 회원에 따라 페이지로 들어왔을 때 상태 보여줌 --> 
<script>
	var memberIdValue = '${memberId}' ==''? -1:'${memberId}';
	var liqIdValue = ${liq.liqId};
$(document).ready(function(){
	likeService.checkLike({memberId:memberIdValue,liqId:liqIdValue},function(data){
		if(data){
			$('#like').attr('src', '/resources/img/heart2.png');
			
			
		}else{
			$('#like').attr('src', '/resources/img/heart1.png');
		}
	});
});
</script>
<!-- 버튼 눌렀을때 좋아요/취소 --> 
<script>
$('#like').on({'click': function() {
	
	if(memberIdValue != -1){
	likeService.checkLike({memberId:memberIdValue,liqId:liqIdValue},function(data){
		if(data){
			likeService.cancelLike({memberId:memberIdValue,liqId:liqIdValue}, function(count){
				console.log("cancel");
					if(count === "success"){
						$('#like').attr('src', '/resources/img/heart1.png');
					}
				});
			return;
			
		}else{
			likeService.like({memberId:memberIdValue,liqId:liqIdValue}, function(count){
				console.log("like");
					if(count === "success"){
						$('#like').attr('src', '/resources/img/heart2.png');
					}
				});
		}
	});
	}else{
		window.location.href ='/login';
	}
}	
});
</script>

</body>
</html>