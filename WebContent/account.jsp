<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="assets/css/lib/font-awesome.min.css" rel="stylesheet">
<link href="assets/css/lib/themify-icons.css" rel="stylesheet">
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
								密码修改
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
								<form class="form form-horizontal" role="form"
							action="upassword.action" method="post">
							<div class="form-group">
								<label class="control-label col-md-2">原始密码</label>
								<div class="col-md-4">
									<input class="form-control" type="password" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-2">新密码</label>
								<div class="col-md-4">
									<input class="form-control" type="password" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-2">确认密码</label>
								<div class="col-md-4">
									<input class="form-control" type="password" />
								</div>
							</div>
							<button class="btn btn-success  col-md-offset-2 col-xs-offset-2">确认修改</button>
							<button class="btn btn-default">重置</button>
						</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
</div>	
			
	
</body>
<script src="assets/js/lib/jquery.min.js"></script>
	<script src="assets/js/lib/jquery.nanoscroller.min.js"></script>

	<script src="assets/js/lib/menubar/sidebar.js"></script>
	<script src="assets/js/lib/preloader/pace.min.js"></script>


	<script src="assets/js/lib/bootstrap.min.js"></script>
	<script src="assets/js/scripts.js"></script>
</html>

