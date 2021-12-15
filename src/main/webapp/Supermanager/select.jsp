<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html class="iframe-h">
<head>
<meta charset="UTF-8">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		 
		<link rel="stylesheet" type="text/css" href="static/admin/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="static/admin/css/admin.css" />
		<style type="text/css">
		#sub,#btn{
			    display: inline-block;
			    height: 38px;
			    line-height: 38px;
			    padding: 0 10px;
			    background-color: #009688;
			    color: #000;
			    white-space: nowrap;
			    text-align: center;
			    font-size: 14px;
			    border: none;
			    border-radius: 2px;
			    cursor: pointer;
			    opacity: .9;
		}
		 
		#route{
			 display: inline-block;
			    height: 38px;
			    line-height: 38px;
			    padding: 0 10px;
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
		.select{
			 display: inline-block;
			    height: 38px;
			    line-height: 38px;
		}
		.select select{
			    font-size: 16px; 
			    border: none;
			    border-radius: 5px;
			    cursor: pointer;
		}
		</style>
</head>
<body>
<div>
<div>
	<form action="<%=request.getContextPath()%>/EmployeeServer?op=moreSelect" method="post">
	<div class="select">
		<select name="type" >
			<option value="-1">请选择</option>
			<option value="1">工号</option>
			<option value="2">邮件</option>
		</select>
	</div>
	<div class="layui-inline">
		<input type="text" name="wordkey" required lay-verify="required" placeholder="请输入工号或邮件" autocomplete="off" class="layui-input">
	</div>
	<div class="select">
		<select name="employeeJobName">
			<option value="-1">请选择职位</option>
			<c:forEach items="${requestScope.employeeJobs}" var="employeeJob">
			<option><c:out value="${employeeJob.employeeJobName}"></c:out> </option>
			</c:forEach>
		</select>
	</div>
		<div class="select">
		<select name="employeeState" >
			<option value="-1">请选择工作状态</option>
			<option>在职</option>
			<option>离职</option>
			<option>休假</option>
			<option>其他</option>
		</select>
	</div>
	<input  type="submit" id="btn" value="查询" />
	</form>
</div>
<div class="layui-tab">
						<ul class="layui-tab-title">
							<li class="layui-this">员工列表</li>
						</ul>
 <c:forEach items="${requestScope.employees}" var="employee">
<div>
<form action="<%=request.getContextPath()%>/EmployeeServer?op=Code" method="post">  
 
<table class="layui-table" >
						<tr> 
							<th >工号</th>
							<th >姓名</th>
							<th>性别</th>
							<th>操作</th>
						</tr>
						 
						<tr>
						
							<td ><c:out  value="${employee.employeeCode}"></c:out></td>
							<td > <c:out value="${employee.employeeName}"></c:out></td>
							<td><c:out value="${employee.employeeGender}"></c:out></td>
							<td>
							<input type="hidden" name ="employeeId" value="<c:out  value="${employee.employeeId}"></c:out> "/> 
							<input type="hidden" name ="employeeCode" value="<c:out  value="${employee.employeeCode}"></c:out>"/> 
								 <input type="submit" id="sub" value="修改"/>  
							</td>
					
						</tr>
					 
				</table> 
				 
</form> 
</div>
</c:forEach>
<c:forEach begin="1" end="${requestScope.allPage}" var="pv">
	<a id="route" href="<%=request.getContextPath()%>/EmployeeServer?op=select&position=${pv }">[<c:out value="${pv }"></c:out>]</a>
</c:forEach>
</div>
</div>
</body>  
</html>