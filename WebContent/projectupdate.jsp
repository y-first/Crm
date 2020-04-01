<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	#note{
		height:100px;
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
							<h1>
								科技项目信息修改
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
										action="pupdate.action?duty=${duty}&&uid=${uid}" method="post">
										<div class="row">
											<div class="col-lg-6">
												<div class="form-group">
													<input type="hidden" id="hd" value="${pj.id}" name="id">
													<label>项目名称</label> <input type="text" class="form-control"
														id="name" value="${pj.name}" name="name"
														 onBlur="blur2()"  required="required" value="Some text value...">
												</div>
												<div class="form-group">
													<label>登记号</label> <input type="text" id="registration"
														value="${pj.registration}" class=" form-control"
														name="registration" />
												</div>
												<div class="form-group">
													<label>实施单位</label>
													<c:if test="${duty == '3' }">
														<select name="ework" id="ework" class="form-control">
															<c:forEach items="${unitlist }" var="list">
																<c:if test="${pj.ework==list.id }">
																	<option value="${list.id }" selected="selected">${list.name }</option>
																</c:if>
																<c:if test="${pj.ework!=list.name }">
																	<option value="${list.id }">${list.name }</option>
																</c:if>
															</c:forEach>
														</select>
													</c:if>
													<c:if test="${duty == '2' }">
														<select name="ework" id="ework" class="form-control">
																<option value="${uid }" selected="selected">${unitname }</option>
														</select>
													</c:if>

												</div>
												<div class="form-group">
													<label>联系人</label> <input type="text" class="form-control"
														value="${pj.linkman}" id="linkman" name="linkman" />
												</div>
												<div class="form-group">
													<label>联系电话</label> <input type="text" class="form-control"
														value="${pj.phone}" id="phone" name="phone" />
												</div>
												<div class="form-group">
													<label>经费</label> <input type="text" class="form-control"
														value="${pj.expenditure}" id="expenditure"
														name="expenditure" required="required" />
												</div>

											</div>
											<div class="col-lg-6">
												<div class="form-group">
													<label>项目进展</label> <input type="text" class="form-control"
														value="${pj.progress}" id="progress" name="progress" />
												</div>
												<div class="form-group">
													<label>申报时间</label> <input type="date" class="form-control"
														value="${pj.app}" id="applicationtime"
														name="applicationtime" required="required" />
												</div>
												<div class="form-group">
													<label>评价方式</label> 
													<select id="Eway" name="Eway" class="form-control" style="width:300xp">
													<c:if test="${pj.eway=='鉴定'}">
													 <option value="鉴定" selected="selected">鉴定</option>
													 <option value="验收">验收</option>
													 <option value="行业准入">行业准入</option>
													 <option value="评估">评估</option>
													 <option value="机构评价">机构评价</option>
													</c:if>
													<c:if test="${pj.eway=='验收'}">
													 <option value="鉴定" >鉴定</option>
													 <option value="验收" selected="selected">验收</option>
													 <option value="行业准入">行业准入</option>
													 <option value="评估">评估</option>
													 <option value="机构评价">机构评价</option>
													</c:if>
													<c:if test="${pj.eway=='行业准入'}">
													 <option value="鉴定" >鉴定</option>
													 <option value="验收">验收</option>
													 <option value="行业准入" selected="selected">行业准入</option>
													 <option value="评估">评估</option>
													 <option value="机构评价">机构评价</option>
													</c:if>
													<c:if test="${pj.eway=='评估'}">
													 <option value="鉴定" >鉴定</option>
													 <option value="验收">验收</option>
													 <option value="行业准入">行业准入</option>
													 <option value="评估" selected="selected">评估</option>
													 <option value="机构评价">机构评价</option>
													</c:if>
													<c:if test="${pj.eway=='机构评价'}">
													 <option value="鉴定" >鉴定</option>
													 <option value="验收">验收</option>
													 <option value="行业准入">行业准入</option>
													 <option value="评估">评估</option>
													 <option value="机构评价" selected="selected">机构评价</option>
													</c:if>
													</select>
												</div>
												<div class="form-group">
													<label>评价单位</label> <select name="eunit" id="Eunit"
														class="form-control">
														<%-- <option value="${pj.eunit}">${pj.eunit}</option>
														<c:forEach items="${unitlist }" var="list">
															<option value="${list.id }">${list.name }</option>
														</c:forEach> --%>
														<c:forEach items="${unitlist }" var="list">
																<c:if test="${pj.eunit==list.id }">
																	<option value="${list.id }" selected="selected">${list.name }</option>
																</c:if>
																<c:if test="${pj.eunit!=list.name }">
																	<option value="${list.id }">${list.name }</option>
																</c:if>
															</c:forEach>
													</select>
												</div>
												<div class="form-group">
													<label>评价日期</label> <input type="date" class="form-control"
														value="${pj.acc}" id="acceptancetime"
														name="acceptancetime" required="required" />
												</div>
												<div class="form-group">
													<label>归档情况</label> <select class="form-control"
														id="achievement" name="achievement">
														<c:if test="${pj.achievement=='是'}">
															<option value="是" class="yes" selected="selected">是</option>
															<option value="否" class="no">否</option>
														</c:if>
														<c:if test="${pj.achievement=='否'}">
															<option value="是" class="yes">是</option>
															<option value="否" class="no" selected="selected">否</option>
														</c:if>

													</select>
												</div>

											</div>
										</div>
										<div class="row">
											<div class="col-lg-12">
												<div class="form-group">
													<label>备注</label>
													<textarea class="form-control" id="note"
														rows="8" cols="" name="note">${pj.note}</textarea>

												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12">
												<div class="form-group">
													<div class="col-sm-offset-2 col-sm-10">
														<button type="submit" class="btn btn-default" id="button">修改</button>
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
