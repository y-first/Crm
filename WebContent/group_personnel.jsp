<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<script src="js/jquery-3.3.1.min.js"></script>

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
#search {
	padding-bottom: 20px;
	padding-left: 30px;
}

.jsgrid-pager-container li {
	font-size: 20px;
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
							<h1>
								团组信息编辑
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
								<h6>当前团组人员</h6>
									<div class="row">
									
										<div class="jsgrid-table-panel">
										
											<div id="jsGrid" class="jsgrid"
												style="position: relative; height: 100%; width: 100%;">
												
												<div class="jsgrid-grid-header jsgrid-header-scrollbar">
													<input type="hidden" id="ggid" value="${gid}" />
													
													<table class="jsgrid-table">
													
														<tbody>
															<tr class="jsgrid-header-row">
															<th class="jsgrid-header-cell jsgrid-header-sortable jsgrid-align-center"
																	style="width: 25%;">团组名称</th>
																<th class="jsgrid-header-cell jsgrid-header-sortable jsgrid-align-center"
																	style="width: 15%;">人员名称</th>
																<th class="jsgrid-header-cell jsgrid-header-sortable jsgrid-align-center"
																	style="width: 30%;">单位</th>
																<th
																	class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
																	style="width: 15%;">出访国家</th>
																<th
																	class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
																	style="width: 10%;">团内身份</th>
																

																<th
																	class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center"
																	style="width: 5%;">操作</th>
															</tr>

														</tbody>
													</table>
												</div>
												<div class="jsgrid-grid-body" style="height: 873px;">
													<table class="jsgrid-table">
														<tbody>

															<c:forEach items="${grouppersonnel}" var="c">
																<tr class="jsgrid-row">
																	<td class="jsgrid-cell jsgrid-align-center" style="width: 25%;">${c.groupname}</td>
																	<td class="jsgrid-cell jsgrid-align-center" style="width: 15%;">${c.name}</td>
																	<td class="jsgrid-cell jsgrid-align-center" style="width: 30%;">${c.unitname}</td>
																	<td class="jsgrid-cell jsgrid-align-center"
																		style="width: 15%;">${c.accesscountry}</td>
																	<td class="jsgrid-cell jsgrid-align-center"
																		style="width: 10%;">${c.role}</td>
																	<td
																		class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
																		style="width: 5%;"><a href='#' class="delete"
																		style="text-decoration: none"
																		onclick="clubdelete(${c.id},${c.pid})"> <span
																			class="jsgrid-button jsgrid-delete-button ti-trash"
																			type="button" title="删除"></span>
																	</a></td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div> 
										</div>
									</div>
									 <div class="row" style="margin:20px 0 20px 0">
										<form role="form" class="form-inline"
											action="selectmhpersonnel.action?id=${gid}" method="post">
											<div class="form-group" style="margin:0 20px 0 0">
												<label>所属单位：</label> <select name="unit" id="uniy"
													class="form-control ">
													<c:if test="${projectunit==null}">
													<c:forEach items="${unitlist}" var="list">
														<option value="${list.id }">${list.name }</option>
													</c:forEach>
													</c:if>
													<c:if test="${projectunit!=null}">
													<c:forEach items="${unitlist}" var="list">
													<c:if test="${projectunit==list.name}">
														<option value="${list.id }" selected="selected">${list.name }</option>
													</c:if>
													<c:if test="${projectunit!=list.name}">
														<option value="${list.id }">${list.name }</option>
													</c:if>
													</c:forEach>
													</c:if>
												</select>
											</div>
											<div class="form-group" style="margin:0 20px 0 0">
												<label>姓名：</label> <input type="text" class="form-control"
													id="name" name="name" />
											</div>
											<button class="btn btn-success" type="submit">查询</button>


										</form>

									</div>
									<div class="row">
										<div class="jsgrid-table-panel">
											 <div id="jsGrid" class="jsgrid"
												style="position: relative; height: 100%; width: 100%;">
												<div class="jsgrid-grid-header jsgrid-header-scrollbar">
													<input type="hidden" id="ggid" value="${gid}" />
													<table class="jsgrid-table">
														<tbody>
															<tr class="jsgrid-header-row">
																<th class="jsgrid-header-cell jsgrid-header-sortable jsgrid-align-center"
																	style="width: 20%;">名称</th>
																<th
																	class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
																	style="width: 5%;">性别</th>
																<th class="jsgrid-header-cell jsgrid-header-sortable jsgrid-align-center" style="width: 30%;">出生地</th>
																<th class="jsgrid-header-cell jsgrid-header-sortable jsgrid-align-center" style="width: 35%;">所属单位</th>
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

															<c:forEach items="${personnelByun}" var="c">
																<tr class="jsgrid-row">
																	<td class="jsgrid-cell jsgrid-align-center" style="width: 20%;">${c.name}</td>
																	<td class="jsgrid-cell jsgrid-align-center"
																		style="width: 5%;">${c.sex}</td>
																	<td class="jsgrid-cell jsgrid-align-center" style="width: 30%;">${c.place }</td>
																	<td class="jsgrid-cell jsgrid-align-center" style="width: 35%;">${c.unitname }</td>
																	<td
																		class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
																		style="width: 10%;">
																		<%-- <a href='#'
																		style="text-decoration: none" onclick="validation(${c.id})"><span
																			class="jsgrid-button jsgrid-edit-button ti-eye"
																			type="button" title="验证出国资格"></span></a>  --%>
																			<a href='#'
																		style="text-decoration: none" onclick="add(${c.id})">
																			<span
																			class="jsgrid-button jsgrid-delete-button ti-plus"
																			type="button" title="添加"></span>
																	</a></td>
																</tr>
															</c:forEach>
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
				</div>
			</section>
		</div>
	</div>
	
	<script type="text/javascript">
	/* var start = location.href.indexOf("=")+1;
	var gid = location.href.substring(start);
	
	$(function(){
		group_person_bind();
	});
	function group_person_bind(){
		 var updata={"groupid":gid}; 
	     var jsonData = JSON.stringify(updata);
		$.ajax({  
            type:"post",  
            url:"getGroupBygid.action",  
            contentType:"application/json;charset=utf-8",  
            data:jsonData,  
            success:function(data){
            	//console.log(data);
            	var result = $.parseJSON(data);
              //  console.log(result); 
                var db = {

                        loadData: function(filter) {
                			
                            return $.grep(result, function(client) {console.log(client);
                                return (!filter.name || client.name.indexOf(filter.name) > -1)
                                     && (filter.unitname === undefined || client.unitname === filter.unitname)
                                    && (!filter.accesscountry || client.accesscountry.indexOf(filter.accesscountry) > -1)
                                    && (!filter.role || client.role === filter.role); 
                            });
                        },

                    };
                $("#jsGrid").jsGrid({
                    height: "100%",
                    width: "100%",
                    filtering: false,
                    editing: true,
                    inserting: true,
                    sorting: true,
                    paging: true,
                    autoload: true,
                    pageSize: 1,
                    pageButtonCount: 5,
                    deleteConfirm: "Do you really want to delete the client?",
                    controller: db,
                    fields: [
                        { name: "name", type: "text", width: 150 },
                        { name: "unitname", type: "text", width: 150 },
                        { name: "accesscountry", type: "text", width: 150 },
                        { name: "role", type: "text", width: 150 },
                        { type: "control" }
                    ]
                });
            },
			error:function(data){
			    alert("后台发生异常！");
			}
        }); 
	}  */
	var gid="";
	var pid="";
	$(function(){
		$("#groupSure").click(function(){
			var groupname=$("#status").val();
			var role=$("#GroupStatusModal #status").val();
			
			$.post("addgroupperson.action",{"id":pid,"gid":gid,"role":role},function(data){
				
				if(data){
					
					window.location.reload();
				}else{
					$("#alertModal h4").html("改人员已在该团组中");
					$("#alertModal").modal('show');
				}
			})
		});
	});
	
	function clubdelete(id,pid){
		if(confirm("确认删除")){
			var gid=$("#ggid").val();
			
			$.post("deletegroupperson.action",{"id":id,"gid":gid,"pid":pid},function(data){
				alert("删除成功");
				window.location.reload();
			});
		}
	}
	function add(id){
		gid=$("#ggid").val();
		pid=id;
		var accesscountry=$("#accesscountry").val();
		$("#GroupStatusModal").modal('show');
		//var groupname=$("")
		/*  if(confirm("确认增加")){
			$.post("addgroupperson.action",{"id":id,"gid":gid},function(data){
				console.log(data);
				alert(data);
				window.location.reload();
			})
		} */ 
	}
	
	function validation(id) {
		 var gid=$("#ggid").val();
			$.post("validationpersonnel.action",{"id":id,"gid":gid},function(data){
				if (data.note!="通过审核") {
					alert("验证不通过，"+data.note);
				}
				else{
				alert(data.note);
				}
			}) 
			
	}
	</script>
	<script src="assets/js/lib/jquery.min.js"></script>
	<script src="assets/js/lib/jquery.nanoscroller.min.js"></script>
	<!-- nano scroller -->
	<script src="assets/js/lib/menubar/sidebar.js"></script>
	<script src="assets/js/lib/preloader/pace.min.js"></script>
	<!-- sidebar -->
    <script src="assets/js/lib/jsgrid/jsgrid.core.js"></script>
    <script src="assets/js/lib/jsgrid/jsgrid.load-indicator.js"></script>
    <script src="assets/js/lib/jsgrid/jsgrid.load-strategies.js"></script>
    <script src="assets/js/lib/jsgrid/jsgrid.sort-strategies.js"></script>
    <script src="assets/js/lib/jsgrid/jsgrid.field.js"></script>
    <script src="assets/js/lib/jsgrid/fields/jsgrid.field.text.js"></script>
    <script src="assets/js/lib/jsgrid/fields/jsgrid.field.number.js"></script>
    <script src="assets/js/lib/jsgrid/fields/jsgrid.field.select.js"></script>
    <script src="assets/js/lib/jsgrid/fields/jsgrid.field.checkbox.js"></script>
    <script src="assets/js/lib/jsgrid/fields/jsgrid.field.control.js"></script>
	<script src="assets/js/lib/bootstrap.min.js"></script>
	<script src="assets/js/scripts.js"></script>
</body>
</html>