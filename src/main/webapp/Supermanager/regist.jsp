<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%-- <head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/wangEditor.min.js"></script>
	<!-- 引入JSTL标签库 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
<div id="head"><h3>员工创建</h3></div>
<div>
<div><img alt="" src="/Myimg/${requestScope.fileName}.jpg" width="100px" height="100px"/></div>
<form action="<%=request.getContextPath()%>/EmployeeServer?op=joblist" enctype="multipart/form-data" method="post">
  选择图片： <input type="file" name = "myfile"/>   
   <input type="submit" value="确认提交"/>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
</form>
<form action="<%=request.getContextPath()%>/EmployeeServer?op=create" method="post">
   <!--  <div><img alt="" src="/img/ia_300000001.jpg" width="10%"/></div> -->
   <input type="hidden" name ="pciture" value="/Myimg/${requestScope.fileName}.jpg" />
<div><span>工号：</span><input type="text" name ="employeeCode" /></div>
<div><span>姓名：</span><input type="text" name ="employeeName" /></div>
<div><span>密码：</span><input type="text" name ="employeePassword" /></div>

<div><span>性别：</span>
		<input type="radio" name ="employeeGender" value="男" />男
		<input type="radio" name ="employeeGender" value="女"/>女
</div>

<div><span>电话：</span><input type="text" name ="employeePhone" maxlength="11"/></div>
<div><span>邮件：</span><input type="text" name ="employeeEmail" /></div>
<div><span>出生日期：</span><input type="date" name ="employeeBrithday"  /></div>
<div><span>身份证：</span><input type="text" name ="employeeIdentity" maxlength="18"/></div>

<div>
<span>工作状态：</span>
<select  name ="employeeState" >
	<option>在职</option>
	<option>离职</option>
	<option>休假</option>
	<option>其他</option>
</select>
</div>

<span>简介：</span>
<div id="myEditor" style="width: 600px;margin: 0 auto;">
</div>
<input type="hidden" id="employeeIntroduction" name ="employeeIntroduction" />
<div><span>家庭地址：</span><textarea cols="20" rows="2"  name ="employeeAddress" ></textarea></div>

<div><span>学历：</span>
<select  name ="employeeEducation" >
		<option>小学</option>
		<option>中学</option>
		<option>高中</option>
		<option>中专</option>
		<option>大专</option>
		<option>本科</option>
		<option>硕士</option>
		<option>博士</option>
		</select>
</div>

<div><span>职位：</span>
	<select  name ="employeeJobName" >
		<c:forEach items="${requestScope.employeeJobs}" var="employeeJob">
	
	<option><c:out value="${employeeJob.employeeJobName}"></c:out> </option>
	
	</c:forEach>
	</select>
</div>
<div><span>职位描述：</span><textarea cols="20" rows="5" name ="employeeDescribe" ></textarea></div>

<input type="submit"  value="创建" onclick="showEditorContent()" />
</form>
</div>
<script type="text/javascript">

		
		const E = window.wangEditor;
		const editor = new E('#myEditor');
		// 设置编辑区域高度为 500px
		editor.config.height = 300;
		editor.create();
		var employeeIntroduction = document.getElementById("employeeIntroduction");
		//显示editor的内容
		function showEditorContent(){
			employeeIntroduction.value = editor.txt.text();
			//alert(employeeIntroduction);
		}
		 
	</script>
