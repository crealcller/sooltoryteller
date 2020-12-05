<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/include/topmenu.jsp"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                        <a href='/mypage/like'>좋아요한 전통주</a> 
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
                            <a href='#'>좋아요한 게시글 </a>
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
		<h1>리뷰</h1>
		<div class="d-con">
		</div>
		<div class="d-paging">
		</div>
        </div>
    </div>
    <div class="d-mypage-footer">
        <h1>footer</h1>
    </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/revw.js"></script>
<script>
$(document).ready(function(){
	var memberIdValue = '<c:out value="${member.memberId}"/>'
	var dCon = $(".d-con");
	var pageNum = 1;
	var paging = $(".d-paging");
	showMyList(1);
	function showMyRevwPage(myRevwCnt){
		console.log(myRevwCnt);
		var endNum = Math.ceil(pageNum/3.0)*3;
		var startNum = endNum -2;
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum*3>=myRevwCnt){
			endNum = Math.ceil(myRevwCnt/3.0);
		}
		if(endNum*3<myRevwCnt){
			next =true;
		}
		var str = "<ul>";
		
		if(prev){
			str += "<li class='d-paging-btn-none'><a href='" + (startNum - 1)+ "'><</a></li>";
		}
		for(var i=startNum; i <=endNum; i++){
			var active = pageNum == i? "active":"";
			str+="<li class='d-paging-btn-"+active +"'><a href="+i+">"+i+"</a></li>";
		}
		if(next){
			str+="<li class='d-paging-btn-none'><a href='"+ (endNum + 1)+"'>></a></li>";
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
		revwService.getMyList({memberId:memberIdValue,page: page||1},function(myRevwCnt,myList){
			if(page == -1){
				pageNum = Math.ceil(myRevwCnt/3.0);
				showMyList(pageNum);
				return;
			}
			var str="";
			if(myList == null || myList.length==0){
				return;
			}
			for(var i=0,len = myList.length || 0; i<len; i++){
				str += "<li class='d-revw-con' data-revwId = '"+myList[i].revwId+"'>";
				//전통주 이미지 
				str += "<img class='d-my-revw-img' src='/resources/img/"+myList[i].img+"'/>"
				str += "<p>"+myList[i].nm+"</p>"
				str += "<p>"+myList[i].rate+"점</p>"
				str += "<small style='float:right;'>"+revwService.displayTime(myList[i].regdate)+"</small>";
				str += "<p>"+myList[i].cn+"</p></li>"
				
			}
			dCon.html(str);
			showMyRevwPage(myRevwCnt);
		})
	}
});
</script>
    
</body>
</html>