<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="shortcut icon" href="http://placehold.it/64.png/000/fff">
<!-- Retina iPad Touch Icon-->
<link rel="apple-touch-icon" sizes="144x144"
	href="http://placehold.it/144.png/000/fff">
<!-- Retina iPhone Touch Icon-->
<link rel="apple-touch-icon" sizes="114x114"
	href="http://placehold.it/114.png/000/fff">
<!-- Standard iPad Touch Icon-->
<link rel="apple-touch-icon" sizes="72x72"
	href="http://placehold.it/72.png/000/fff">
<!-- Standard iPhone Touch Icon-->
<link rel="apple-touch-icon" sizes="57x57"
	href="http://placehold.it/57.png/000/fff">
<!-- Toastr -->
<link href="assets/css/lib/toastr/toastr.min.css" rel="stylesheet">
<!-- Sweet Alert -->
<link href="assets/css/lib/sweetalert/sweetalert.css" rel="stylesheet">
<!-- Range Slider -->
<link href="assets/css/lib/rangSlider/ion.rangeSlider.css"
	rel="stylesheet">
<link href="assets/css/lib/rangSlider/ion.rangeSlider.skinFlat.css"
	rel="stylesheet">
<!-- Bar Rating -->
<link href="assets/css/lib/barRating/barRating.css" rel="stylesheet">
<!-- Nestable -->
<link href="assets/css/lib/nestable/nestable.css" rel="stylesheet">
<!-- JsGrid -->
<link href="assets/css/lib/jsgrid/jsgrid-theme.min.css" rel="stylesheet" />
<link href="assets/css/lib/jsgrid/jsgrid.min.css" type="text/css"
	rel="stylesheet" />
<!-- Datatable -->
<link href="assets/css/lib/data-table/buttons.bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/css/lib/owl.carousel.min.css" rel="stylesheet" />
<link href="assets/css/lib/owl.theme.default.min.css" rel="stylesheet" />
<!-- Select2 -->
<link href="assets/css/lib/select2/select2.min.css" rel="stylesheet">
<link href="assets/css/lib/chartist/chartist.min.css" rel="stylesheet">
<link href="assets/css/lib/calendar2/pignose.calendar.min.css"
	rel="stylesheet">
<!-- Common -->
<link href="assets/css/lib/font-awesome.min.css" rel="stylesheet">
<link href="assets/css/lib/themify-icons.css" rel="stylesheet">
<link href="assets/css/lib/menubar/sidebar.css" rel="stylesheet">
<link href="assets/css/lib/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/lib/helper.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">
<style type="text/css">
.bg_color {
	width: 100px;
	height: 100px;
	border: 1px solid #aa00aa;
	margin-left: 10px
}
</style>
<script type="text/javascript">
 function updateprojectdt(id) {
	 if(confirm("确认推送？")){
	$.post("updatedt.action",{"id":id},function(data){
		window.location.reload();
	})
}
} 
 //判断是否弹出推送
 window.onload = function(){
	  var duty=	$("#duty").val();
	  if (duty=="2") {
		
		  if($("#flag").val()!="0")
	  		$('#myalert').modal('show');
	}
 }
</script>
</head>
<body>


	<%@ include file="common.jsp"%>


	<%@ include file="nav.jsp"%>
	<input type="hidden" id="flag" value="${flag }"  name="flag">
	<div class="content-wrap">
		<div class="main">
			<div class="row">
				<div class="col-lg-8 p-r-0 title-margin-right">
					<div class="page-header">
						<div class="page-title">
							<h1>
								科技管理系统首页
							</h1>
						</div>
					</div>
				</div>
				<!-- /# column -->
				<div class="col-lg-4 p-l-0 title-margin-left">
					<div class="page-header">
						<ol class="breadcrumb">
							
						</ol>
					</div>
				</div>
				<!-- /# column -->
			</div>
			<section id="main-content">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<div class="row">
									<div class="col-md-4" style="margin-top: 40px;">
										<input type="hidden" name="duty" id="duty" value="${duty}">
										<c:if test="${duty==3}"> 
											<div id="external-events" class="m-t-20">
												<c:forEach items="${pselectall}" var="list">
													<button type="button" onclick="updateprojectdt(${list.id})"
														class="external-event"
														style="width:300px;background-color:${list.color }">
														${list.name }<br>${list.acc}日截止
													</button>
												</c:forEach>
											</div>
										</c:if> 
										<c:if test="${duty==2}"> 
											<div id="external-events" class="m-t-20">
												<c:forEach items="${unitalert}" var="list">
													<button type="button"
														class="external-event"
														style="width:300px;background-color:${list.color }">
														${list.name }<br>${list.acc}日截止
													</button>
												</c:forEach>
											</div>
										</c:if> 
									</div>
									<div class="col-md-8">
										<div class="card-box">
											<div class="year-calendar"></div>
										</div>
									</div>


								</div>
							</div>
						</div>
						<!-- /# card -->
					</div>
					<!-- /# column -->
				</div>
			</section>
		</div>
	</div>
	<div class="modal fade" id="myalert" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">快截止项目</div>
				<div class="modal-body">
					<table class="jsgrid-table" >
						<tbody>
							<tr class="jsgrid-header-row">
								<th class="jsgrid-header-cell jsgrid-header-sortable"
									style="width: 100px;">项目名称</th>
								<th
									class="jsgrid-header-cell  jsgrid-header-sortable"
									style="width: 100px;">截止时间</th>
							</tr>

						</tbody>
					</table>
				</div>
				<div class="jsgrid-grid-body" style="height: 873px;">
					<table class="jsgrid-table"  >
						<tbody>
							<c:forEach items="${unitalert}" var="list">
								<tr class="jsgrid-row" >
									<td class="jsgrid-cell jsgrid-align-center" style="width: 100px;">${list.name}</td>
									<td class="jsgrid-cell" style="width: 100px; text-align: center;">${list.acc}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
	</div>

	<script src="assets/js/lib/jquery.min.js"></script>
	<script src="assets/js/lib/jquery.nanoscroller.min.js"></script>
	<script src="assets/js/lib/menubar/sidebar.js"></script>
	<script src="assets/js/lib/preloader/pace.min.js"></script>
	<script src="assets/js/lib/bootstrap.min.js"></script>
	<script src="assets/js/scripts.js"></script>

	<script src="assets/js/lib/jquery-ui/jquery-ui.min.js"></script>
	<script src="assets/js/lib/moment/moment.js"></script>
	<script src="assets/js/lib/calendar-2/moment.latest.min.js"></script>
	<!-- scripit init-->
	<!-- scripit init-->
	<script src="assets/js/lib/calendar-2/prism.min.js"></script>
	<!-- scripit init-->
	<script src="assets/js/lib/calendar-2/pignose.calendar.min.js"></script>
	<!-- scripit init-->
	<script src="assets/js/lib/calendar-2/pignose.init.js"></script>

</body>
</html>
