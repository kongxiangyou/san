<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/admin/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/admin/css/admin.css" />
 <style type="text/css">
 	#btn{
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
		#outboundNum{
		    padding: 9px 15px;
		    min-height: 20px;
		    line-height: 20px;
		    border: 1px solid #e2e2e2;
		    font-size: 14px;
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
 <div class="layui-tab">
						<ul class="layui-tab-title">
							<li class="layui-this">出库</li>
						</ul>
<div class="layui-tab-content">
<form action="<%=request.getContextPath()%>/OutBoundServer?op=create" method="post">
<span>出库数量：</span><input type="text" id="outboundNum" placeholder="请输入数量" onblur="add()" name="outboundNum">
<div class="select">
<select name="shopName">
<option value="-1">请选择商店</option>
<c:forEach items="${requestScope.shops}" var="shops">	
	<option><c:out value="${shops.shopName}"></c:out></option>
</c:forEach>
</select>
 </div>
<input type ="hidden" name="inventoryId" value="${requestScope.inventory.inventoryId}"/>
<input type ="hidden" name="produceId" value="${requestScope.inventory.produceId}"/>
<input type ="hidden" name="employeeId" value="${requestScope.inventory.employeeId}"/>
<input id="btn" type="submit" value="确定">
</form>
</div>
</div>
<%-- <div>
<form action="<%=request.getContextPath()%>/OutBoundServer?op=create" method="post">
<span>出库数量：</span><input type="text" name = "outboundNum"/>
<select name="shopName">
<c:forEach items="${requestScope.shops}" var="shops">
	
	<option><c:out value="${shops.shopName}"></c:out></option>

</c:forEach>
</select>
 
<input type ="hidden" name="inventoryId" value="${requestScope.inventory.inventoryId}"/>
<input type ="hidden" name="produceId" value="${requestScope.inventory.produceId}"/>
<input type ="hidden" name="employeeId" value="${requestScope.inventory.employeeId}"/>
<input type="submit" value="确定"/>

</form>
</div> --%>
</body>
</html>