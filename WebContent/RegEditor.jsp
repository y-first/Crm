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
	padding-left: 10px;
}

.query {
	margin-left: 10px;
}

#serach div {
	margin-right: 10px;
}
</style>
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
							<h1>社团信息查询</h1>
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
								<form action="filtrate.action?uid=${uid}&&duty=${duty}"
									method="post" role="form" class="form-inline">
									<div class="form-group" style="margin: 0 30px 0 0;">
										<label>社团名称：</label> <input type="text" class="form-control"
											name="name" />
									</div>
									<div class="form-group">
										<c:if test="${emp.duty == 3 }">
											<div class="form-group">
												<label>支撑单位：</label> <input type="text" class="form-control"
													name="sunit" />
											</div>
										</c:if>
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
															<th class="jsgrid-header-cell jsgrid-header-sortable jsgrid-align-center"
																style="width: 10%;"><input type="checkbox"
																onclick="ck()" id="all">全选</th>
															
															<th
																class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
																style="width: 15%;">团体组织</th>
															<th
																class="jsgrid-header-cell jsgrid-header-sortable jsgrid-align-center"
																style="width: 10%;">法定代表人</th>
															<th
																class="jsgrid-header-cell jsgrid-header-sortable jsgrid-align-center"
																style="width: 10%;">秘书长</th>
															<th
																class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
																style="width: 20%;">业务主管单位</th>
															<th class="jsgrid-header-cell jsgrid-align-center"
																style="width: 10%;">联系人</th>
															<th class="jsgrid-header-cell jsgrid-align-center"
																style="width: 17%;">联系电话</th>
															<th
																class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center"
																style="width: 8%;">操作</th>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="jsgrid-grid-body" style="height: 873px;">
												<table class="jsgrid-table">
													<tbody>
														<c:forEach items="${club}" var="cl">
															<tr class="jsgrid-row">
																<td class="jsgrid-cell jsgrid-align-center" style="width: 10%;"><input
																	value="${cl.id }" name="checkbox" type="checkbox"></td>
																
																<td class="jsgrid-cell jsgrid-align-center"
																	style="width: 15%;">${cl.name}</td>
																<td class="jsgrid-cell jsgrid-align-center"
																	style="width: 10%;">${cl.director}</td>
																<td class="jsgrid-cell" style="width: 10%;">${cl.sgeneral }</td>
																<td class="jsgrid-cell jsgrid-align-center"
																	style="width: 20%;">${cl.unitname}</td>
																<td class="jsgrid-cell jsgrid-align-center"
																	style="width: 10%;">${cl.linkman }</td>
																<td class="jsgrid-cell jsgrid-align-center"
																	style="width: 17%;">${cl.phone }</td>
																<td
																	class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
																	style="width: 8%;"><a href='us.action?id=${cl.id}'
																	style="text-decoration: none"> <span
																		class="jsgrid-button jsgrid-edit-button ti-pencil"
																		type="button" title="Edit"></span>
																</a> <a href='#' class="delete"
																	style="text-decoration: none"
																	onclick="clubdelete(${cl.id})"> <span
																		class="jsgrid-button jsgrid-delete-button ti-trash"
																		type="button" title="Delete"></span>
																</a></td>
															</tr>
														</c:forEach>
														<tr>
															<td colspan="8"><button style="width: 8%;font-size: 8px;" class=" btn  pull-right"
																	 onclick="deleteall() ">全部删除</button></td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="jsgrid-pager-container" style="display: block;">
												<nav>
													<ul class="pagination">
														<li><a href="<c:url value="pd.action?page=1"/>">首页</a></li>
														<li><a
															href="<c:url value="pd.action?page=${page-1>1?page-1:1}"/>">&laquo;</a></li>

														<c:forEach begin="1" end="${totalPages}" varStatus="loop">
															<c:set var="active"
																value="${loop.index==page?'active':''}" />
															<li class="${active}"><a
																href="<c:url value="clubselect.action?page=${loop.index}"/>">${loop.index}</a>&nbsp;&nbsp;&nbsp;
															</li>
														</c:forEach>
														<li><a
															href="<c:url value="clubselect.action?page=${page+1<totalPages?page+1:totalPages}"/>">&raquo;</a>
														</li>
														<li><a
															href="<c:url value="clubselect.action?page=${totalPages}"/>">尾页</a></li>
													</ul>
												</nav>
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
				        url: "chdelete.action",
				        contentType: 'application/json',//这个必须是这个格式
				        data: JSON.stringify(id),//前台要封装成json格式
				        success: function (result) {
				        	
				        	$("#alertModal #cfmMsg").html("删除成功");
				    		$("#alertModal").modal();
				        }
				    });
			}else{
				$.post("clubdelete.action",{"id":delid},function(date){
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
