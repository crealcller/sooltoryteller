<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/include/topmenu.jsp"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전통주 리스트</title>
<link rel="stylesheet" href="/resources/css/trad-list.css">
</head>
<body>
<div class="s-main-background">

<ul class="s-bbst-container">
<h2>전체</h2>
<c:forEach items="${allLiq}" var="allLiq">
<li class="s-bbst-item-container" OnClick="location.href ='/trad-liq?liqId=<c:out value="${allLiq.liqId}" />'" style="cursor:pointer;">
<div class="s-bbst-img-con">   
<img class="d-img-con" src="<c:out value='${allLiq.liqImg}'/>">
</div>
<div class="s-bbst-info-div">
<h2><c:out value="${allLiq.nm}"/> <span style="color:#ff8040;"><c:out value="${allLiq.liqCnt.avgRate}"/></span></h2>
<p>도수 : <c:out value="${allLiq.lv}"/>%</p>
<p>원재료 : <c:out value="${allLiq.capct}"/>ml</p>
<p>양조장 : <c:out value="${allLiq.liqCo.nm}"/></p>
</div>
</li>
</c:forEach>
</ul>
<!-- 페이징 처리 -->
<ul class="s-pagination">
	<c:if test="${pageMaker.prev }">
		<li class="s-paginate_button previous" style="width: 50px;">
			<a href="${pageMaker.startPage -1 }"><i class="fas fa-arrow-circle-left"></i></a>
		</li>
	</c:if>
	
	<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
		<li class="s-paginate_button ${pageMaker.cri.pageNum == num ? "active":"" } ">
			<a href="${num }">${num }</a>
		</li>
	</c:forEach>
	
	<c:if test="${pageMaker.next }">
		<li class="s-paginate_button next" style="width: 50px;">
			<a href="${pageMaker.endPage + 1 }"><i class="fas fa-arrow-circle-right"></i></a>
		</li>
	</c:if>
</ul>
		
</div>
<%@include file="/WEB-INF/views/include/footer.jsp" %>

<form id="s-actionForm" action="/all-liq" method="get">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }" />
	<input type="hidden" name="amount" value="${pageMaker.cri.amount }" />
</form>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	var actionForm = $("#s-actionForm");
	
	$(".s-paginate_button a").on("click", function(e) {
		e.preventDefault();
		console.log("click");
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
});	
</script>
</body>
</html>