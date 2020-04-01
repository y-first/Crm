<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="assets/css/lib/font-awesome.min.css" rel="stylesheet">
<link href="assets/css/lib/themify-icons.css" rel="stylesheet">
<link href="assets/css/lib/jsgrid/jsgrid-theme.min.css" rel="stylesheet" />
<link href="assets/css/lib/jsgrid/jsgrid.min.css" type="text/css"
	rel="stylesheet" />
<link href="assets/css/lib/menubar/sidebar.css" rel="stylesheet">
<link href="assets/css/lib/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/lib/helper.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">
<style type="text/css">
#serach {
	padding-bottom: 20px;
	padding-left: 20px;
}
</style>
</head>
<body>
	<%@ include file="model.jsp"%>
	<%@ include file="common.jsp"%>
	<%@ include file="nav.jsp"%>
		<input type="hidden" value="${name}" id="hd">
	<div class="content-wrap">
		<div class="main">
			<div class="row">
				<div class="col-lg-8 p-r-0 title-margin-right">
					<div class="page-header">
						<div class="page-title">
							<h1>培训课程管理</h1>
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
							<div class="card-title"></div>
							<div id="serach" class="form-inline">
									<div class="form-group" style="margin: 0 30px 0 0;">
										<label>请选择培训会议：</label> 
											<input type="hidden" name="unitid" id="unitid" value="${uid}" />
											<select id="trainingid" class="form-control" style="width:200px"></select>
									</div>
									
							</div>

							<div class="card-body" >
								<div class="basic-elements">
									<div class="card">
										<div class="jsgrid-table-panel">
											<div id="jsGrid"></div>
										</div>
										<div>
											<button id="btnDelete" type="button" class="btn btn-warning m-b-10 m-l-9" style="float:right">批量删除</button>
									</div>
									</div>
									
								</div>
							</div>
							<div id="serach" class="form-inline" style="margin:30px 0 0 0">
							<form onsubmit="return false" class="form-inline">
									<div class="form-group" style="margin: 0 30px 0 0;">
										<label>课程名称：</label> 
										<input type="text" id="coursename" required="required" class="form-control" />
									</div>
									<div class="form-group" style="margin: 0 30px 0 0;">
										<label>授课人员：</label> 
										<input type="text" id="teacher" class="form-control" required="required" />
									</div>
									<div class="form-group" style="margin: 0 30px 0 0;">
										<button type="submit" class="btn btn-default" id="btnCreate">创建课程</button>
									</div>
									<div class="form-group" style="margin: 0 30px 0 0;">
										<button type="button" class="btn btn-default" id="btnCancel" style="display:none">取消</button>
									</div>
								</form>
								
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
	<script src="assets/js/lib/jsgrid/jsgrid.core.js"></script>
    <script src="assets/js/lib/jsgrid/jsgrid.load-indicator.js"></script>
    <script src="assets/js/lib/jsgrid/jsgrid.load-strategies.js"></script>
    <script src="assets/js/lib/jsgrid/jsgrid.sort-strategies.js"></script>
    <script src="assets/js/lib/jsgrid/jsgrid.field.js"></script>
    <script src="assets/js/lib/jsgrid/fields/jsgrid.field.text.js"></script>
    <script src="assets/js/lib/jsgrid/fields/jsgrid.field.number.js"></script>
    <script src="assets/js/lib/jsgrid/fields/jsgrid.field.select.js"></script>
    <script src="assets/js/lib/jsgrid/fields/jsgrid.field.checkbox.js"></script>
    <script src="assets/js/lib/jsgrid/fields/jsgrid.field.control.js"></script>
	<script type="text/javascript">
		var isEdit=false; 
		var courseid="";
		var pageIndex=1;
		$(function(){
			//绑定会议
			trainingBind();
			$("#trainingid").change(function(){
				pageIndex=1;
				courseBind();
			});
			//取消按钮点击
			$("#btnCancel").click(function(){
				isEdit=false;
				$("#coursename").val("");
				$("#teacher").val("");
				$("#btnCreate").html("创建课程");
				$("#btnCancel").css("display","none");
			});
			
			//添加按钮点击
			$("#btnCreate").click(function(){
				var url="";
				var trainingid=$('#trainingid option:selected').val();
				var coursename=$("#coursename").val();
				var teacher=$("#teacher").val();
				if(coursename==""||teacher=="")
					return;
				var courseData="";
				if(isEdit){
					courseData={
							"coursename":coursename,
							"teacher":teacher,
							"trainingid":parseInt(trainingid),
							"id":parseInt(courseid)
							};
					url="EditCourseById.action";
				}else{
					url="CreateCourse.action";
					courseData={
							"coursename":coursename,
							"teacher":teacher,
							"trainingid":parseInt(trainingid)
							};
				}
				var jsonData = JSON.stringify(courseData);
				$.ajax({  
		            type:"post",  
		            url:url, 
		            dataType: "json",
		            contentType:"application/json;charset=utf-8",  
		            data:jsonData,
		            success:function(data){
		            	courseBind();
		            	isEdit=false;
						$("#coursename").val("");
						$("#teacher").val("");
						$("#btnCreate").html("创建课程");
						$("#btnCancel").css("display","none");
		            } ,
					error:function(data){
					    alert("后台发生异常！");
					} 
		        });
			});
			
			//批量删除
			$("#btnDelete").click(function(){
				pageIndex=$("span.jsgrid-pager-current-page").text();
				var cbs=$("input:checked").not("#cb");
				var checkNum = cbs.length;
	            if (checkNum == 0) {
	                return;
	            }
	            var userList = new Array();
	            cbs.each(function () {
	            	var $input=$(this).parent().parent().children("td:eq(1)").children("input:eq(0)");
    				courseid=$input.val();
	               	userList.push(courseid)
	             });
	          
				$.ajax({
	                type: "post",
	                url: "DeleteCourseByIds.action",
	                data: {userList: userList.toString()},
	                success: function (data) {
	                	courseBind();
	                },
	                error: function (data) {
	                    alert("后台发生异常！");
	                }
	            });
			});
		});
		function trainingBind(){
			var unitid=$("#unitid").val();
			var unitdata={"unitid":unitid}; 
		    var jsonData = JSON.stringify(unitdata);
			$.ajax({  
	            type:"post",  
	            url:"queryTraningInfoByUnitid.action", 
	            dataType: "json",
	            contentType:"application/json;charset=utf-8",  
	            data:jsonData,
	            success:function(data){
	            	//data是一个集合,所以需要先遍历
	                $.each(data,function(index,obj){
	                	var $option="<option value='"+obj['id']+"'>"+obj['name']+"</option>";
	                	$("#trainingid").append($option);
	                    
	                });
	                courseBind();
	            } ,
				error:function(data){
				    alert("后台发生异常！");
				} 
	        });
			
		}
		function courseBind(){
			var trainingid=$('#trainingid option:selected').val();
			
			var trainingData={"id":parseInt(trainingid)};
			var jsonData = JSON.stringify(trainingData);
			
			$.ajax({  
	            type:"post",  
	            url:"queryCourseByTrainingid.action",  
	            contentType:"application/json;charset=utf-8",  
	            data:jsonData,  
	            success:function(data){$("#jsGrid").html("");
	            	//console.log(data);
	            	var result = $.parseJSON(data);
	              //  console.log(result); 
	                var db = {loadData: function(filter) {
	                            return $.grep(result, function(temp) {
	                                return (!filter.coursename || temp.coursename.indexOf(filter.coursename) > -1)
	                                	&&(!filter.teacher || temp.teacher.indexOf(filter.teacher) > -1)
	                                    && (filter.index === undefined || temp.index === filter.index)
	                                    && (filter.id === undefined || temp.id === filter.id); 
	                            });
	                        },

	                    };
	                $("#jsGrid").jsGrid({
	                    height: "100%",
	                    width: "100%",
	                    filtering: false,
	                    editing: false,
	                    inserting: false,
	                    sorting: true,
	                    paging: true,
	                    pageIndex:pageIndex,
	                    autoload: true,
	                    pageSize: 5,
	                    pageButtonCount: 5,
	                    deleteConfirm: "Do you really want to delete the client?",
	                    controller: db,
	                    fields: [
	                    	{type:"checkbox",width:"15%",
	        					headerTemplate:function(){
	        						return ' <input type="checkbox" id="cb" />全选';
	        				}},
	        				{ name: "", width:0,
	        					headerTemplate:function(){
	    							return "";
	    						},
	    					 	itemTemplate: function(value, item) {
	    							$input="<input type='hidden' value='"+item.id+"' />";
	    					   		return $input;
	    						}
	    					},
	                        { name: "index", width: "10%",
	    						headerTemplate:function(){
    								return "序号";
    							}
	    					},
	                        { name: "coursename", width: "40%",
	    						headerTemplate:function(){
    								return "课程名称";
    							}
	                        },
	                        { name: "teacher", width: "25%",
	                        	headerTemplate:function(){
    								return "授课人员";
    							}
	                        },
	                        { type: "control",width:"10%",
	                        	itemTemplate: function(value, item) {
	       						 //console.log(value);
	       						
	       						var $result = $([]);

	       						if(this.editButton) {
	       							
	       							$result = $result.add(this._createEditButton(item));
	       							//console.log($result[0]);
	       						}

	       						if(this.deleteButton) {
	       							$result = $result.add(this._createDeleteButton(item));
	       						}

	       						return $result;
	       					} 
	                        }
	                    ]
	                });
	              /*   $('a').click(function(){
	                	alert();
	                }); */
	               
	                $('#jsGrid').on('click',"span[type='button']",function(){
	                	var $input=$(this).parent().parent().children("td:eq(1)").children("input:eq(0)");
	    				courseid=$input.val();
	    				var coursename=$(this).parent().parent().children("td:eq(3)").text();
	    				var teacher=$(this).parent().parent().children("td:eq(4)").text();
	    				var opera=$(this).attr("name");
	    				if(opera=="edit"){
	    					isEdit=true;
	    					$("#coursename").val(coursename);
	    					$("#teacher").val(teacher);
	    					$("#btnCreate").html("编辑");
	    					$("#btnCancel").css("display","block");

	    	                pageIndex=$("span.jsgrid-pager-current-page").text();
	    				}else if(opera=="delete"){

	    	                pageIndex=$("span.jsgrid-pager-current-page").text();
	    					var courseData={"id":parseInt(courseid)};
	    					var jsonData = JSON.stringify(courseData);
	    					$.ajax({  
	    			            type:"post",  
	    			            url:"DeleteCourseById.action", 
	    			            dataType: "json",
	    			            contentType:"application/json;charset=utf-8",  
	    			            data:jsonData,
	    			            success:function(data){
	    			            	courseBind();
	    			            } ,
	    						error:function(data){
	    						    alert("后台发生异常！");
	    						} 
	    			        });
	    				}
	                });
 					/* $("#jsGrid").on('click',"a",function(){
	                	
	    				alert();
	                }); */
	                $("#cb").click(function(){
	                	$(":checkbox").prop("checked", this.checked);
	                });
	                
	            },
				error:function(data){
				    alert("后台发生异常！");
				}
	        }); 
		} 
	</script>
</body>
</html>

