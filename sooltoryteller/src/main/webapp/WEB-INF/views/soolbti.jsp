<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>술BTI</title>
<style>
.s-game-container {
	height: 700px;
	width: 1520px;
	position: relative;
	background: url("/resources/img/arcade.gif");
	background-repeat: no-repeat;
	background-size: cover;
}

.s-game-div {
	height: 350px;
	width: 800px;
	border-radius: 10px;
	position: absolute;
	display: inline-block;
	margin: 180px auto 0 350px;
	background-color: rgba(255,255,255,0.5);
}

.s-game {
	height: 250px;
	width: 200px;
	margin: 70px 0 0 48px;
	display: inline-block;
	text-align: center;
	font-size: 15px;
	font-weight: bold;
}

.s-game-img {
	height: 200px;
	width: 200px;
}

.s-game-title {
	margin-top: 15px;
}
</style>
</head>

<body>
<%@ include file="/WEB-INF/views/include/topmenu.jsp"%>
<div class="s-game-container">
	<div class="s-game-div">
		<a href="/soolbti/roulette">
			<div class="s-game">
				<img src="/resources/img/roulette.gif" class="s-game-img" />
				<p class="s-game-title">돌려 돌려 돌림판!</p>
			</div>
		</a>
		<a href="https://www.zutopia-test.com/">
			<div class="s-game">
				<img src="/resources/img/drunk.gif" class="s-game-img" />
				<p class="s-game-title">내 주사 유형 테스트</p>
			</div>
		</a>
		<a href="/soolbti/random">
			<div class="s-game">
				<img src="/resources/img/alcohol-type.gif" class="s-game-img" />
				<p class="s-game-title">랜덤 뽑기!</p>
			</div>
		</a>
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>