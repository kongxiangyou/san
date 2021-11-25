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
<a href="<%=request.getContextPath()%>/OutBoundServer?op=list">出库信息</a>
<form action="<%=request.getContextPath()%>/inventoryServer?op=ByProduceId" method="post">
<span>请输入商品名：</span>

<input type="search" name="produceName" />
<input type="submit" value="查询"/>
</form>
<c:forEach items="${requestScope.inventory}" var="inventory">
<div>
<form action="<%=request.getContextPath()%>/OutBoundServer?op=set" method="post">
 <a href="<%=request.getContextPath()%>/inventoryServer?op=byId&inventoryId=${inventory.inventoryId }">
<input type="hidden" name="inventoryId" value="<c:out value="${inventory.inventoryId }"></c:out>"/>
<span>入库数量: </span><c:out value="${inventory.inventoryNum }"></c:out>
<span>入库的位置:</span><c:out value="${ inventory.inventoryPostion }"></c:out>
<span> 入库时间: </span><c:out value="${inventory.inventoryTime }"></c:out>
<span> 该采购单的商品还可以入库的数量: </span><c:out value="${inventory.inventoryRemain }"></c:out>
<span> 商品: </span><c:out value="${inventory.produceName }"></c:out>
<input type="hidden" name="produceId" value="<c:out value="${inventory.produceId }"></c:out>"/>
<%-- <span> 员工Id: </span><c:out value="${inventory.employeeId }"></c:out> --%>	
<input type="hidden" name="employeeId" value="<c:out value="${inventory.employeeId }"></c:out>"/>
<%--  <span> 采购单Id: </span><c:out value="${ inventory.procurementId  }"></c:out> --%>
  <span> 该商品的库存: </span><c:out value="${ inventory.produceNum }"></c:out>
   <span> 该商品曾入库: </span><c:out value="${ inventory.allNum  }"></c:out>
</a>
<input type="submit" value="出库"/> 
 
</form>
</div>
</c:forEach>
<div>
<c:forEach begin="1" end="${requestScope.allPage}" var="pv">
	<a href="<%=request.getContextPath()%>/inventoryServer?op=list&position=${pv }">[<c:out value="${pv }"></c:out>]</a>
</c:forEach>

</div>
</body>
</html>