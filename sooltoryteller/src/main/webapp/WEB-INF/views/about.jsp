<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>

<style>
.s-main-background {
	width: 1520px;
}

.s-container {
	height: auto;
	width: 1200px;
	position: relative;
	margin: 0 auto;
}

.s-container img {
	height: 100%;
	width: 100%;
	vertical-align: middle;
}

.s-container .s-content {
	position: absolute;
	bottom: 0;
	background: rgba(0, 0, 0, 0.5);
	color: #f1f1f1;
	width: 100%;
	padding: 20px;
}

</style>

</head>
<body>
<%@ include file="/WEB-INF/views/include/topmenu.jsp"%>

<div class="s-main-background">
	<div class="s-container">
		<img src="/resources/img/wineglass.gif" />
		<div class="s-content">
			<h2>술토리텔러님,</h2>
			<p>안녕하세요. 술토리텔러에 방문해주셔서 감사 드립니다.<br />
			<p>술토리텔러란, '애주가들이 술에 관한 이야기를 풀어낸다'는 의미의 술 정보 공유 커뮤니티입니다.<br />
			<p>저희 사이트는 쉽게 접해보지 못한 다양한 전통주에 대한 정보를 포함하여,<br />
			코로나 시국으로 바깥 나들이를 즐기지 못하는 사람들이 집에서 일명 '나홀로술상'을 차려 온라인으로 건배를 외치고 술 관련 정보를 교류하실 수 있는 만남의 장소입니다.</p>
			
		</div>
	</div>
</div>

</body>
</html>