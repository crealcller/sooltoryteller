<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/topmenu.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<script>
    //로그인이 안된 상태면 로그인페이지로 넘어가게
   let msg = '${msg}';
      if(msg != ""){
         alert(msg);
         location.href = '/login';
      }
      
</script>
<html>
<head>
 <link rel="stylesheet" href="/resources/css/joinHead.css">
<meta charset="UTF-8">
<title>장바구니</title>
<style>
.h-basket-body{
   width: 1520px;
    height: 1000px;
    background-color: #fff2ccff;
    display: flex;
    justify-content: center;
    align-items: center;
}
.h-basket-content{
    width: 1300px;
    height: 850px;
    background-color: white;
}
.h-title{
    margin: 10px;
}
        
table{
    width: 1300px;
    border-top: 2px solid;
    margin: 30px 0 0 0;
}
th, td {
    border-bottom: 1px solid #ddd;
    text-align: center;
}
th{
    padding: 10px 0 10px 0;
}
td{
    height: 140px;
}
.h-basket-img{
   height: 130px;
   width: 100px;
}
.h-change-btn{
    margin-top: 5px;
    width: 53px;
}
.h-s-order-btn, .h-delete-btn{
    width: 100px;
    height: 30px;
    background-color: #c27ba0ff;
    margin-bottom:10px;
    border: none;
    color: white;
    border-radius: 5px;
}
.h-btn-content{
    text-align: center;
}
.h-order-btn{
    width: 120px;
    height: 60px;
    background-color: #c27ba0ff;
    border: none;
    color: white;
    border-radius: 5px;
    margin: 30px;
    font-size: 15px;
}
.h-total-price{
    width: 1300px;
    height: 70px;
    background-color: #d9d2e9ff;
    display: flex;
    justify-content: flex-end;
    align-items: center;
}
</style>
</head>
<body>
<div class='h-basket-body'>
        <div class='h-basket-content'>
            <h2 class='h-title'>장바구니</h2>
           
            <table id="basket-item">
              <thead>
                <tr>
                  <th></th>
                  <th colspan="2" align="center">상품정보</th>
                  <th>수량</th>
                  <th>판매자</th>
                  <th>배송비</th>
                  <th>판매가</th>
                  <th>선택</th>
                </tr>
              </thead>
              
              <c:forEach items="${list}" var="basket">
                 <tr>
                   <td><input name="chkbox" data-liqid="<c:out value='${basket.liqId }'/>" type="checkbox" onClick="itemSum()" checked="checked"></td>
                   <td><a href="/trad-liq?liqId=<c:out value='${basket.liqId }'/>">
                   <img class="h-basket-img" src='<c:out value="${basket.liqImg }"/>'></a></td>
                   <td style="text-align: left"><c:out value="${basket.liqNm }"/></td>
                   <td><p><input name="qty" class="<c:out value='${basket.liqId }'/>" type="number" min="1" max="10" value="<c:out value='${basket.qty }'/>"></p>
                      <p><button data-liqid="<c:out value='${basket.liqId }'/>"  class='h-change-btn'>변경</button></p>
                  </td>
                  <td><c:out value="${basket.coNm }"/></td>
                  <td>무료</td>
                  <td class="price"><fmt:parseNumber type='number' value="${basket.amount }" />원</td>
                  <td><p><button class='h-s-order-btn'>주문하기</button></p>
                       <p><button data-liqid="<c:out value='${basket.liqId }'/>"  class='h-delete-btn'>선택상품 삭제</button></p></td>
                 </tr>
              <input type="hidden" value="<c:out value='${basket.memberId }'/>"  name='memberId' class='memberId'>
              <input type="hidden" value="<c:out value='${basket.liqId }'/>" name='liqId' class="liqId">
              
              </c:forEach>
              </table>
              
            <div class="h-total-price"><h3 style="margin-right: 50px;" id="total"></h3></div>
            <!-- 전체상품 주문  -->
              <form action="/shop/order" method="post">
                 <c:forEach items="${list}" var="list" varStatus="status">
                     <input type = "hidden" name="items[${status.index}].liqId" value='<c:out value = "${list.liqId }"/>'>
                  <input type = "hidden" name="items[${status.index}].qty" value='<c:out value = "${list.qty }"/>'>
                  <input type = "hidden" name="items[${status.index}].prc" value='<c:out value = "${list.prc }"/>'>
                </c:forEach>
            <div class='h-btn-content'><button type="submit" class='h-order-btn'>전체상품 주문</button>
                 <button type="button" class='h-order-btn' style="margin-left: 100px;">선택상품 주문</button></div>
               </form>
        </div>
    </div>
    
<%@include file="/WEB-INF/views/include/footer.jsp" %>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
   
   itemTotal();
   
   //장바구니 총 합계 구하기 
   //처음 실행시
   function itemTotal(){
   let sum = 0;
   let chkbox = document.getElementsByName("chkbox");
     for(let i=0; i < chkbox.length; i++ ){
        if( chkbox[i].checked == true ){
           sum += parseInt(document.getElementsByClassName("price")[i].innerHTML);
          }
     }
         document.getElementById("total").innerHTML = "총 상품 금액 : "+sum+"원";
   
   }
   //클릭시
   function itemSum(){
      let sum = 0;
      let chkbox = document.getElementsByName("chkbox");
      for(let i=0; i < chkbox.length; i++ ){
          if( chkbox[i].checked == true ){
          sum += parseInt(document.getElementsByClassName("price")[i].innerHTML);
          }
      }
         document.getElementById("total").innerHTML = "총 상품 금액 : "+sum+"원";
   }
   
   
   
   //수량 수정하기
    $(function(){
      
      $(".h-change-btn").click(function(){
         
         var memberId = $(".memberId").val();
         var liqId = $(this).data('liqid');
         var className = "."+liqId;
         var qty = $(className).val();
         console.log(liqId);
         
         $.ajax({
           type : 'post',
           data : {'qty' : qty, 'memberId':memberId, 'liqId':liqId},
           url : "/shop/basket/modify",
           dataType: "json",
           success : function(data){ 
              alert(data);
           }
           
         }); //ajax end
         location.reload();
      }); //fun end
   });      
   
   
   //장바구니 선택 삭제
   $(function(){
      $(".h-delete-btn").click(function(){
         var liqId = $(this).data('liqid');
         var memberId = $(".memberId").val();
      
         console.log(liqId);
         
         $.ajax({
           type : 'post',
           data : {'memberId':memberId, 'liqId':liqId},
           url : "/shop/basket/remove",
           dataType: "json",
           success : function(data){ 
            alert(data);
           }
           
         }); //ajax end
         location.reload();
      }); //fun end
   });      
</script>
</body>
</html>