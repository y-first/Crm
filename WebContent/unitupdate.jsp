<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.3.1.min.js"></script>
<link href="assets/css/lib/font-awesome.min.css" rel="stylesheet">
<link href="assets/css/lib/themify-icons.css" rel="stylesheet">
<link href="assets/css/lib/menubar/sidebar.css" rel="stylesheet">
<link href="assets/css/lib/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/lib/helper.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">
<style type="text/css">
#notetext {
	height: 100px;
}

#adds {
	margin-left: 100px;
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
								单位编辑
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
									<form role="form" class="form-horizontal"
										action="updateunit.action" method="post">
										<div class="row">
											<div class="col-lg-6">
												<div class="form-group">
												<input type="hidden" name="id" value="${unitu.id }"
														class="form-control"  required="required" />
													<label>单位名称</label> <input type="text" name="name"
													value="${unitu.name }"	class="form-control" required="required" />
												</div>
												<div class="form-group">
													<label>单位代码</label> <input type="text"  name="code" value="${unitu.code }"
														class="form-control" required="required" />
												</div>
												<div class="form-group">
													<label>单位类型</label> <select name="type" id="duty"
														class="form-control">
														<c:if test="${unitu.type==0}">
														<option value="0" selected="selected">事业单位</option>
														<option value="1">机关单位</option>
														</c:if>
														<c:if test="${unitu.type==1}">
														<option value="0" >事业单位</option>
														<option value="1" selected="selected"> 机关单位</option>
														</c:if>
													</select>
												</div>
												
											</div>
											<div class="col-lg-6">
											</div>
										</div>
										
										<div class="row">
											<div class="col-lg-12">
												<div class="form-group">
													<div class="form-group">
														<div class="col-sm-offset-2 col-sm-10">
															<button type="submit" class="btn btn-default" id="button">修改</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</form>
									
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