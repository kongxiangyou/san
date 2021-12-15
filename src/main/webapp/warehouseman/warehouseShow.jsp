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
		 
		#route,#route2{
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
<form action="<%=request.getContextPath()%>/inventoryServer?op=ByProduceId" method="post">
	<div class="layui-inline">
		<input type="text" name="produceName" required lay-verify="required" placeholder="请输入商品名" autocomplete="off" class="layui-input">
	</div>
	<input  type="submit" id="btn" value="查询" />
	<a id="route2" href="<%=request.getContextPath()%>/OutBoundServer?op=list">出库信息</a>
</form>

<div class="layui-tab">
						<ul class="layui-tab-title">
							<li class="layui-this">仓库列表</li>
						</ul>
<%-- <c:forEach items="${requestScope.inventory}" var="inventory"> --%>
<div>
<form action="<%=request.getContextPath()%>/OutBoundServer?op=set" method="post">  
<table class="layui-table" >			 
						<tr> 
							<th>入库数量</th>
							<th>入库的位置</th>
							<th>入库时间</th>
							<th>可以入库数</th>
							<th>商品</th>
							<th>库存</th>
							<th>记录数</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${requestScope.inventory}" var="inventory">
						<tr>
							<td ><c:out  value="${inventory.inventoryNum}"></c:out></td>
							<td > <c:out value="${inventory.inventoryPostion}"></c:out></td>
							<td><c:out value="${inventory.inventoryTime}"></c:out></td>
							<td > <c:out value="${inventory.inventoryRemain}"></c:out></td>
							<td><c:out value="${inventory.produceName}"></c:out></td>
							<td><c:out value="${inventory.produceNum}"></c:out></td>
							<td><c:out value="${inventory.allNum}"></c:out></td>
							
							<td>
							<input type="hidden" name="employeeId" value="<c:out value="${inventory.employeeId }"></c:out>"/>
							<input type="hidden" name="produceId" value="<c:out value="${inventory.produceId }"></c:out>"/>
							<input type="hidden" name="inventoryId" value="<c:out value="${inventory.inventoryId }"></c:out>"/>	
							 <input type="submit" id="sub" value="出库"/>  
								<a id="btn" href="<%=request.getContextPath()%>/inventoryServer?op=byId&inventoryId=${inventory.inventoryId }">
								查看
								</a> 
							</td>
						</tr>
						</c:forEach>
				</table> 					 
</form> 
</div>
<%-- </c:forEach> --%>
 </div>

<%-- <a href="<%=request.getContextPath()%>/warehouseman/warehousemain.jsp">返回</a>
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
<span> 员工Id: </span><c:out value="${inventory.employeeId }"></c:out>	
<input type="hidden" name="employeeId" value="<c:out value="${inventory.employeeId }"></c:out>"/>
 <span> 采购单Id: </span><c:out value="${ inventory.procurementId  }"></c:out>
  <span> 该商品的库存: </span><c:out value="${ inventory.produceNum }"></c:out>
   <span> 该商品曾入库: </span><c:out value="${ inventory.allNum  }"></c:out>
</a>
<input type="submit" value="出库"/> 
 
</form>
</div>
</c:forEach> --%>
<div>
<c:forEach begin="1" end="${requestScope.allPage}" var="pv">
	<a id="route" href="<%=request.getContextPath()%>/inventoryServer?op=list&position=${pv }">[<c:out value="${pv }"></c:out>]</a>
</c:forEach>

</div>
</body>
</html>