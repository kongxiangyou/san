<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{
		margin:0;
		padding:0;
	}
	#head{
		margin:10px,auto;
	}
	#list{
		link-syle:none;
	}
	#list li{
		display:link-black;
	}
</style>
</head>
<body>
<div id="head">
<h1>进销存系统</h1>
</div>
<ul id="list">
<li><a href="<%=request.getContextPath()%>/routeServer?op=employee">创建员工</a></li>
 <li><a href="<%=request.getContextPath()%>/Supermanager/updatePass.jsp">修改密码</a></li>
<li><a href="<%=request.getContextPath()%>/EmployeeServer?op=select">查看员工信息</a></li>
<li><a href="<%=request.getContextPath()%>/commodityServer?op=judge">商品管理</a></li>
<li><a href="<%=request.getContextPath()%>/routeServer?op=warehouse">仓库管理</a></li>
<li><a href="<%=request.getContextPath()%>/routeServer?op=shop">店铺管理</a></li>
 
<li><a href="<%=request.getContextPath()%>/login.jsp">退出</a></li>
</ul>
</body>
</html>