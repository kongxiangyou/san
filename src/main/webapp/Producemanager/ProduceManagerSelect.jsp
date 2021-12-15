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
		.select{
			 display: inline-block;
			    height: 38px;
			    line-height: 38px;
		}
		.select select{
			    font-size: 16px; 
			    border: none;
			    border-radius: 5px;
			    cursor: pointer;
		}
		</style>
</head>
<body>
<div>
<form action="<%=request.getContextPath()%>/procurementServer?op=byMore" method="post">
 
	<div class="select">
		<select name="type" >
			<option value="-1">请选择</option>
			<option value="1">商品编号</option>
			<option value="2">商品名称</option>
			<option value="3">采购员工号</option>
			<option value="4">采购日期</option>
		</select>
	</div>
	
	<div class="layui-inline">
		<input type="text" name="wordkey" required lay-verify="required" placeholder="请输入关键字" autocomplete="off" class="layui-input">
	</div>
	<input  type="submit" id="btn" value="查询" />
</form>

<div class="layui-tab">
						<ul class="layui-tab-title">
							<li class="layui-this">采购列表</li>
						</ul>
<%-- <c:forEach items="${requestScope.procurement}" var="procurement"> --%>
<div>
<form action="<%=request.getContextPath()%>/procurementServer?op=byId" method="post">  
<table class="layui-table" >			 
						<tr> 
							<th >采购数量</th>
							<th >采购的价格</th>
							<th>采购时间</th>
							<th >采购供应商</th>
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
								 <input type="submit" id="sub" value="修改"/>  
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
<%-- <form action="<%=request.getContextPath()%>/procurementServer?op=byMore" method="post">
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
<span>采购id: </span><c:out value="${procurement.procurementId }"></c:out>
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
</div> --%>
<c:forEach begin="1" end="${requestScope.allPage}" var="pv">
	<a id="route" href="<%=request.getContextPath()%>/procurementServer?op=select&position=${pv }">[<c:out value="${pv }"></c:out>]</a>
</c:forEach>

</div>
 </body>
</html>