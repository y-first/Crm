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
						<i class="glyphicon glyphicon-th-list"></i> 推送
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
							<td colspan="2" style="text-align: center">操作</td>
						</tr>
						<c:forEach items="${pro}" var="p">
							<c:if test="${p.time<5&&p.time>0}">
								<tr style="background: red">
									<td>${p.name }</td>
									<td>${p.ework }</td>
									<td>${p.app}</td>
									<td>${p.acc}</td>
									<td>${p.linkman}</td>
									<td style="color: white">${ p.time}</td>
									<td><a href="#" style="color: white" onclick="remind(${p.id},${p.ework},&quot${p.linkman}&quot)">提醒</a></td>
									<td><a style="color:white">推送</a></td>
								</tr>
							</c:if>
							<c:if test="${p.time>5}">
								<tr>
									<td>${p.name }</td>
									<td>${p.ework }</td>
									<td>${p.app}</td>
									<td>${p.acc}</td>
									<td>${p.linkman}</td>
									<td>${p.time}</td>
									<td><a href="#" onclick='remind(${p.id},${p.ework},&quot${p.linkman}&quot)'>提醒</a></td>
									<td><a>推送</a></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
function remind(id,ework,linkman){
	$.post("remind.action",{"id":id,"ework":ework,"linkman":linkman},function(date){
		alert(date)
	}) 
}
</script>
</html>
