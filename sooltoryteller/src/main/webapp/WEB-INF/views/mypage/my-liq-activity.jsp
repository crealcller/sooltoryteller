<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
let msg = '${msg}';
	if(msg != ""){
		alert(msg);
		location.href = '/login';
	}
</script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ include file="/WEB-INF/views/include/mypageSidebar.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>내 전통주 활동 현황</title>
<style>
.s-chart-div {
	height: 400px;
	width: 600px;
	margin: 0 auto;
}

#columnchart_values {
	height: 400px;
	width: 600px;
}

.s-myactivity-table {
	height: 150px;
	width: 400px;
	margin: 20px auto 0 auto;
}

th, td {
	border: 1px solid rgb(240 240 240);
	padding: 8px;
	text-align: left;
}

tr:nth-child(even) {
	background-color: rgb(250 245 255);
}
</style>
</head>

<body>
<h2 style="width: 780px;">내 전통주 활동 현황</h2>
<div class="s-chart-div">
	<div id="columnchart_values"></div>
</div>

<table class="s-myactivity-table">
	<tr>
		<th>내가 작성한 전통주 리뷰수</th>
		<td><c:out value="${liqRCnt }" /></td>
	</tr>
	<tr>
		<th>좋아요 누른 전통주수</th>
		<td><c:out value="${liqLCnt }" /></td>
	</tr>
</table>

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
      /* title: "내 전통주 활동 현황", */
      width: 600,
      height: 400,
      /* 정수혐으로만 나오도록 */
      vAxis: {format: '#'},
      bar: {groupWidth: "40%"},
      legend: { position: "none" },
    };
    
    var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
    chart.draw(view, options);
}
</script>
</body>
</html>