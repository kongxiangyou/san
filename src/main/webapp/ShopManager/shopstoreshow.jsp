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
		 
		#route,#list{
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
<a id="list" href="<%=request.getContextPath()%>/SaleServer?op=list">查询出售信息</a>
<div class="layui-tab">
						<ul class="layui-tab-title">
							<li class="layui-this">商店库存</li>
						</ul> 
<div>
<form action="<%=request.getContextPath()%>/ShopManager/saleCreat.jsp" method="post">  
<table class="layui-table" >			 
						<tr> 
							<th >商店名</th>
							<th >商品名</th>
							<th>商店库存</th>
							<th >进货时间</th>
							<th >进货记录数</th>
							 
							<th>操作</th>
						</tr>
						<c:forEach items="${requestScope.shopstore}" var="shopstore">
						<tr>
							<td ><c:out  value="${shopstore.shopName}"></c:out></td>
							<td > <c:out value="${shopstore.produceName}"></c:out></td>
							<td><c:out value="${shopstore.shopStoreNum}"></c:out></td>
							<td ><c:out  value="${shopstore.shopStoreTime}"></c:out></td>
							<td > <c:out value="${shopstore.shopStoreallNum}"></c:out></td>
							 
							<td>
							 <input type="hidden" value="<c:out value="${shopstore.shopStoreId  }"></c:out>" name="shopStoreId"/>
							<input type="hidden" value="<c:out value="${shopstore.shopId  }"></c:out>" name="shopId"/>
							<input type="hidden" value="<c:out value="${shopstore.produceId  }"></c:out>" name="produceId"/>
								 <input type="submit" id="sub" value="出售"/>   
							</td>
						</tr>
						</c:forEach>
				</table> 					 
</form> 
</div>
</div>
<%-- </head>
<body>
<div>
<a href="<%=request.getContextPath()%>/Supermanager/show.jsp">首页</a>
<a href="<%=request.getContextPath()%>/ShopManager/ShopMain.jsp">返回</a>
<a href="<%=request.getContextPath()%>/SaleServer?op=list">查询出售信息</a>
<c:forEach items="${requestScope.shopstore}" var="shopstore">
<div>
<form action="<%=request.getContextPath()%>/ShopManager/saleCreat.jsp" method="post">
<form action="<%=request.getContextPath()%>/routeServer?op=sale" method="post">
 <span>商店名字: </span><c:out value="${shopstore.shopName }"></c:out>
 <input type="hidden" value="<c:out value="${shopstore.shopStoreId  }"></c:out>" name="shopStoreId"/>
<input type="hidden" value="<c:out value="${shopstore.shopId  }"></c:out>" name="shopId"/>
<span>商品名: </span><c:out value="${shopstore.produceName }"></c:out>
<input type="hidden" value="<c:out value="${shopstore.produceId  }"></c:out>" name="produceId"/>
<span>商店库存: </span><c:out value="${shopstore.shopStoreNum }"></c:out>
 
<span>商品进货时间: </span><c:out value="${shopstore.shopStoreTime }"></c:out> 

<span>商品曾进货数量: </span><c:out value="${shopstore.shopStoreallNum }"></c:out> 
 
<input type="submit" value="出售"/>    
 
</form>
</div>
</c:forEach>
</div> --%>
<c:forEach begin="1" end="${requestScope.allPage}" var="pv">
	<a id="route" href="<%=request.getContextPath()%>/SaleServer?op=set&position=${pv }">[<c:out value="${pv }"></c:out>]</a>
</c:forEach>

</body>
</html>