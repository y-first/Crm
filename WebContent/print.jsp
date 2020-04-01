<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style type="text/css">
</style>
<title></title>
<script src="js/jquery-3.3.1.min.js"></script>

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
.jsgrid-pager-container li {
	font-size: 20px;
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
							出国人员表打印
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
										<div class="jsgrid-table-panel">
											<div id="jsGrid" class="jsgrid"
												style="position: relative; height: 100%; width: 100%;">
												<div class="jsgrid-grid-header jsgrid-header-scrollbar">
													<input type="hidden" id="ggid" value="${gid}" />
													<table class="jsgrid-table">
														<tbody>
															<tr class="jsgrid-header-row">
																<th class="jsgrid-header-cell jsgrid-header-sortable"
																	style="width: 15%;">团组名</th>
																<th
																	class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
																	style="width: 10%;">出访人数</th>
																<th class="jsgrid-header-cell jsgrid-header-sortable jsgrid-align-center"
																	style="width: 15%;">出访时间</th>
																<th class="jsgrid-header-cell jsgrid-align-center"
																	style="width: 10%;">出访国家</th>
																<th class="jsgrid-header-cell jsgrid-align-center"
																	style="width: 10%;">出访天数</th>
																<th class="jsgrid-header-cell jsgrid-align-center"
																	style="width: 10%;">出访单位</th>
																<th class="jsgrid-header-cell jsgrid-align-center"
																	style="width: 15%;">总经费</th>
																<th class="jsgrid-header-cell jsgrid-align-center"
																	style="width: 10%;">人均经费</th>


																<th
																	class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center"
																	style="width: 5%;">操作</th>
															</tr>

														</tbody>
													</table>
												</div>

												<div class="jsgrid-grid-body" style="height: 873px;">
													<table class="jsgrid-table">
														<tbody>
																<c:forEach items="${groupfindall}" var="c">
																<tr class="jsgrid-row">
																	<td class="jsgrid-cell" style="width: 15%;">${c.name}</td>
																	<td class="jsgrid-cell jsgrid-align-center "
																		style="width: 10%;">${c.access}</td>
																	<td class="jsgrid-cell jsgrid-align-center" style="width: 15%;">${c.accesstime }</td>
																	<td class="jsgrid-cell jsgrid-align-center"
																		style="width: 10%;">${c.accesscountry }</td>
																	<td class="jsgrid-cell jsgrid-align-center"
																		style="width: 10%;">${c.days }</td>
																	<td class="jsgrid-cell jsgrid-align-center"
																		style="width: 10%;">${c.unitname }</td>
																	<td class="jsgrid-cell jsgrid-align-center"
																		style="width: 15%;">${c.expenditure }</td>
																	<td class="jsgrid-cell jsgrid-align-center"
																		style="width: 10%;">${c.pexpenditure }</td>

																	<td
																		class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
																		style="width: 5%;"><a
																		href='dy2.action?gid=${c.id }'
																		style="text-decoration: none"> <span
																			class="jsgrid-button ti-search" type="button"
																			title="查看人员"></span>
																	</a></td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>




											</div>

										</div>
									</div>
									<div class="card-title">
										<h4>个人审批表导出</h4>
									</div>
									<div class="row">
										<div class="jsgrid-table-panel">
											<div id="jsGrid" class="jsgrid"
												style="position: relative; height: 100%; width: 100%;">
												<div class="jsgrid-grid-header jsgrid-header-scrollbar">
<!--startprint-->
													<table class="jsgrid-table">
														<tbody>
															<tr class="jsgrid-header-row">
																<th class="jsgrid-header-cell jsgrid-header-sortable"
																	style="width: 100px;">人员名称</th>
																<th
																	class="jsgrid-header-cell jsgrid-align-right jsgrid-header-sortable"
																	style="width: 100px;">出访国家</th>
																<th class="jsgrid-header-cell jsgrid-header-sortable">备注</th>
																<th
																	class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center"
																	style="width: 100px;">操作</th>
															</tr>

														</tbody>
													</table>
												</div>
												<div class="jsgrid-grid-body" style="height: 873px;">
													<table class="jsgrid-table">
														<tbody>

															<c:forEach items="${grouppersonnel}" var="c">
																<tr class="jsgrid-row">
																	<td class="jsgrid-cell" style="width: 100px;">${c.name}</td>
																	<td class="jsgrid-cell jsgrid-align-right"
																		style="width: 100px;">${c.accesscountry}</td>
																	<td class="jsgrid-cell">${c.note }</td>

																	<td
																		class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
																		style="width: 100px;"><a
																		href='downResumeDoc.action?gid=${c.groupid}&pid=${c.pid}'
																		style="text-decoration: none"><span
																			class="jsgrid-button jsgrid-edit-button ti-export"
																			type="button" title="导出人员审批表"></span></a></td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
													<!--endprint-->
												</div>




											</div>

										</div>
									</div>
									<!-- <div class="row">
										<div class="col-lg-12">
											<div class="form-group">
												<div class="col-sm-offset-2 col-sm-10">
													<input type="button" onclick="doPrint()"
														class="btn btn-success" style="margin-left: 30px;"
														value="打印" />
												</div>
											</div>
										</div>
									</div> -->
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
	<!-- nano scroller -->
	<script src="assets/js/lib/menubar/sidebar.js"></script>
	<script src="assets/js/lib/preloader/pace.min.js"></script>
	<!-- sidebar -->

	<script src="assets/js/lib/bootstrap.min.js"></script>
	<script src="assets/js/scripts.js"></script>

</body>
<script>
	function doPrint() {
		bdhtml = window.document.body.innerHTML;
		sprnstr = "<!--startprint-->";
		eprnstr = "<!--endprint-->";
		prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 17);
		prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
		window.document.body.innerHTML = prnhtml;
		window.print();
	}
</script>
</html>
