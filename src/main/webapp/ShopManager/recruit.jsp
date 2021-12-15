<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>网站后台管理模版</title>
		 
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
		<div class="layui-tab">
						<ul class="layui-tab-title">
							<li class="layui-this">应聘列表</li>
						</ul> 
<div>
<form action="<%=request.getContextPath()%>/ShopServer?op=recruit" method="post">  
<table class="layui-table" >			 
						<tr> 
							<th >姓名</th>
							<th>工号</th>
							<th >性别</th>
							<th>电话</th>
							<th >职位</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${requestScope.employees}" var="employees">
						<tr>
						    <td ><c:out  value="${employees.employeeName}"></c:out></td>
							<td > <c:out value="${employees.employeeCode}"></c:out></td>
							<td><c:out value="${employees.employeeGender}"></c:out></td>
							<td ><c:out  value="${employees.employeePhone}"></c:out></td>
							<td > <c:out value="${employees.employeeJobName}"></c:out></td>
							 
							<td>
							 <input type="hidden" value="<c:out value="${employees.employeeId  }"></c:out>" name="employeeId"/>	
							  <input type="hidden" value="<c:out value="${requestScope.shopId  }"></c:out>" name="shopId"/>
							  <input type="submit" id="sub" value="确定"/>  
							</td>
						</tr>
						</c:forEach>
				</table> 					 
</form> 
</div>
</div>
</body>
<%-- <body>
<a href="<%=request.getContextPath()%>/Supermanager/show.jsp">首页</a>
<a href="<%=request.getContextPath()%>/ShopServer?op=list">返回</a>
<c:forEach items="${requestScope.employees}" var="employees">
<div>
<form action="<%=request.getContextPath()%>/ShopServer?op=recruit" method="post">
<span>照片：</span><img alt="" src="${employees.pciture}"  width="100px" height="100px" />
 <input type="hidden" value="<c:out value="${employees.employeeId  }"></c:out>" name="employeeId"/>
<span>名字: </span><c:out value="${employees.employeeName }"></c:out>
<input type="hidden" value="<c:out value="${requestScope.shopId  }"></c:out>" name="shopId"/>
<span>工号: </span><c:out value="${employees.employeeCode }"></c:out>
<span>性别：</span><c:out value="${employees.employeeGender}"></c:out>

<span>电话：</span><c:out value="${employees.employeePhone}"></c:out>
<span>职位：</span><c:out value="${employees.employeeJobName}"></c:out>

<input type="submit" value="确定"/> 
  
</form>
</div>
</c:forEach>
</body> --%>
</html>