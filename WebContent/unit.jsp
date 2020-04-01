<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>

<style type="text/css">
jsgrid-pager-container li {
	font-size: 20px;
}
</style>
<script src="js/jquery-3.3.1.min.js"></script>
<link href="assets/css/lib/font-awesome.min.css" rel="stylesheet">
<link href="assets/css/lib/themify-icons.css" rel="stylesheet">
<link href="assets/css/lib/jsgrid/jsgrid-theme.min.css" rel="stylesheet" />
<link href="assets/css/lib/jsgrid/jsgrid.min.css" type="text/css" rel="stylesheet" />
<link href="assets/css/lib/menubar/sidebar.css" rel="stylesheet">
<link href="assets/css/lib/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/lib/helper.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">
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
								单位信息查询
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
				<div class="col-lg-12">
					<div class="card" style="margin: 0 0 0 0; padding: 10 0 0 0;min-height:1000px">
						<div id="x">
							
						</div>
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
															style="width: 150px;">单位名称</th>
														<th
															class="jsgrid-header-cell jsgrid-align-right jsgrid-header-sortable"
															style="width: 50px;">单位代码</th>
														<th class="jsgrid-header-cell jsgrid-header-sortable"
															style="width: 200px;">单位类型</th>
														<th
															class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center"
															style="width: 50px;">操作</th>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="jsgrid-grid-body" style="height: 873px;">
											<table class="jsgrid-table">
												<tbody>
														<c:forEach items="${findall}" var="cl">
														<tr class="jsgrid-row">
															<td class="jsgrid-cell" style="width: 150px;">${cl.name}</td>
															<td class="jsgrid-cell jsgrid-align-right"
																style="width: 50px;">${cl.code}</td>
															<td class="jsgrid-cell" style="width: 200px;">
															<c:if test="${cl.type==0}">
															事业单位
															</c:if>
															<c:if test="${cl.type==1}">
															机关单位
															</c:if>
														</td>
														<td
																class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
																style="width: 50px;">
														<a href="selectyunitByid.action?id=${cl.id }" style="text-decoration: none"
																><span
																	class="jsgrid-button jsgrid-delete-button ti-pencil"  type="button" title="update"></span>
															</a>
																 <a href="#" style="text-decoration: none"
																onclick="clubdelete(${cl.id})"><span
																	class="jsgrid-button jsgrid-delete-button ti-trash"  type="button" title="Delete"></span>
															</a></td> 
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										
										<div class="jsgrid-pager-container" style="display: block;">
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
					</div>
				</div>
			</section>
		</div>
	</div>
	<script type="text/javascript">
		function clubdelete(id){
			if(confirm("确认删除")){
				$.post("removeUnit.action",{"id":id},function(date){
					alert("删除成功");
					window.location.reload();
				})
			}
		}
		
		</script>
<script src="assets/js/lib/jquery.min.js"></script>
	<script src="assets/js/lib/jquery.nanoscroller.min.js"></script>
	<!-- nano scroller -->
	<script src="assets/js/lib/menubar/sidebar.js"></script>
	<script src="assets/js/lib/preloader/pace.min.js"></script>
	<!-- sidebar -->

	<script src="assets/js/lib/bootstrap.min.js"></script>
	<script src="assets/js/scripts.js"></script>
</body>
</html>
