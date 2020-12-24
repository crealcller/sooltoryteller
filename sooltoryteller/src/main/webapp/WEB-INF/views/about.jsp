<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">

<style>
.s-about-background {
	height: 650px;
	width: 1520px;
	position: relative;
}

.s-about-background::after {
	height: 650px;
	width: 1520px;
	background-image: url("/resources/img/cheers.jpg");
	background-repeat: no-repeat;
	background-size: 100% 100%;
	opacity: 0.5;
	filter: blur(3px);
	position: absolute;
	content: "";
	z-index: -1;
}

.s-container {
	height: 500px;
	width: 800px;
	position: relative;
	top: 75px;
	left: 350px;
	margin: 0 auto;
	background-image: url("/resources/img/cheers.jpg");
	background-repeat: no-repeat;
	background-size: 100% 100%;
	position: absolute;
	content: "";
	vertical-align: middle;
	z-index: 1;
}

.s-container .s-content {
	position: absolute;
	bottom: 0;
	font-family: 'Nanum Myeongjo', serif;
	background: rgba(0, 0, 0, 0.5);
	color: #f1f1f1;
	width: 100%;
	padding: 20px;
	z-index: 999;
}
</style>
</head>
<body>

<%@ include file="/WEB-INF/views/include/topmenu.jsp"%>

<div class="s-about-background">
	<div class="s-container">
		<div class="s-content">
			<h2>술토리텔러들의 이야기</h2><br />
			<p>안녕하세요. 술토리텔러에 방문해주셔서 감사 드립니다.<br />
			술토리텔러란, '애주가들이 술에 관한 이야기를 풀어낸다'는 의미의 술 정보 공유 커뮤니티입니다.<br />
			저희 사이트는 쉽게 접해보지 못한 다양한 전통주에 대한 정보를 포함하여,<br />
			코로나 시국으로 바깥 나들이를 즐기지 못하는 사람들이 집에서 일명 '나홀로술상'을 차려<br />
			온라인으로 건배를 외치며 이야기를 풀어나갈 수 있는 만남의 공간입니다.</p>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp" %>

</body>
</html>