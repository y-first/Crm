<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
</script>
</head>
<body>
<!-- 团组身份选择模态框 开始-->
<div class="modal fade" id="GroupStatusModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 300px;height:270px;margin-left: 50%;margin-top: 200px;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="GroupStatusModalLabel">请选择团组身份</h5>
					<!-- <button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;<tton> -->
				</div>
				<div class="modal-body">
					<div class="modal-body">
					<p>
						<select id="status" class="form-control">
							<option value="团长">团长</option>
							<option value="副团长">副团长</option>
							<option value="团员">团员</option>
							<option value="翻译">翻译</option>
						</select>
						</p>
						
					</div>
					<div class="modal-footer">
						
						<button type="button" id="groupSure" class="btn btn-default" data-dismiss="modal">
							确定</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">
							取消</button>
					</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
<!-- 团组身份选择模态框 结束开始-->
<!-- 提示模态框 开始-->
<div class="modal fade" id="alertModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 300px;height:270px;margin-left: 50%;margin-top: 200px;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">提示信息</h5>
					<!-- <button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;<tton> -->
				</div>
				<div class="modal-body">
					<div class="modal-body">
						<p>
						<h4 id="cfmMsg"></h4>
						</p>
					</div>
					<div class="modal-footer">
						<input type="hidden" id="submitUrl" />
						<button type="button" class="btn btn-default" data-dismiss="modal">
							确定</button>
							
					</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
<!-- 提示模态框 结束开始-->
	<!-- 确认模态框 开始-->
	<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">确认信息</h5>
				</div>
				<div class="modal-body">
					<div class="modal-body">
						<p>
						<h4 id="cfmMsg"></h4>
						</p>
					</div>
					<div class="modal-footer">
						<input type="hidden" id="submitUrl" />
						<button id="btn_sure" class="btn btn-success"
							data-dismiss="modal"
							style="background-color: grey; border: 1px solid grey; color: white"
							>确定</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">
							取消</button>

					</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- 确认模态框结束 -->
</body>
</html>