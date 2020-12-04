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
<style>
.d-my-revw-footer{
	width:500px;
	height:100px;
	border-style:solid;
	}
</style>
</head>
<body>
<div class="d-mypage-wrapper">
        <div class="d-mypage-left">
             <div class="d-mypage-profile-con">
                <img class="d-mypage-profile" src='/resources/img/<c:out value="${member.img}" />'>
                <div class="d-mypage-info">
                  <h1><c:out value="${member.name}" />님</h1>
                </div>
            </div>
        </div>
        <div class="d-mypage-right">
        <p><a href="/mypage/like">like</a></p><p><a href="/mypage/revw">revw</a></p>
        <div class="d-con">
		</div>
		<div class="d-my-revw-footer">
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
	var dCon = $(".d-con");
	var pageNum = 1;
	var myRevwFooter = $(".d-my-revw-footer");
	showMyList(1);
	function showMyLikePage(myLikeCnt){
		console.log(myLikeCnt);
		var endNum = Math.ceil(pageNum/3.0)*3;
		var startNum = endNum -2;
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum*3>=myLikeCnt){
			endNum = Math.ceil(myLikeCnt/3.0);
		}
		if(endNum*3<myLikeCnt){
			next =true;
		}
		var str = "<ul>";
		
		if(prev){
			str += "<li><a href='" + (startNum - 1)+ "'>Previous</a></li>";
		}
		for(var i=startNum; i <=endNum; i++){
			var active = pageNum == i? "active":"";
			str+="<li><a href="+i+">"+i+"</a></li>";
		}
		if(next){
			str+="<li><a href='"+ (endNum + 1)+"'>Next</a></li>";
		}
		
		str += "</ul>";
		myRevwFooter.html(str);
		
			
	}
	myRevwFooter.on("click","li a",function(e){
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
				str += "<li class='d-revw-con' data-liqId = '"+myList[i].liqId+"'>";
				str += "<p>"+myList[i].nm+"</p>"
				str += "<p>"+myList[i].lv+"%</p></li>"
				
			}
			dCon.html(str);
			showMyLikePage(myLikeCnt);
		})
	}
});
</script>
</body>
</html>
