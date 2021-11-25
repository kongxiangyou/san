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

<form action="<%=request.getContextPath()%>/procurementServer?op=byMore" method="post">
<span>输入关键字：</span><input type="search" name="wordkey"/>
<select name = "type">
<option value="1">商品编号</option>
<option value="2">商品名称</option>
<option value="3">采购员工号</option>
<option value="4">采购日期</option>
</select>
<input type="submit" value="查询"/> 
</form>
<div>
<a href="<%=request.getContextPath()%>/produce/produceMain.jsp">首页</a>
<c:forEach items="${requestScope.procurement}" var="procurement">
<div>
<form action="<%=request.getContextPath()%>/procurementServer?op=byId" method="post">
<a href="<%=request.getContextPath()%>/procurementServer?op=byId&procurementId=${procurement.procurementId }">
<%-- <span>采购id: </span><c:out value="${procurement.procurementId }"></c:out> --%>
<input type="hidden" value="<c:out value="${ procurement.procurementId}"></c:out>" name="procurementId"/>
<span>采购数量: </span><c:out value="${procurement.procurementNum}"></c:out>
<span>采购的价格:</span><c:out value="${ procurement.procurementPrice}"></c:out>
<span>采购时间: </span><c:out value="${ procurement.procurementTime}"></c:out>
<span>采购供应商: </span><c:out value="${ procurement.procurementSuppliers}"></c:out>
<span>采购的商品: </span><c:out value="${ procurement.produceName}"></c:out>
<span>采购员: </span><c:out value="${ procurement.employeeName}"></c:out>
</a>
<input type="submit" value="修改"/> 
 
</form>
</div>
</c:forEach>
</div>
<c:forEach begin="1" end="${requestScope.allPage}" var="pv">
	<a href="<%=request.getContextPath()%>/procurementServer?op=select&position=${pv }">[<c:out value="${pv }"></c:out>]</a>
</c:forEach>

</div>
</body>
</html>