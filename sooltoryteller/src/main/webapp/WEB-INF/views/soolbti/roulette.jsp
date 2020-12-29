<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/topmenu.jsp"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
       <title>roulette</title>
       <script type="text/javascript" src="/resources/js/Winwheel.js"></script>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>
    <style>
    	.d-r-con{
    	padding:100px;
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
        .s-main-background h2{
        margin:20px 0px 0px 200px;
        }
    </style>
</head>
<body>
<div class="s-main-background">
<h2>룰렛을 클릭해주세요!!</h2>
<div class="d-r-con">
    <div id="canvasContainer">
        <canvas id='canvas' width='880' height='440' data-responsiveMinWidth="180"
    data-responsiveScaleHeight="true"  data-responsiveMargin="50"
    onClick="startSpin();">>
        </canvas>
        <img id="prizePointer" src="/resources/img/bottle.png" alt="V" />
    </div>
    </div>
  </div>  
    <script>
        let theWheel = new Winwheel({
            'canvasId': 'canvas',
            'lineWidth': 3,
            'numSegments': 4,
            'responsive'   : true,
            'segments':
                [
                    { 'fillStyle': '#EAE56F', 'text': '오늘은맥쭈한잔' },
                    { 'fillStyle': '#89F26E', 'text': '아냐아냐막걸리야' },
                    { 'fillStyle': '#7DE6EF', 'text': '다틀렸어쏘맥이다' },
                    { 'fillStyle': '#E7706F', 'text': '꽝이요!꽝!' }
                ],
                
            'animation':
            {
                'type': 'spinToStop',
                'duration': 5,
                'spins': 8,
            }
        });
        function addSegment() {
            // Use a date object to set the text of each added segment to the current minutes:seconds
            // (just to give each new segment a different label).
            let date = new Date();
            // The Second parameter in the call to addSegment specifies the position,
            // in this case 1 meaning the new segment goes at the start of the wheel.
            theWheel.addSegment({
                'text': date.getMinutes() + ':' + date.getSeconds(),
                'fillStyle': 'aqua'
            }, 1);
            // The draw method of the wheel object must be called in order for the changes
            // to be rendered.
            theWheel.draw();
        }
        function deleteSegment() {
            // Call function to remove a segment from the wheel, by default the last one will be
            // removed; you can pass in the number of the segment to delete if desired.
            theWheel.deleteSegment();
            // The draw method of the wheel object must be called to render the changes.
            theWheel.draw();
        }
        function startSpin()
        {
            // Stop any current animation.
            theWheel.stopAnimation(false);
     
            // Reset the rotation angle to less than or equal to 360 so spinning again works as expected.
            // Setting to modulus (%) 360 keeps the current position.
            theWheel.rotationAngle = theWheel.rotationAngle % 360;
     
            // Start animation.
            theWheel.startAnimation();
        }
    </script>
</body>
</html>