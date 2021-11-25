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
<h3>采购</h3>
<form action="<%=request.getContextPath()%>/procurementServer?op=create" method="post">
<div><span>采购的数量：</span><input type="text" name="procurementNum"/></div>
<div><span>采购的价格：</span><input type="text" name="procurementPrice"/></div>
<!-- <div><span>采购的供应商：</span><input type="text" name="procurementSuppliers"/></div> -->
<div><span>采购的供应商：</span>
<select name="procurementSuppliers">
<option value="-1">--请选择--</option>
<c:forEach items="${requestScope.suppliers}" var="supplier">
<option><c:out value="${supplier.supplierName}"></c:out></option>
</c:forEach>
</select>
</div>
<input type="hidden" value="<c:out value="${ requestScope.produceId}"></c:out>" name="produceId"/>
<input type="submit" value="确定"/>
</form>
</div>
</body>
</html>