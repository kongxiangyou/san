<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="head">
<h1>仓库管理</h1>
</div>
<ul id="list">
<li><a href="<%=request.getContextPath()%>/inventoryServer?op=showprocurement">商品入库</a></li>
<li><a href="<%=request.getContextPath()%>/inventoryServer?op=list">商品出库</a></li>
<li><a href="<%=request.getContextPath()%>/Supermanager/show.jsp">首页</a></li>
</ul>
</body>
</html>