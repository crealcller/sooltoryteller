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
             <div class="d-mypage-profile-con">
                <img class="d-mypage-profile" src='/resources/img/<c:out value="${member.img}" />'>
                <div class="d-mypage-info">
                  <h1><c:out value="${member.name}" />님</h1>
                </div>
            </div>
        </div>
        <div class="d-mypage-right">
        
        <!-- 현수 추가 -->
        <button type = "button" onclick="location.href='/mypage/changeuserinfo'">회원정보수정</button>
		<button type = "button" onclick="location.href='/mypage/changepwd'">비밀번호 변경</button>
		
        <p><a href="/mypage/like">like</a></p><p><a href="/mypage/revw">revw</a></p>
        <div class="d-con">
		<c:forEach items="${myLikeList}" var="myLikeList">
		<div class="d-liq-con" OnClick="location.href ='/trad-liq?liqId=<c:out value="${myLikeList.liqId}" />'" style="cursor:pointer;">
		<img class="d-img-con" src='/resources/img/<c:out value="${myLikeList.img}" />'>
		<div class="d-text-con">
		<h3><c:out value="${myLikeList.nm}"/></h3>
		가격 : \<fmt:formatNumber type="number" maxFractionDigits="3" value="${myLikeList.prc}" /><br>
		도수 : <c:out value="${myLikeList.lv}"/>%<br>
		원재료 : <c:out value="${myLikeList.capct}"/>ml<br>
		</div>
		</div>
		</c:forEach>
		</div>
		</div>
    </div>
    <div class="d-mypage-footer">
        <h1>footer</h1>
    </div>
</body>
</html>