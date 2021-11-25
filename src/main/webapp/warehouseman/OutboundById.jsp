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
<a href="<%=request.getContextPath()%>/warehouseman/warehousemain.jsp">返回</a>
<a href="<%=request.getContextPath()%>/Supermanager/show.jsp">主页</a>
<div>
<span>出库数量: </span><c:out value="${outbound.outboundNum }"></c:out>
 
<span> 出库时间: </span><c:out value="${outbound.outboundTime }"></c:out>
 
<span> 商品: </span><c:out value="${outbound.produceName }"></c:out>
 
<span> 员工: </span><c:out value="${outbound.employeeName }"></c:out>	 <%--  
 <span> 入库Id: </span><c:out value="${outbound.inventoryId }"></c:out> --%>
</div>
</body>
</html>