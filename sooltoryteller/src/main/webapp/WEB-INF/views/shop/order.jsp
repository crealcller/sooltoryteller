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
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
<title>주문/결제</title>
</head>

<body>
	<!-- top menu -->
	<%@ include file="/WEB-INF/views/include/topmenu.jsp"%>
	<form id="operForm" action="/shop/kakaoPay" method="post">
		<h2>주문/결제</h2>
		<c:forEach items="${liq }" var="liq" varStatus="status">
			<input type="hidden" name="items[${status.index }].liqId" value="<c:out value='${liq.liqId }' />" />
			<input type="hidden" name="items[${status.index }].qty" value="<c:out value='${itemList.items[status.index].qty }' />" />
			<input type="hidden" name="items[${status.index }].prc" value="<c:out value='${liq.prc * itemList.items[status.index].qty }' />" />
			<p>상품 사진<c:out value="${liq.liqThumb }" /></p>
			<p>상품 정보<c:out value="${liq.nm }" /></p>
			<p>상품 단가<fmt:formatNumber value="${liq.prc }" pattern="#,###" />원</p>
			<!-- ***** 수량 수정해야 함 -->
			<p>주문 수량<c:out value="${itemList.items[status.index].qty }" />개</p>
			<p>판매자<c:out value="${liq.liqCo.nm }" /></p>
			<p>
				주문금액
				<fmt:formatNumber
					value="${liq.prc * itemList.items[status.index].qty }"
					pattern="#,###" />
				원
			</p>
			<!-- 주문총수량 구하기 -->
			<c:set var="ttlQty"
				value="${ttlQty + itemList.items[status.index].qty }" />
			<!-- 주문총금액 구하기 -->
			<c:set var="ttlPrc"
				value="${ttlPrc + liq.prc * itemList.items[status.index].qty }" />
		</c:forEach>

		<!-- 배송지 정보 -->
		수령인 <input type="text" name="ord.recipient" /> 
		전화번호 <input type="text" name="ord.telno" />
		주소 <input  type="text"  name="ord.ordAdr" />
		<!-- 주문 전체 내역 -->

<h4>주문 전체 내역</h4>
		<p>
			<c:choose>
				<c:when test="${fn:length(liq) eq 1}">
					<c:out value="${liq[0].nm }" />
			</c:when>
				<c:otherwise>
					<c:out value="${liq[0].nm }" /> 외 <c:out value="${ttlQty -1}" />개
			</c:otherwise>
			</c:choose>
		</p>
		<p>총 <c:out value="${ttlQty }" />개 </p>
<p>총 <c:out value="${ttlPrc }" />원</p>
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

		<!-- 주문자 정보 -->
		<h4>주문자 정보</h4>
		<c:out value="${member.name }" />
		<c:out value="${member.email }" />

<!-- 결제하기 버튼 -->
<button type="submit" data-oper="pay">결제하기</button>
</form>
<!-- footer -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>
</html>