</body> --%>
<head>
		<meta charset="UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>网站后台管理模版</title>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/js/wangEditor.min.js"></script>
			<!-- 引入JSTL标签库 -->
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<link rel="stylesheet" type="text/css" href="static/admin/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="static/admin/css/admin.css" />
		<style type="text/css">
		#sub{
			    display: inline-block;
			    height: 38px;
			    line-height: 38px;
			    padding: 0 18px;
			    background-color: #009688;
			    color: #fff;
			    white-space: nowrap;
			    text-align: center;
			    font-size: 14px;
			    border: none;
			    border-radius: 2px;
			    cursor: pointer;
			    opacity: .9;
		}
		</style>
	</head>

	<body>
		<div class="page-content-wrap clearfix">
		 
				  
					<!-- <div class="layui-tab"> -->
						<ul class="layui-tab-title">
							<li class="layui-this">员工创建</li>
						</ul>
						 
						
						<div><img alt="" src="/Myimg/${requestScope.fileName}.jpg" width="100px" height="100px"/></div>
					<form action="<%=request.getContextPath()%>/EmployeeServer?op=joblist" enctype="multipart/form-data" method="post">
					  选择图片： <input type="file" name = "myfile"/>   
					   <input type="submit" value="确认提交"/>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
					</form>
					
						 <form class="layui-form" action="<%=request.getContextPath()%>/EmployeeServer?op=create"   method="post" >
						
						<div class="layui-tab-content">
							 <input type="hidden" name ="pciture" value="/Myimg/${requestScope.fileName}.jpg" />
								<div class="layui-form-item">
									<label class="layui-form-label">工号：</label>
									<div class="layui-input-block">
										<input type="text" name="employeeCode" required lay-verify="required" placeholder="请输入工号" autocomplete="off" class="layui-input">
									</div>
								</div>
								
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">姓名：</label>
									<div class="layui-input-block">
									<input type="text" name="employeeName" required lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
										 
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">密码：</label>
									<div class="layui-input-block">
									<input type="text" name="employeePassword" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
										 
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">性别：</label>
									<div >
										<input type="radio" name ="employeeGender" value="男" title="男" />
										<input type="radio" name ="employeeGender" value="女" title="女"/>
									</div>
								</div>
								 
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">邮件：</label>
									<div class="layui-input-block">
									<input type="text" name="employeeEmail" required lay-verify="required" placeholder="请输入邮件" autocomplete="off" class="layui-input">
										 
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">电话：</label>
									<div class="layui-input-block">
									<input type="text" name="employeePhone" required lay-verify="required" placeholder="请输入电话" autocomplete="off" class="layui-input">
										 
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">出生日期：</label>
									<div class="layui-input-block">
									<input type="date" name="employeeBrithday" required lay-verify="required" placeholder="请输入出生日期" autocomplete="off" class="layui-input">
										 
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">身份证：</label>
									<div class="layui-input-block">
									<input type="text" name="employeeIdentity" maxlength="18" required lay-verify="required" placeholder="请输入身份证号" autocomplete="off" class="layui-input">
										 
									</div>
								</div>
 
 								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">简介：</label>
									<div class="layui-input-block">
										<div id="myEditor" style="width: 600px;">
										</div>
										 
									</div>
								</div>
								
								<div class="layui-form-item">
									<label class="layui-form-label">选择工作状态：</label>
									<div class="layui-input-block">
										<select name ="employeeState" lay-verify="required">
											<option value="">请选择状态</option>
											<option>在职</option>
											<option>离职</option>
											<option>休假</option>
											<option>其他</option>
										</select>
									</div>
								</div>
								 
								
								 
								<input type="hidden" id="employeeIntroduction" name ="employeeIntroduction" />
 								<div class="layui-form-item">
									<label class="layui-form-label">选择学历：</label>
									<div class="layui-input-block">
										<select name ="employeeEducation" lay-verify="required">
											<option value="">请选择学历</option>
											<option>小学</option>
											<option>中学</option>
											<option>高中</option>
											<option>中专</option>
											<option>大专</option>
											<option>本科</option>
											<option>硕士</option>
											<option>博士</option>
										</select>
									</div>
								</div>


								<div class="layui-form-item">
									<label class="layui-form-label">家庭地址：</label>
									<div class="layui-input-block">
										<input type="text" name="employeeAddress" placeholder="请输入家庭地址" autocomplete="off" class="layui-input">
									</div>
								</div>
	 
								<div class="layui-form-item">
									<label class="layui-form-label">选择职位：</label>
									<div class="layui-input-block">
										<select name ="employeeJobName" lay-verify="required">
											<option value="">请选择职位</option>
											<c:forEach items="${requestScope.employeeJobs}" var="employeeJob">
											
											<option><c:out value="${employeeJob.employeeJobName}"></c:out> </option>
											
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">职位描述：</label>
									<div class="layui-input-block">
										<textarea placeholder="请输入内容" name ="employeeDescribe"  class="layui-textarea"></textarea>
									</div>
								</div>
							</div>
							 
						 
					<div class="layui-form-item" style="padding-left: 10px;">
						<div class="layui-input-block">
							<input type="submit" onclick="showEditorContent()" id="sub" value="立即提交"  >
							<button type="reset" class="layui-btn layui-btn-primary">重置</button>
						</div>
					</div>
				</form>
		</div>
		 
		<script src="static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="static/admin/js/common.js" type="text/javascript" charset="utf-8"></script>
		<script>
		const E = window.wangEditor;
		const editor = new E('#myEditor');
		// 设置编辑区域高度为 500px
		editor.config.height = 100;
		editor.create();
		var employeeIntroduction = document.getElementById("employeeIntroduction");
		//显示editor的内容
		function showEditorContent(){
			employeeIntroduction.value = editor.txt.text();
			//alert(employeeIntroduction);
		}
			 
		</script>
	</body>
</html>