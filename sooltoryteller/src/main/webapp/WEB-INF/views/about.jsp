<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">

<style>
.s-about-background {
	height: 560px;
	width: 1520px;
	background-color: rgb(243 248 224);
}

.s-container {
	height: 560px;
	width: 1100px;
	margin: 0 auto;
	position: relative;
	color: white;
}

.s-container img {
	height: 100%;
	width: 100%;
}	

.s-content {
	height: 560px;
	width: 400px;
	margin: 0 auto;
	padding: 65px 0 0 25px;
	position: absolute;
	top: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.5);
	color: #f1f1f1;
}

.s-content p {
	font-size: 15px;
	line-height: 2;
}

</style>
</head>
<body>

<%@ include file="/WEB-INF/views/include/topmenu.jsp"%>

<div class="s-about-background">
	<div class="s-container">
		<img class="s-img" src="/resources/img/beer.jpg" />
		<div class="s-content">
			<h2>술토리텔러들의 이야기</h2><br />
			<p>안녕하세요.<br />
			술토리텔러에 방문해주셔서 감사 드립니다.<br /><br />
			술토리텔러란,<br />
			<strong>'애주가들이 술에 관한 이야기를 풀어낸다'</strong>는 의미의<br />
			술 정보 공유 커뮤니티입니다.<br /><br />
			저희 사이트는 쉽게 접해보지 못한<br />
			다양한 전통주에 대한 정보 및 술게임을 포함하여,<br />
			코로나 시국으로 바깥 나들이를 즐기지 못하는 사람들이<br />
			집에서 일명 <strong>'나홀로술상'</strong>을 차려<br />
			온라인으로 건배를 외치며 이야기를 풀어나갈 수 있는<br />
			만남의 공간입니다.</p>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp" %>

</body>
</html>