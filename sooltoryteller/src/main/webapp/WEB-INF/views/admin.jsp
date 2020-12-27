<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/adminMenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 main</title>
</head>
<body>
	<div id="donutchart" style="width: 900px; height: 500px;"></div>
  		<div style="background-color: white;">
    </div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	//home 버튼 눌린 표시
	document.getElementById("h-admin-home").style="background-color: navy;color: white;";

  google.charts.load("current", {packages:["corechart"]});
  google.charts.setOnLoadCallback(drawChart);
  		
  function drawChart() {
    var data = google.visualization.arrayToDataTable(
		${data}
    );

    var options = {
      title: '회원 별 선호하는 주종 통계',
      pieHole: 0.4,
    };

    var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
    chart.draw(data, options);
  }
</script>

</body>
</html>