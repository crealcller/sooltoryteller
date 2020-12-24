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
<html>
<head>
<title>Home</title>
<link rel="stylesheet" href="/resources/css/main.css">
<!-- jquery script src -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
<!-- fontawesome -->
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
<div class="d-main-con">
<div class="d-main-img-con">
    <div class="h-logobar">
        <div class="h-logo">
       <a href="/" id="h-company-name"><img class="h-logo-img" src='/resources/img/Logo_1-1.png'>
        </a>
            <div id="h-dropdown" class="h-dropdown">
            <button id="h-dropbtn1" class="h-dropbtn">전통주</button>
            <div id="h-dropdown-content" class="h-dropdown-content">
                <a href="/all-liq">전체</a>
                <a href="/liq-list?cate=탁주">탁주</a>
                <a href="/liq-list?cate=약주 청주">약주/청주</a>
                <a href="/liq-list?cate=과실주">과실주</a>
                <a href="/liq-list?cate=증류주">증류주</a>
                <a href="/liq-list?cate=기타류">기타류</a>
            </div>
            </div>
            <div id="h-dropdown2" class="h-dropdown">
            <button id="h-dropbtn2" class="h-dropbtn">술BTI</button>
            </div>
            <div id="h-dropdown3" class="h-dropdown">
            <button id="h-dropbtn3" class="h-dropbtn"><a href="/cheers/list">건배의 광장</a></button>
            </div>
            <div id="h-dropdown4" class="h-dropdown">
            <button id="h-dropbtn4" class="h-dropbtn"><a href="/about">About</button>
            </div>
        <!-- ----------------------------------------------------------------------------------------------------- -->
        </div><div class='h-usermenu'>
        <!-- 현수 추가 관리자 페이지로 이동 -->
            <a href='/admin/memberlist' style="display:<%=authorityDisplay%>">관리자페이지 ㅣ</a>
            <a href='/login' style="display:<%=loginDisplay%>">로그인 ㅣ</a>
            <a href='/logout' style="display:<%=logoutDisplay%>" onclick="kakaoLogout()">로그아웃 ㅣ</a>
            <a href='/join' style="display:<%=loginDisplay%>">회원가입 ㅣ</a>
              <!-- 다울 추가 임시로 like 페이지로 연결 -->
            <a href='/mypage/like'>마이페이지 ㅣ</a>
            <a href='/help/faq'>고객센터</a>
        </div>
    </div>
</div>
</div>

<!-- 게시글 리스트 - 조회수 높은순 -->
<div class="s-bbst-container">
	<div class="s-bbst-div">
		<h3 style="margin: 0 0 10px 15px;">건배의 광장 인기 게시물</h3>
		<c:if test="${empty bbstList }">
					<p>작성된 게시글이 없습니다.</p>
		</c:if>
		<c:if test="${not empty bbstList }">
			<c:forEach items="${bbstList }" var="bbst">
				<div class="s-bbst-item-container">
					<a class="move" href="<c:out value='${bbst.bbstId }' />">
					<div class="s-bbst-img-div">            
						<img class="s-bbst-img" src="<c:out value='${bbst.cnImg }' />" />
					</div>
					<div class="s-bbst-info-div">
						<p style="font-weight: bold">제목: <c:out value="${bbst.title }" /></p>
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

<div>

</div>
</body>
</html>