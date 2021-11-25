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
<form action="<%=request.getContextPath()%>/OutBoundServer?op=create" method="post">
<span>出库数量：</span><input type="text" name = "outboundNum"/>
<select name="shopName">
<c:forEach items="${requestScope.shops}" var="shops">
	
	<option><c:out value="${shops.shopName}"></c:out></option>

</c:forEach>
</select>
 
<input type ="hidden" name="inventoryId" value="${requestScope.inventory.inventoryId}"/>
<input type ="hidden" name="produceId" value="${requestScope.inventory.produceId}"/>
<input type ="hidden" name="employeeId" value="${requestScope.inventory.employeeId}"/>
<input type="submit" value="确定"/>

</form>
</div>
</body>
</html>