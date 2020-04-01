<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF">
<title></title>

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
								人员录入
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
										action="personneladd.action" method="post">
										<div class="row">
											<div class="col-lg-6">
												<div class="form-group">
													<label>用户姓名</label> <input type="text" name="name"
														class="form-control" required="required" />
												</div>
												<div class="form-group">
													<label>出生地</label> <input type="text" name="place"
														class="form-control" required="required" />
												</div>
												<div class="form-group">
													<label>政治面貌</label> <select name="zzmm" id="zzmm"
														class="form-control">
														<option value="中共党员">中共党员</option>
														<option value="团员">团员</option>
														<option value="群众">群众</option>
														<option value="民主党派">民主党派</option>
														<option value="无党派人事">无党派人事</option>
													</select>
												</div>
												<div class="form-group">
													<label>职称</label> <input type="text" name="zc"
														class="form-control" />
												</div>
												<div class="form-group">
													<input type="hidden" name="id" id="hi"> <label>实际工作</label>
													<input type="text" name="pwork" id="pwork"
														class="form-control" />
												</div>
												<div class="form-group">
													<label>专业</label> <input type="text" name="professional"
														value="${personnel.professional }" class="form-control" />
												</div>
												<div class="form-group">
													<label>身份证号</label> <input type="text" name="idcare"
														pattern="^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$"
														class="form-control" required="required" />
												</div>
												<div class="form-group">
													<label>是否在编实职</label> <select name="preal"
														class="form-control">
														<option value="是">是</option>
														<option value="否">否</option>
													</select>
												</div>
											</div>
											<div class="col-lg-6">
												<div class="form-group">
													<label>性别</label> <select class="form-control" name="sex">
													<option value="男" selected="selected">男</option>
													<option value="女">女</option>
											</select>
												</div>
												<div class="form-group">
													<label>单位</label>
															<select name="unit" id="unit" class="form-control">
															<c:if test="${duty=='3'}">
															<c:forEach items="${unitlist }" var="list">
																<option value="${list.id }">${list.name }</option>
															</c:forEach>
															</c:if>
															<c:if test="${duty=='2'}">
																<option value="${uid }">${unitname}</option>
															</c:if>
														</select>
												</div>
												<div class="form-group">
													<label>职务</label> <select name="zw" id="zw" class="form-control">
														<option value="正厅实职干部" selected="selected">正厅实职干部</option>
														<option value="其他省管干部" >其他省管干部</option>
														<option value="处级及以下干部" >处级及以下干部</option>
											</select>
												</div>
												<div class="form-group">
													<input type="hidden" name="id" id="hi"> <label>对外身份</label>
													<input type="text" name="fidentity" class="form-control" />
												</div>
												<div class="form-group">
													<label>毕业院校</label> <input type="text" name="school"
														 class="form-control" />
												</div>
												<div class="form-group">
													<label>毕业时间</label> <input type="text" name="gtime"
														value="${personnel.gtime }" class="form-control" />
												</div>
												<div class="form-group">
													<input type="hidden" name="id" id="hi"> <label>是否是负责人</label>
													<select name="head" class="form-control">
														<option value="是">是</option>
														<option value="否">否</option>
													</select>
												</div>
												<div class="form-group">
													<!-- <label>出团性质</label><select name="aim" class="form-control">
													<option value="交流" selected="selected">交流</option>
													<option value="培训" >培训</option>
											</select> -->
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12">
												<div class="form-group">
													<label>备注</label>
													<textarea class="form-control" id="notetext" rows="8"
														cols="" name="note"></textarea>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12">
												<div class="form-group">
													<div class="form-group">
														<div class="col-sm-offset-2 col-sm-10">
															<button type="submit" class="btn btn-default" id="button">录入</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</form>
									<form method="POST" class="col-md-offset-4"
										enctype="multipart/form-data" id="form1"
										action="fileUploadPe.action">
										<div class="row">
											<div class="col-lg-12">
												<table>
													<tr>
														<td>批量录入:</td>
														<td><input id="upfile" type="file" name="upfile"></td>
														<td><input type="submit" value="提交"></td>
													</tr>
												</table>
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
