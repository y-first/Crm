<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
.container-fluid{
background-color: #fbfbfb;
}
li{
font-size: 10px;
}
.r-b {
    background: #ffffff;
    margin: 30px 30px 30px 30px;
    padding: 20px;
    border: 1px solid #e7e7e7;
    border-radius: 3px;
    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
}
body {font-family: "Microsoft YaHei";}
</style>

		
<!-- 模板页 -->
</head>
<body>
	<div class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
			<div class="nano">
				<div class="nano-content">
					<div class="logo" style="height:70px">
							<a href="index.html">
								<span>科技管理系统</span>
							</a>
						</div>
					<ul>
						<li class="label"><a href="homepage.action"><i class="ti-home"></i>首頁</a></li>
						<c:if test="${emp.duty == 1}">
							<li><a class="sidebar-sub-toggle">
									<i class="ti-user"></i>个人信息<span class="sidebar-collapse-icon ti-angle-down"></span></a>
								<ul>
									<li><a href="PselectByid.action?id=${emp.pid }">  个人信息编辑
									</a></li>
									
									
								</ul></li>
						</c:if>

						<c:if test="${emp.duty == 2 }">
							<li><a class="sidebar-sub-toggle">
									<i class="ti-desktop"></i> 权限管理 <span class="sidebar-collapse-icon ti-angle-down"></span></a>
								<ul>
									
									<li><a href="personnel.jsp">
											人员录入
									</a></li>
									<li><a href="personnellist.action">
											人员查看
									</a></li>
								</ul></li>
							<li><a class="sidebar-sub-toggle">
									<i class="ti-desktop"></i> 科技项目管理<span class="sidebar-collapse-icon ti-angle-down"></span></a>
								<ul>
									<li><a href="projectadd.jsp">科技项目录入
									</a></li>
									<li><a href="Projecteditor.jsp">
											 科技项目查询
									</a></li>
									<li><a href="start.action?uid=${emp.uid}&&duty=${emp.duty}">
											科技项目 统计
									</a></li>
								</ul></li>
							<li><a class="sidebar-sub-toggle">
									<i class="ti-cup"></i> 科技成果管理 <span class="sidebar-collapse-icon ti-angle-down"></span></a>
								<ul>
									<li><a href="achievementadd.jsp">科技成果录入
									</a></li>
									<li><a href="Achievmentfindall.action">  科技成果查询
									</a></li>
								</ul></li>
							<li><a class="sidebar-sub-toggle">
									<i class="ti-book"></i> 教育培训 <span class="sidebar-collapse-icon ti-angle-down"></span></a>
								<ul>
							 	<li><a href="trainingadd.jsp"> 单位培训计划导入
									</a></li>
									<li><a href="courseadd.jsp"> 培训课程录入
									</a></li>
									<li><a
										href="Trainingfindall.action?uid=${emp.uid}&&duty=${emp.duty}" >
											 培训计划查看
									</a></li>
									<li><a
										href="Trainingfindall2.action?uid=${emp.uid}&&duty=${emp.duty}" >
											 培训计划上报
									</a></li>
									<li><a href="edstart.action?uid=${emp.uid}&&duty=${emp.duty}">培训计划统计</a></li>
								</ul></li>
							<li><a class="sidebar-sub-toggle">
									<i class="ti-world"></i> 外事工作 <span class="sidebar-collapse-icon ti-angle-down"></span></a>
								<ul >
								   <%--  <li><a href="personnellist.action?uid=${uid }">人员信息查看
									</a></li> --%>
									<li><a href="print.action?uid=${uid }">出国人员表打印
									</a></li>
								<li><a href="budgetsummaryfindall.action?uid=${uid}">出国预算汇总导出
									</a></li>
									<li><a href="abyg.action?uid=${uid}">
											出国预算预估导出
									</a></li>
								</ul></li>
							<li><a class="sidebar-sub-toggle">
									<i class="ti-panel"></i> 社团管理 <span class="sidebar-collapse-icon ti-angle-down"></span></a>
								<ul>
									<li><a href="add.jsp">社团信息登记
									</a></li>
									<li><a
										href="clubselect.action?uid=${emp.uid }&&duty=${emp.duty}">社团信息查询
									</a></li>
								</ul></li>
						</c:if>
						<c:if test="${ emp.duty == 3}">
							<li><a class="sidebar-sub-toggle">
									<i class="ti-desktop"></i> 权限管理 <span class="sidebar-collapse-icon ti-angle-down"></span></a>
								<ul>
									<li><a href="unitfindall.action?id=0">单位编辑
									</a></li>
									<li><a href="test.jsp">单位添加
									</a></li>
									<li><a href="personnel.jsp">
											人员录入
									</a></li>
									<li><a href="personnellist.action">
											人员查看
									</a></li>
								</ul></li>
							<li><a class="sidebar-sub-toggle">
									<i class="ti-desktop"></i> 科技项目管理 <span class="sidebar-collapse-icon ti-angle-down"></span></a>
								<ul>
									<li><a href="projectadd.jsp">科技项目录入
									</a></li>
									<li><a href="projectadds.jsp">科技项目批量导入
									</a></li>
									<li><a href="Projecteditor.jsp">
											科技项目查询
									</a></li>
									<li><a href="start.action?uid=${emp.uid}&&duty=${emp.duty}">
											科技项目统计
									</a></li>
								</ul></li>
							<li><a class="sidebar-sub-toggle">
									<i class="ti-cup"></i> 科技成果管理 <span class="sidebar-collapse-icon ti-angle-down"></span></a>
								<ul>
									<li><a href="achievementadd.jsp">科技成果录入
									</a></li>
									<li><a href="achievementadds.jsp">科技成果批量导入
									</a></li>
									<li><a href="Achievmentfindall.action">科技成果查询
									</a></li>
								</ul></li>
							<li><a class="sidebar-sub-toggle">
									<i class="ti-book"></i>教育培训 <span class="sidebar-collapse-icon ti-angle-down"></span></a>
								<ul>
									<li><a href="trainingadd.jsp">年度计划录入
									</a></li>
									<li><a href="trainingadds.jsp">年度计划批量导入
									</a></li>
									<li><a
										href="Trainingfindall.action?duty=${emp.duty}">
											 年度计划查询
									</a></li>
									<li><a href="edstart.action?duty=${emp.duty}"> 年度计划统计</a></li>
								</ul></li>
							<li><a class="sidebar-sub-toggle">
									<i class="ti-world"></i> 外事工作 <span class="sidebar-collapse-icon ti-angle-down"></span></a>
								<ul>
									<li><a href="groupadd.jsp">年度团组计划登记
									</a></li>
									<li><a href="groupfindall.action">年度团组计划查询
									</a></li>
									<li><a href="print.action">出国人员表打印
									</a></li>
								 	<li><a href="budgetsummaryfindall.action">出国预算汇总导出
									</a></li> 
									<li><a href="abyg.action">出国预算预估导出
									</a></li>
								</ul></li>
							<li><a class="sidebar-sub-toggle">
									<i class="ti-panel"></i> 社团管理 <span class="sidebar-collapse-icon ti-angle-down"></span></a>
								<ul>
									<li><a href="add.jsp">社团信息登记
									</a></li>
									<li><a
										href="clubselect.action?uid=${emp.uid }&&duty=${emp.duty}">社团信息查询
									</a></li>
								</ul></li>
			
						</c:if>
					</ul>
				</div>
			</div>
	</div>
</body>
</html>