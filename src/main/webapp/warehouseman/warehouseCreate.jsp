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
<c:forEach items="${requestScope.procurement}" var="procurement">
<div>
<form action="<%=request.getContextPath()%>/inventoryServer?op=showCreate" method="post">

<input type="hidden" value="<c:out value="${ procurement.procurementId}"></c:out>" name="procurementId"/>
<span>采购数量: </span><c:out value="${procurement.procurementNum}"></c:out>
<span>采购的价格:</span><c:out value="${ procurement.procurementPrice}"></c:out>
<span>采购时间: </span><c:out value="${ procurement.procurementTime}"></c:out>
<span>采购的商品: </span><c:out value="${ procurement.produceName}"></c:out>
<span>采购员工: </span><c:out value="${ procurement.employeeName}"></c:out>	 
<input type="hidden" name="produceId" value="<c:out value="${ procurement.produceId}"></c:out>"/>		 

<input type="submit" value="入库"/> 
 
</form>
</div>
</c:forEach>
<div>
<c:forEach begin="1" end="${requestScope.allPage}" var="pv">
	<a href="<%=request.getContextPath()%>/inventoryServer?op=showprocurement&position=${pv }">[<c:out value="${pv }"></c:out>]</a>
</c:forEach>

</div>

</body>
</html>