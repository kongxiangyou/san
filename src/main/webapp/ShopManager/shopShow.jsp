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
<div>
<form action="<%=request.getContextPath()%>/ShopServer?op=byMore" method="post">
<span>输入关键字：</span><input type="search" name="wordkey"/>
<select name = "type">
<option value="1">商店名字</option>
<option value="2">商店电话</option>
<option value="3">商店地址</option>
 
</select>
<input type="submit" value="查询"/> 
</form>
<div>
<a href="<%=request.getContextPath()%>/Supermanager/show.jsp">首页</a>
<a href="<%=request.getContextPath()%>/ShopManager/ShopMain.jsp">返回</a>
<c:forEach items="${requestScope.shops}" var="shops">
<div>
<form action="<%=request.getContextPath()%>/ShopServer?op=byId" method="post">
 
<span>商店名字: </span><c:out value="${shops.shopName }"></c:out>
<input type="hidden" value="<c:out value="${shops.shopId  }"></c:out>" name="shopId"/>
<span>商店电话: </span><c:out value="${shops.shopPhone }"></c:out>
<span>商店地址:</span><c:out value="${ shops.shopAddress}"></c:out> 

<input type="submit" value="修改"/> 
 <a href="<%=request.getContextPath()%>/ShopServer?op=set&shopId=${shops.shopId  }">招聘</a>
</form>
</div>
</c:forEach>
</div>
<c:forEach begin="1" end="${requestScope.allPage}" var="pv">
	<a href="<%=request.getContextPath()%>/ShopServer?op=list&position=${pv }">[<c:out value="${pv }"></c:out>]</a>
</c:forEach>

</div>
</body>
</html>