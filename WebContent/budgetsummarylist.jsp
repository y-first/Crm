<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="assets/css/lib/font-awesome.min.css" rel="stylesheet">
<link href="assets/css/lib/themify-icons.css" rel="stylesheet">
<link href="assets/css/lib/jsgrid/jsgrid-theme.min.css" rel="stylesheet" />
<link href="assets/css/lib/jsgrid/jsgrid.min.css" type="text/css"
	rel="stylesheet" />
<link href="assets/css/lib/menubar/sidebar.css" rel="stylesheet">
<link href="assets/css/lib/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/lib/helper.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">
<style type="text/css">
#serach {
	padding-bottom: 20px;
	padding-left: 30px;
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
							<h1>出国预算汇总查看</h1>
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
							<div class="card-title"></div>
							<div class="card-body">
								<div class="basic-elements">
									<div class="jsgrid-table-panel">
										<div id="jsGrid" class="jsgrid"
											style="position: relative; height: 100%; width: 100%;">
											<div class="jsgrid-grid-header jsgrid-header-scrollbar">
												<table class="jsgrid-table">
													<tbody>
														<tr class="jsgrid-header-row">
															<th class="jsgrid-header-cell jsgrid-header-sortable"
																style="width: 20%;">单位名称</th>
															<th
																class="jsgrid-header-cell jsgrid-align-right jsgrid-header-sortable"
																style="width: 20%;">单位代码</th>
															<th class="jsgrid-header-cell jsgrid-header-sortable"
																style="width: 20%;">财政资金</th>
															<th class="jsgrid-header-cell jsgrid-header-sortable"
																style="width: 20%;">其他资金</th>
															<th
																class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
																style="width: 20%;">合计</th>
														</tr>


													</tbody>
												</table>
											</div>

											<div class="jsgrid-grid-body" style="height: 873px;">
												<table class="jsgrid-table">
													<tbody>
															<c:forEach items="${budgetsummarylist}" var="list">
															<tr class="jsgrid-row">
																<td class="jsgrid-cell" style="width: 20%;">${list.name}</td>
																<td class="jsgrid-cell jsgrid-align-right"
																	style="width: 20%;">${list.code}</td>
																<td class="jsgrid-cell" style="width: 20%;">${list.fcapital }</td>
																<td class="jsgrid-cell" style="width: 20%;">${list.ofunds }</td>
																<td class="jsgrid-cell jsgrid-align-center"
																	style="width: 20%;">${list.sum }</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
											
											<div class="form-group" style="margin: 20px 200px 0 0;">
												<a href="huizong.action" class="btn btn-success">导出出国预算汇总表
												</a>
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
</html>
