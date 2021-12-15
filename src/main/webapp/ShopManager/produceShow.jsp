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
							<li class="layui-this">商品列表</li>
						</ul>
<%-- <c:forEach items="${requestScope.procurement}" var="procurement"> --%>
<div>
<form action="<%=request.getContextPath()%>/ShopServer?op=byId" method="post">  
<table class="layui-table" >			 
						<tr> 
							<th >商品ID</th>
							<th >商品名</th>
							<th>商品码</th>
							<th >商品描述</th>
							<th >商品库存</th>
							<th>商店名</th>
							<th>员工ID</th>
							<!-- <th>操作</th> -->
						</tr>
						<c:forEach items="${requestScope.produce}" var="produce">
						<tr>
							<td ><c:out  value="${produce.produceId}"></c:out></td>
							<td > <c:out value="${produce.produceName}"></c:out></td>
							<td><c:out value="${produce.produceISBN}"></c:out></td>
							 <td ><c:out  value="${produce.produceDescribe}"></c:out></td>
							<td > <c:out value="${produce.shopstoreNum}"></c:out></td>
							<td><c:out value="${produce.shopName}"></c:out></td>
							<td><c:out value="${produce.employeeId}"></c:out></td>
							<%-- <td>
							<input type="hidden" value="<c:out value="${shops.shopId  }"></c:out>" name="shopId"/>
								 <input type="submit" id="sub" value="修改"/>  
								<a id="btn" href="<%=request.getContextPath()%>/ShopServer?op=set&shopId=${shops.shopId  }">
								招聘</a> 
							</td> --%>
						</tr>
						</c:forEach>
				</table> 					 
</form> 
</div>
</div>
<%-- <body>
<div>
<a href="<%=request.getContextPath()%>/Supermanager/show.jsp">首页</a>
<a href="<%=request.getContextPath()%>/ShopManager/ShopMain.jsp">返回</a>
<c:forEach items="${requestScope.produce}" var="produce">
<div>
<form action="<%=request.getContextPath()%>/" method="post">
 <span>商品id</span><c:out value="${ produce.produceId}"></c:out> 
<span>商品名：</span><c:out value="${ produce.produceName}"></c:out>
<span>商品码：</span><c:out value="${ produce.produceISBN}"></c:out>
<span>商品的描述：</span><c:out value="${ produce.produceDescribe}"></c:out>
<span>员工id：</span><c:out value="${ produce.employeeId}"></c:out>
<span>商店库存：</span><c:out value="${ produce.shopstoreNum}"></c:out>
<span>商店名字: </span><c:out value="${produce.shopName }"></c:out>

</form>
</div> 
</c:forEach>
</div>--%>
<c:forEach begin="1" end="${requestScope.allPage}" var="pv">
	<a id="route" href="<%=request.getContextPath()%>/ShopServer?op=show&position=${pv }">[<c:out value="${pv }"></c:out>]</a>
</c:forEach>

 
</body>
</html>