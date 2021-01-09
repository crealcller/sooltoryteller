<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/include/topmenu.jsp"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전통주 상세</title>
<link rel="stylesheet" href="/resources/css/trad-liq-info.css">
</head>
<body>
<div class="s-main-background">
<div class="d-con">
   <div class="d-trad-liq-info">
      <div class="d-trad-liq-info-con">
         <img class="d-trad-liq-img-con" src="<c:out value='${liq.liqImg}'/>">
         <div class="d-trad-liq-text-con">
            
            <h1>
               <c:out value="${liq.nm}" />
            </h1>
            <div style="padding:10px;">
            <i class="fas fa-heart"  id="d-like-cnt"> <c:out value="${liq.liqCnt.likeCnt}" /></i>
            <i class="far fa-comment-dots" id="d-revw-cnt"> <c:out value="${liq.liqCnt.revwCnt}" /></i>
            <i class="fas fa-eye"> <c:out value="${liq.liqCnt.inqrCnt}" /></i>
            </div>
            <p>
            주종 : <c:out value="${liq.cate}" />
            </p>
            <p>
            용량 : <c:out value="${liq.capct}" />ml
            </p>
            <p>
            도수 : <c:out value="${liq.lv}" />%
            </p>
            <p>
            주재료 : <c:out value="${liq.irdnt}" />
            </p>
            <c:if test="${liq.ards ne null}">
            <p>
            수상내역 : <c:out value="${liq.ards}" />
            </p>
            </c:if>
            <p>
            가격 : <fmt:formatNumber value="${liq.prc }" pattern="#,###" />원
            </p>
            
            
            <button type="button" style="padding:0px 10px 0px 10px;">-</button>
            <input  type="text" style="width: 30px;" value="1" >
            <button type="button" style="padding:0px 10px 0px 10px;">+</button>
            <br>
            <button type="submit">술바구니</button>
            <button type="submit" data-oper="order">구매하기</button>
         </div>
      </div>
      <div class="d-trad-liq-info-con-heart">
      <i id='like' class="far fa-heart"></i>
      </div>
   </div>
   <div class="d-trad-liq-con">
      <div class="d-trad-liq-column">
      
      <h1>소개</h1><br>
      <p>
         <c:out value="${liq.liqCn.intro}" />
      </p>
      </div>
      <c:if test="${liq.liqCn.pair ne null}">
      <div class="d-trad-liq-column">
      <h1>맛과 페어링</h1><br>
      <p>
         <c:out value="${liq.liqCn.pair}" />
      </p>
      </div>
      </c:if>
      <div class="d-trad-liq-column">
      <div class="d-revw-wrapper">
         <h1>리뷰</h1><br>
         <div class="d-revws-con">
            <ul class="d-revws">
            </ul>
            <div class="d-paging">
            </div>
         </div>
         <div class="d-new-revw-con">
         <ul>
         <li><strong><c:out value="${liq.liqCnt.avgRate}" /></strong>
         <span class="d-revw-cnt"><c:out value="${liq.liqCnt.revwCnt}" /></span><span class="d-revw-cnt-msg">개의 리뷰</span></li>
         
         <li style="border:none;">
         지금 리뷰를 작성해보세요!
         </li>
         <c:choose>
            <c:when test = "${member.thumbImg eq null}">
                 <img class='d-revw-profile' src='/imgUpload/2020/12/08/s/s_user.png'>
             </c:when>
            <c:otherwise>
               <img class='d-revw-profile' src='<c:out value="${member.thumbImg}" />'>
            </c:otherwise>
         </c:choose>
         <button id='addRevwBtn' class="d-star_grade">
           <span value=1>★</span>
           <span value=2>★</span>
           <span value=3>★</span>
           <span value=4>★</span>
           <span value=5>★</span>
          </button>
         </ul>
         </div>   
      </div>
      </div>
      <div class="d-trad-liq-column">
         
         <h1>양조장 정보</h1><br>
         <div class="d-trad-liq-text-con">
         <p>
            <c:out value="${liq.liqCo.nm}" />
         </p>
         <p>
            <c:out value="${liq.liqCo.addr}" />
         </p>
         <c:if test="${liq.liqCo.hmpg ne null}">
            <a class="d-hmpg-a" href='<c:out value="${liq.liqCo.hmpg}" />' target="blank"><c:out value="${liq.liqCo.hmpg}" /></a>
         </c:if>
         <p id="tel">
         </p>
         
         </div>
         <div id="map"
            style="width: 450px; height: 350px; display:inline-block; margin-left:50px;">
         </div>
      </div>
   </div>

