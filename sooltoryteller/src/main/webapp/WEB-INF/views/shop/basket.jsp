<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/topmenu.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
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
.h-change-btn{
    margin-top: 5px;
    width: 53px;
}
.h-s-order-btn{
    width: 100px;
    height: 30px;
    background-color: #c27ba0ff;
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
           
            <table>
                <tr>
                  <th></th>
                  <th>상품정보</th>
                  <th>수량</th>
                  <th>판매자</th>
                  <th>배송비</th>
                  <th>판매가</th>
                  <th>선택</th>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>--------</td>
                  <td><p><input type="number" min="1" max="10"></p>
                      <p><button class='h-change-btn'>변경</button></p></td>
                  <td>--------</td>
                  <td>--------</td>
                  <td>--------</td>
                  <td><button class='h-s-order-btn'>주문하기</button></td>
                </tr>
            </table>
            <div class="h-total-price"><h3 style="margin-right: 50px;">총 상품 금액 :       원</h3></div>
            <div><button>선택상품 삭제</button></div>
            <div class='h-btn-content'><button class='h-order-btn'>전체상품 주문</button>
                 <button class='h-order-btn' style="margin-left: 100px;">선택상품 주문</button></div>
        </div>
    </div>
    <%@include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>