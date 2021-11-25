<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <script type="text/javascript">
 	window.onload = function (){
 		 

		  var btn = document.getElementById("btn");
		  var hint = document.getElementById("hint");
 		  var password = document.querySelector(".password");
 		  var pswre4 = /^[0-9a-zA-Z_,.?]{6,20}$/;
 		
 		 password.oninput = function(){
 			 pass();
 		 }
 		 
 		 function pass(){
 			password.style.border ="1px black solid";
 		  	
   		  	if(pswre4.test(password.value)){
   		  		
   		  	password.style.border ="1px green solid";
   		  	hint.innerHTML = "√";
   			 hint.style.color = "green"
   		  	}else{
   		  	password.style.border ="1px red solid";
   		  	hint.innerHTML = "×";
   			 hint.style.color = "red"
   		  		return false;
   		  	}
 		 }
 		 btn.onclick = function(){
 		 	 pass();
 		 	 alert("修改成功！")
 		 }
 	}
 </script>
</head>
<body>
<div>
<h3>修改密码</h3>
<form action="<%=request.getContextPath()%>/es?op=update" method="post" >
<input type="hidden" name="employeeCode" value="<c:out value="${requestScope.employeeCode }"></c:out>"/>
<div>新密码：<input type="text" id="password" name="employeePassword"/><span id="hint"></span></div>
<input type="submit" value="修改" id="btn"/>
</form>
</div>
</body>
</html>