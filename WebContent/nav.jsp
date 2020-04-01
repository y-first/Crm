<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
span {
	font-size: 14px;
	font-weight: 400em;
	font-family: "微软雅黑";
}

.dropdown-content-heading span:hover, .user-avatar:hover {
	color: blue;
}
}
</style>
<script type="text/javascript">
	function removelogin() {
		if (confirm("确认注销")) {
			window.location.href = "login.jsp";
		}
	}
	function removelogin2() {
		window.location.href = "account.jsp";
	}
	function addUser() {
		$('#myModal').modal('show');

	}
	function addUser2() {
		$('#myModal2').modal('show');

	}
	function addUser3() {
		window.location.href = "addUser.jsp";
	}
	function addUser4() {
		$('#myModal4').modal('show');
	}
	function addUser5() {
		$.post("unitfindall.action", {
			"id" : 0
		}, function(data) {
			window.location.href = "unit.jsp";
		})
	}
	function addUser7() {
		window.location.href = "removeUser.jsp";
	}
	function addUser8() {
		window.location.href = "personnel.jsp";
	}
	function addUser9() {
		$.post("personnellist.action", {}, function(data) {
			window.location.href = "personnellist.jsp";
		})
	}
</script>
</head>
<body>
	<div class="header">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<div class="float-left">
						<div class="hamburger sidebar-toggle">
							<span class="line"></span><span class="line"></span> <span
								class="line"></span>

						</div>

					</div>
					<div class="dropdown dib">
						<div class="header-icon" data-toggle="dropdown">
							${emp.uid}
							<c:if test="${emp.duty=='1' }">个人用户</c:if>
							<c:if test="${emp.duty=='2' }">单位用户</c:if>
							<c:if test="${emp.duty=='3' }">管理员用户</c:if>
						</div>
					</div>
					<div class="float-right">
						<c:if test="${duty==3 }">
							<!-- <div class="dropdown dib">
								<div class="header-icon" data-toggle="dropdown">
									<span class="user-avatar" onclick="addUser5()">单位编辑 </span>
								</div>
							</div>
							<div class="dropdown dib">
								<div class="header-icon" data-toggle="dropdown">
									<span class="user-avatar" onclick="addUser4()">单位添加 </span>
								</div>
							</div>
							<div class="dropdown dib">
								<div class="header-icon" data-toggle="dropdown">
									<span class="user-avatar" onclick="addUser8()">人员录入 </span>
								</div>
							</div> -->
						</c:if>
						<c:if test="${duty!=1 }">
							<!-- <div class="dropdown dib">
								<div class="header-icon" data-toggle="dropdown">
									<span class="user-avatar" onclick="addUser9()">人员查看</span>
								</div>
							</div> -->
							<!-- <div class="dropdown dib">
							<div class="header-icon" data-toggle="dropdown">
								<span class="user-avatar" onclick="addUser7()">用户编辑</span>
							</div>
						</div>  -->
						</c:if>
						<c:if test="${duty!=1 }">
						</c:if>
						<div class="dropdown dib">
							<div class="header-icon" data-toggle="dropdown">
								<span class="user-avatar">${emp.name} <i
									class="ti-angle-down f-s-10"></i>
								</span>
								<div
									class="drop-down dropdown-profile dropdown-menu dropdown-menu-right">
									<div class="dropdown-content-heading">
										<span class="text-left" onclick="removelogin()">注销</span>
									</div>
									<div class="dropdown-content-heading">
										<!-- <span class="text-left" onclick="removelogin2()">修改密码</span> -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 模态框 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">管理员添加</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<form action="addEmployee.action" method="post">
						<div class="form-group">
							<label>用户名称</label> <input type="text" class="form-control"
								name="name" required="required" />
						</div>
						<div class="form-group">
							<label>用户账号</label> <input type="text" class="form-control"
								name="username" required="required" />
						</div>
						<div>
							<label>用户密码</label> <input type="password" class="form-control"
								name="password" required="required" />
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
	<!-- 模态框 2-->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">单位用户添加</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<form action="addEmployee.action" method="post">
						<div class="form-group">
							<label>单位名称</label> <select name="uid" id="uid"
								class="form-control">
								<c:forEach items="${unitlist }" var="list">
									<option value="${list.name }">${list.name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label>用户名称</label> <input type="text" class="form-control"
								name="name" required="required" />
						</div>
						<div class="form-group">
							<label>用户账号</label> <input type="text" class="form-control"
								name="username" required="required" />
						</div>
						<div>
							<label>用户密码</label> <input type="password" class="form-control"
								name="password" required="required" />
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
	<!-- 模态框3 -->
	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">管理员添加</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<form action="addUnit" method="post">
						<div class="form-group">
							<label>单位类型</label> <input type="text" class="form-control"
								name="type" required="required" />
						</div>
						<div class="form-group">
							<label>单位名称</label> <input type="text" class="form-control"
								name="name" required="required" />
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-primary">添加</button>
						</div>
					</form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- 模态框4 -->
	<div class="modal fade" id="myModal4" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">管理员添加</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<form action="addUnit.action" method="post">
						<div class="form-group">
							<label>单位类型</label> <select name="type">
								<option value="0" selected="selected">事业单位</option>
								<option value="1">机关单位</option>
							</select>
						</div>
						<div class="form-group">
							<label>单位名称</label> <input type="text" class="form-control"
								id="name" name="name" required="required" />
						</div>
						<div class="form-group">
							<label>单位代码</label> <input type="text" class="form-control"
								id="code" name="code" />
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-primary">添加</button>
						</div>
					</form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
</body>
</html>