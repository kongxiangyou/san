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
<a href="<%=request.getContextPath()%>/Supermanager/show.jsp">首页</a>
<a href="<%=request.getContextPath()%>/ShopServer?op=list">返回</a>
<c:forEach items="${requestScope.employees}" var="employees">
<div>
<form action="<%=request.getContextPath()%>/ShopServer?op=recruit" method="post">
<span>照片：</span><img alt="" src="${employees.pciture}"  width="100px" height="100px" />
 <input type="hidden" value="<c:out value="${employees.employeeId  }"></c:out>" name="employeeId"/>
<span>名字: </span><c:out value="${employees.employeeName }"></c:out>
<input type="hidden" value="<c:out value="${requestScope.shopId  }"></c:out>" name="shopId"/>
<span>工号: </span><c:out value="${employees.employeeCode }"></c:out>
<span>性别：</span><c:out value="${employees.employeeGender}"></c:out>

<span>电话：</span><c:out value="${employees.employeePhone}"></c:out>
<span>职位：</span><c:out value="${employees.employeeJobName}"></c:out>

<input type="submit" value="确定"/> 
  
</form>
</div>
</c:forEach>
</body>
</html>