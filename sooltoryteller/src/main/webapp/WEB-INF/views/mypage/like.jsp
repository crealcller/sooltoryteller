<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/include/topmenu.jsp"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 > 좋아요</title>
<link rel="stylesheet" href="/resources/css/mypage.css">
</head>
<body>

    <div class="d-mypage-wrapper">
        <div class="d-mypage-left">
            <div class="d-left-con">
                <div class="d-mypage-profile-con">
                <img class="d-mypage-profile" src='/resources/img/<c:out value="${member.img}" />'>
           
                <div class="d-mypage-info">
                   <h1><c:out value="${member.name}" />님</h1>
                </div>
                </div>
                <ul class="d-mypage-menu-con">
                <li class="d-mypage-ref"><a href='/mypage/like'>전통주</a> </li>
                <ul class="d-mypage-menu">
                    <li class="d-mypage-li">
                        <a href='/mypage/like'>좋아요한 전통주 </a> 
                    </li> 
                    <li class="d-mypage-li">
                        <a href='/mypage/revw'>내가 작성한 리뷰 </a> 
                    </li>     
                </ul> 
                </ul>
                <ul class="d-mypage-menu-con">
                    <li class="d-mypage-ref"><a href='#'>게시글 </a></li>
                    <ul class="d-mypage-menu">
                        <li class="d-mypage-li">
                            <a href='#'>좋아요한 게시글</a>
                        </li> 
                        <li class="d-mypage-li">
                            <a href='#'>내가 작성한 게시글 </a> 
                        </li>     
                    </ul> 
                    </ul>
                    <ul class="d-mypage-menu-con" style="border-style: none;">
                        <li class="d-mypage-ref"><a href='/mypage/changeuserinfo'>회원정보</a> </li>
                        <ul class="d-mypage-menu">
                            <li class="d-mypage-li">
                                <a href='/mypage/changeuserinfo'>회원정보수정 </a> 
                            </li> 
                            <li class="d-mypage-li">
                                <a href='/mypage/changepwd'>비밀번호 변경 </a> 
                            </li>    
                            <li class="d-mypage-li"> 
                                <a href='#'>관심사 변경?</a>
                            </li>
                        </ul> 
                        </ul>

            </div>
        </div>
        <div class="d-mypage-right">
		<h2>내가 좋아요한 전통주</h2>
		<div class="d-con">
		<ul class="d-like">
		</ul>
		
		<div class="d-paging">
		</div>
        </div>
        </div>
    </div>
    <div class="d-mypage-footer">
        <h1>footer</h1>
    </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/like.js"></script>
<script>
$(document).ready(function(){
	var memberIdValue = '<c:out value="${member.memberId}"/>'
	var dLike = $(".d-like");
	var pageNum = 1;
	var paging = $(".d-paging");
	showMyList(1);
	function showMyLikePage(myLikeCnt){
		console.log(myLikeCnt);
		var endNum = Math.ceil(pageNum/4.0)*4;
		var startNum = endNum -3;
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum*4>=myLikeCnt){
			endNum = Math.ceil(myLikeCnt/4.0);
		}
		if(endNum*4<myLikeCnt){
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
				pageNum = Math.ceil(myLikeCnt/3.0);
				showMyList(pageNum);
				return;
			}
			var str="";
			if(myList == null || myList.length==0){
				return;
			}
			for(var i=0,len = myList.length || 0; i<len; i++){
				str += "<li id='move' style='cursor:pointer;' class='d-revw-con' data-liqid='"+myList[i].liqId+"'>";
				str += "<img class='d-my-revw-img' src='/resources/img/"+myList[i].img+"'/>";
				str += "<span class='d-like-cancel-btn' style='cursor:pointer;' data-liqid='"+myList[i].liqId+"' id='cancelLikeBtn'>&times;</span>";
				str += "<span>"+myList[i].nm+"</span><br>";
				str += "<span>도수 : "+myList[i].lv+" %</span><br>";
				str += "<span>원재료  : "+myList[i].irdnt+"</span></li>";
				
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
