<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<a href="<%=request.getContextPath()%>/Supermanager/show.jsp">首页</a>
<a href="<%=request.getContextPath()%>/ShopServer?op=list">返回</a>
<form action="<%=request.getContextPath()%>/ShopServer?op=update" method="post">
 <input type="hidden" value="${requestScope.shop.shopId  }" name="shopId"/>
<span>商店名字: </span><input type="text" name="shopName" value="${requestScope.shop.shopName }"/> 
<span>商店地址:</span><input type="text" name="shopAddress" value="${ requestScope.shop.shopAddress}"/> 
<span>商店电话: </span><input type="text" name="shopPhone" value="${requestScope.shop.shopPhone }"/> 

<input type="submit" value="确定修改"/> 
</form>
</div>
</body>
</html>