<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script>
	// 로그인이 안된 상태면 로그인페이지로 넘어가게
	let msg = "${msg}";
	if (msg != "") {
		alert(msg);
		location.href = "/login";
	}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
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
   height: 55%;
   min-height: 850px;
   background-color: white;
}

.order-info-div {
   margin: 0 auto;
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
.d-pay-msg-con{
	width:800px;
	height: 150px;
	margin : 100px auto 30px auto;
	text-align: center;
	border-bottom: 2px solid #e1e1e1;
}
.d-pay-msg-con p{
	margin:15px;
}
.d-pay-info-con{
	width:800px;
	height: 300px;
	margin : 20px auto 20px auto;
}
.d-pay-table{
	margin:20px;
}
.d-pay-table th, td{
	width: 250px;
	border: 1px solid #ddd; 
	text-align: center;
}
.d-pay-table th{
	height : 60px;
	 background-color: #fff2ccff;
}
.d-pay-table td{
	height : 50px;
}

.d-second-row td{
	height : 30px;
	font-size: 10px;
}
</style>
</head>
<body>

<%@ include file="/WEB-INF/views/include/topmenu.jsp"%>
 <div class="order-container">
 <div class="order-info-container">
 <h2 style="margin-bottom: 20px;">주문/결제</h2>
 <div class="d-pay-msg-con">
 <h2>주문이 성공적으로 접수 되었습니다</h2>
<p>주문 번호(<c:out value="${info.partner_order_id}"/>) | 감사합니다</p>
<p>자세한 정보는 마이페이지 > 주문내역 에서 확인하실 수 있습니다.</p>
</div>
<div class="d-pay-info-con">
<h2>결제 정보</h2>
<div class="d-pay-table">
<table>
      <thead>
        <tr>
          <th>상품가격</th>
          <th>배송비</th>
          <th>결제금액</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><c:out value="${info.amount.total}"/></td>
          <td>0</td>
          <td><c:out value="${info.amount.total}"/></td>
        </tr>
          <tr class="d-second-row">
          <td><c:out value="${info.item_name}"/>
          <p><c:out value="${info.amount.total}"/></p></td>
          <td></td>
          <td>
          <c:choose>
                  <c:when test="${payment_method_type eq MONEY}">
                     	카카오 <c:out value="${info.payment_method_type}"/>
                  </c:when>
                  <c:otherwise>
                      <c:out value="${info.card_info.card_type}"/>
                  </c:otherwise>
               </c:choose>
          <c:out value="${info.amount.total}"/></td>
        </tr>
      </tbody>
    </table>
</div>
</div>  
</div>
</div>
</body>
</html>