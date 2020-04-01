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
#text {
	height: 200px;
}

#adds {
	margin-left: 100px;
}
</style>
<script type="text/javascript">
	function cal(){
		
		var num=$("#num").val();
		var reg = /^[1-9]\d+|[0-9]$/;
		flag=reg.test(num);
		if(flag){
			var fcapital=$("#fcapital").val();
			reg=/^([1-9]{1,}\.{0,}[0-9]{0,})|0$/;
			flag=reg.test(fcapital);
			if(flag){
				var ofunds=$("#ofunds").val();
				reg=/^([1-9]{1,}\.{0,}[0-9]{0,})|0$/;
				flag=reg.test(ofunds);
				if(flag){
					var totalFunds=parseFloat(ofunds)+parseFloat(fcapital);
					var pre=(totalFunds/(parseInt(num))).toFixed(2);
					$("#pexpenditure").val(pre);
					$("#expenditure").val(totalFunds);
					return true;
				}
			}
		}
		return false;
	}
	$(function(){
		$("#pexpenditure").blur(function(){
			cal();
		});
		$("#pexpenditure").blur(function(){
			cal();
		});
		$("#num").blur(function(){
			cal();
		});
		$("#fcapital").blur(function(){
			cal();
		});
		$("#ofunds").blur(function(){
			cal();
		});
	});
	
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
							<h1>年度团组编辑</h1>
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
									<form role="form" class="form-horizontal" onsubmit="return cal()"
										action="groupupdate.action" method="post">
										<div class="row">
											<div class="col-lg-6">
												<div class="form-group">
													<label>团组名</label> 
													<input type="hidden" name="id"
														class="form-control" value="${group.id }" />
													<input type="text" name="name"
														class="form-control" value="${group.name }" />
												</div>
												<div class="form-group">
													<label>出访时间</label> <input type="date" name="accesstime"
														class="form-control"  value="${group.accesstime }" />
												</div>
												<div class="form-group">
													<label>举办单位</label>
														<select name="accessunit" id="accessunit"
															class="form-control">
															<c:forEach items="${unitlist}" var="list">
															<c:if test="${list.id==group.accessunit}">
																<option value="${list.id }" selected="selected">${list.name }</option>
															</c:if>
															<c:if test="${list.id!=group.accessunit}">
																<option value="${list.id }">${list.name }</option>
															</c:if>
															</c:forEach>
														</select>
												</div>
												<div class="form-group">
													<label>经费</label> <input type="text" name="expenditure" id="expenditure"
														value="${group.expenditure }" class="form-control"
														required="required"   pattern="^[0-9.]*$"  readonly="readonly" />
												</div>
												<div class="form-group">
												<label>财政资金</label> <input type="text" name="fcapital" value="${group.fcapital }" id="fcapital"
													class="form-control" required="required" pattern="^[0-9.]*$" id="fcapital" />
												</div>
												<div class="form-group">
													<label>出团性质</label> <select name="aim"
														class="form-control">
														<c:if test="${group.aim=='交流'}">
															<option value="交流" selected="selected">交流</option>
															<option value="培训">培训</option>
															
														</c:if>
														<c:if test="${group.aim=='培训'}">
															<option value="交流">交流</option>
															<option value="培训" selected="selected">培训</option>
															
														</c:if>
														</select>
												</div>
											</div>

											<div class="col-lg-6">
												<div class="form-group">
													<label>出访人数</label> <input type="text" name="access" id="num"
														class="form-control" value="${group.access }" pattern="^[1-9][0-9]*$" />
												</div>
												<div class="form-group">
													<label>出访国家</label> <input type="text" name="accesscountry"
														class="form-control" value="${group.accesscountry }" />
												</div>
												<div class="form-group">
													<label>出访天数</label> <input type="text" name="days"
														class="form-control" required="required"  value="${group.days }" pattern="^[1-9][0-9]*$" />
												</div>
												<div class="form-group">
													<label>人均经费</label> <input type="text" name="pexpenditure" readonly="readonly" id="pexpenditure"
														class="form-control"  id="pexpenditure" value="${group.pexpenditure }"/>
												</div>
												<div class="form-group">
												<label>其他资金</label> <input type="text" name="ofunds" id="ofunds"
													class="form-control" pattern="^[0-9.]*$" id="ofunds" value="${group.ofunds }" />
											</div>
											</div>
											
											
										</div>
										<div class="row">
											<div class="col-lg-12">
												<div class="form-group">
													<label>备注</label>
													<textarea class="form-control" id="text" rows="8" cols=""
														name="note"></textarea>
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
