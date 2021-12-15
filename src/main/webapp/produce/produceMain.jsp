<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/admin/layui/css/layui.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/admin/css/admin.css"/>
</head>
<body>
<div>
<%-- <h3>商品管理</h3>
<ul id="list">
<li><a href="<%=request.getContextPath()%>/produce/produceCreate.jsp">创建商品</a></li>
<li><a href="<%=request.getContextPath()%>/">修改商品信息</a></li>
<li><a href="<%=request.getContextPath()%>/commodityServer?op=selectAll">查看商品信息</a></li>
<li><a href="<%=request.getContextPath()%>/commodityServer?op=selectAll">采购商品</a></li>
<li><a href="<%=request.getContextPath()%>/routeServer?op=produceManager2">查看采购信息</a></li>
<li><a href="<%=request.getContextPath()%>/Supermanager/show.jsp">首页</a></li>
</ul> --%>
<jsp:include page="<%=request.getContextPath()%>/Supermanager/show.jsp"></jsp:include>
</div>
</body>
</html>