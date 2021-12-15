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
							<li class="layui-this">商店列表</li>
						</ul>
<%-- <c:forEach items="${requestScope.procurement}" var="procurement"> --%>
<div>
<form action="<%=request.getContextPath()%>/ShopServer?op=byId" method="post">  
<table class="layui-table" >			 
						<tr> 
							<th >商店名</th>
							<th >商店电话</th>
							<th>商店地址</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${requestScope.shops}" var="shops">
						<tr>
							<td ><c:out  value="${shops.shopName}"></c:out></td>
							<td > <c:out value="${shops.shopPhone}"></c:out></td>
							<td><c:out value="${shops.shopAddress}"></c:out></td>
							 
							<td>
							<input type="hidden" value="<c:out value="${shops.shopId  }"></c:out>" name="shopId"/>
								 <input type="submit" id="sub" value="修改"/>  
								<a id="btn" href="<%=request.getContextPath()%>/ShopServer?op=set&shopId=${shops.shopId  }">
								招聘</a> 
							</td>
						</tr>
						</c:forEach>
				</table> 					 
</form> 
</div>
</div>
<%-- <body>
<div>
<a href="<%=request.getContextPath()%>/Supermanager/show.jsp">首页</a>
<a href="<%=request.getContextPath()%>/ShopServer?op=list">返回</a>
<c:forEach items="${requestScope.shops}" var="shops">
<div>
<form action="<%=request.getContextPath()%>/ShopServer?op=byId" method="post">
 
<span>商店名字: </span><c:out value="${shops.shopName }"></c:out>
<input type="hidden" value="<c:out value="${shops.shopId  }"></c:out>" name="shopId"/>
<span>商店电话: </span><c:out value="${shops.shopPhone }"></c:out>
<span>商店地址:</span><c:out value="${ shops.shopAddress}"></c:out> 

<input type="submit" value="修改"/> 
 
</form>
</div>
</c:forEach>
</div>--%>
</body> 
</html>