<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="js/jquery-3.3.1.min.js"></script>
<!-- <script src="js/bootstrap.min.js"></script> -->
<link href="assets/css/lib/font-awesome.min.css" rel="stylesheet">
<link href="assets/css/lib/themify-icons.css" rel="stylesheet">
<link href="assets/css/lib/owl.carousel.min.css" rel="stylesheet" />
<link href="assets/css/lib/owl.theme.default.min.css" rel="stylesheet" />
<link href="assets/css/lib/weather-icons.css" rel="stylesheet" />
<link href="assets/css/lib/menubar/sidebar.css" rel="stylesheet">
<link href="assets/css/lib/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/lib/helper.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">
<script type="text/javascript">  
function check() {
    var fileObj = document.getElementById("upfile"); // js 获取文件对象
    if(fileObj.files.length<=0){
 	    $("#alertModal #cfmMsg").html("未选择上传文件");
 		$("#alertModal").modal();
    		return false;
    }else if(fileObj.files[0].name!="科技成果批量录入.xls"&&fileObj.files[0].name!="科技成果批量录入.xlsx"){
 	    $("#alertModal #cfmMsg").html("请选择正确的上传文件");
 		$("#alertModal").modal();
 	   	return false;
    }
     return true;
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
							<h1>
							科技成果批量导入
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
									<form method="POST" class="col-md-offset-4" onsubmit="return check()"
										enctype="multipart/form-data" id="form1"
										action="fileUpload.action">
										<table>
											<tr>
												<td>批量录入:</td>
												<td><input id="upfile" type="file" name="upfile"></td>
												<td><input type="submit" value="提交"></td>
											</tr>
											<tr>
									
									<c:forEach items="${error }" var="list">
									<td style="color:red">${list}</td>
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
	<script src="assets/js/lib/jquery.nanoscroller.min.js"></script>
	<script src="assets/js/lib/menubar/sidebar.js"></script>
	<script src="assets/js/lib/preloader/pace.min.js"></script>
	<script src="assets/js/lib/bootstrap.min.js"></script>
	<script src="assets/js/scripts.js"></script>
</body>
</html>