<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript">
function removeUser(id){
	if(confirm("确认删除")){
		$.post("removeUser.action",{"id":id},function(data){
			alert("删除成功");
			window.location.reload();
		})
	}
}
function edit(id) {
	$.post("eidtUser.action",{"id":id},function(data){
		$("#id").val(data.id);
		$("#username").val(data.name);
		$("#userusername").val(data.username);
		$("#userpassword").val(data.password);
		$('#edit').modal('show');
	})
}
</script>
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
							<h1>编辑用户账号</h1>
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
							<div id="serach">
								<form method="post" role="form"
									class="form-inline col-md-offset-1" id="form"
									action="selectmh2.action">
									<div class="form-group" style="margin: 0 20px 0 0;">
										<label>权限等级：</label> <select name="duty" id="duty"
											class="form-control" style="width: 200px">
											<option value="3">管理员用户</option>
											<option value="2">单位用户</option>
											<option value="1">个人用户</option>
										</select>
									</div>
									<button class="btn btn-success" type="submit">查询</button>
								</form>
							</div>
							<div class="card-body" style="margin-top: 20px;">
								<div class="basic-elements">
									<div class="jsgrid-table-panel">
										<div id="jsGrid" class="jsgrid"
											style="position: relative; height: 100%; width: 100%;">
											<div class="jsgrid-grid-header jsgrid-header-scrollbar">
												<table class="jsgrid-table">
													<tbody>
														<tr class="jsgrid-header-row">
															<th
																class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
																style="width: 20%;">账号</th>
															<th class="jsgrid-header-cell jsgrid-align-center"
																style="width: 20%;">单位</th>
															<th class="jsgrid-header-cell jsgrid-align-center"
																style="width: 20%;">权限</th>
															<th
																class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center"
																style="width: 20%;">操作</th>
														</tr>

													</tbody>
												</table>
											</div>
											<div class="jsgrid-grid-body" style="height: 873px;">
												<table class="jsgrid-table">
													<tbody>
														<c:forEach items="${mh}" var="list">
															<tr class="jsgrid-row">
																<td class="jsgrid-cell "
																	style="width: 20%; text-align: center;">${list.name}</td>
																<td class="jsgrid-cell jsgrid-align-centent"
																	style="width: 20%; text-align: center;">${list.uid}</td>
																<td class="jsgrid-cell jsgrid-align-centent"
																	style="width: 20%; text-align: center;">${list.duty }</td>
																<td style="width: 20%; text-align: center;"
																	class="jsgrid-cell jsgrid-align-centent"><a
																	href="#" onclick="edit(${list.id})"> 编辑账号</a> <a
																	href="#" onclick="removeUser(${list.id})">删除账号</a></td>
															</tr>
														</c:forEach>
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
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- 模态框 -->
	<div class="modal fade" id="edit" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">管理员添加</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<form action="Userupdate.action" method="post">
						<div class="form-group">
							<label>用户名称</label> <input type="hidden" class="form-control"
								name="id" id="id" required="required" /> <input type="text"
								class="form-control" name="name" id="username"
								required="required" />
						</div>
						<div class="form-group">
							<label>用户账号</label> <input type="text" class="form-control"
								name="username" id="userusername" required="required" />
						</div>
						<div>
							<label>用户密码</label> <input type="text" class="form-control"
								name="password" id="userpassword" required="required" />
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-primary">提交更改</button>
						</div>
					</form>
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
</body>
</html>
