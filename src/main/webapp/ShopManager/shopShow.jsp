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
		#sub,#btn,#btn1{
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

<form action="<%=request.getContextPath()%>/ShopServer?op=byMore" method="post">
 
	<div class="select">
		<select name="type" >
			<option value="-1">请选择</option>
			<option value="1">商店名字</option>
			<option value="2">商店电话</option>
			<option value="3">商店地址</option>
		</select>
	</div>
	
	<div class="layui-inline">
		<input type="text" name="wordkey" required lay-verify="required" placeholder="请输入关键字" autocomplete="off" class="layui-input">
	</div>
	<input  type="submit" id="btn" value="查询" />
</form>

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
								<a id="btn1" href="<%=request.getContextPath()%>/ShopServer?op=SelectEmployees&shopId=${shops.shopId  }">
								查看店员</a>
							</td>
						</tr>
						</c:forEach>
				</table> 					 
</form> 
</div>
<%-- <body>
<div>
<form action="<%=request.getContextPath()%>/ShopServer?op=byMore" method="post">
<span>输入关键字：</span><input type="search" name="wordkey"/>
<select name = "type">
<option value="1">商店名字</option>
<option value="2">商店电话</option>
<option value="3">商店地址</option>
 
</select>
<input type="submit" value="查询"/> 
</form>
<div>
<a href="<%=request.getContextPath()%>/Supermanager/show.jsp">首页</a>
<a href="<%=request.getContextPath()%>/ShopManager/ShopMain.jsp">返回</a>
<c:forEach items="${requestScope.shops}" var="shops">
<div>
<form action="<%=request.getContextPath()%>/ShopServer?op=byId" method="post">
 
<span>商店名字: </span><c:out value="${shops.shopName }"></c:out>
<input type="hidden" value="<c:out value="${shops.shopId  }"></c:out>" name="shopId"/>
<span>商店电话: </span><c:out value="${shops.shopPhone }"></c:out>
<span>商店地址:</span><c:out value="${ shops.shopAddress}"></c:out> 

<input type="submit" value="修改"/> 
 <a href="<%=request.getContextPath()%>/ShopServer?op=set&shopId=${shops.shopId  }">招聘</a>
</form>
</div>
</c:forEach>
 --%>
</div>
<c:forEach begin="1" end="${requestScope.allPage}" var="pv">
	<a id="route" href="<%=request.getContextPath()%>/ShopServer?op=list&position=${pv }">[<c:out value="${pv }"></c:out>]</a>
</c:forEach>


</body>
</html>