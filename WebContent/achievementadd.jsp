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
<link href="assets/css/lib/menubar/sidebar.css" rel="stylesheet">
<link href="assets/css/lib/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/lib/helper.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">
<style type="text/css">
#note {
	height: 100px;
}
</style>
<script type="text/javascript">
function blur2() {
	 var input=$("#proname").val();
	$.post("selectbyname.action",{"name":input},function(data){
		if (data.name==null) {
			$("#button").attr("disabled",false);
		}
		else{
			alert(data.name);
			$("#button").attr("disabled",true);
		}
		
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
							<h1>
								科技成果录入
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
										action="Achievmentadd.action" method="post">
										<div class="row">
											<div class="col-lg-6">
												<div class="form-group">
													<label>科技成果名称</label> <input type="hidden"
														class="form-control" id="id" name="id" /> <input
														type="text" class="form-control" id="proname" name="name"
													 onblur="blur2()"	required="required" />
													 
												</div>
												<div class="form-group">
													<label>成果登记时间</label> <input type="date"
														class="form-control" id="time" name="time"
														required="required" />
												</div>
												<div class="form-group">
													<label>完成单位</label>
													<c:if test="${duty == '3' }">
														<select name="unit" id="unit" class="form-control">
															<c:forEach items="${unitlist }" var="list">
																<option value="${list.id }">${list.name }</option>
															</c:forEach>
														</select>
													</c:if>
													<c:if test="${duty == '2' }">
														<select name="unit" id="unit" class="form-control">
															<option value="${uid }">${unitname }</option>
														</select>
													</c:if>
												</div>
												
											</div>
											<div class="col-lg-6">
												<div class="form-group">
													<label>成果登记号</label> <input type="text"
														class="form-control" id="registration" name="registration" />
												</div>
												<div class="form-group">
													<label>成果类型</label> <input type="text" class="form-control"
														id="type" name="type" />
												</div>
												<div class="form-group">
													<label>完成人</label> <input type="text" class="form-control"
														id="person" name="person" />
												</div>
												
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12">
												<div class="form-group">
													<label>备注</label>
													<textarea class="form-control" id="note" rows="8" cols=""
														name="note"></textarea>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12">
												<div class="form-group">
													<label></label>
													<button class="btn btn-default pull-lef" type="submit"
														id="button">录入</button>
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
