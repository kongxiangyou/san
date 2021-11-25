<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
<div>
<a href="<%=request.getContextPath()%>/Supermanager/show.jsp">主页</a>
<div>
	<form action="<%=request.getContextPath()%>/EmployeeServer?op=moreSelect" method="post">
	<select name="type">
	<option value="1">工号</option>
	<option value="2">邮件</option>
	</select><input type="text" name="wordkey" />
	<span>职位：</span><select  name ="employeeJobName" >
		<c:forEach items="${requestScope.employeeJobs}" var="employeeJob">
	
	<option><c:out value="${employeeJob.employeeJobName}"></c:out> </option>
	
	</c:forEach>
	</select>
	<span>工作状态：</span>
	<select name ="employeeState" >
	<option>在职</option>
	<option>离职</option>
	<option>休假</option>
	<option>其他</option>
	</select>
	<input  type="submit" value="查询" />
	</form>
</div>

<div id="main">
<h3>员工列表</h3>
<c:forEach items="${requestScope.employees}" var="employee">
<div>

<form action="<%=request.getContextPath()%>/EmployeeServer?op=Code" method="post"> 
<input type="hidden" name ="employeeId" value="<c:out  value="${employee.employeeId}"></c:out> "/>
<span>工号：</span><input type="text" name ="employeeCode" value="<c:out  value="${employee.employeeCode}"></c:out>"/>
<span>姓名：</span><input type="text" name ="employeeName" value="<c:out value="${employee.employeeName}"></c:out>"/>
<span>性别：</span><input type="text" name ="employeeGender" value="<c:out value="${employee.employeeGender}"></c:out>"/>
<input type="submit" value="修改"/>
</form> 
</div>
</c:forEach>
<c:forEach begin="1" end="${requestScope.allPage}" var="pv">
	<a href="<%=request.getContextPath()%>/EmployeeServer?op=select&position=${pv }">[<c:out value="${pv }"></c:out>]</a>
</c:forEach>
</div>
</div>
</body>
</html>