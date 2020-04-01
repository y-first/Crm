<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style type="text/css">
#serach {
	padding-bottom: 20px;
	padding-left: 20px;
}

#serach div {
	margin-left: 20px;
}

.query {
	margin-left: 10px;
}
</style>
<script type="text/javascript">
var pid=0;
$(function(){
	var hd =  $("#hd").val();
	if(hd==null || hd==""){
		
	}else{
		$("#sposnor").val(hd)
	}
	$("#btn_sure").click(function(){
		var duty=$("#duty1").val();
		var username=$("#username1").val();
		var password=$("#password1").val();
		
		$.post("updateemploy.action",{"id":pid,"duty":duty,"password":password,"username":username},function(data){
			window.location.href = "personnellist.jsp";
		});
	});
});
function updateployee(id,duty,pwd,username) {
	pid= id;
	$("#editmyModal #empp").val(username);
	$("#editmyModal #password1").val(pwd);
	
	$("#editmyModal #duty1").val(duty);
	
	$("#editmyModal").modal('show');
	
}
function upduty(id,uid) {
	
	$("#pidsss").val(id);
	$("#uidsss").val(uid);
	$("#myModal5").modal('show');
}
function blur2() {
	 var input=$("#editmyModal #empp").val();
	$.post("selectByeyploname.action",{"name":input},function(data){
		if (data.name==null) {
			$("#editmyModal button").attr("disabled",false);
		}
		else{
			alert(data.name);
			$("#editmyModal button").attr("disabled",true);
		}
		
	}) 
	
}
</script>
</head>
<body>
	<%@ include file="common.jsp"%>
	<%@ include file="nav.jsp"%>
	<%@ include file="model.jsp"%>

	<div class="content-wrap">
		<div class="main">
			<div class="row">
				<div class="col-lg-8 p-r-0 title-margin-right">
					<div class="page-header">
						<div class="page-title">
							<h1>人员信息查询</h1>
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
							<div id="serach">
								<input type="hidden" value="${name}" id="hd">
								<form method="post" role="form"
									class="form-inline col-md-offset-1" id="form"
									action="personnellist.action">
									<c:if test="${duty==3}">
										<div class="form-group">
											<label>单位名称：</label> <select name="unit" id="sposnor"
												class="form-control"
												style="margin: 0 30px 0 0; height: 43px; width: 200px">
												<c:forEach items="${unitlist}" var="list">
													<option value="${list.id }">${list.name }</option>
												</c:forEach>
											</select>
										</div>
									</c:if>
									<div class="form-group" style="margin: 0 20px 0 0;">
										<label>姓名：</label><input type="text" name="name"
											class="form-control" />
									</div>
									<button class="btn btn-success query" type="submit">查询</button>
								</form>
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
															<th
																class="jsgrid-header-cell jsgrid-header-sortable jsgrid-align-center"
																style="width: 7%;"><input type="checkbox"
																onclick="ck()" id="all">全选</th>
															<th
																class="jsgrid-header-cell jsgrid-header-sortable jsgrid-align-center"
																style="width: 8%;">姓名</th>
															<th
																class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable jsgrid-align-center"
																style="width: 5%;">性别</th>
															<th
																class="jsgrid-header-cell jsgrid-header-sortable jsgrid-align-center"
																style="width: 10%;">单位</th>
															<th
																class="jsgrid-header-cell jsgrid-header-sortable jsgrid-align-center"
																style="width: 5%;">职称</th>
															<th
																class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
																style="width: 18%;">身份证号码</th>
															<th class="jsgrid-header-cell jsgrid-align-center"
																style="width: 10%;">毕业时间</th>
															<th class="jsgrid-header-cell jsgrid-align-center"
																style="width: 10%;">专业</th>
															<th class="jsgrid-header-cell jsgrid-align-center"
																style="width: 8%;">账号</th>
															<th class="jsgrid-header-cell jsgrid-align-center"
																style="width: 8%;">权限等级</th>

															<th
																class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center"
																style="width: 6%;">操作</th>
													</tbody>
												</table>
											</div>
											<div class="jsgrid-grid-body" style="height: 873px;">
												<table class="jsgrid-table">
													<tbody>
														<c:forEach items="${personnellist}" var="list">
															<tr class="jsgrid-row">
																<td class="jsgrid-cell jsgrid-align-center"
																	style="width: 7%;"><input value="${list.id }"
																	name="checkbox" type="checkbox"></td>
																<td class="jsgrid-cell jsgrid-align-center"
																	style="width: 8%;">${list.name}</td>
																<td class="jsgrid-cell jsgrid-align-center"
																	style="width: 5%;">${list.sex}</td>
																<td class="jsgrid-cell jsgrid-align-center"
																	style="width: 10%;">${list.unitname }</td>
																<td class="jsgrid-cell jsgrid-align-center"
																	style="width: 5%;">${list.zc }</td>
																<td class="jsgrid-cell jsgrid-align-center"
																	style="width: 18%;">${list.idcare }</td>
																<td class="jsgrid-cell jsgrid-align-center"
																	style="width: 10%;">${list.gtime }</td>
																<td class="jsgrid-cell jsgrid-align-center"
																	style="width: 10%;">${list.professional }</td>
																<td class="jsgrid-cell jsgrid-align-center"
																	style="width: 8%;">${list.username }</td>
																<td class="jsgrid-cell jsgrid-align-center"
																	style="width: 8%;"><c:if test="${list.duty=='1' }">个人用户</c:if>
																	<c:if test="${list.duty=='2' }">单位用户</c:if> <c:if
																		test="${list.duty=='3' }">管理员用户</c:if></td>

																<td
																	class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
																	style="width: 6%;"><c:if test="${list.duty==null}">
																		<a href='upduty.action?id=${list.id }&&unit=${list.unit}' style="text-decoration: none"> <span
																			class="jsgrid-button jsgrid-search-button ti-plus"
																			type="button" title="添加权限"></span>
																		</a>
																	</c:if> <c:if test="${list.duty!=null}">
																		<a href='udt.action?pid=${list.id}&&duty=${list.duty}&&password=${list.password}&&username=${list.username}'  style="text-decoration: none"> 
																		<span class="jsgrid-button jsgrid-search-button ti-pencil"
																			type="button" title="编辑权限"></span>
																		</a>
																	</c:if> <a href='selecByid.action?id=${list.id}'
																	style="text-decoration: none"> <span
																		class="jsgrid-button jsgrid-search-button ti-search"
																		type="button" title="查看"></span>
																</a></td>

															</tr>

														</c:forEach>
														<tr>
														<!-- <tr>
															<td class="pull-right"><button onclick="deleteall()">全部删除</button></td>
														</tr> -->
													</tbody>
												</table>
											</div>
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
					<form action="addEmployees.action" method="post">
						<input type="hidden" class="form-control" id="uidsss" name="uid" />
						<input type="hidden" class="form-control" id="pidsss" name="pid" />
						<div class="form-group">
							<select name="duty" id="duty" style="height: 40px">
								<option value="1">个人用户</option>
								<option value="2">单位用户</option>
								<c:if test="${duty==3}">
									<option value="3">管理员用户</option>
								</c:if>
							</select>
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
	<!-- 编辑模态框-->
	<div class="modal fade" id="editmyModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">用户编辑</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">

					<input type="hidden" class="form-control" id="uid" name="uid" /> <input
						type="hidden" class="form-control" id="pid" name="pid" />
					<div class="form-group">
						<select name="duty1" id="duty1" style="height: 40px">
							<option value="1">个人用户</option>
							<option value="2">单位用户</option>
							<option value="3">管理员用户</option>
						</select>
					</div>
					<div class="form-group">
						<label>用户账号</label> <input type="text" onblur="blur2()" class="form-control"
							id="empp" name="username" required="required" />
					</div>
					<div>
						<label>用户密码</label> <input type="password" class="form-control"
							id="password1" name="password" required="required" />
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" id="btn_sure" class="btn btn-primary">提交更改</button>
					</div>
					<
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- 模态框4 -->
	<div class="modal fade" id="dutyup" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">管理员添加</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<input type="hidden" id="eid"> <select id="duty"
						style="height: 40px">
						<option value="1">个人用户</option>
						<option value="2">单位用户</option>
						<c:if test="${duty==3}">
							<option value="3">管理员用户</option>
						</c:if>
					</select>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="submit" class="btn btn-primary"
						onclick="updateployee()">提交更改</button>
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
	<script type="text/javascript">
