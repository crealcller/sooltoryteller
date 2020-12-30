<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%
	String email = (String) session.getAttribute("email");
    String authority = (String) session.getAttribute("authority");
	String loginDisplay = "";
	String logoutDisplay = "";
	String authorityDisplay = "";
	
//세션에 로그인 정보가 담겼다면 로그인/회원가입 버튼 비활성화
if (email != null) {
	loginDisplay = "none";
} else {
	logoutDisplay =  "none";
}

//로그인한 회원의 권한이 관리자가 아니라면 관리자 페이지 비활성화
if(authority == null || !authority.equalsIgnoreCase("admin")){
	authorityDisplay = "none";
}

//로그아웃시 캐시삭제
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma", "no-cache");
%>
<script>

//로그인이 안된 상태면 로그인페이지로 넘어가게
let msg = '${msg}';
	if(msg != ""){
		alert(msg);
		location.href = '/login';
	}
</script>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" href="/resources/css/main.css">
<!-- jquery script src -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
<!-- fontawesome -->
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>
<body>
    <div class="h-logobar">
        <div class="h-logo">
        <div class="d-logo-left-con">
       <a href="/" id="h-company-name"><img class="h-logo-img" src='/resources/img/Logo_1-1.png'>
        </a></div>
        <div class="d-logo-left-con" style="padding-top:35px;">
            <div id="h-dropdown" class="h-dropdown">
            <button id="h-dropbtn1" class="h-dropbtn">전통주</button>
            <div id="h-dropdown-content" class="h-dropdown-content">
                <a href="/liq-list">전체</a>
                <a href="/liq-list?cate=탁주">탁주</a>
                <a href="/liq-list?cate=약주 청주">약주/청주</a>
                <a href="/liq-list?cate=과실주">과실주</a>
                <a href="/liq-list?cate=증류주 리큐르">증류주/리큐르</a>
            </div>
            </div>
            <div id="h-dropdown2" class="h-dropdown">
            <button id="h-dropbtn2" class="h-dropbtn"><a href="/soolbti/">술BTI</a></button>
            </div>
            <div id="h-dropdown3" class="h-dropdown">
            <button id="h-dropbtn3" class="h-dropbtn"><a href="/cheers/list">건배의 광장</a></button>
            </div>
            <div id="h-dropdown4" class="h-dropdown">
            <button id="h-dropbtn4" class="h-dropbtn"><a href="/about">About</button>
            </div>
            </div>
        <!-- ----------------------------------------------------------------------------------------------------- -->
        </div><div class='h-usermenu'>
        <!-- 현수 추가 관리자 페이지로 이동 -->
            <a href='/admin/' style="display:<%=authorityDisplay%>">관리자페이지 ㅣ</a>
            <a href='/login' style="display:<%=loginDisplay%>">로그인 ㅣ</a>
            <a href='/logout' style="display:<%=logoutDisplay%>" onclick="kakaoLogout()">로그아웃 ㅣ</a>
            <a href='/join' style="display:<%=loginDisplay%>">회원가입 ㅣ</a>
              <!-- 다울 추가 임시로 like 페이지로 연결 -->
            <a href='/mypage/revw'>마이페이지 ㅣ</a>
            <a href='/help/faq'>고객센터</a>
        </div>
    </div>
<div class="d-main-img-con">
</div>

<!-- 현수 추가 선호하는 술 통계 -->
<div class="s-bbst-container">
	<div class="h-bbst-div-left">
		<img class="s-chart-img" src="/resources/img/drink.gif" />
		<p class="s-chart-text">술토리텔러들이 가장 선호하는 주종은?</p>
	</div><div class="h-bbst-div-right">
	<div style="display: inline-block; overflow: hidden; width: 600px">
	<div id="donutchart" style="width: 760px; height: 500px; display: inline-block;">
	</div>
	</div>
	</div>
</div>

<!-- 게시글 리스트 - 조회수 높은순 -->
<div class="s-bbst-container" style="background-color: aliceblue;">
	<div class="s-bbst-div">
		<h2 style="margin: 0 0 8px 15px;">건배의 광장 - 인기 게시물</h2>
		<c:if test="${empty bbstList }">
			<p>작성된 게시글이 없습니다.</p>
		</c:if>
		<c:if test="${not empty bbstList }">
			<c:forEach items="${bbstList }" var="bbst">
				<div class="s-bbst-item-container">
					<a class="move" href="/cheers/get?bbstId=<c:out value='${bbst.bbstId }' />">
					<div class="s-bbst-img-div">            
						<img class="s-bbst-img" src="<c:out value='${bbst.cnImg }' />" />
					</div>
					<div class="s-bbst-info-div">
						<p style="font-weight: bold; font-size: 15px;"><c:out value="${bbst.title }" /></p>
					</div>
					<div class="s-bbst-item-overlay">
						<div class="s-bbst-item-overlay-info">
							<i class="fas fa-eye" style="color: white;"></i> <span class="s-bbst-item-overlay-span"><c:out value="${bbst.viewCnt }" /></span>&nbsp;
							<i class="fas fa-heart" style="color: white;"></i> <span class="s-bbst-item-overlay-span"><c:out value="${bbst.likeCnt }" /></span>&nbsp;
							<i class="fas fa-comment-dots" style="color: white;"></i> <span class="s-bbst-item-overlay-span"><c:out value="${bbst.replyCnt }" /></span>
						</div>
					</div>
				</a></div>
			</c:forEach>
		</c:if>
	</div>
