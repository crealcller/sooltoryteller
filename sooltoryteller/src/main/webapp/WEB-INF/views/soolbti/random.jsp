<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="/WEB-INF/views/include/topmenu.jsp" %>
     <link rel="stylesheet" href="/resources/css/loginHead.css">
     <style>
        .btn-img{
            height: 220px;
            width: 300px;
            border-radius: 50px;
        }
        .btn{
            cursor: pointer;
        }
        .game-content{
        	height: 600px;
        	padding-top:50px;
        }
        .game-top{
            height: 150px;
            /* width: 430px; */
            /* background-image: url("img/game3.png") ; */
            background-position: center;
            background-repeat: no-repeat;
            text-align: center;
        }
        .result{
            padding-top: 40px;
        }
    </style>
<body>
<div class="s-main-background">
	<div class="s-main-column" style="height:750px; text-align: center;">
		<div class='game-content'>
	  	 <div class='game-top'><h2 class='result'>랜덤 벌칙 뽑기! (이미지를 클릭해주세요.)</h2></div>
      	 <div class='game-botton'><a class='btn'><img src="/resources/img/game1.jpeg" class='btn-img'></a></div>
  		</div>
    </div>
  </div>
</div>
</div>
   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
var penalty = ['현재 잔의 소주 두 잔 타기', '옆 사람 술 원샷하기!', '왼쪽에 앉은 사람과 러브샷',
'노래 한 소절 부르기~', '오른발 귀에 대고 엽때요? 하기', '옆 사람 유혹해서 섹시해요 란 말 듣기',
'애교부리고 귀엽다 란 말 듣기', '아이유 3단 고음지르기', '현재 잔 원샷 후 팔굽혀펴기 3번',
'물구나무 서서 5초 버티기', '편의점 가서 육포 사오기', '프리스타일 랩 하기', '성대모사 하기',
 '오른쪽에 앉은 사람 족욕시켜주기', '폭탄주 제조해서 옆사람 주기'];

$(document).ready(function(){
    $('.btn').click(function(){
        let i = Math.floor( Math.random()*15 ); //0~14
        $(".result").html(penalty[i]);
        $(".game-top").css("background-image", 'url("/resources/img/firework1.gif")');
    
})
})

</script>
</body>
<%@include file="/WEB-INF/views/include/footer.jsp" %>
</html>