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

<html>
<head>
<title>주문/결제</title>
</head>

<body>
<!-- top menu -->
<%@ include file="/WEB-INF/views/include/topmenu.jsp"%>

<h2>주문/결제</h2>

<!-- 1. 구매하기 버튼에서 바로 넘어오기 -->
<!-- 상품 사진, 상품 정보, 주문 수량, 판매자, 배송비, 주문금액 (단가 x 수량) -->
<p> 상품 사진 <c:out value="${liq.liqThumb }" /> </p>
<p> 상품 정보 <c:out value="${liq.nm }" /> </p>
<!-- ***** 수량 수정해야 함 -->
<p> 주문 수량 1개 </p>
<p> 판매자 <c:out value="${liq.liqCo.nm }" /> </p>
<p> 배송비 무료 </p>
<p> 주문금액 <fmt:formatNumber value="${liq.prc }" pattern="#,###" />원 </p>

<!-- 배송지 정보 -->
<%-- <h4>배송지 정보</h4>
<form id="operForm" action="/shop/order-details" method="post">
	<p>수령인 <input type="text" name="recipient" value="<c:out value='${dlvy.recipient }' />" placeholder="수령인 정보" /> </p>
	<p>연락처 <input type="text" name="telno" value="<c:out value='${dlvy.telno }' />" placeholder="연락처 정보" /> </p>
	<p>배송지 주소 </p>
	<input type="text" name="zipcode" value="<c:out value='${dlvy.zipcode }' />" placeholder="우편번호" /> <button>우편번호</button> <br />
	<input type="text" name="zipcode" value="<c:out value='${dlvy.adr }' />" placeholder="도로명 주소" />
	<input type="text" name="zipcode" value="<c:out value='${dlvy.adrDtl }' />" placeholder="상세 주소" />
</form>
 --%>
 
<!-- 주문자 정보 -->
<h4>주문자 정보</h4>
<p> <c:out value="${orderer.name }" /> </p>
<p> <c:out value="${email }" /> </p>

<!-- 주문 전체 내역 -->
<h4>주문 전체 내역</h4>
<!-- 내역이 1건이면 -->
<p><c:out value="${liq.nm }" /></p>
<!-- ***** 수량 수정해야 함 -->
<p>총 1개 </p>
<p>총 <fmt:formatNumber value="${liq.prc * 1 }" pattern="#,###" />원</p>

<!-- 장바구니 : 내역이 2건 이상이면 -->


<!-- 결제수단 -->
<h4>결제수단</h4>
<p> <input type="radio" checked />카카오페이 </p>

<!-- 결제하기 버튼 -->
<button type="submit" data-oper="pay">결제하기</button>

<!-- 결제하기 버튼 클릭 시 이동할 데이터 -->
<form id="operForm" action="/shop/pay" method="post">
	<input type="hidden" value="<c:out value='${liq.nm }' />" />
	<!-- ***** 수량 수정해야 함 -->
	<input  type="hidden" value="1" >
	<input type="hidden" name="liqId" value="<c:out value='${liq.prc * 1}'/>" />
</form>

<!-- footer -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>
</body>

<!-- 결제 페이지로 데이터 이동 -->
<script type="text/javascript">
$(document).ready(function() {
	   
	var operForm = $("#operForm");
	$("button[data-oper='pay']").on("click", function(e) {
	      operForm.attr("action", "/shop/pay").submit();
	   });
});
</script>
</html>