</div>
<div class="s-bbst-container" style="background-color: black">
<div class="s-bbst-div" style="top: 100px;">
	<h2 style="margin: 0 0 10px 15px; color:white;">전통주 둘러보기</h2>
	<div class="s-bbst-item-container" onclick="location.href='/liq-list?cate=탁주';">
	<div class="s-bbst-img-div">
	<img class="d-bbst-img" src="resources/img/main1.png"/>
	</div>
	<div class="s-bbst-item-overlay" style="height: 220px; border-radius: 3%;">
		<div class="s-bbst-item-overlay-info">
			<p style="color: white; font-size: 18px; font-weight: bold;">탁주 둘러보기</p>
		</div>
	</div>
	<div class="d-bbst-info-div">
	<h2>탁주</h2>
	</div>
	</div>
	<div class="s-bbst-item-container" onclick="location.href='/liq-list?cate=약주 청주';">
	<div class="s-bbst-img-div">
    <img class="d-bbst-img" src="resources/img/main2.jpg"/>
	</div>
	<div class="s-bbst-item-overlay" style="height: 220px; border-radius: 3%;">
		<div class="s-bbst-item-overlay-info">
			<p style="color: white; font-size: 18px; font-weight: bold;">약주/청주 둘러보기</p>
		</div>
	</div>
	<div class="d-bbst-info-div">
	<h2>약주/청주</h2>
	</div>
	</div>
	<div class="s-bbst-item-container" onclick="location.href='/liq-list?cate=과실주';">
	<div class="s-bbst-img-div">
    <img class="d-bbst-img" src="resources/img/main3.jpg" />            
	</div>
	<div class="s-bbst-item-overlay" style="height: 220px; border-radius: 3%;">
		<div class="s-bbst-item-overlay-info">
			<p style="color: white; font-size: 18px; font-weight: bold;">과실주 둘러보기</p>
		</div>
	</div>
	<div class="d-bbst-info-div">
	<h2>과실주</h2>
	</div>
	</div>
	<div class="s-bbst-item-container" onclick="location.href='/liq-list?cate=증류주 리큐르';">
	<div class="s-bbst-img-div">
    <img class="d-bbst-img" src="resources/img/main4.jpg" />           
	</div>
	<div class="s-bbst-item-overlay" style="height: 220px; border-radius: 3%;">
		<div class="s-bbst-item-overlay-info">
			<p style="width: 200px; color: white; font-size: 18px; font-weight: bold;">증류주/리큐르 둘러보기</p>
		</div>
	</div>
	<div class="d-bbst-info-div">
	<h2>증류주/리큐르</h2>
	</div>
	</div>
</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp" %>

<script>
$(document).ready(function() {
	/* 게시물 클릭 시 이동하는 이벤트 처리 */
	$(".move").on("click", function(e) {
		/* e.preventDefault(); */
		actionForm.append("<input type='hidden' name='bbstId' value='"+$(this).attr("href") + "'>");
		actionForm.attr("action", "/cheers/get");
		actionForm.submit();
	});
});
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

/* 현수 추가 구글차트 */
google.charts.load("current", {packages:["corechart"]});
google.charts.setOnLoadCallback(drawChart);
		
function drawChart() {
  var data = google.visualization.arrayToDataTable(
		${data}
  );

  var options = {
    title: '술토리텔러들의 선택',
    pieHole: 0.4,
    titleTextStyle: {
    	fontSize: 20
    }
  };

  var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
  chart.draw(data, options);
}
/* ----------------- */


$(window).scroll(function(evt) {
	var y=$(".h-logobar").offset().top
	if(y>=200){
		$(".h-logobar").css('height','70px');
		$(".h-logobar").css('box-shadow','0px -2px 8px 5px #e1e1e1');
		$(".h-logobar").css('background-color','white');
		$(".h-logo-img").attr('src','/resources/img/Logo_1-2.png');
		$('.h-usermenu').find('a').css('color','black');
		$('.h-dropbtn').find('a').css('color','black');
		$('.h-dropbtn').css('color','black');
		
	}else{
		$(".h-logobar").css('height','');
		$(".h-logobar").css('box-shadow','none');
		$(".h-logobar").css('background', '');
		$(".h-logo-img").attr('src','/resources/img/Logo_1-1.png');
		$('.h-usermenu').find('a').css('color','white');
		$('.h-dropbtn').find('a').css('color','white');
		$('.h-dropbtn').css('color','white');
		
	}
	});
</script>
</body>
</html>