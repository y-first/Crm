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
	padding-left: 10px;
}

.query {
	margin-left: 10px;
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
							<h1>
								出国预算导出
							</h1>
						</div>
					</div>
				</div>
				<!-- /# column -->
				<div class="col-lg-4 p-l-0 title-margin-left">
					<div class="page-header">
						<div class="page-title">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#"></a></li>
								<li class="breadcrumb-item active"></li>
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
							<div class="card-title">
								<h4></h4>
							</div>
							<div id="serach">
								<form method="post" role="form"
									class="form-inline col-md-offset-1" id="form"
									action="abyg.action">
									<c:if test="${duty==3}">
										<div class="form-group" style="margin-right: 20px">
											<label>单位名称：</label> <select
												name="unit" id="sposnor" class="form-control"
												style="width: 300px">
												<c:if test="${name==null }">
												<c:forEach items="${unitlist}" var="list">
													<option value="${list.id }">${list.name }</option>
												</c:forEach>
												</c:if>
												<c:if test="${name!=null }">
												<c:forEach items="${unitlist}" var="list">
												<c:if test="${name==list.name}">
													<option value="${list.id }" selected="selected">${list.name }</option>
												</c:if>
												<c:if test="${name!=list.name}">
													<option value="${list.id }">${list.name }</option>
												</c:if>
												</c:forEach>
												</c:if>
											</select>
										</div>
									<button class="btn btn-success" type="submit">查询</button>
									</c:if>
								</form>

							</div>
							<div class="card-body">
								<div class="row">
									<div class="basic-elements">
										<div class="jsgrid-table-panel">
											<div id="jsGrid" class="jsgrid"
												style="position: relative; height: 100%; width: 100%;">
												<div class="jsgrid-grid-header jsgrid-header-scrollbar">
													<table class="jsgrid-table">
														<tbody>
															<tr class="jsgrid-header-row">
																<th class="jsgrid-header-cell jsgrid-header-sortable"
																	style="width: 15%;">单位</th>
																<th
																	class="jsgrid-header-cell jsgrid-align-right jsgrid-header-sortable"
																	style="width: 15%;">预算总额</th>
																<th class="jsgrid-header-cell jsgrid-header-sortable"
																	style="width: 15%;">财政资金因公出国费用</th>
																<th class="jsgrid-header-cell jsgrid-header-sortable"
																	style="width: 15%;">其他资金</th>
																<th
																	class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
																	style="width: 10%;">人员</th>
																<th class="jsgrid-header-cell jsgrid-align-center"
																	style="width: 15%;">参加团组</th>
																<th class="jsgrid-header-cell jsgrid-align-center"
																	style="width: 15%;">预估费用</th>

															</tr>

														</tbody>
													</table>
												</div>
												<div class="jsgrid-grid-body" style="height: 873px;">
													<table class="jsgrid-table">
														<tbody>

																<c:forEach items="${abroadBudgets}" var="list">
																<tr class="jsgrid-row">
																	<td class="jsgrid-cell" style="width: 15%;">${list.unitname }</td>
																	<td class="jsgrid-cell jsgrid-align-left"
																		style="width: 15%;">${list.pexpenditure}</td>
																	<td class="jsgrid-cell" style="width: 15%;">${list.fcapital }</td>
																	<td class="jsgrid-cell" style="width: 15%;">${list.ofunds }</td>
																	<td class="jsgrid-cell jsgrid-align-center"
																		style="width: 10%;">${list.access }</td>
																	<td class="jsgrid-cell jsgrid-align-left"
																		style="width: 15%;">${list.name }</td>
																	<td class="jsgrid-cell jsgrid-align-left"
																		style="width: 15%;">${list.pexpenditure }</td>

																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>

												<div class="jsgrid-load-shader"
													style="display: none; position: absolute; top: 0px; right: 0px; bottom: 0px; left: 0px; z-index: 1000;"></div>
												<div class="jsgrid-load-panel"
													style="display: none; position: absolute; top: 50%; left: 50%; z-index: 1000;">Please,
													wait...</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="row" style="margin-top:20px">
								<div class="form-group" style="margin: 0 200px 0 0;">
									<a href="abdaochu.action"
										class="btn btn-success">导出出国预算预估 </a>
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
	<script type="text/javascript">
	</script>
</body>
</html>

