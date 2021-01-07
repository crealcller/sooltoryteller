<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>

//로그인이 안된 상태면 로그인페이지로 넘어가게
let msg = '${msg}';
   if(msg != ""){
      alert(msg);
      location.href = '/login';
   }
</script>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/include/mypageSidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 > 리뷰</title>
</head>
<body>
      <h2>내가 작성한 전통주 리뷰</h2>
      <div class="d-con">
      <ul class="d-revw">
      </ul>
      </div>
        <div class="d-paging" style="width: 700px; margin-right: 25px;"></div>
        </div>
       </div>
       </div>
       
       <%@include file="/WEB-INF/views/include/footer.jsp" %>
 
<div id="getRevw" class="d-revw-modal">
  <!-- Modal content -->
  <div class="d-revw-modal-content">
    <h2>리뷰 상세<span class="d-revw-modal-close">&times;</span></h2>
     <p class="star_grade">
        <span value=1>★</span>
        <span value=2>★</span>
        <span value=3>★</span>
        <span value=4>★</span>
        <span value=5>★</span>
    </p>
    <div class="wrap">
    <p> <textarea id="content" rows='15' maxlength="500" name='revwCn' placeholder='10자 이상 입력해주세요'></textarea> <span id="counter"></span></p>
    </div>
    <div class="d-modal-btn">
    <button id='revwUpdateBtn' type='submit'>수정</button> 
    <button id='revwDeleteBtn' type='submit'>삭제</button>
     </div>
  </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/revw.js"></script>
<script>
$(document).ready(function(){

	let memberIdValue = '<c:out value="${member.memberId}"/>'
	let dRevw = $(".d-revw");
	let pageNum = 1;
	let paging = $(".d-paging");
	showMyList(1);
	function showMyRevwPage(myRevwCnt){
		console.log(myRevwCnt);
		let endNum = Math.ceil(pageNum/5.0)*5;
		let startNum = endNum -4;
		
		let prev = startNum != 1;
		let next = false;
		
		if(endNum*4>=myRevwCnt){
			endNum = Math.ceil(myRevwCnt/4.0);
		}
		if(endNum*4 < myRevwCnt){
			next = true;
		}
		let str = "<ul class='d-paging'>";
		
		if(prev){
			str += "<li class='d-paging-btn-none'><a href='" + (startNum - 1)+ "'>&#60;</a></li>";
		}
		for(let i=startNum; i <=endNum; i++){
			let active = pageNum == i? "active":"none";
			str+="<li class='d-paging-btn-"+active +"'><a href="+i+">"+i+"</a></li>";
		}
		if(next){
			str+="<li class='d-paging-btn-none'><a href='"+ (endNum + 1)+"'>&#62;</a></li>";
		}
		
		str += "</ul>";
		paging.html(str);
		
			
	}
	paging.on("click","li a",function(e){
		e.preventDefault();
		let targetPageNum =$(this).attr("href");
		pageNum = targetPageNum;
		showMyList(pageNum);
	
	});
	
	function showMyList(page){
		revwService.getMyList({memberId:memberIdValue,page: page||1},function(myRevwCnt,myList){
			if(page == -1){
				pageNum = Math.ceil(myRevwCnt/5.0);
				showMyList(pageNum);
				return;
			}
			let str="";
			if(myList == null || myList.length==0){
				dRevw.html("<p style='margin: 35px 0px 0px -52px;'>작성한 전통주 리뷰가 없습니다.</p><br />"); 
				return;
			}
			for(let i=0,len = myList.length || 0; i<len; i++){
				str += "<li  class='d-revw-con' >";
				str += "<div class='d-myrevw-liq-con' id='move' data-liqid = '"+myList[i].liqId+"'>";
				str += "<img class='d-myrevw-img' src='"+myList[i].liqThumb+"'/>";
				str += "<div class='d-myrevw-liq-nm'><span>"+myList[i].nm+"</span></div></div>";
				str += "<div class='d-myrevw-eval' id='getRevw' data-revwid = '"+myList[i].revwId+"'><div class='d-star-box'><span class='d-revw-star'>★</span>"+myList[i].rate+"</div>";
				str += "<div class='d-myrevw-cn'><span class='d-revw-cn-span'>"+myList[i].cn+"</span></div></div></li>";
			}
			
			dRevw.html(str);
			showMyRevwPage(myRevwCnt);
		});
	}
	//항목 선택시 상세페이지로 이동
	dRevw.on("click","#move",function(e){
		let targetId = $(this).data('liqid');
		location.href=location.href ="/trad-liq?liqId="+targetId;
	});
	// 버튼 생성해서 수정하기
	//리뷰상세모달
	let revwModal = $('#getRevw');
	//모달에서의 수정하기 버튼
	let revwUpdateBtn = $('#revwUpdateBtn');
	//모달에서의 삭제하기 버튼
	let revwDeleteBtn = $('#revwDeleteBtn');
	//모달 닫기
	let closeBtn = $('.d-revw-modal-close');
	//리뷰 코멘트
	let cn = revwModal.find("textarea[name='revwCn']");
	//리뷰 평점 
	let rate = 0;
	let targetRevwId=0;
	let targetLiqId =0;
	dRevw.on("click","#getRevw",function(e){
		targetRevwId = $(this).data('revwid');
		targetLiqId = $(this).data('liqid');
		console.log("targetRevwId : "+targetRevwId);
		revwService.get(targetRevwId,function(revw){
			cn.val(revw.cn);
			rate = revw.rate;
			$('.star_grade').children().eq(rate-1).parent().children("span").removeClass("on");
			$('.star_grade').children().eq(rate-1).addClass("on").prevAll("span").addClass("on");
			$(function() {
			      $('#content').keyup(function (e){
			          var content = $(this).val();
			          $('#counter').html(content.length + '/500');
			      });
			      $('#content').keyup();
			});
			revwModal.fadeIn(100);
		});
	});
		//클릭시 별점 채우고 update revw에 들어갈 rate값에 선택된 값 넣어줌
		$('.star_grade span').click(function(){
		    $(this).parent().children("span").removeClass("on");
		    $(this).addClass("on").prevAll("span").addClass("on"); 
		    rate =  $(this).attr('value');
		    console.log(rate);
		});
		//X 클릭시 모달 끄기
		closeBtn.on("click",function(e){
			revwModal.fadeOut(300);
		});
		
		//리뷰 > 수정하기버튼 클릭시 사용자가 선택한 해당전통주의 해당 번호에 사용자가 입력한 평점/코멘트를 revw에 set
		revwUpdateBtn.on("click",function(e){
			
			if(cn.val().trim().length==0){
				alert("내용을 입력해주세요 ");
				return;
			}
			if(cn.val().trim().length<10){
				alert("리뷰내용은 최소 10자이상 입력해주세요");
				return;
			}
			if(rate == 0){
				alert("별점을 선택해주세요");
				return;
			}
			const revw={
					revwId : targetRevwId,
					liqId : targetLiqId,					
					cn:cn.val(),
					rate:rate,
					memberId:memberIdValue
			};
			//업데이트 할 revw를 받아 업데이트후 모달 끄기
			revwService.update(revw,function(result){
				if(result === "success"){
					revwModal.fadeOut(100);
					showMyList(1);
					alert("수정완료");
				}
			});
		});
		
		//해당리뷰삭제
		revwDeleteBtn.on("click", function(e){
			revwService.remove(targetRevwId,function(result){
				if(result === "success"){
					alert("리뷰가 삭제 되었습니다");
					location.reload();
				}else{
					alert("실패");
				}
			});
		});
});
</script>
</body>
</html>