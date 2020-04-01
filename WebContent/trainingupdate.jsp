<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
#notetext {
	height: 100px;
}
</style>
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
							<h1>
							<c:if test="${duty == '3' }">
								年度计划审核
							</c:if>
							<c:if test="${duty == '2' }">
								年度计划编辑
							</c:if>
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
									<form role="form" class="form-horizontal"
										action="trainingupdate.action?uid=${uid}&&duty=${duty}"
										method="post">
										<div class="row">
											<div class="col-lg-6">
												<div class="form-group">
													<label>会议名称</label> 
													<input type="hidden" class="form-control" id="id" value="${trainingu.id}"
														name="id" /> <input type="text" onBlur="blur2()"  class="form-control"
														id="name" value="${trainingu.name}" name="name" required="required"/>
												</div>
												<div class="form-group">
													<label>预举办地点</label> <input type="text"
														value="${trainingu.held}" class="form-control" id="held"
														name="held" required="required"/>
												</div>
												<div class="form-group">
													<label>计划经费</label> <input type="text" name="pfunds"
														value="${trainingu.pfunds}" class="form-control"
														required="required" />
												</div>
												<c:if test="${trainingu.examine=='审核通过'}">
												<div class="form-group">
													<label>实际举办地点</label> <input type="text"
														value="${trainingu.realhold}" class="form-control" id="realhold"
														name="realhold" required="required"/>
												</div>
												<div class="form-group">
													<label>实际经费</label>
													<input type="text" name="afunds" class="form-control"
														value="${trainingu.afunds}" required="required" />
												</div>
												</c:if>
												<div class="form-group">
													<label>培训对象</label>
													<input type="text" name="target" class="form-control" value="${trainingu.target}" />
												</div>
											</div>
											<div class="col-lg-6">
												<div class="form-group">
													<label>举办单位</label>
													<c:if test="${duty == '3' }">
														<select name="unitid" id="unitid" class="form-control">
															<c:forEach items="${unitlist}" var="list">
																<c:if test="${trainingu.unitid==list.id}">
																	<option value="${list.id }" selected="selected">${list.name }</option>
																</c:if>
																<c:if test="${trainingu.unitid!=list.id}">
																	<option value="${list.id }">${list.name }</option>
																</c:if>
															</c:forEach>
														</select>
													</c:if>
													<c:if test="${duty == '2' }">
													<select name="unitid" id="unitid" class="form-control">
															
																	<option value="${trainingu.unitid }" selected="selected">${trainingu.unitname }</option>
																
															
														</select>
														<%-- <input type="text" class="form-control input-lg"
															readonly="readonly" name="sposnor" placeholder="请输入单位"
															required value="${uid }"> --%>
													</c:if>
												</div>
												<div class="form-group">
													<label>预参与人数</label>
													<input type="text" name="participation"
														value="${trainingu.participation}" class="form-control" />
												</div>
												<div class="form-group">
													<label>预举办时间</label>
													<input type="date" name="ptime" class="form-control"
														value="${trainingu.p}" required="required" />
												</div>
												<c:if test="${trainingu.examine=='审核通过'}">
												<div class="form-group">
													<label>实际参与人数</label>
													<input type="text" name="realnum"
														value="${trainingu.realnum}" class="form-control" />
												</div>
												<div class="form-group">
													<label>实际举办时间</label> <input type="date" name="atime"
														value="${trainingu.a}" class="form-control"
														required="required" />
												</div>
												</c:if>
											</div>

										</div>
										<div class="row">
											<div class="col-lg-12">
												<div class="form-group">
													<label>备注</label>
													<textarea class="form-control" id="notetext" rows="8"
														cols="" name="note">${trainingu.note}</textarea>
												</div>
											</div>
										</div>
										<c:if test="${duty == '3' }">
											<div class="row">
											<div class="col-lg-12">
												<div class="form-group">
													<label>审核建议</label>
													<textarea class="form-control" id="notetext" rows="8"
														cols="" name="proposal">${trainingu.proposal}</textarea>
												</div>
											</div>
											<div class="col-lg-6">
												<div class="form-group">
													<label>审核</label>
													<select name="examine" id="examine" class="form-control">
														<c:if test="${trainingu.examine=='待审核'}">
															<option value="待审核" selected="selected">待审核</option>
															<option value="审核拒绝">审核拒绝</option>
															<option value="审核通过">审核通过</option>
														</c:if>
														<c:if test="${trainingu.examine=='审核拒绝'}">
															<option value="待审核">待审核</option>
															<option value="审核拒绝" selected="selected">审核拒绝</option>
															<option value="审核通过">审核通过</option>
														</c:if>
														<c:if test="${trainingu.examine=='审核通过'}">
															<option value="待审核">待审核</option>
															<option value="审核拒绝">审核拒绝</option>
															<option value="审核通过"  selected="selected">审核通过</option>
														</c:if>
													</select>
												</div>
											</div>
											</div>
										</c:if>
										<c:if test="${duty == '2' }">
											<div class="row">
											<div class="col-lg-12">
												<div class="form-group">
													<label>审核建议</label>
													<textarea class="form-control" id="notetext" rows="8" readonly="readonly"
														cols="" name="proposal">${trainingu.proposal}</textarea>
												</div>
											</div>
											</div>
										</c:if>
										<div class="row">
											<div class="col-lg-12">
												<div class="form-group">
													<div class="col-sm-offset-2 col-sm-10">
														<c:if test="${duty == '2' }">
															
																<button type="submit" class="btn btn-default" id="button">编辑</button>
															
														</c:if>
														<c:if test="${duty == '3' }">
															<button type="submit" class="btn btn-default" id="button">审核</button>
														</c:if>
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

