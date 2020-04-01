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

</head>
<body>
	<%@ include file="model.jsp"%>
	<%@ include file="common.jsp"%>
	<%@ include file="nav.jsp"%>
	<div class="content-wrap">
		<div class="main">
			<div class="row">
				<div class="col-lg-8 p-r-0 title-margin-right">
					<div class="page-header">
						<div class="page-title">
							<h1>年度团组查询</h1>
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
								<div class="row">
									<div class="basic-elements">
										<div class="jsgrid-table-panel">
											<div id="jsGrid" class="jsgrid"
												style="position: relative; height: 100%; width: 100%;">
												<div class="jsgrid-grid-header jsgrid-header-scrollbar">
													<table class="jsgrid-table">
														<tbody>
															<tr class="jsgrid-header-row">
																<th class="jsgrid-header-cell jsgrid-header-sortable jsgrid-align-center"
																	style="width: 8%;"><input type="checkbox"
																	onclick="ck()" id="all">全选</th>
																<th
																	class="jsgrid-header-cell jsgrid-header-sortable jsgrid-align-center"
																	style="width: 12%;">团组名</th>
																<th
																	class="jsgrid-header-cell jsgrid-align-right jsgrid-header-sortable jsgrid-align-center"
																	style="width: 10%;">出访人数</th>
																<th
																	class="jsgrid-header-cell jsgrid-header-sortable jsgrid-align-center"
																	style="width: 12%;">出访时间</th>
																<th
																	class="jsgrid-header-cell jsgrid-header-sortable jsgrid-align-center"
																	style="width: 10%;">出访国家</th>
																<th
																	class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
																	style="width: 15%;">举办单位</th>
																<th class="jsgrid-header-cell jsgrid-align-center"
																	style="width: 8%;">出访天数</th>
																<th class="jsgrid-header-cell jsgrid-align-center"
																	style="width: 10%;">经费</th>
																<th class="jsgrid-header-cell jsgrid-align-center"
																	style="width: 10%;">人均经费</th>
																<th
																	class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center"
																	style="width: 10%;">操作</th>
															</tr>

														</tbody>
													</table>
												</div>
												<div class="jsgrid-grid-body" style="height: 873px;">
													<table class="jsgrid-table">
														<tbody>
															<c:forEach items="${groupfindall}" var="c">
																<tr class="jsgrid-row">
																	<td class="jsgrid-cell jsgrid-align-center" style="width: 8%;"><input
																		value="${c.id }" name="checkbox" type="checkbox"></td>
																	<td class="jsgrid-cell jsgrid-align-center"
																		style="width: 12%;">${c.name}</td>
																	<td class="jsgrid-cell jsgrid-align-center" style="width: 10%;" >${c.access }</td>
																	<td class="jsgrid-cell jsgrid-align-center" style="width: 12%;">${c.accesstime }</td>
																	<td class="jsgrid-cell jsgrid-align-center"
																		style="width: 10%;">${c.accesscountry }</td>
																	<td class="jsgrid-cell jsgrid-align-center"
																		style="width: 15%;">${c.unitname }</td>
																	<td class="jsgrid-cell jsgrid-align-center"
																		style="width: 8%;">${c.days }</td>
																	<td class="jsgrid-cell jsgrid-align-center"
																		style="width: 10%;">${c.expenditure }</td>
																	<td class="jsgrid-cell jsgrid-align-center"
																		style="width: 10%;">${c.pexpenditure }</td>
																	<td
																		class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
																		style="width: 10%;"><c:if test="${duty==3 }">
																			<a href='gp.action?gid=${c.id }'style="text-decoration: none"> <span
																				class="jsgrid-button jsgrid-edit-button  ti-plus"
																				type="button" title="添加人员"></span>
																			</a>
																			<%-- <a href='group_personnel.jsp?gid=${c.id }'style="text-decoration: none"> <span
																				class="jsgrid-button jsgrid-edit-button  ti-plus"
																				type="button" title="添加人员"></span>
																			</a> --%>
																			<a href='grouput.action?id=${c.id}'
																				style="text-decoration: none"> <span
																				class="jsgrid-button jsgrid-edit-button ti-pencil"
																				type="button" title="编辑团组信息"></span>
																			</a>
																		</c:if> <a href='#' class="delete"
																		style="text-decoration: none"
																		onclick="clubdelete(${c.id})"> <span
																			class="jsgrid-button jsgrid-delete-button ti-trash"
																			type="button" title="删除"></span>
																	</a></td>
																</tr>
															</c:forEach>
														</tbody>
														<tr>
															<td colspan="10"><button style="width: 8%;font-size: 8px;" class=" btn  pull-right"
																	 onclick="deleteall() ">全部删除</button></td>
														</tr>
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
	<script type="text/javascript"></script>
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
				        url: "gdelete.action",
				        contentType: 'application/json',//这个必须是这个格式
				        data: JSON.stringify(id),//前台要封装成json格式
				        success: function (result) {
				        	
				        	$("#alertModal #cfmMsg").html("删除成功");
				    		$("#alertModal").modal();
				        }
				    });
			}else{
				$.post("deletegroup.action",{"id":delid},function(date){
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
