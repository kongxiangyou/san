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
<form action="<%=request.getContextPath()%>/OutBoundServer?op=ByProduceName" method="post">
	<div class="layui-inline">
		<input type="text" name="produceName" required lay-verify="required" placeholder="请输入商品名" autocomplete="off" class="layui-input">
	</div>
	<input  type="submit" id="btn" value="查询" />
</form>

<div class="layui-tab">
						<ul class="layui-tab-title">
							<li class="layui-this">出库列表</li>
						</ul>
<%-- <c:forEach items="${requestScope.outbound}" var="outbound"> --%>
<div>
<form action="<%=request.getContextPath()%>/OutBoundServer?op=byId" method="post">  
<table class="layui-table" >			 
						<tr> 
							<th>出库ID</th>
							<th>出库数量</th>
							<th>出库时间</th>
							<th>商品</th>
							<th>员工</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${requestScope.outbound}" var="outbound">
						<tr>
							<td ><c:out  value="${outbound.outboundId}"></c:out></td>
							<td > <c:out value="${outbound.outboundNum}"></c:out></td>
							<td><c:out value="${outbound.outboundTime}"></c:out></td>
							<td > <c:out value="${outbound.produceName}"></c:out></td>
							<td><c:out value="${outbound.employeeName}"></c:out></td>
							<td>
							<input type="hidden" name="outboundId" value="<c:out value="${outbound.outboundId }"></c:out>"/>
							 <input type="submit" id="sub" value="查看"/>  
								<%-- <a id="btn" href="<%=request.getContextPath()%>/OutBoundServer?op=byId&outboundId=${outbound.outboundId }">
								查看
								</a>  --%>
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
 
<span> 员工: </span><c:out value="${outbound.employeeName }"></c:out>	  
 <span> 入库Id: </span><c:out value="${outbound.inventoryId }"></c:out>
</a>
<input type="submit" value="查看"/> 

</form>
</div>
</c:forEach> --%>
<div>
<c:forEach begin="1" end="${requestScope.allPage}" var="pv">
	<a id="route" href="<%=request.getContextPath()%>/OutBoundServer?op=list&position=${pv }">[<c:out value="${pv }"></c:out>]</a>
</c:forEach>

</div>
</body>
</html>