<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/excharts.js"></script>
<link href="assets/css/lib/font-awesome.min.css" rel="stylesheet">
<link href="assets/css/lib/themify-icons.css" rel="stylesheet">
<link href="assets/css/lib/jsgrid/jsgrid-theme.min.css" rel="stylesheet" />
<link href="assets/css/lib/jsgrid/jsgrid.min.css" type="text/css"
	rel="stylesheet" />
<link href="assets/css/lib/menubar/sidebar.css" rel="stylesheet">
<link href="assets/css/lib/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/lib/helper.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">
<style>
.title {
	height: 108px;
	text-align: center;
	background: #f8f9fd;
	color: #96a6b6;
	margin: 0; ! import;
	border: 1px solid #eee
}

.title>div {
	border-right: 1px solid #eee
}

.tit {
	line-height: 28px;
	margin-top: 30px;
}

font {
	font-size: 24px;
	color: black;
}
</style>
</head>
<body>
	<%@ include file="common.jsp"%>
	<%@ include file="nav.jsp"%>
	<div class="content-wrap">
		<div class="main">
			<div class="row">
				<div class="col-lg-8 p-r-0 title-margin-right">
					<div class="page-header">
						<div class="page-title">
							<h1>项目信息统计
							</h1>
						</div>
					</div>
				</div>
				<!-- /# column -->
				<div class="col-lg-4 p-l-0 title-margin-left">
					<div class="page-header">
						<div class="page-title">
							<ol class="breadcrumb">
							</ol>
						</div>
					</div>
				</div>
				<!-- /# column -->
			</div>
			<section id="main-content">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<div class="basic-elements">
									<div class="row">
										<div class="col-md-6">
											<div class="col-md-12" style="padding: 0;">
												<div id="main" class="col-md-12 col-xs-12"
													style="height: 600px; border-right: 1px solid #eee;"></div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="row title" style="width:500px">
												<div class="col-md-4">
													<div class="tit">项目</div>
													<font>${numb }</font> <span>项</span>
												</div>
												
												<div class="col-md-4">
													<div class="tit">经费</div>
													<font>${money }</font> <span>元</span>
												</div>
											</div>
											<div class="col-md-12" style="padding: 0;">
												<table class="table  table-striped">
													<tr>
														<td>项目名称</td>
														<td>实施单位</td>
														<td>经费</td>
														<td>项目进展</td>
														<td>评价日期</td>
														<td>评价方式</td>
													</tr>
													<c:forEach var="i" items="${inform }">
														<tr>
															<td class="name">${i.name }</td>
															<td>${i.ework }</td>
															<td class="price">${i.expenditure }</td>
															<td>${i.progress }</td>
															<td>${i.acc }</td>
															<td>${i.eway }</td>
														</tr>
													</c:forEach>
												</table>
											</div>

										</div>
									</div>



								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>

	<script src="assets/js/lib/jquery.min.js"></script>
	<script src="assets/js/lib/jquery.nanoscroller.min.js"></script>
	
	<script src="assets/js/lib/menubar/sidebar.js"></script>
	<script src="assets/js/lib/preloader/pace.min.js"></script>
	

	<script src="assets/js/lib/bootstrap.min.js"></script>
	<script src="assets/js/scripts.js"></script>
</body>
<script>
	$(function() {
		var names = []
		var prices = []
		$.post("apply.action?duty=${duty}&&uid=${uid}", function(date) {

			for (var i = 0; i < date.length; i++) {
				names.push(date[i].name)
				prices.push(date[i].expenditure)
			}
			var myChart = echarts.init(document.getElementById('main'));
			var data = genData();

			option = {
				title : {
					text : '科技项目经费占比',
					x : 'center'
				},
				tooltip : {
					trigger : 'item',
					formatter : "{a} <br/>项目名称:{b} : {c} 元({d}%)"
				},
				legend : {
					type : 'scroll',
					orient : 'vertical',
					right : 10,
					top : 20,
					bottom : 20,
					data : data.legendData,

					selected : data.selected
				},
				series : [ {
					name : '',
					type : 'pie',
					radius : '55%',
					center : [ '40%', '50%' ],
					data : data.seriesData,
					itemStyle : {
						emphasis : {
							shadowBlur : 10,
							shadowOffsetX : 0,
							shadowColor : 'rgba(0, 0, 0, 0.5)'
						}
					}
				} ]
			};

			function genData() {
				var nameList = names;
				var legendData = [];
				var seriesData = [];
				var selected = {};
				for (var i = 0; i < names.length; i++) {
					name = names[i];
					legendData.push(name);
					seriesData.push({
						name : names[i],
						value : prices[i]
					});
					selected[name] = i <1000;
				}

				return {
					legendData : legendData,
					seriesData : seriesData,
					selected : selected
				};

				function makeWord(max, min) {
					var nameLen = Math.ceil(Math.random() * max + min);
					var name = [];
					for (var i = 0; i < nameLen; i++) {
						name.push(nameList[Math.round(Math.random()
								* nameList.length - 1)]);
					}
					return name.join('');
				}
			}

			myChart.setOption(option);
			window.addEventListener("resize", function() {
				this.myChart.resize();
			});
		})

	})
</script>
</html>