<div id="addRevw" class="d-revw-modal">

  <!-- Modal content -->
  <div class="d-revw-modal-content">
  <h2>리뷰 작성하기!<span class="d-revw-modal-close">&times;</span></h2>
    
    <div class="d-info-con">
   <div class="d-modal-info"><img style='width:70px;height:100px;' src='<c:out value="${liq.liqThumb}" />'></div>
   <div class="d-modal-info" style="padding-top:40px;"><h4 style="padding: 5px;"><c:out value="${liq.nm}" /></h4><p><c:out value="${liq.liqCo.nm}" /></p></div></div>
    
     <p class="star_grade">
        <span value=1>★</span>
        <span value=2>★</span>
        <span value=3>★</span>
        <span value=4>★</span>
        <span value=5>★</span>
    </p>
    <div class="wrap">
    <p><textarea id="content" maxlength="500" rows='15' name='revwCn' placeholder='10자 이상 입력해주세요'></textarea> <span id="counter"></span></p>
   </div>
    <button id='revwRegBtn' type='submit'>등록</button>
  </div>
</div>
</div>
</div>

<!-- 주문/결제 페이지로 데이터 이동 -->
<form id="operForm" action="/shop/order" method="post">
	<input type="hidden" name="liqId" value="<c:out value='${liq.liqId}'/>" />
	<input type="hidden" name="liqThumb" value="<c:out value='${liq.liqThumb}'/>" />
	<input type="hidden" name="liqId" value="<c:out value='${liq.nm}'/>" />
	<!-- ***** 수량 수정해야 함 -->
	<input  type="hidden" value="1" >
	<input type="hidden" name="liqId" value="<c:out value='${liq.liqCo.nm}'/>" />
	<input type="hidden" name="liqId" value="<c:out value='${liq.prc}'/>" />
</form>

<%@include file="/WEB-INF/views/include/footer.jsp" %>
<!-- 리뷰 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/revw.js"></script>
<script type="text/javascript" src="/resources/js/like.js"></script>
<script>
$(document).ready(function(){
   var liqIdValue = '<c:out value="${liq.liqId}"/>'
   var revwUL = $(".d-revws");
   var pageNum = 1;
   var revwPageFooter =$(".d-paging");
   showList(1);
   
   function showRevwPage(revwCnt){
      var endNum = Math.ceil(pageNum/5.0)*5;
      var startNum = endNum -4;
      
      var prev = startNum != 1;
      var next = false;
      
      if(endNum*3>=revwCnt){
         endNum = Math.ceil(revwCnt/3.0);
      }
      if(endNum*3<revwCnt){
         next =true;
      }
      var str = "<ul>";
      
      if(prev){
         str += "<li class='d-paging-btn-none'><a href='" + (startNum - 1)+ "'>&#60;</a></li>";
      }
      for(var i=startNum; i <=endNum; i++){
         var active = pageNum == i? "active":"none";
         str+="<li class='d-paging-btn-"+active +"'><a href="+i+">"+i+"</a></li>";
      }
      if(next){
         str+="<li class='d-paging-btn-none'><a href='"+ (endNum + 1)+"'>&#62;</a></li>";
      }
      
      str += "</ul>";
      revwPageFooter.html(str);
      
         
   }
   revwPageFooter.on("click","li a",function(e){
      e.preventDefault();
      var targetPageNum =$(this).attr("href");
      pageNum = targetPageNum;
      showList(pageNum);
   
   });
   
   function showList(page){
   
      revwService.getList({liqId:liqIdValue,page: page||1},function(revwCnt,list){
         console.log(revwCnt);
         if(page == -1){
            pageNum = Math.ceil(revwCnt/3.0);
            showList(pageNum);
            return;
         }
         var str="";
         if(list == null || list.length==0){
            revwUL.html("<li class='d-revw-con'>아직 등록된 리뷰가 없습니다.</li>");
            return;
         }
         for(var i=0,len = list.length || 0; i<len; i++){
            str += "<li class='d-revw-con' data-revwId = '"+list[i].revwId+"'>";
            str += "<div><div class='d-star-box'><span class='d-revw-star'>★</span>"+list[i].rate+"</div>"
            str += "<small class='d-revw-time'>"+revwService.displayTime(list[i].regdate)+"</small></div>"
            str += "<p style='padding:10px;'>"+list[i].cn+"</p></div>";
            str += "<div class='d-revw-member'><img class='d-revw-profile' src='"+list[i].member.thumbImg+"'>";
            str += "<div class='d-revw-member-nm'><strong>"+list[i].member.name+"</strong></div></div></li>";
         }
         revwUL.html(str);
         showRevwPage(revwCnt);
      });
      //동적으로 생성된 node에 접근해야함 
      //load/ready 될떄 별점이 보여야함
   }
   //모달
   let revwModal = $('#addRevw');
   let addRevwBtn = $('#addRevwBtn');
   let closeBtn = $('.d-revw-modal-close');
   let newRevwRate = 0;
   let newRevwCn = revwModal.find("textarea[name='revwCn']");
   let star = $('.star_grade span');
   let revwRegBtn =$('#revwRegBtn');
   star.click(function(){
        $(this).parent().children("span").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
        $(this).addClass("on").prevAll("span").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
        newRevwRate = $(this).attr('value');
        console.log(newRevwRate);
    });
   $(".d-star_grade span").click(function(){
       newRevwRate = $(this).attr('value');
       $('.star_grade').children().eq(newRevwRate-1).addClass("on").prevAll("span").addClass("on");
   });
   $(".d-star_grade span").hover(function(){
        $(this).parent().children("span").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
        $(this).addClass("on").prevAll("span").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
    });
   

   $(".d-star_grade span").mouseleave(function(){
        $(this).parent().children("span").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
    });

   //리뷰작성하기 버튼
   addRevwBtn.on("click",function(e){
      if(memberIdValue!=-1){
         
         $('#addRevw').fadeIn(300);
      }else{
         alert("로그인이 필요합니다");
         window.location.href ='/login';
      }
   });
   
   //모달 끄기 버튼
   closeBtn.on("click",function(e){
   revwModal.fadeOut(300);
   resetRevw();
   });
   
   //리뷰 작성후 제출 버튼
   revwRegBtn.on("click",function(e){
      var submitted = false;
      const revwCntHtml = $("#d-revw-cnt");
      const revwCnt = $(".d-revw-cnt");
      if(submitted == true){
         return;
      }
      if(newRevwCn.val().trim().length==0){
         alert("내용을 입력해주세요 ");
         return;
      }
      
      if(newRevwCn.val().trim().length<10){
         alert("내용을 최소 10자 이상 작성해주세요 ");
         return;
      }
      
      if(newRevwRate == 0){
         alert("별점을 선택해주세요");
         return;
      }
      let revw={
            liqId:liqIdValue,
            memberId:memberIdValue,
            cn:newRevwCn.val(),
            rate:newRevwRate
      };
      submitted = true;
      console.log(submitted);
      revwService.add(revw,function(result){
         if(result == "success"){
         alert("리뷰가 등록 되었습니다");
         revwModal.fadeOut(100);
         resetRevw();
         revwCntHtml.html(Number(revwCntHtml.html())+1);
         revwCnt.html(Number(revwCnt.html())+1);
         showList(1);
         }
      });
   });
      
function resetRevw(){
   $('.star_grade span').parent().children("span").removeClass("on");
   newRevwCn.val("");
   newRevwRate =0;
}
   
});

