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
	#notetext{
		height:100px;
	}
	#adds{
		margin-left:100px;
	}
</style>
<script type="text/javascript">
function blur2() {
	var input=$("#proname").val();
	$.post("selectbytname.action",{"name":input},function(data){
		if (data.name==null) {
			$("#button").attr("disabled",false);
		}
		else{
			alert(data.name);
			$("#button").attr("disabled",true);
		}
		
	}) 
}</script>
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
							<h1>年度计划培训</h1>
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
	                              <form role="form" class="form-horizontal" action="Trainingadd.action" method="post">
	                              		<div class="row">
	                              			<div class="col-lg-6">
	                              				<div class="form-group">
													<label>会议名称</label>
													<input type="text" name="name"  onblur="blur2()" id="proname" class="form-control" required="required"/>
												</div>
												<div class="form-group">
													<label>预举办地点</label>
													<input type="text" name="held" class="form-control" required="required"/>
												</div>
												<!-- <div class="form-group">
													<label>实际举办时间</label>
													<input type="date" name="atime" class="form-control" required="required"/>
												</div> -->
												<div class="form-group">
													<label>计划经费</label>
													<input type="text" name="pfunds" class="form-control" required="required" pattern="^[0-9.]*$"/>
												</div>
												<div class="form-group">
													<label>培训对象</label>
													<input type="text" name="target" class="form-control" required="required" />
												</div>
												
	                              			</div>
	                              			<div class="col-lg-6">
	                              				<div class="form-group">
													<label>举办单位</label>
													<c:if test="${duty == '3' }">
														<select name="unitid" class="form-control">
															<c:forEach items="${unitlist }" var="list">
																<option value="${list.id }">${list.name }</option>
															</c:forEach>
														</select>
													</c:if>
													<c:if test="${duty == '2' }">
														<%-- <input type="text" class="form-control input-lg" readonly="readonly" name="unitid" placeholder="请输入单位" required value="${uid }"> --%>
														<select name="unitid" class="form-control">
															<c:forEach items="${unitlist }" var="list">
																<c:if test="${list.id==uid}">
																	<option value="${list.id }" selected="selected">${list.name }</option>
																</c:if>
																
															</c:forEach>
														</select>
													</c:if>
												</div>
												<div class="form-group"> 
													<label>预举办时间</label>
													<!-- <input type="hidden" name="id" id="hi"> -->
													<input type="date" name="ptime" class="form-control" required="required"/>
												</div>
												<div class="form-group"> 
													<label>预参与人数</label>
													<!-- <input type="hidden" name="id" id="hi"> -->
													<input type="text" name="participation" class="form-control" pattern="^[1-9]|[1-9][0-9]*$" />
												</div>
												<!-- <div class="form-group">
													<input type="hidden" name="id" id="hi"> 
													<label>实际经费</label>
													<input type="text" name="afunds" class="form-control" required="required"/>
												</div> -->
	                              			</div>
	                              			
	                              		</div>
	                              		<div class="row">
	                              			<div class="col-lg-12">
	                              				<div class="form-group">
													<label>备注</label>
													<textarea class="form-control" id="notetext" rows="8" cols="" name="note"></textarea>
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
