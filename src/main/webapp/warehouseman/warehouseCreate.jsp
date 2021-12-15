<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		 
		<link rel="stylesheet" type="text/css" href="static/admin/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="static/admin/css/admin.css" />
		<style type="text/css">
		#sub,#btn{
			    display: inline-block;
			    height: 38px;
			    line-height: 38px;
			    padding: 0 10px;
			    background-color: #009688;
			    color: #000;
			    white-space: nowrap;
			    text-align: center;
			    font-size: 14px;
			    border: none;
			    border-radius: 2px;
			    cursor: pointer;
			    opacity: .9;
		} 
		#route{
			 display: inline-block;
			    height: 38px;
			    line-height: 38px;
			    padding: 0 10px;
			    background-color: #009688;
			    color: #fff;
			    white-space: nowrap;
			    text-align: center;
			    font-size: 14px;
			    border: none;
			    border-radius: 2px;
			    cursor: pointer;
			    opacity: .9;    
		}
	 
		</style>
</head>
<body>
<div class="layui-tab">
						<ul class="layui-tab-title">
							<li class="layui-this">入库列表</li>
						</ul>
<%-- <c:forEach items="${requestScope.procurement}" var="procurement"> --%>
<div>
<form action="<%=request.getContextPath()%>/inventoryServer?op=showCreate" method="post">  
<table class="layui-table" >			 
						<tr> 
							<th>采购数量</th>
							<th>采购的价格</th>
							<th>采购时间</th>
							<th>采购供应商</th>
							<th>采购的商品</th>
							<th>采购员</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${requestScope.procurement}" var="procurement">
						<tr>
							<td ><c:out  value="${procurement.procurementNum}"></c:out></td>
							<td > <c:out value="${procurement.procurementPrice}"></c:out></td>
							<td><c:out value="${procurement.procurementTime}"></c:out></td>
							<td > <c:out value="${procurement.procurementSuppliers}"></c:out></td>
							<td><c:out value="${procurement.produceName}"></c:out></td>
							<td><c:out value="${procurement.employeeName}"></c:out></td>
							<td>
							<input type="hidden" value="<c:out value="${ procurement.procurementId}"></c:out>" name="procurementId"/>
							<input type="hidden" name="produceId" value="<c:out value="${ procurement.produceId}"></c:out>"/>	
								 <input type="submit" id="sub" value="入库"/>  
								<a id="btn" href="<%=request.getContextPath()%>/procurementServer?op=byId&procurementId=${procurement.procurementId }">
								查看</a> 
							</td>
						</tr>
						</c:forEach>
				</table> 					 
</form> 
</div>
<%-- </c:forEach> --%>
 
</div>
<%-- </head>
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
</c:forEach> --%>
<div>
<c:forEach begin="1" end="${requestScope.allPage}" var="pv">
	<a id="route" href="<%=request.getContextPath()%>/inventoryServer?op=showprocurement&position=${pv }">[<c:out value="${pv }"></c:out>]</a>
</c:forEach>

</div>

</body>
</html>