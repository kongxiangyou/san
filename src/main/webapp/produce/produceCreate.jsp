<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<div id="create">
<h3>创建商品</h3>
<a href="<%=request.getContextPath()%>/produce/produceMain.jsp">首页</a>
<form action="<%=request.getContextPath()%>/commodityServer?op=create" method="post">
<div><span>商品名</span><input type="text" name="produceName"/></div>
<div><span>商品码</span><input type="text" name="produceISBN"/></div>
<div><span>商品描述</span><textarea rows="3" cols="10" name="produceDescribe"></textarea></div>
<div><span>供应商</span><input type="text" name="supplierName"/></div>
<input type ="submit" value="创建商品"/>
</form>
</div>
</body>
</html>