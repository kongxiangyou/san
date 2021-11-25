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
<a href="<%=request.getContextPath()%>/Supermanager/show.jsp">首页</a>
<a href="<%=request.getContextPath()%>/ShopManager/ShopMain.jsp">返回</a>
<c:forEach items="${requestScope.produce}" var="produce">
<div>
<form action="<%=request.getContextPath()%>/" method="post">
 <span>商品id</span><c:out value="${ produce.produceId}"></c:out> 
<span>商品名：</span><c:out value="${ produce.produceName}"></c:out>
<span>商品码：</span><c:out value="${ produce.produceISBN}"></c:out>
<span>商品的描述：</span><c:out value="${ produce.produceDescribe}"></c:out>
<span>员工id：</span><c:out value="${ produce.employeeId}"></c:out>
<span>商店库存：</span><c:out value="${ produce.shopstoreNum}"></c:out>
<span>商店名字: </span><c:out value="${produce.shopName }"></c:out>

</form>
</div>
</c:forEach>
</div>
<c:forEach begin="1" end="${requestScope.allPage}" var="pv">
	<a href="<%=request.getContextPath()%>/ShopServer?op=show&position=${pv }">[<c:out value="${pv }"></c:out>]</a>
</c:forEach>

 
</body>
</html>