<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
	<div>
	<a href="<%=request.getContextPath()%>/produce/produceMain.jsp">首页</a>
		<form action="<%=request.getContextPath()%>/commodityServer?op=update"
			method="post">
			<div>
				<span>商品id</span><input type="text" name="produceId"
					value="<c:out value="${ produce.produceId}"></c:out>" />
			</div>
			<div>
				<span>商品名</span><input type="text" name="produceName"
					value="<c:out value="${ produce.produceName}"></c:out>" />
			</div>
			<div>
				<span>商品码</span><input type="text" name="produceISBN"
					value="<c:out value="${ produce.produceISBN}"></c:out>" />
			</div>
			<div>
				<span>商品描述</span><textarea rows="2" cols="15" name="produceDescribe">
					<c:out value="${ produce.produceDescribe}"></c:out>" >
				</textarea>
			</div>
			<div>
				<span>员工id</span><input type="text" name="employeeId"
					value="<c:out value="${ produce.employeeId}"></c:out>" />
			</div>
			<input type="submit" value="修改商品" />
		</form>
	</div>
</body>
</html>