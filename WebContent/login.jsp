<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>科技管理系统</title>


<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="css/component.css" />
	<style type="text/css">
		body{
			font-family:"Microsoft YaHei",微软雅黑,"Times New Roman",Georgia,Serif;
			background:url(img/1.jpg);
		}
	</style>
    </head>
    <body>
   		<div class="container demo-1">
			<div class="content">
				<div id="large-header" class="large-header">
					<canvas id="demo-canvas"></canvas>
					<div class="logo_box">
						<h3>浙江省自然资源厅科技管理系统</h3>
						<form role="form" action="login.action" method="post" class="login-form">
							<div class="input_outer">
								<span class="u_user"></span>
								<input value="1234566" name="username" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入账户">
							</div>
							<div class="input_outer">
								<span class="us_uer"></span>
								<input value="123" name="password" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;"value="" type="password" placeholder="请输入密码">
							</div>
							<div class="mb2">
							<button type="submit" class="act-but submit" style="border:none;width:335px;color:white;height:50px">登录</button>
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div><!-- /container -->
		<script src="js/TweenLite.min.js"></script>
		<script src="js/EasePack.min.js"></script>
		<script src="js/rAF.js"></script>
		<script src="js/demo-1.js"></script>
      

    </body>

</html>