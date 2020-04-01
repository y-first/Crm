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
	function cal() {

		var num = $("#num").val();
		var reg = /^[1-9]\d+|[0-9]$/;
		flag = reg.test(num);
		if (flag) {
			var fcapital = $("#fcapital").val();
			reg = /^([1-9]{1,}\.{0,}[0-9]{0,})|0$/;
			flag = reg.test(fcapital);
			if (flag) {
				var ofunds = $("#ofunds").val();
				reg = /^([1-9]{1,}\.{0,}[0-9]{0,})|0$/;
				flag = reg.test(ofunds);
				if (flag) {
					var totalFunds = parseFloat(ofunds) + parseFloat(fcapital);
					var pre = (totalFunds / (parseInt(num))).toFixed(2);
					$("#pexpenditure").val(pre);
					$("#expenditure").val(totalFunds);
					return true;
				}
			}
		}
		return false;
	}
	$(function() {
		$("#pexpenditure").blur(function() {
			cal();
		});
		$("#pexpenditure").blur(function() {
			cal();
		});
		$("#num").blur(function() {
			cal();
		});
		$("#fcapital").blur(function() {
			cal();
		});
		$("#ofunds").blur(function() {
			cal();
		});
	});
    function check() {
       var fileObj = document.getElementById("upfile"); // js 获取文件对象
       if(fileObj.files.length<=0){
    	   	alert("未选择上传文件");
       		return false;
       }else if(fileObj.files[0].name!="出国团组批量录入.xls"&&fileObj.files[0].name!="出国团组批量录入.xlsx"){
    	   alert("请选择正确的上传文件");
    	   return false;
       }
        return true;
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
							<h1>年度团组登记</h1>
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
										action="groupadd.action" method="post" onsubmit="return cal()">
										<div class="row">
											<div class="col-lg-6">
												<div class="form-group">
													<label>团组名</label> <input type="text" name="name"
														class="form-control" />
												</div>
												<div class="form-group">
													<label>出访时间</label> <input type="date" name="accesstime"
														class="form-control" />
												</div>
												<div class="form-group">
													<label>举办单位</label>
													<c:if test="${duty == '3' }">
														<select name="accessunit" id="accessunit"
															class="form-control">
															<c:forEach items="${unitlist}" var="list">
																<option value="${list.id }">${list.name }</option>
															</c:forEach>
														</select>
													</c:if>
													<c:if test="${duty == '2' }">
														<input type="text" class="form-control input-lg"
															readonly="readonly" name="accessunit" placeholder="请输入单位"
															required value="${uid }">
													</c:if>
												</div>
												<div class="form-group">
													<label>经费</label> <input type="text" name="expenditure"
														id="expenditure" value="${personnel.idcare }"
														class="form-control" required="required"
														pattern="^[0-9.]*$" readonly="readonly" />
												</div>
												<div class="form-group">
													<label>财政资金</label> <input type="text" name="fcapital"
														class="form-control" required="required"
														pattern="^[0-9.]*$" id="fcapital" />
												</div>
												<div class="form-group">
													<label>出团性质</label>
													<select name="aim" class="form-control">
													<option value="交流" selected="selected">交流</option>
													<option value="培训" >培训</option>
													</select> 
												</div>
											</div>

											<div class="col-lg-6">
												<div class="form-group">
													<label>出访人数</label> <input type="text" name="access"
														id="num" class="form-control" required="required" pattern="^[1-9][0-9]*$" />
												</div>
												<div class="form-group">
													<label>出访国家</label> <input type="text" name="accesscountry"
														class="form-control" />
												</div>
												<div class="form-group">
													<label>出访天数</label> <input type="text" name="days"
														id="days" class="form-control" required="required"
													pattern="^[1-9][0-9]*$" />
												</div>
												<div class="form-group">
													<label>人均经费</label> <input type="text" name="pexpenditure"
														readonly="readonly" class="form-control"
														pattern="^[1-9][0-9.]*$" id="pexpenditure" />
												</div>
												<div class="form-group">
													<label>其他资金</label> <input type="text" name="ofunds"
														class="form-control" pattern="^[0-9.]*$" id="ofunds" />
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
														<button type="submit" class="btn btn-default" id="button">录入</button>
													</div>
												</div>
											</div>
										</div>

									</form>
									<form method="POST" class="col-md-offset-4"
										onsubmit="return check()"  enctype="multipart/form-data"
										id="form1" action="filegUploada.action">
										<table>
											<tr>
												<td>批量录入:</td>
												<td><input id="upfile" type="file" name="upfile"></td>
												<td><input type="submit" value="提交"></td>
											</tr>
											<tr>

												<c:forEach items="${error }" var="list">
													<td style="color: red">${list}</td>
												</c:forEach>
											</tr>
										</table>
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
