<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		 
		#route,#see{
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
		/* #list{
			border: 0px;
		} */
		</style>
</head>
<body>
<div> 
<%-- <c:forEach items="${requestScope.produce}" var="produce"> --%>
<div>
<form action="<%=request.getContextPath()%>/routeServer?op=produceManager" method="post">
<%-- <a href="<%=request.getContextPath()%>/commodityServer?op=byId&produceId=${produce.produceId}"> --%>
<%-- <span>商品id</span><c:out value="${ produce.produceId}"></c:out>
<input type="hidden" value="<c:out value="${ produce.produceId}"></c:out>" name="produceId"/>
<span>商品名</span><c:out value="${ produce.produceName}"></c:out>
<span>商品码</span><c:out value="${ produce.produceISBN}"></c:out>
<span>员工id</span><c:out value="${ produce.employeeId}"></c:out> --%>

<table class="layui-table" >
				 
						<tr> 
							<th >商品id</th>
							<th >商品名</th>
							<th>商品码</th>
							<th>操作</th>
						</tr>
					
						<c:forEach items="${requestScope.produce}" var="produce">
							<tr>
								<td ><c:out  value="${produce.produceId}"></c:out></td>
								<td > <c:out value="${produce.produceName}"></c:out></td>
								<td><c:out value="${produce.produceISBN}"></c:out></td>
							
								<td>
								<input type="hidden" value="<c:out value="${ produce.produceId}"></c:out>" name="produceId"/>
									 <input type="submit" id="sub" value="采购"/>
									 <a id="see" href="<%=request.getContextPath()%>/commodityServer?op=byId&produceId=${produce.produceId}">查看商品</a>
								</td>
							</tr>
						</c:forEach>
				</table> 
<!-- </a> -->
 
 
</form>
</div>
<%-- </c:forEach> --%>
</div>
<c:forEach begin="1" end="${requestScope.allPage}" var="pv">
	<a id="route" href="<%=request.getContextPath()%>/commodityServer?op=selectAll&position=${pv }">[<c:out value="${pv }"></c:out>]</a>
</c:forEach>
</body>
</html>