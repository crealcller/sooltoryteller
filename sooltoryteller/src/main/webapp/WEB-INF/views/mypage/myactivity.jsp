<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ include file="/WEB-INF/views/include/mypageSidebar.jsp"%>

<html>
<head>
<meta charset="UTF-8">
<title>내 게시글 활동 현황</title>
<script type="text/javascript">
	// 로그인이 안된 상태면 로그인페이지로 넘어가게
	let msg = "${msg}";
	if (msg != "") {
		alert(msg);
		location.href = "/login";
	}
</script>
</head>

<body>
<div>
	<div id="columnchart_values" style="width: 900px; height: 300px;"></div>
</div>

</div>
</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load("current", {packages:['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
    var data = google.visualization.arrayToDataTable(
    	${data}
    );

    var view = new google.visualization.DataView(data);
    view.setColumns([0, 1]);
                    
    var options = {
      title: "내 게시글 활동 현황",
      width: 600,
      height: 400,
      bar: {groupWidth: "95%"},
      legend: { position: "none" },
    };
    var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
    chart.draw(view, options);
}
</script>
</body>
</html>