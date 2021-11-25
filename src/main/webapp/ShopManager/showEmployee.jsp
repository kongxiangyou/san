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
<a href="<%=request.getContextPath()%>/Supermanager/show.jsp">首页</a>

<c:forEach items="${requestScope.shops}" var="shops">
<a href="<%=request.getContextPath()%>/ShopServer?op=set&shopId=${shops.shopId  }">返回</a>
<div>
<form action="<%=request.getContextPath()%>/ShopServer?op" method="post">
 
<span>商店名字: </span><c:out value="${shops.shopName }"></c:out>
<input type="hidden" value="<c:out value="${shops.shopId  }"></c:out>" name="shopId"/>
<span>商店电话: </span><c:out value="${shops.shopPhone }"></c:out>
<span>商店地址:</span><c:out value="${ shops.shopAddress}"></c:out> 
<span>店员: </span><c:out value="${shops.employeeName }"></c:out>
 
</form>
</div>
</c:forEach>


</body>
</html>