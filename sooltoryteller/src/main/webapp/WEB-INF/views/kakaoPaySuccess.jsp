<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<p>결제 일시 : <fmt:formatDate value="${info.approved_at}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
<p>예약 번호 : <c:out value="${info.partner_order_id}"/></p>
<p>상품명 :<c:out value="${info.item_name}"/></p>
<p>상품수량 :<c:out value="${info.quantity}"/></p>
<p>결제금액 : <c:out value="${info.amount.total}"/></p>
<p>결제방법 : <c:out value="${info.payment_method_type}"/></p>  
</body>
</html>