</script>


<!-- 좋아요 버튼 회원에 따라 페이지로 들어왔을 때 상태 보여줌 --> 
<script>
   var memberIdValue = '${member.memberId}' ==''? -1:'${member.memberId}';
   var liqIdValue = ${liq.liqId};
$(document).ready(function(){
   likeService.checkLike({memberId:memberIdValue,liqId:liqIdValue},function(data){
      if(data){
         $('#like').attr('class', 'fas fa-heart');
      }else{
         $('#like').attr('class', 'far fa-heart');
      }
   });
});
</script>
<!-- 버튼 눌렀을때 좋아요/취소 --> 
<script>
$('#like').on({'click': function() {
   var like= $("#d-like-cnt")
   if(memberIdValue != -1){
   likeService.checkLike({memberId:memberIdValue,liqId:liqIdValue},function(data){
      if(data){
         likeService.cancelLike({memberId:memberIdValue,liqId:liqIdValue}, function(count){
            console.log("cancel");
               if(count === "success"){
                  like.html(" "+(Number(like.html())-1));
                  $('#like').attr('class', 'far fa-heart');
               }
            });
         return;
         
      }else{
         likeService.like({memberId:memberIdValue,liqId:liqIdValue}, function(count){
            console.log("like");
               if(count === "success"){
                  like.html(" "+(Number(like.html())+1));
                  $('#like').attr('class', 'fas fa-heart');
               }
            });
      }
   });
   }else{
      alert("로그인이 필요합니다.")
      window.location.href ='/login';
   }
}   
});
</script>

   <!--카카오 지도 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12d8a59ec91065369e7c717d28c1c667&libraries=services,clusterer,drawing"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
var targetAddr = '${liq.liqCo.addr}';
var targetNm = '${liq.liqCo.nm}';
// 주소로 좌표를 검색합니다
geocoder.addressSearch(targetAddr , function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+targetNm+'</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
<script>
$(document).ready(function() {
   var num ="${liq.liqCo.telno}";
   console.log(num.length);
      console.log(num);
       var formatNum = '';
       if(num.length==11){
               formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
       }else if(num.length==8){
           formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
       }else{
           if(num.indexOf('02')==0){
                   formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
           }else{
                   formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
           }
       }
       $("#tel").text(formatNum);
});
</script>
<script>
$(function() {
    $('#content').keyup(function (e){
        var content = $(this).val();
        $('#counter').html(content.length + '/500');
    });
    $('#content').keyup();
});
</script>

<!-- 주문/결제 페이지로 데이터 이동 -->
<script type="text/javascript">
$(document).ready(function() {
	   
	var operForm = $("#operForm");
	$("button[data-oper='order']").on("click", function(e) {
	      operForm.attr("action", "/shop/order").submit();
	   });
});
</script>
</body>
</html>