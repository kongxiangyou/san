<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="renderer" content="webkit">
  		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>网站后台管理模版</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/admin/layui/css/layui.css"/>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/admin/css/admin.css"/>
	<style type="text/css">
		#sub{
			    display: inline-block;
			    height: 38px;
			    line-height: 38px;
			    padding: 0 20px;
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
		#pciture{
			
		}
		</style>
</head>
<body>
	<ul class="layui-tab-title">
		    <li class="layui-this">修改资料</li>
		  </ul>
		  <div class="layui-tab-content">
		    <div class="layui-tab-item layui-show">
		    <c:forEach items="${requestScope.employees}" var="employee">
		    	<form class="layui-form" action="<%=request.getContextPath()%>/EmployeeServer?op=Update" method="post"  style="width: 90%;padding-top: 20px;">
				  <input type="hidden" name="pciture" value="<c:out value="${employee.pciture}"></c:out>"> 
				 <div class="layui-form-item">
				    <label class="layui-form-label">照片：</label>
				    <div class="layui-input-block">
				       <img alt="" src="${employee.pciture}"  width="100px" height="100px" />
				    </div>
				  </div>
					<div class="layui-form-item">
				    <label class="layui-form-label">ID：</label>
				    <div class="layui-input-block">
				      <input type="text" name="employeeId" disabled autocomplete="off" class="layui-input layui-disabled" value="<c:out value="${employee.employeeId}"></c:out>">
				    </div>
				  </div>
				  <input type="hidden" name="employeeCode" value="<c:out value="${employee.employeeCode}"></c:out>">
				  <div class="layui-form-item">
				    <label class="layui-form-label">工号：</label>
				    <div class="layui-input-block">
				      <input type="text" name="employeeCode" disabled autocomplete="off" class="layui-input layui-disabled" value="<c:out value="${employee.employeeCode}"></c:out> ">
				    </div>
				  </div>
				   <div class="layui-form-item">
				    <label class="layui-form-label">姓名：</label>
				    <div class="layui-input-block">
				      <input type="text" name="employeeName" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" value="<c:out value="${employee.employeeName}"></c:out> ">
				    </div>
				  </div>
				   <div class="layui-form-item">
				    <label class="layui-form-label">性别：</label>
				    <div class="layui-input-block">
				      <input type="text" name="employeeGender" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" value="<c:out value="${employee.employeeGender}"></c:out> ">
				    </div>
				  </div>
				   <div class="layui-form-item">
				    <label class="layui-form-label">电话：</label>
				    <div class="layui-input-block">
				      <input type="text" name="employeePhone" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" value="<c:out value="${employee.employeePhone}"></c:out> ">
				    </div>
				  </div>
				   <div class="layui-form-item">
				    <label class="layui-form-label">生日：</label>
				    <div class="layui-input-block">
				      <input type="text" name="employeeBrithday" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" value="<c:out value="${employee.employeeBrithday}"></c:out> ">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">邮箱：</label>
				    <div class="layui-input-block">
				      <input type="text" name="employeeEmail" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" value="<c:out value="${employee.employeeEmail}"></c:out>">
				    </div>
				  </div>
				  <div class="layui-form-item layui-form-text">
				    <label class="layui-form-label">身份证号：</label>
				    <div class="layui-input-block">
				       <input type="text" name="employeeIdentity" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" value="<c:out value="${employee.employeeIdentity}"></c:out>">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">状态：</label>
				    <div class="layui-input-block">
				      <input type="text" name="employeeState" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" value="<c:out value="${employee.employeeState}"></c:out>">
				    </div>
				  </div>
				  <div class="layui-form-item layui-form-text">
				    <label class="layui-form-label">简介：</label>
				    <div class="layui-input-block">
				      <textarea name="employeeIntroduction" placeholder="请输入内容" class="layui-textarea">
				      <c:out value="${employee.employeeIntroduction}"></c:out>
				      </textarea>
				    </div>
				  </div>
				   <div class="layui-form-item">
				    <label class="layui-form-label">地址：</label>
				    <div class="layui-input-block">
				      <input type="text" name="employeeAddress" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" value="<c:out value="${employee.employeeAddress}"></c:out>">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">学历：</label>
				    <div class="layui-input-block">
				      <input type="text" name="employeeEducation" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" value="<c:out value="${employee.employeeEducation}"></c:out>">
				    </div>
				  </div>
				  <input type="hidden" name="employeeJobId" value="<c:out value="${employee.employeeJobId}"></c:out>">
				  <div class="layui-form-item">
				    <label class="layui-form-label">职业：</label>
				    <div class="layui-input-block">
				      <input type="text" name="employeeJobName" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" value="<c:out value="${employee.employeeJobName}"></c:out>">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">职业描述：</label>
				    <div class="layui-input-block">
				      <input type="text" name="employeeDescribe" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" value="<c:out value="${employee.employeeDescribe}"></c:out>">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <div class="layui-input-block">
				       <input type="submit" id="sub" value="修改"/>  
				    </div>
				  </div>
				</form>
				</c:forEach>
		    </div>
		 </div>
<%-- <c:forEach items="${requestScope.employees}" var="employee">
<div>
 
<form action="<%=request.getContextPath()%>/EmployeeServer?op=Update" method="post">

 <input type="hidden" name="pciture" value="<c:out value="${employee.pciture}"></c:out>">

<div>照片：<img alt="" src="${employee.pciture}" width="100px" height="100px" /></div>
 <div> <c:out value="${employee.employeeId}"></c:out></div>
 
<input type="hidden" name="employeeCode" value="<c:out value="${employee.employeeCode}"></c:out>">

<div><c:out value="${employee.employeeCode}"></c:out></div>
<div><input type="text" name="employeeName" value="<c:out value="${employee.employeeName}"></c:out>"></div>

<div><input type="text" name="employeePassword" value="<c:out value="${employee.employeePassword}"></c:out>"></div>

<div><input type="text" name="employeeGender" value="<c:out value="${employee.employeeGender}"></c:out>"></div>

<div><input type="text" name="employeePhone" value="<c:out value="${employee.employeePhone}"></c:out>"></div>

<div><input type="text" name="employeeEmail" value="<c:out value="${employee.employeeEmail}"></c:out>"></div>

<div><input type="date" name="employeeBrithday" value="<c:out value="${employee.employeeBrithday}"></c:out>"></div>

<div><input type="text" name="employeeIdentity" value="<c:out value="${employee.employeeIdentity}"></c:out>"></div>

<div><input type="text" name="employeeState" value="<c:out value="${employee.employeeState}"></c:out>"></div>

<div><input type="text" name="employeeIntroduction" value="<c:out value="${employee.employeeIntroduction}"></c:out>"></div>

<div><input type="text" name="employeeAddress" value="<c:out value="${employee.employeeAddress}"></c:out>"></div>

<div><input type="text" name="employeeEducation" value="<c:out value="${employee.employeeEducation}"></c:out>"></div>

<div><input type="text" name="employeeJobId" disabled="disabled" value="<c:out value="${employee.employeeJobId}"></c:out>"></div>

<input type="hidden" name="employeeJobId" value="<c:out value="${employee.employeeJobId}"></c:out>">
<div><input type="text" name="employeeJobName" value="<c:out value="${employee.employeeJobName}"></c:out>"></div>
<div><input type="text" name="employeeDescribe" value="<c:out value="${employee.employeeDescribe}"></c:out>"></div>

<input type="submit" value="确定修改">
</form>
</div>
</c:forEach> --%>
</body>
</html>