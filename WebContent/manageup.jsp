<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="shortcut icon" href="http://placehold.it/64.png/000/fff">
<!-- Retina iPad Touch Icon-->
<link rel="apple-touch-icon" sizes="144x144"
	href="http://placehold.it/144.png/000/fff">
<!-- Retina iPhone Touch Icon-->
<link rel="apple-touch-icon" sizes="114x114"
	href="http://placehold.it/114.png/000/fff">
<!-- Standard iPad Touch Icon-->
<link rel="apple-touch-icon" sizes="72x72"
	href="http://placehold.it/72.png/000/fff">
<!-- Standard iPhone Touch Icon-->
<link rel="apple-touch-icon" sizes="57x57"
	href="http://placehold.it/57.png/000/fff">
<!-- Toastr -->
<link href="assets/css/lib/toastr/toastr.min.css" rel="stylesheet">
<!-- Sweet Alert -->
<link href="assets/css/lib/sweetalert/sweetalert.css" rel="stylesheet">
<!-- Range Slider -->
<link href="assets/css/lib/rangSlider/ion.rangeSlider.css"
	rel="stylesheet">
<link href="assets/css/lib/rangSlider/ion.rangeSlider.skinFlat.css"
	rel="stylesheet">
<!-- Bar Rating -->
<link href="assets/css/lib/barRating/barRating.css" rel="stylesheet">
<!-- Nestable -->
<link href="assets/css/lib/nestable/nestable.css" rel="stylesheet">
<!-- JsGrid -->
<link href="assets/css/lib/jsgrid/jsgrid-theme.min.css" rel="stylesheet" />
<link href="assets/css/lib/jsgrid/jsgrid.min.css" type="text/css"
	rel="stylesheet" />
<!-- Datatable -->
<link href="assets/css/lib/data-table/buttons.bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/css/lib/owl.carousel.min.css" rel="stylesheet" />
<link href="assets/css/lib/owl.theme.default.min.css" rel="stylesheet" />
<!-- Select2 -->
<link href="assets/css/lib/select2/select2.min.css" rel="stylesheet">
<link href="assets/css/lib/chartist/chartist.min.css" rel="stylesheet">
<link href="assets/css/lib/calendar2/pignose.calendar.min.css"
	rel="stylesheet">
<!-- Common -->
<link href="assets/css/lib/font-awesome.min.css" rel="stylesheet">
<link href="assets/css/lib/themify-icons.css" rel="stylesheet">
<link href="assets/css/lib/menubar/sidebar.css" rel="stylesheet">
<link href="assets/css/lib/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/lib/helper.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">
<style type="text/css">
.bg_color {
	width: 100px;
	height: 100px;
	border: 1px solid #aa00aa;
	margin-left: 10px
}
</style>
<script type="text/javascript">
	/* function blur2() {
		var input = $("#username1").val();
		$.post("selectByeyploname.action", {
			"name" : input
		}, function(data) {
			if (data.name == null) {
				$("#btn1").attr("disabled", false);
			} else {
			
				$("#btn1").attr("disabled", true);
			}

		})

	} */
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
							<h1>用户编辑</h1>
						</div>
						<form action="updateemploy.action" method="post">
							<input type="hidden" class="form-control" id="uid" name="uid"
								value="${id }" /> <input type="hidden" class="form-control"
								id="pid" name="pid" value="${unit }" />
							<div class="form-group">
								<select style="height: 40px" name="duty">
									<c:if test="${ emp.duty == 2}">
										<c:if test="${duty == 1 }">
											<option value="1" selected="selected">个人用户</option>
											<option value="2">单位用户</option>
										</c:if>
										<c:if test="${duty == 2 }">
											<option value="1">个人用户</option>
											<option value="2" selected="selected">单位用户</option>
										</c:if>
										<c:if test="${duty == 3 }">
											<option value="1">个人用户</option>
											<option value="2">单位用户</option>
										</c:if>
									</c:if>
									<c:if test="${ emp.duty == 3}">
										<c:if test="${duty == 1 }">
											<option value="1" selected="selected">个人用户</option>
											<option value="2">单位用户</option>
											<option value="3">管理员用户</option>
										</c:if>
										<c:if test="${duty == 2 }">
											<option value="1">个人用户</option>
											<option value="2" selected="selected">单位用户</option>
											<option value="3">管理员用户</option>
										</c:if>
										<c:if test="${duty == 3 }">
											<option value="1">个人用户</option>
											<option value="2">单位用户</option>
											<option value="3" selected="selected">管理员用户</option>
										</c:if>
									</c:if>
								</select>
							</div>
							<div class="form-group">
								<label>用户账号</label> <input type="text" class="form-control" readonly='readonly'
									id="username1" name="username" required="required"
									value="${username }" onblur="blur2()" />
							</div>
							<div>
								<label>用户密码</label> <input type="password" class="form-control"
									id="password1" name="password" required="required"
									value="${password }" />
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="submit" id="btn1" class="btn btn-primary">提交更改</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- /.modal -->
	</div>

	<script src="assets/js/lib/jquery.min.js"></script>
	<script src="assets/js/lib/jquery.nanoscroller.min.js"></script>
	<script src="assets/js/lib/menubar/sidebar.js"></script>
	<script src="assets/js/lib/preloader/pace.min.js"></script>
	<script src="assets/js/lib/bootstrap.min.js"></script>
	<script src="assets/js/scripts.js"></script>

	<script src="assets/js/lib/jquery-ui/jquery-ui.min.js"></script>
	<script src="assets/js/lib/moment/moment.js"></script>
	<script src="assets/js/lib/calendar-2/moment.latest.min.js"></script>
	<!-- scripit init-->
	<!-- scripit init-->
	<script src="assets/js/lib/calendar-2/prism.min.js"></script>
	<!-- scripit init-->
	<script src="assets/js/lib/calendar-2/pignose.calendar.min.js"></script>
	<!-- scripit init-->
	<script src="assets/js/lib/calendar-2/pignose.init.js"></script>

</body>
</html>
