<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="<%=request.getContextPath()%>/warehouseman/warehouseShow.jsp">返回</a>
<a href="<%=request.getContextPath()%>/Supermanager/show.jsp">主页</a>
<div>
<ul>
<li><span>入库数量: </span> ${requestScope.inventory.inventoryNum }</li>
 <li><span>入库的位置:</span> ${requestScope.inventory.inventoryPostion }</li>
 <li><span> 入库时间: </span> ${requestScope.inventory.inventoryTime }</li>
 <li><span> 该商品还可以入库的数量: </span>${requestScope.inventory.inventoryRemain }</li>
<%--  <li><span> 商品ID: </span>${requestScope.inventory.produceId }</li> --%>
 <li><span> 商品: </span>${requestScope.inventory.produceName }</li>
 <li><span> 员工Id: </span>${requestScope.inventory.employeeId }</li>
 <li><span> 采购单Id: </span>${ requestScope.inventory.procurementId  }</li>
 <li> <span> 该商品的库存: </span>${ requestScope.inventory.produceNum }</li>
 <li><span> 该商品曾入库: </span>${ requestScope.inventory.allNum  }</li>
</ul>
</div>
</body>
</html>