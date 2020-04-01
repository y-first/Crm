<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/homepage.css" rel="stylesheet" />
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<%@ include file="common.jsp"%>

			<div class="col-md-10" style="padding: 0;">
				<%@ include file="nav.jsp"%>
				<div class="r-m">
					<div>
						<i class="glyphicon glyphicon-th-list"></i>提醒
					</div>
				</div>
				<div class="r-b">
					<table class="table table-striped">
						<tr>
							<td>项目名称</td>
							<td>实施单位</td>
							<td>申报时间</td>
							<td>验收时间</td>
							<td>联系人</td>
							<td>项目剩余时间</td>
						</tr>
						<c:forEach items="${pro}" var="p">
							<c:if test="${p.time <10}">
								<tr style="background: red">
									<td>${p.name }</td>
									<td>${p.ework }</td>
									<td>${p.app}</td>
									<td>${p.acc}</td>
									<td>${p.linkman}</td>
									<td style="color: white">${ p.time}</td>
								</tr>
							</c:if>
							<c:if test="${p.time>10}">
								<tr>
									<td>${p.name }</td>
									<td>${p.ework }</td>
									<td>${p.app}</td>
									<td>${p.acc}</td>
									<td>${p.linkman}</td>
									<td>${ p.time}</td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
