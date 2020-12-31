<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/topmenu.jsp"  %>
<!DOCTYPE html>
<html>
<head>
<title>돌려 돌려 돌림판!</title>
<meta charset="UTF-8">
<script type="text/javascript" src="/resources/js/Winwheel.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>
<style>
.s-roulette-container {
	height: 2200px;
	width: 1520px;
	padding-top: 130px;
	background: url("/resources/img/roulette-ver.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}

.s-roulette-div {
	height: 1950px;
	width: 1300px;
	margin-left: 105px;
	padding-top: 30px;
	border-radius: 20px;
	background-color: rgba(255,255,255,0.5);
}

.d-r-con {
	margin-left: 110px;
	padding: 50px 100px 150px 100px;
}

#canvasContainer {
	position: relative;
	width: 300px;
}

#canvas {
	z-index: 1;
	min-width: 880px;
}

#prizePointer {
	width: 150px;
	height: auto;
	position: absolute;
	left: 557px;
	top: 10px;
	z-index: 2;
	transform: rotate(50deg);
}

.s-main-background h2 {
	margin: 20px 0px 0px 200px;
}
</style>
</head>
<body>
<div class="s-roulette-container">
	<div class="s-roulette-div">
		<h4 style="margin-right: 200px; text-align: right;">* 룰렛을 클릭해주세요!</h4>
		
		<h2 style="margin-left: 150px;"><i class="fas fa-wine-bottle"></i> 무슨 술을 마실까요?</h2>
		<div class="d-r-con">
			<div id="canvasContainer">
				<canvas id='canvas' width='880' height='440'
					data-responsiveMinWidth="180" data-responsiveScaleHeight="true"
					data-responsiveMargin="50" onClick="startSpin();">>
	       </canvas>
				<img id="prizePointer" src="/resources/img/bottle.png" alt="V" />
			</div>
		</div>
		
		<h2 style="margin-left: 150px;"><i class="fas fa-utensils"></i> 무슨 안주를 먹을까요?</h2>
		<div class="d-r-con">
			<div id="canvasContainer">
				<canvas id='canvas1' width='880' height='440'
					data-responsiveMinWidth="180" data-responsiveScaleHeight="true"
					data-responsiveMargin="50" onClick="startSpin1();">>
	       </canvas>
				<img id="prizePointer" src="/resources/img/bottle.png" alt="V" />
			</div>
		</div>
		
		<h2 style="margin-left: 150px;"><i class="fas fa-bell"></i> 어서오세요, 골든벨 지옥에^^!</h2>
		<div class="d-r-con">
			<div id="canvasContainer">
				<canvas id='canvas2' width='880' height='440'
					data-responsiveMinWidth="180" data-responsiveScaleHeight="true"
					data-responsiveMargin="50" onClick="startSpin2();">>
	       </canvas>
				<img id="prizePointer" src="/resources/img/bottle.png" alt="V" />
			</div>
		</div>
	</div>
</div>

<script>
    let theWheel = new Winwheel({
        'canvasId': 'canvas',
        'lineWidth': 3,
        'numSegments': 4,
        'responsive': true,
        'segments':
            [
                { 'fillStyle': '#EAE56F', 'text': '오늘은맥쭈한잔?' },
                { 'fillStyle': '#89F26E', 'text': '고오급와인어때?' },
                { 'fillStyle': '#7DE6EF', 'text': '다틀렸어쏘맥이다!' },
                { 'fillStyle': '#E7706F', 'text': '금주해...' }
            ],
            
        'animation':
        {
            'type': 'spinToStop',
            'duration': 5,
            'spins': 8,
        }
    });
    function addSegment() {
        let date = new Date();
        theWheel.addSegment({
            'text': date.getMinutes() + ':' + date.getSeconds(),
            'fillStyle': 'aqua'
        }, 1);
        theWheel.draw();
    }
    function deleteSegment() {
        theWheel.deleteSegment();
        theWheel.draw();
    }
    function startSpin()
    {
        theWheel.stopAnimation(false);
        theWheel.rotationAngle = theWheel.rotationAngle % 360;
        theWheel.startAnimation();
    }
</script>
<script>
    let theWheel1 = new Winwheel({
        'canvasId': 'canvas1',
        'lineWidth': 3,
        'numSegments': 4,
        'responsive': true,
        'segments':
            [
                { 'fillStyle': '#EAE56F', 'text': '막창 후루룩?' },
                { 'fillStyle': '#89F26E', 'text': '인생은B와D사이의취킨' },
                { 'fillStyle': '#7DE6EF', 'text': '나 껍데기야.자니?' },
                { 'fillStyle': '#E7706F', 'text': '두유노 삼겹살!' }
            ],
            
        'animation':
        {
            'type': 'spinToStop',
            'duration': 5,
            'spins': 8,
        }
    });
    function addSegment1() {
        let date = new Date();
        theWheel1.addSegment({
            'text': date.getMinutes() + ':' + date.getSeconds(),
            'fillStyle': 'aqua'
        }, 1);
        theWheel1.draw();
    }
    function deleteSegment1() {
        theWheel1.deleteSegment();
        theWheel1.draw();
    }
    function startSpin1()
    {
        theWheel1.stopAnimation(false);
        theWheel1.rotationAngle = theWheel1.rotationAngle % 360;
        theWheel1.startAnimation();
    }
</script>
<script>
    let theWheel2 = new Winwheel({
        'canvasId': 'canvas2',
        'lineWidth': 3,
        'numSegments': 4,
        'responsive': true,
        'segments':
            [
                { 'fillStyle': '#EAE56F', 'text': '맥주 골든벨!' },
                { 'fillStyle': '#89F26E', 'text': '와인 골든벨!' },
                { 'fillStyle': '#7DE6EF', 'text': '위스키 골든벨!' },
                { 'fillStyle': '#E7706F', 'text': '막걸리 골든벨!' }
            ],
            
        'animation':
        {
            'type': 'spinToStop',
            'duration': 5,
            'spins': 8,
        }
    });
    function addSegment2() {
        let date = new Date();
        theWheel2.addSegment({
            'text': date.getMinutes() + ':' + date.getSeconds(),
            'fillStyle': 'aqua'
        }, 1);
        theWheel2.draw();
    }
    function deleteSegment2() {
        theWheel2.deleteSegment();
        theWheel2.draw();
    }
    function startSpin2()
    {
        theWheel2.stopAnimation(false);
        theWheel2.rotationAngle = theWheel2.rotationAngle % 360;
        theWheel2.startAnimation();
    }
</script>
</body>
</html>