<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
  
<!DOCTYPE html>
<html>
<head>
<script>
//권한체크
let msg ='${msg}';

if(msg != ''){
	alert(msg);
	location.href = '/';
}
</script>
<%@include file="/WEB-INF/views/include/adminMenu.jsp" %> 
<meta charset="UTF-8">
<title>양조장 관리</title>
</head>
<body>
<p><c:out value='${liqCo.nm }'/></p>
<p><c:out value='${liqCo.addr }'/></p>
<p><c:out value='${liqCo.telno }'/></p>
<p><c:out value='${liqCo.hmpg }'/></p>

</div>
</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp" %>
<script>
$(document).ready(function(){

	$("#d-liq-co-list").css('background-color', 'rgb(10, 29, 74)').css('color','white');
});
</script>
</body>
</html>