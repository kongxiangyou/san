<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
<div>
<a href="<%=request.getContextPath()%>/Supermanager/show.jsp">首页</a>
<a href="<%=request.getContextPath()%>/ShopManager/ShopMain.jsp">返回</a>
<a href="<%=request.getContextPath()%>/SaleServer?op=list">查询出售信息</a>
<c:forEach items="${requestScope.shopstore}" var="shopstore">
<div>
<%-- <form action="<%=request.getContextPath()%>/ShopManager/saleCreat.jsp" method="post"> --%>
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
</div>
<c:forEach begin="1" end="${requestScope.allPage}" var="pv">
	<a href="<%=request.getContextPath()%>/SaleServer?op=set&position=${pv }">[<c:out value="${pv }"></c:out>]</a>
</c:forEach>

</body>
</html>