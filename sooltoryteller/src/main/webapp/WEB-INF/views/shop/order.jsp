<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<script type="text/javascript">
   // 로그인이 안된 상태면 로그인페이지로 넘어가게
   let msg = "${msg}";
   if (msg != "") {
      alert(msg);
      location.href = "/login";
   }
</script>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>
<title>주문/결제</title>
<style>
.order-container {
   width: 1520px;
   height: 100%;
   min-height: 1000px;
   background-color: #fff2ccff;
   display: flex;
   justify-content: center;
   align-items: center;
}

.order-info-container {
   width: 900px;
   height: 85%;
   min-height: 850px;
   background-color: white;
}

.order-info-div {
   margin: 0 auto;
}

table {
   border-top: 1px solid #ddd;
}

th, td {
   border-bottom: 1px solid #ddd;
   text-align: center;
}

th {
   padding: 10px 0 10px 0;
}

td {
   padding: 0 33px 0 33px;
}

.dlvy-info-div {
   width: 350px;
   height: 250px;
   margin: 30px 0 0 100px;
   display: inline-block;
}

.zipBtn {
   width: 100px;
   height: 20px;
   border: none;
   background-color: #c27ba0ff;
   color: white;
   border-radius: 10px;
}

.order-etc-div {
   width: 300px;
   height: 250px;
   margin: 30px 0 0 150px;
   display: inline-block;
   float: right;
}

.payBtn-div {
   width: 150px;
   margin: 50px auto 0 auto;
}

.payBtn {
   width: 134px;
   height: 64px;
   border: none;
   background-color: white;
}

</style>
</head>

