<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>


<div> 
<a href="<%=request.getContextPath()%>/Supermanager/show.jsp">主页</a>
 
 <%-- <div id="file">照片：<img id="fileName" alt="" src="/Myimg/${requestScope.fileName}.jpg" width="100px" height="100px"/></div>
<form action="<%=request.getContextPath()%>/es?op=smartUpload" enctype="multipart/form-data" method="post">
  选择图片： <input type="file" name = "myfile"/>  
   <input type="hidden" name="employeeCode" value="<c:out value="${requestScope.employee.employeeCode}"></c:out>">
   <input type="submit"  value="确认修改"/>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
</form>  --%>
<form action="<%=request.getContextPath()%>/EmployeeServer?op=Update" method="post">
 <input type="hidden" name="pciture" value="<c:out value="${requestScope.employee.pciture}"></c:out>"> 
 <%-- <input type="hidden" name ="pciture" value="/Myimg/${requestScope.fileName}.jpg" /> --%>
<div id="pciture">照片：<img alt="" src="${requestScope.employee.pciture}"  width="100px" height="100px" /></div>
 <div> <c:out value="${requestScope.employee.employeeId}"></c:out></div>
 
<input type="hidden" name="employeeCode" value="<c:out value="${requestScope.employee.employeeCode}"></c:out>">

<div><c:out value="${requestScope.employee.employeeCode}"></c:out></div>
<div><input type="text" name="employeeName" value="<c:out value="${requestScope.employee.employeeName}"></c:out>"></div>

<div><input type="text" name="employeePassword" value="<c:out value="${requestScope.employee.employeePassword}"></c:out>"></div>

<div><input type="text" name="employeeGender" value="<c:out value="${requestScope.employee.employeeGender}"></c:out>"></div>

<div><input type="text" name="employeePhone" value="<c:out value="${requestScope.employee.employeePhone}"></c:out>"></div>

<div><input type="text" name="employeeEmail" value="<c:out value="${requestScope.employee.employeeEmail}"></c:out>"></div>

<div><input type="date" name="employeeBrithday" value="<c:out value="${requestScope.employee.employeeBrithday}"></c:out>"></div>

<div><input type="text" name="employeeIdentity" value="<c:out value="${requestScope.employee.employeeIdentity}"></c:out>"></div>

<div><input type="text" name="employeeState" value="<c:out value="${requestScope.employee.employeeState}"></c:out>"></div>

<div><input type="text" name="employeeIntroduction" value="<c:out value="${requestScope.employee.employeeIntroduction}"></c:out>"></div>

<div><input type="text" name="employeeAddress" value="<c:out value="${requestScope.employee.employeeAddress}"></c:out>"></div>

<div><input type="text" name="employeeEducation" value="<c:out value="${requestScope.employee.employeeEducation}"></c:out>"></div>

<div><input type="text" name="employeeJobId" disabled="disabled" value="<c:out value="${requestScope.employee.employeeJobId}"></c:out>"></div>

<input type="hidden" name="employeeJobId" value="<c:out value="${requestScope.employee.employeeJobId}"></c:out>">
<div><input type="text" name="employeeJobName" value="<c:out value="${requestScope.employee.employeeJobName}"></c:out>"></div>
<div><input type="text" name="employeeDescribe" value="<c:out value="${requestScope.employee.employeeDescribe}"></c:out>"></div>

<input type="submit" value="确定修改">
</form>
</div>
<script type="text/javascript">
/*  var pciture = document.getElementById("pciture");
var fileName = document.getElementById("fileName");
var file = document.getElementById("file");
 
console.log(fileName.src)
file.style.display = "none";
  function fn(){
	if(fileName.src!="/Myimg/.jpg"){
		pciture.style.display = "none";
		file.style.display = "block";
	}
} 
  fn(); */
 
</script>

</body>
</html>