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
</style>
</head>
<body>
	<%@ include file="model.jsp"%>
	<%@ include file="common.jsp"%>
	<%@ include file="nav.jsp"%>
		<input type="hidden" value="${name}" id="hd">
	<div class="content-wrap">
		<div class="main">
			<div class="row">
				<div class="col-lg-8 p-r-0 title-margin-right">
					<div class="page-header">
						<div class="page-title">
							<h1>年度计划查询</h1>
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
									action="page.action">
									<div class="form-group" style="margin: 0 30px 0 0;">
										<label>会议名称：</label> <input type="text" class="form-control"
											name="name" />
											<c:if test="${duty=='2' }">
											<input type="hidden" name="unitid" id="unitid" value="${uid}" />
											</c:if>
									</div>
									<c:if test="${duty=='3' }">
									<div class="form-group" style="margin: 0 20px 0 0;">
										<label>举办单位：</label> <select name="unitid" id="unitid"
											class="form-control" style="width: 200px">
											<c:forEach items="${unitlist}" var="list">
												<option value="${list.id }">${list.name }</option>
											</c:forEach>
										</select>
									</div>
									</c:if>
									<button class="btn btn-success" type="submit">查询</button>
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
															<th class="jsgrid-align-center jsgrid-header-cell jsgrid-header-sortable"
																style="width:7%;"><input type="checkbox"
																onclick="ck()" id="all">全选</th>
															<th
																class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
																style="width: 12%;">会议名称</th>
															<th
																class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
																style="width: 10%;">举办单位</th>
															<th class="jsgrid-header-cell jsgrid-header-sortable jsgrid-align-center"
																style="width: 12%;">举办地点</th>
															<th class="jsgrid-header-cell jsgrid-header-sortable jsgrid-align-center"
																style="width: 10%;">预举办时间</th>
															<th class="jsgrid-header-cell jsgrid-header-sortable jsgrid-align-center"
																style="width: 10%;">实际办时间</th>
															<th
																class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
																style="width: 6%;">参与人数</th>
															<th class="jsgrid-header-cell jsgrid-align-center"
																style="width: 10%;">计划经费</th>
															<th class="jsgrid-header-cell jsgrid-align-center"
																style="width: 10%;">实际经费</th>
															<th class="jsgrid-header-cell jsgrid-align-center"
																style="width: 7%;">审核状态</th>
															
																<th
																	class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center"
																	style="width: 6%;">操作</th>
															
														</tr>

													</tbody>
												</table>
											</div>

											<div class="jsgrid-grid-body" style="height: 873px;">
												<table class="jsgrid-table">
													<tbody>
														<c:forEach items="${traininglist}" var="list">
															<tr class="jsgrid-row">
																<td class="jsgrid-cell jsgrid-align-center" style="width: 7%;"><input
																	value="${list.id }" name="checkbox" type="checkbox"></td>
																<td class="jsgrid-cell jsgrid-align-center" style="width: 12%;">${list.name}</td>
																<td class="jsgrid-cell jsgrid-align-center"
																	style="width: 10%;">${list.unitname}</td>
																<td class="jsgrid-cell jsgrid-align-center"
																	style="width: 12%;">${list.held }</td>
																<td class="jsgrid-cell jsgrid-align-center" style="width: 10%;">${list.p }</td>
																<td class="jsgrid-cell jsgrid-align-center" style="width: 10%;">${list.a }</td>
																
																<td class="jsgrid-cell jsgrid-align-center"
																	style="width: 6%;">${list.participation }</td>
																<td class="jsgrid-cell jsgrid-align-center"
																	style="width: 10%;">${list.pfunds }</td>
																<td class="jsgrid-cell jsgrid-align-center"
																	style="width: 10%;">${list.afunds }</td>
																<td class="jsgrid-cell jsgrid-align-center"
																	style="width: 7%;">${list.examine }</td>
																<c:if test="${duty=='2' }">
																	<td
																		class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
																		style="width: 6%;"><a
																		href='trainingByid.action?id=${list.id}'
																		style="text-decoration: none"> <span
																			class="jsgrid-button jsgrid-edit-button ti-pencil"
																			type="button" title="编辑"></span>
																	</a> <a href='#' class="delete"
																		style="text-decoration: none"
																		onclick="clubdelete(${list.id})"> <span
																			class="jsgrid-button jsgrid-delete-button ti-trash"
																			type="button" title="删除"></span>
																	</a></td>
																</c:if>
																<c:if test="${duty=='3' }">
																	<td
																		class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
																		style="width: 6%;"><a
																		href='trainingByid.action?id=${list.id}'
																		style="text-decoration: none"> <span
																			class="jsgrid-button jsgrid-edit-button ti-pencil"
																			type="button" title="审核"></span>
																	</a> </td>
																</c:if>
															</tr>
														</c:forEach>
														<c:if test="${duty==2 }">
														<tr>
															<td colspan="10"><button style="width: 8%;font-size: 8px;" class=" btn  pull-right"
																	 onclick="deleteall() ">全部删除</button></td>
														</tr>
														</c:if>
													</tbody>
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
		var hd =  $("#hd").val();
		if(hd==null || hd==""){
			
		}else{
			$("#sposnor").val(hd)
		}
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
				        url: "tdelete.action",
				        contentType: 'application/json',//这个必须是这个格式
				        data: JSON.stringify(id),//前台要封装成json格式
				        success: function (result) {
				        	
				        	$("#alertModal #cfmMsg").html("删除成功");
				    		$("#alertModal").modal();
				        }
				    });
			}else{
				$.post("Trainingdelete.action",{"id":delid},function(date){
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
		       $('input[name="checkbox"]').prop("checked",true)}else{
		    	   $('input[name="checkbox"]').prop("checked",false) 
		       }
		   }
			</script>
</body>
</html>