<body>
   <!-- top menu -->
   <%@ include file="/WEB-INF/views/include/topmenu.jsp"%>

   <form id="operForm" action="/shop/kakaoPay" method="post">

      <div class="order-container">
         <div class="order-info-container">
            <h2 style="margin-bottom: 20px;">주문/결제</h2>

            <table class="order-info-div">
               <thead>
                  <tr>
                     <th></th>
                     <th>상품정보</th>
                     <th>수량</th>
                     <th>양조장</th>
                     <th>배송비</th>
                     <th>주문금액</th>
                  </tr>
               </thead>

               <c:forEach items="${liq }" var="liq" varStatus="status">
                  <input type="hidden" name="items[${status.index }].liqId"
                     value="<c:out value='${liq.liqId }' />" />
                  <input type="hidden" name="items[${status.index }].qty"
                     value="<c:out value='${itemList.items[status.index].qty }' />" />
                  <input type="hidden" name="items[${status.index }].prc"
                     value="<c:out value='${liq.prc * itemList.items[status.index].qty }' />" />

                  <tr>
                     <td><img style="width: 70px;"
                        src="<c:out value="${liq.liqThumb }" />" /></td>
                     <td><c:out value="${liq.nm }" /></td>
                     <td><c:out value="${itemList.items[status.index].qty }" />개</td>
                     <td><c:out value="${liq.liqCo.nm }" /></td>
                     <td>0원</td>
                     <td><fmt:formatNumber
                           value="${liq.prc * itemList.items[status.index].qty }"
                           pattern="#,###" />원</td>
                  </tr>

                  <!-- 주문총수량 구하기 -->
                  <c:set var="ttlQty"
                     value="${ttlQty + itemList.items[status.index].qty }" />
                  <!-- 주문총금액 구하기 -->
                  <c:set var="ttlPrc"
                     value="${ttlPrc + liq.prc * itemList.items[status.index].qty }" />
               </c:forEach>
            </table>

            <div class="dlvy-info-div">
               <h4 style="margin: 10px 0 20px 0;">배송지정보</h4>
               <!-- 배송지 정보 -->
               수령인 <input type="text" name="ord.recipient" required="required" style="height: 22px; margin-bottom: 10px;"/><br />
               연락처 <input type="text" name="ord.telno" required="required" style="height: 22px; margin-bottom: 10px;" /><br />
               <input type="hidden" id="addr" name="ord.ordAdr" required="required" />
               배송지주소
               <p>
                  <input type="text" id="sample2_postcode" placeholder="우편번호"
                     readonly="readonly" required="required" style="margin: 10px 0 10px 0; width: 84px; height: 22px; " />
                  <input type="button" onclick="sample2_execDaumPostcode()"
                     value="우편번호 찾기" class="zipBtn" />
               </p>
               <p>
                  <input type="text" id="sample2_address" placeholder="주소"
                     readonly="readonly" required="required" style="margin-bottom: 10px; width: 254px; height: 22px;" />
               </p>
               <p>
                  <input type="text" id="sample2_detailAddress" placeholder="상세주소" style="margin-bottom: 10px; width: 254px; height: 22px;" />
                  <input type="text" id="sample2_extraAddress" placeholder="참고항목"
                     readonly="readonly" required="required" style="width: 254px; height: 22px;" />
               </p>

               <div id="layer"
                  style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
                  <img src="//t1.daumcdn.net/postcode/resource/images/close.png"
                     id="btnCloseLayer"
                     style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
                     onclick="closeDaumPostcode()" alt="닫기 버튼">
               </div>
            </div>

            <div class="order-etc-div">
               <h4 style="margin-bottom: 20px;">주문 전체 내역</h4>
               <p style="margin-bottom: 10px;">
                  <c:choose>
                     <c:when test="${fn:length(liq) eq 1}">
                        <c:out value="${liq[0].nm }" />
                     </c:when>
                     <c:otherwise>
                        <c:out value="${liq[0].nm }" /> 외 <c:out value="${ttlQty -1}" />개
                        </c:otherwise>
                  </c:choose>
               </p>
               <p style="margin-bottom: 10px;">
                  총
                  <c:out value="${ttlQty }" />
                  개
               </p>
               <p style="margin-bottom: 10px;">
                  총
                  <c:out value="${ttlPrc }" />
                  원
               </p>
               <!-- 결제하기 버튼 클릭 시 이동할 데이터 -->
               <c:choose>
                  <c:when test="${fn:length(liq) eq 1}">
                     <input type="hidden" name="ordName"
                        value='<c:out value="${liq[0].nm }" />' />
                  </c:when>
                  <c:otherwise>
                     <input type="hidden" name="ordName"
                        value='<c:out value="${liq[0].nm }" /> 외 <c:out value="${ttlQty -1}" />개' />
                  </c:otherwise>
               </c:choose>
               <input type="hidden" name="ord.ttlQty" value='<c:out value="${ttlQty }" />' /> 
               <input type="hidden" name="ord.ttlPrc" value='<c:out value="${ttlPrc }" />' /> 
               <input type="hidden" name="ordHist.meberId" value='<c:out value="${member.memberId }" />' />
               <!-- 변경필요 -->	
               <input type="hidden" name="pay.payMthd" value='카카오 페이' />
               <input type="hidden" name="payHist.bfStus" value='P' />

               <!-- 주문자 정보 -->
               <h4 style="margin: 50px 0 20px 0;">주문자 정보</h4>
               <p style="margin-bottom: 10px;"><c:out value="${member.name }" /></p>
               <p style="margin-bottom: 10px;"><c:out value="${member.email }" /></p>
            </div>
            
            <!-- 결제하기 버튼 -->
            <div class="payBtn-div">
               <button type="submit" class="payBtn" id="pay" data-oper="pay">
                  <img src="/resources/img/kakaoPay.png" />
               </button>
            </div>
         </div>
   </div>
   </form>

   <!-- footer -->
   <%@include file="/WEB-INF/views/include/footer.jsp"%>

   <!-- 배송지 input value받아오기 -->
   <script>
      $("#pay").on(
            "click",
            function() {
               var ordAdr = $("#sample2_postcode").val() + " "
                     + $("#sample2_address").val()
                     + $("#sample2_extraAddress").val()
                     + $("#sample2_detailAddress").val();
               $("#addr").val(ordAdr);
            });
   </script>
   <script
      src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script>
      // 우편번호 찾기 화면을 넣을 element
      var element_layer = document.getElementById('layer');

      function closeDaumPostcode() {
         // iframe을 넣은 element를 안보이게 한다.
         element_layer.style.display = 'none';
      }

      function sample2_execDaumPostcode() {
         new daum.Postcode(
               {
                  oncomplete : function(data) {
                     // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                     // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                     // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                     var addr = ''; // 주소 변수
                     var extraAddr = ''; // 참고항목 변수

                     //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                     if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                     } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                     }

                     // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                     if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== ''
                              && /[동|로|가]$/g.test(data.bname)) {
                           extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== ''
                              && data.apartment === 'Y') {
                           extraAddr += (extraAddr !== '' ? ', '
                                 + data.buildingName
                                 : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                           extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample2_extraAddress").value = extraAddr;

                     } else {
                        document.getElementById("sample2_extraAddress").value = '';
                     }

                     // 우편번호와 주소 정보를 해당 필드에 넣는다.
                     document.getElementById('sample2_postcode').value = data.zonecode;
                     document.getElementById("sample2_address").value = addr;
                     // 커서를 상세주소 필드로 이동한다.
                     document.getElementById("sample2_detailAddress")
                           .focus();

                     // iframe을 넣은 element를 안보이게 한다.
                     // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                     element_layer.style.display = 'none';
                  },
                  width : '100%',
                  height : '100%',
                  maxSuggestItems : 5
               }).embed(element_layer);

         // iframe을 넣은 element를 보이게 한다.
         element_layer.style.display = 'block';

         // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
         initLayerPosition();
      }

      // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
      // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
      // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
      function initLayerPosition() {
         var width = 500; //우편번호서비스가 들어갈 element의 width
         var height = 400; //우편번호서비스가 들어갈 element의 height
         var borderWidth = 5; //샘플에서 사용하는 border의 두께

         // 위에서 선언한 값들을 실제 element에 넣는다.
         element_layer.style.width = width + 'px';
         element_layer.style.height = height + 'px';
         element_layer.style.border = borderWidth + 'px solid';
         // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
         element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
               + 'px';
         element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
               + 'px';
      }
   </script>
</html>