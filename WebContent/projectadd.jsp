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
<style type="text/css">
#note {
	height: 100px;
}
</style>
<script type="text/javascript">
	function blur2() {
		 var input=$("#proname").val();
		$.post("selectname.action",{"name":input},function(data){
			if (data.name==null||data.name=="") {
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
							<h1>科技项目录入</h1>
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
										action="Projectadd.action" method="post">
										<div class="row">
											<div class="col-lg-6">
												<div class="form-group">
													<input type="hidden" id="hd" name="id"> <label>项目名称</label>
													<input type="text" class="form-control" id="proname"
														name="name" onBlur="blur2()" value="" required="required">
												</div>
												<div class="form-group">
													<label>登记号</label> <input type="text" id="registration"
														class=" form-control" name="registration" />
												</div>
												<div class="form-group">
													<label>实施单位</label>
													<c:if test="${duty == '3' }">
														<select name="ework" id="ework" class="form-control">
															<c:forEach items="${unitlist }" var="list">
																<option value="${list.id }">${list.name }</option>
															</c:forEach>
														</select>
													</c:if>
													<c:if test="${duty == '2' }">
														<select name="ework" id="ework" class="form-control">
																<option value="${uid }">${unitname }</option>
														</select>
														
													</c:if>
												</div>
												<div class="form-group">
													<label>联系人</label> <input type="text" class="form-control"
														id="linkman" name="linkman" />
												</div>
												<div class="form-group">
													<label>联系电话</label> <input type="text" class="form-control"
														id="phone" name="phone" />
												</div>
												<div class="form-group">
													<label>经费</label> <input type="text" class="form-control" pattern="^[0-9.]*$"
														id="expenditure" name="expenditure" required="required" />
												</div>

											</div>
											<div class="col-lg-6">
												<div class="form-group">
													<label>项目进展</label> <input type="text" class="form-control"
														id="progress" name="progress" />
												</div>
												<div class="form-group">
													<label>申报时间</label> <input type="date" class="form-control"
														id="applicationtime" name="applicationtime"
														required="required" />
												</div>
												<div class="form-group">
													<label>评价方式</label>
													<select id="Eway"  class="form-control" style="width:300xp" name="Eway">
													 <option value="鉴定">鉴定</option>
													 <option value="验收">验收</option>
													 <option value="行业准入">行业准入</option>
													 <option value="评估">评估</option>
													 <option value="机构评价">机构评价</option>
													</select>
												</div>
												<div class="form-group">
													<label>评价单位</label> <select name="eunit" id="eunit"
														class="form-control">
														<c:forEach items="${unitlist }" var="list">
															<option value="${list.id }">${list.name }</option>
														</c:forEach>
													</select>
												</div>
												<div class="form-group">
													<label>评价日期</label> <input type="date" class="form-control"
														id="acceptancetime" name="acceptancetime"
														required="required"/>
												</div>
												<div class="form-group">
													<label>归档情况</label> <select class="form-control"
														id="achievement" name="achievement">
														<option value="是" class="yes">是</option>
														<option value="否" class="no">否</option>
													</select>
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
													<div class="col-sm-offset-2 col-sm-10">
														<button type="submit" class="btn btn-default" id="button">录入</button>
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
