<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>

<script src="js/jquery-3.3.1.min.js"></script>
<link href="assets/css/lib/font-awesome.min.css" rel="stylesheet">
<link href="assets/css/lib/themify-icons.css" rel="stylesheet">
<link href="assets/css/lib/menubar/sidebar.css" rel="stylesheet">
<link href="assets/css/lib/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/lib/helper.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">
<script type="text/javascript">

function addUser6(id) {
	$("#pid").val(id);
   var unit=$("#units").val();
   $("#uid").val(unit);
	$("#myModal5").modal('show');
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
							<h1>
								添加用户账号
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
				<div class="r-b">
					<form method="post" role="form" class="form-inline col-md-offset-1"
						id="form" action="selectmh.action">
						<div class="form-group" style="margin: 0 200px 0 0;">
							<label>人员名称:</label> <input type="text" class="form-control"
								name="username" />
						</div>
						<div class="form-group">
							<label>举办单位:</label> <select name="unit" id="unit"
								class="form-control" style="width: 200px">
								<c:forEach items="${unitlist}" var="list">
									<option value="${list.name }">${list.name }</option>
								</c:forEach>
							</select>
						</div>
						<button class="btn btn-success" type="submit">查询</button>
					</form>
					<table class="table table-striped ">
						<thead>
							<tr>
								<th>姓名</th>
								<th>性别</th>
								<th>单位</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${mh}" var="list">
								<tr>
									<td>${list.name}</td>
									<td>${list.sex}</td>
									<td>${list.unit}</td>
									<td>
										<a href="#" onclick="addUser6(${list.id})"  id="add">
											添加
										</a>
									</td>
									<td><input type="hidden" id="units" value="${list.unit}">
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</section>
		</div>
	</div>
	<!-- 模态框 2-->
	<div class="modal fade" id="myModal5" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">用户添加</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<form action="addEmployee.action" method="post">
					 <input	type="hidden" class="form-control" id="uid" name="uid"
								 />
							 <input	type="hidden" class="form-control" id="pid" name="pid"
							/>
						<div class="form-group">
							<label>用户名称</label> <input type="text" class="form-control"
								id="name" name="name" required="required" />
						</div>
						<div class="form-group">
							<label>用户账号</label> <input type="text" class="form-control"
								id="username" name="username" required="required" />
						</div>
						<div>
							<label>用户密码</label> <input type="password" class="form-control"
								id="password" name="password" required="required" />
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
		<!-- nano scroller -->
		<script src="assets/js/lib/menubar/sidebar.js"></script>
		<script src="assets/js/lib/preloader/pace.min.js"></script>
		<!-- sidebar -->

		<script src="assets/js/lib/bootstrap.min.js"></script>
		<script src="assets/js/scripts.js"></script>
</body>
</html>
