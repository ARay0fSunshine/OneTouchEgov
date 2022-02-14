<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

</head>
<body>
<div id="barchart_values" ></div>

<script type="text/javascript">
let vo={};
let countData={};
let testData = ["Element", "Density", { role: "style" } ];
let gooleData = [];
gooleData.push(testData); 
console.log('gooleData[0] 테스트')
console.log(gooleData)

let color = ["#b87333","silver","gold","color: #e5e4e2","#42A5F5","#1565C0"
			,"#81C784","#3F51B5","#FB8C00","#FFEA00","#A1887F","#BDBDBD","#CE93D8","#AB47BC","#66BB6A","#80D8FF"]

fetch('./selectFctFixCount',{
	method:'POST',
	  headers:{
		"Content-Type": "application/json",
	},
	  body:JSON.stringify(vo)
})
.then(response => response.json())
.then(result=>{  
	console.log(result)
	countData = result;
	for(i in countData ){  
		console.log(i)
		console.log(countData[i].fctCd)
		gooleData.push([countData[i].fctNm, countData[i].count,color[i]]);	 
	  }
	for(data in countData){
		console.log(gooleData[data])
	}
	console.log('테스트 구글 데이터 ')
	console.log(gooleData)
})

google.charts.load("current", {packages:["corechart"]});
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
  var data = google.visualization.arrayToDataTable(gooleData);

  var view = new google.visualization.DataView(data);
  view.setColumns([0, 1,
                   { calc: "stringify",
                     sourceColumn: 1,
                     type: "string",
                     role: "annotation" },
                   2]);

  var options = {
    title: "설비 수리",
    width: 600,
    height: 400,
    bar: {groupWidth: "95%"},
    legend: { position: "none" },
  };
  var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
  chart.draw(view, options);
}
</script>
</body>
</html>