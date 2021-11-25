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
<form action="<%=request.getContextPath()%>/OutBoundServer?op=ByProduceName" method="post">
<span>请输入商品名：</span>
 
<input type="search" name="produceName"/>
<input type="submit" value="查询"/>
</form>
<c:forEach items="${requestScope.outbound}" var="outbound">
<div>
<form action="<%=request.getContextPath()%>/OutBoundServer?op=byId" method="post">
 <a href="<%=request.getContextPath()%>/OutBoundServer?op=byId&outboundId=${outbound.outboundId }">
<input type="hidden" name="outboundId" value="<c:out value="${outbound.outboundId }"></c:out>"/>
<span>出库数量: </span><c:out value="${outbound.outboundNum }"></c:out>
 
<span> 出库时间: </span><c:out value="${outbound.outboundTime }"></c:out>
 
<span> 商品: </span><c:out value="${outbound.produceName }"></c:out>
 
<span> 员工: </span><c:out value="${outbound.employeeName }"></c:out>	<%--   
 <span> 入库Id: </span><c:out value="${outbound.inventoryId }"></c:out> --%>
</a>
<input type="submit" value="查看"/> 

</form>
</div>
</c:forEach>
<div>
<c:forEach begin="1" end="${requestScope.allPage}" var="pv">
	<a href="<%=request.getContextPath()%>/OutBoundServer?op=list&position=${pv }">[<c:out value="${pv }"></c:out>]</a>
</c:forEach>

</div>
</body>
</html>