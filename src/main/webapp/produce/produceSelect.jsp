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
<a href="<%=request.getContextPath()%>/produce/produceMain.jsp">首页</a>
<c:forEach items="${requestScope.produce}" var="produce">
<div>
<form action="<%=request.getContextPath()%>/routeServer?op=produceManager" method="post">
<a href="<%=request.getContextPath()%>/commodityServer?op=byId&produceId=${produce.produceId}">
<span>商品id</span><c:out value="${ produce.produceId}"></c:out>
<input type="hidden" value="<c:out value="${ produce.produceId}"></c:out>" name="produceId"/>
<span>商品名</span><c:out value="${ produce.produceName}"></c:out>
<span>商品码</span><c:out value="${ produce.produceISBN}"></c:out>
<span>员工id</span><c:out value="${ produce.employeeId}"></c:out>
</a>
<input type="submit" value="采购"/>
</form>
</div>
</c:forEach>
</div>
<c:forEach begin="1" end="${requestScope.allPage}" var="pv">
	<a href="<%=request.getContextPath()%>/commodityServer?op=selectAll&position=${pv }">[<c:out value="${pv }"></c:out>]</a>
</c:forEach>
</body>
</html>