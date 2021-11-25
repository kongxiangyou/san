<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<h3>店铺管理</h3>
<ul id="list">
<li><a href="<%=request.getContextPath()%>/ShopManager/shopCreate.jsp">创建商铺</a></li>
<li><a href="<%=request.getContextPath()%>/ShopServer?op=list">查看商铺信息</a></li>
<li><a href="<%=request.getContextPath()%>/ShopServer?op=show">查看商品信息</a></li>
<li><a href="<%=request.getContextPath()%>/SaleServer?op=set">查看商店库存信息</a></li>
<li><a href="<%=request.getContextPath()%>/Supermanager/show.jsp">首页</a></li>
</ul>
</div>
</body>
</html>