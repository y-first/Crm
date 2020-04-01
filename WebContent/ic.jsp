<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<style>
.col-md-8 {
	text-align: center;
	font-size: 20px
}
</style>
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
							<h1>人员修改</h1>
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
									<form role="form" class="form-horizontal" method="post"
										action="updatePersonnel.action"> 
										<div class="row">
											<div class="col-lg-6">
												<div class="form-group">
													<input type="hidden" name="id" id="hi"
														value="${personnel.id }"> <label>用户姓名</label> <input
														type="text" name="name" value="${personnel.name }"
														class="form-control" required="required" />
												</div>
												<div class="form-group">
													<label>出生地</label> <input type="text" name="place"
														value="${personnel.place }" class="form-control"
														required="required" />
												</div>
												<div class="form-group">
													<label>政治面貌</label> <select name="zzmm" id="zzmm" value=""
														class="form-control">
														<c:if test="${personnel.zzmm=='中共党员'}">
															<option value="中共党员" selected="selected">中共党员</option>
															<option value="团员">团员</option>
															<option value="群众">群众</option>
															<option value="民主党派">民主党派</option>
															<option value="无党派人事">无党派人事</option>
														</c:if>
														<c:if test="${personnel.zzmm=='团员'}">
															<option value="中共党员">中共党员</option>
															<option value="团员" selected="selected">团员</option>
															<option value="群众">群众</option>
															<option value="民主党派">民主党派</option>
															<option value="无党派人事">无党派人事</option>
														</c:if>
														<c:if test="${personnel.zzmm=='群众'}">
															<option value="中共党员">中共党员</option>
															<option value="团员">团员</option>
															<option value="群众" selected="selected">群众</option>
															<option value="民主党派">民主党派</option>
															<option value="无党派人事">无党派人事</option>
														</c:if>
														<c:if test="${personnel.zzmm=='民主党派'}">
															<option value="中共党员">中共党员</option>
															<option value="团员">团员</option>
															<option value="群众">群众</option>
															<option value="民主党派" selected="selected">民主党派</option>
															<option value="无党派人事">无党派人事</option>
														</c:if>
														<c:if test="${personnel.zzmm=='无党派人事'}">
															<option value="中共党员">中共党员</option>
															<option value="团员">团员</option>
															<option value="群众">群众</option>
															<option value="民主党派">民主党派</option>
															<option value="无党派人事" selected="selected">无党派人事</option>
														</c:if>
													</select>
												</div>
												<div class="form-group">
													<label>职称</label> <input type="text" name="zc"
														value="${personnel.zc}" class="form-control" />
												</div>
												<div class="form-group">
													<input type="hidden" name="id" id="hi"> <label>实际工作</label>
													<input type="text" name="pwork" id="pwork"
														value="${personnel.pwork }" class="form-control" />
												</div>
												<div class="form-group">
													<label>专业</label> <input type="text" name="professional"
														value="${personnel.professional}" class="form-control" />
												</div>
												<div class="form-group">
													<label>身份证号</label> <input type="text" name="idcare"
														value="${personnel.idcare }" class="form-control" />
												</div>
												<div class="form-group">
													<label>是否在编实职</label> <select name="preal"
														class="form-control">
														<c:if test="${personnel.real=='是'}">
															<option value="是" selected="selected">是</option>
															<option value="否">否</option>
														</c:if>
														<c:if test="${personnel.real=='否' }">
															<option value="是">是</option>
															<option value="否" selected="selected">否</option>
														</c:if>

													</select>
												</div>
											</div>
											<div class="col-lg-6">
												<div class="form-group">
													<label>性别</label> <select class="form-control x" name="sex">
														<c:if test="${personnel.sex=='女' }">
															<option value="女" selected="selected">女</option>
															<option value="男">男</option>
														</c:if>
														<c:if test="${personnel.sex=='男' }">
															<option value="男" selected="selected">男</option>
															<option value="女">女</option>
														</c:if>

													</select>
												</div>
												<div class="form-group">
													<label>单位</label> <select name="unit" id="unit"
														class="form-control" readonly="readonly" >
														<option value="${personnel.unit}">${personnel.unit}</option>
													</select>

												</div>
												<div class="form-group">
													<label>职务</label> <input type="text"
														value="${personnel.zw}" name="zw" class="form-control"
														/>

												</div>
												<div class="form-group">
													<input type="hidden" name="id" id="hi"> <label>对外身份</label>
													<input type="text" value="${personnel.fidentity }"
														name="fidentity" class="form-control" />
												</div>
												<div class="form-group">
													<label>毕业院校</label> <input type="text" name="school"
														value="${personnel.school }" class="form-control" />
												</div>
												<div class="form-group">
													<label>毕业时间</label> <input type="text" name="gtime"
														value="${personnel.gtime }" class="form-control" />
												</div>
												<div class="form-group">
													<input type="hidden" name="id" id="hi"> <label>是否是负责人</label>
													<select name="head" class="form-control">
														<c:if test="${personnel.head=='是'}">
															<option value="是" selected="selected">是</option>
															<option value="否">否</option>
														</c:if>
														<c:if test="${personnel.head=='否' }">
															<option value="是">是</option>
															<option value="否" selected="selected">否</option>
														</c:if>

													</select>
												</div>
												<div class="form-group">
													<label>团内身份</label> <select name="identity"
														class="form-control">
														<c:if test="${personnel.identity=='团长'}">
															<option value="团长" selected="selected">团长</option>
															<option value="副团长">副团长</option>
															<option value="团员">团员</option>
															<option value="翻译">翻译</option>
														</c:if>
														<c:if test="${personnel.identity=='副团长'}">
															<option value="团长">团长</option>
															<option value="副团长" selected="selected">副团长</option>
															<option value="团员">团员</option>
															<option value="翻译">翻译</option>
														</c:if>
														<c:if test="${personnel.identity=='团员'}">
															<option value="团长">团长</option>
															<option value="副团长">副团长</option>
															<option value="团员" selected="selected">团员</option>
															<option value="翻译">翻译</option>
														</c:if>
														<c:if test="${personnel.identity=='翻译'}">
															<option value="团长">团长</option>
															<option value="副团长">副团长</option>
															<option value="团员">团员</option>
															<option value="翻译" selected="selected">翻译</option>
														</c:if>

													</select>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12">
												<div class="form-group">
													<label>备注</label>
													<textarea class="form-control" id="notetext" rows="8"
														cols="" name="note">${personnel.note }</textarea>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12">
												<div class="form-group">
													<div class="form-group">
														<div class="col-sm-offset-2 col-sm-10">
															<button class="btn btn-default pull-right" type="submit"
																id="button">修改</button>
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
