<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
<form action="<%=request.getContextPath()%>/SaleServer?op=byMore" method="post">
<span>输入关键字：</span><input type="search" name="wordkey"/>
<select name = "type">
<option value="1">商店名字</option>
<option value="2">销售Id</option>
<option value="3">商品名</option>
 
</select>
<input type="submit" value="查询"/> 
</form>
<div>
<a href="<%=request.getContextPath()%>/Supermanager/show.jsp">首页</a>
<a href="<%=request.getContextPath()%>/ShopManager/ShopMain.jsp">返回</a>
<c:forEach items="${requestScope.sales}" var="sales">
<div>
<form action="<%=request.getContextPath()%>/SaleServer?op=byId" method="post">
 <span>销售ID: </span><c:out value="${sales.saleId }"></c:out>
 <span>商品名: </span><c:out value="${sales.produceName  }"></c:out>
 <span>销售价格: </span><c:out value="${sales.salePrice }"></c:out>
 <span>销售数量: </span><c:out value="${sales.saleNum }"></c:out>
 <span>总金额: </span><c:out value="${sales.proceeds }"></c:out>
 <span>销售时间: </span><c:out value="${sales.saleTime }"></c:out> 
 <span>商店名字: </span><c:out value="${sales.shopName }"></c:out>

<!-- <input type="submit" value="修改"/>  -->
 
</form>
</div>
</c:forEach>
</div>

</body>
</html>