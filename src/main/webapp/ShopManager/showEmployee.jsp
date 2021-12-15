<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta charset="UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>网站后台管理模版</title>
		 
			<!-- 引入JSTL标签库 -->
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<link rel="stylesheet" type="text/css" href="static/admin/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="static/admin/css/admin.css" />
		<style type="text/css">
		#sub{
			    display: inline-block;
			    height: 38px;
			    line-height: 38px;
			    padding: 0 18px;
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
							<li class="layui-this">店员列表</li>
						</ul> 
<div>
<form action="<%=request.getContextPath()%>/ShopServer?op=recruit" method="post">  
<table class="layui-table" >			 
						<tr> 
							<th >商店名</th>
							<th>商店电话</th>
							<th >商店地址</th>
							<th>店员</th> 
							<th>操作</th>
						</tr>
						<c:forEach items="${requestScope.shops}" var="shops">
						<tr>
						    <td ><c:out  value="${shops.shopName}"></c:out></td>
							<td > <c:out value="${shops.shopPhone}"></c:out></td>
							<td><c:out value="${shops.shopAddress}"></c:out></td>
							<td >
							<input type="hidden" value="<c:out value="${shops.shopId  }"></c:out>" name="shopId"/>
							<c:out  value="${shops.employeeName}"></c:out></td>
							 
							 
						<%-- 	<td>
							 <input type="hidden" value="<c:out value="${employees.employeeId  }"></c:out>" name="employeeId"/>	
							  <input type="hidden" value="<c:out value="${requestScope.shopId  }"></c:out>" name="shopId"/>
							  <input type="submit" id="sub" value="确定"/>  
							</td>
						</tr> --%>
						</c:forEach>
				</table> 					 
</form> 
</div>
</div>
</body>
<%-- <body>
<a href="<%=request.getContextPath()%>/Supermanager/show.jsp">首页</a>

<c:forEach items="${requestScope.shops}" var="shops">
<a href="<%=request.getContextPath()%>/ShopServer?op=set&shopId=${shops.shopId  }">返回</a>
<div>
<form action="<%=request.getContextPath()%>/ShopServer?op" method="post">
 
<span>商店名字: </span><c:out value="${shops.shopName }"></c:out>
<input type="hidden" value="<c:out value="${shops.shopId  }"></c:out>" name="shopId"/>
<span>商店电话: </span><c:out value="${shops.shopPhone }"></c:out>
<span>商店地址:</span><c:out value="${ shops.shopAddress}"></c:out> 
<span>店员: </span><c:out value="${shops.employeeName }"></c:out>
 
</form>
</div>
</c:forEach>


</body> --%>
</html>