var dels=false;
var delid=0;
$(function(){
	$("#alertModal button").click(function(){
		location.reload(true); 
	});
	$("#btn_sure").click(function(){
		if(dels){
			var id = [];
			var ob = $("input[name='checkbox']");
			ob.each(function(i){
			    if($(this).is(":checked")){
			      id[i] =	$(this).attr("value")
			    }
			});
			 $.ajax({
			        type: "post",
			        dataType: 'json',
			        url: "pedelete.action",
			        contentType: 'application/json',//这个必须是这个格式
			        data: JSON.stringify(id),//前台要封装成json格式
			        success: function (result) {
			        	
			        	$("#alertModal #cfmMsg").html("删除成功");
			    		$("#alertModal").modal();
			        }
			    });
		}else{
			$.post("psdel.action",{"id":delid},function(date){
				$("#alertModal #cfmMsg").html("删除成功");
	    		$("#alertModal").modal();
	    		
			});
		}
	});
});
function clubdelete(id){
	dels=false;
	delid=id;
	$("#confirmModal #cfmMsg").html("是否删除");
	$("#confirmModal").modal();
	
}

function deleteall(){
	dels=true;
	$("#confirmModal #cfmMsg").html("是否删除");
	$("#confirmModal").modal();
}




function ck(){
 var ob = $('input[name="checkbox"]')
 if($("#all").is(":checked")){
   $('input[name="checkbox"]').prop("checked",true);
}
else{
	   $('input[name="checkbox"]').prop("checked",false);
}
}
}
</script>

</body>
</html>

