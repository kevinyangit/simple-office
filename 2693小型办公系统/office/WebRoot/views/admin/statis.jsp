<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%    
             if(session.getAttribute("adminname") == null) {      
   %>
<script type="text/javascript" language="javascript">        
            alert("您还没有登录，请登录...");   
           location.href="views/admin/adminLogin.jsp";  
           </script>
<%    
       }    
   %>
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<c:set var="domain" value="${pageContext.request.contextPath}"></c:set>
<link rel="apple-touch-icon" sizes="76x76" href="${domain}/${domain}/assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="${domain}/${domain}/assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>薪水统计</title>

<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<meta name="viewport" content="width=device-width" />


<!-- Bootstrap core CSS     -->
	<script src="${domain}/assets/new/jquery.min.js"></script>  
	<script src="${domain}/js/layer.js"></script>
	<link href="${domain}/assets/new/bootstrap.min.css" rel="stylesheet">  
	<script src="${domain}/assets/new/bootstrap.min.js"></script>  
	<!--  Charts Plugin -->
	<script src="${domain}/assets/new/echarts.min.js"></script>
    <!--  Paper Dashboard core CSS    -->
    <link href="${domain}/assets/css/paper-dashboard.css" rel="stylesheet"/>
    <link href="${domain}/assets/css/themify-icons.css" rel="stylesheet">
</head>
<body>

	<div class="wrapper">
		<%@include file="/left.jsp"%>
		<div class="main-panel">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar bar1"></span>
							<span class="icon-bar bar2"></span>
							<span class="icon-bar bar3"></span>
						</button>
						<a class="navbar-brand" href="#">薪水统计</a>
					</div>
					<div class="collapse navbar-collapse"></div>
				</div>
			</nav>


			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6">
							<!-- <div>每年最低工资的员工</div> -->
							   <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
							    <div id="statsLowSalary" style="width: 600px;height:400px;"></div>
						</div>
						<div class="col-md-6">
<!-- 						<div>每年最高工资的员工
 -->							<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
							    <div id="statsHighSalary" style="width: 600px;height:400px;"></div>
						</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
<!-- 							<div>每年最总工资</div>
 -->							   <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
							    <div id="statsSumSalary" style="width: 600px;height:400px;"></div>
						</div>
						<div class="col-md-6">
<!-- 						<div>每年平均工资</div>
 -->								   <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
							    <div id="statsAvgSalary" style="width: 600px;height:400px;"></div>
						</div>
					</div>
				</div>
			</div>

			<footer class="footer">
				<div class="container-fluid">
					<div class="copyright">
						Copyright &copy; 2018.Company name All rights reserved.
						<a target="_blank" href="javascript:">abcd</a>
					</div>
				</div>
			</footer>


		</div>
	</div>


</body>

<script type="text/javascript">
		//获取每年最低工资的员工的数据
		var  domain = "${domain}";
		$(document).ready(function() {
         $.ajax({
                   url:  domain + "/statis/salary/staticSalaryEveryYear.do",
                   datatype: "json",
                   type: "post",
                   data: "",
                   success: function(result) {
                	   if(result.code == 0){
                		   //
                		   loadLowestSalaryEveryYear(result.data.lowestSalaryEveryYearsList);
                		   loadHighSalaryEveryYear(result.data.higherSalaryEveryYearsList);
                		   loadSumSalaryEveryYear(result.data.totolSalaryEveryYearsList);
                		   loadAverSalaryEveryYear(result.data.averageSalaryEveryYearsList);
                	   }else{
                		   console.log('error' + result);
                	   }
                   }
         });
		});

		function loadLowestSalaryEveryYear(data){
			//年
			var xAxisData = []; 
			//点数据
			var seriesData = [];
			for (var i = 0; i < data.length; i++) {
				xAxisData[i] = data[i].year;
				seriesData[i] = data[i].salary;
			}
	        // 基于准备好的dom，初始化echarts实例
	        var myChart = echarts.init(document.getElementById('statsLowSalary'));

	        // 指定图表的配置项和数据
	        var option = {
	            title: {
	                text: '每年最低工资的员工'
	            },
	            tooltip: {
	            },
	            legend: {
	                data:['总工资']
	            },
	            xAxis: {
	                data: xAxisData
	            },
	            yAxis: {},
	            series: [{
	                name: '总工资',
	                type: 'bar',
	                data: seriesData
	            }]
	        };

	        // 使用刚指定的配置项和数据显示图表。
	        myChart.setOption(option);
		}
		function loadHighSalaryEveryYear(data){
			//年
			var xAxisData = []; 
			//点数据
			var seriesData = [];
			for (var i = 0; i < data.length; i++) {
				xAxisData[i] = data[i].year;
				seriesData[i] = data[i].salary;
			}
	        // 基于准备好的dom，初始化echarts实例
	        var myChart = echarts.init(document.getElementById('statsHighSalary'));

	        // 指定图表的配置项和数据
	        var option = {
	            title: {
	                text: '每年最高工资的员工'
	            },
	            tooltip: {},
	            legend: {
	                data:['总工资']
	            },
	            xAxis: {
	                data: xAxisData
	            },
	            yAxis: {},
	            series: [{
	                name: '总工资',
	                type: 'bar',
	                data: seriesData
	            }]
	        };

	        // 使用刚指定的配置项和数据显示图表。
	        myChart.setOption(option);
		}
		function loadSumSalaryEveryYear(data){
			//年
			var xAxisData = []; 
			//点数据
			var seriesData = [];
			for (var i = 0; i < data.length; i++) {
				xAxisData[i] = data[i].year;
				seriesData[i] = data[i].salary;
			}
	        // 基于准备好的dom，初始化echarts实例
	        var myChart = echarts.init(document.getElementById('statsSumSalary'));

	        // 指定图表的配置项和数据
	        var option = {
	            title: {
	                text: '每年总工资'
	            },
	            tooltip: {},
	            legend: {
	                data:['总工资']
	            },
	            xAxis: {
	                data: xAxisData
	            },
	            yAxis: {},
	            series: [{
	                name: '总工资',
	                type: 'bar',
	                data: seriesData
	            }]
	        };

	        // 使用刚指定的配置项和数据显示图表。
	        myChart.setOption(option);
		}
		function loadAverSalaryEveryYear(data){
			//年
			var xAxisData = []; 
			//点数据
			var seriesData = [];
			for (var i = 0; i < data.length; i++) {
				xAxisData[i] = data[i].year;
				seriesData[i] = data[i].salary;
			}
	        // 基于准备好的dom，初始化echarts实例
	        var myChart = echarts.init(document.getElementById('statsAvgSalary'));

	        // 指定图表的配置项和数据
	        var option = {
	            title: {
	                text: '每年平均工资'
	            },
	            tooltip: {},
	            legend: {
	                data:['总工资']
	            },
	            xAxis: {
	                data: xAxisData
	            },
	            yAxis: {},
	            series: [{
	                name: '总工资',
	                type: 'bar',
	                data: seriesData
	            }]
	        };

	        // 使用刚指定的配置项和数据显示图表。
	        myChart.setOption(option);
		}
    </script>

</html>
