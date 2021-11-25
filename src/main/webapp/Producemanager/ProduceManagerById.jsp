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
<a href="<%=request.getContextPath()%>/procurementServer?op=select">返回</a>
<form action="<%=request.getContextPath()%>/procurementServer?op=update" method="post">

<span>采购id</span><c:out value="${requestScope.procurement.procurementId }"></c:out>
<input type="hidden" value="<c:out value="${ requestScope.procurement.procurementId}"></c:out>" name="procurementId"/>

<span>采购数量</span>
<input type="text" value="<c:out value="${ requestScope.procurement.procurementNum}">
</c:out>" name="procurementNum"/> 

<span>采购的价格</span>
<input type="text" value="<c:out value="${ requestScope.procurement.procurementPrice}">
</c:out>" name="procurementPrice"/> 
 
<span>采购时间</span>
<input type="text" value="<c:out value="${ requestScope.procurement.procurementTime}">
</c:out>" name="procurementTime"/> 

<span>采购的供应商</span>
<input type="text" value="<c:out value="${ requestScope.procurement.procurementSuppliers}">
</c:out>" name="procurementSuppliers"/> 
	
	<span>采购的商品</span>
<input type="text" value="<c:out value="${ requestScope.procurement.produceName}">
</c:out>" name="produceName"/> 

<span>采购的员工</span>
<input type="text" value="<c:out value="${ requestScope.procurement.employeeName}">
</c:out>" name="employeeName"/> 		 

<input type="submit" value="修改"/> 
<a href="<%=request.getContextPath()%>/procurementServer?op=delete&procurementId=${procurement.procurementId }">删除</a>
</form>
</body>
</html>