<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style type="text/css">
 
 </style>
   <script type="text/javascript">
 	window.onload = function (){
 		 
 		  var btn = document.querySelector(".btn");
 		  var hint = document.querySelector(".hint");
 		  var oinp = document.querySelectorAll("input");
 		  var pswre4 = /^[0-9a-zA-Z_,.?]{6,20}$/;
 		
 		 oinp[0].oninput = pass();
 		 
 		 function pass(){
 		 	oinp[0].style.border ="1px black solid";
 		  	
   		  	if(pswre4.test(oinp[0].value)){
   		  		
   		  		oinp[0].style.border ="1px green solid";
   		  	hint.innerHTML = "√";
   			 hint.style.color = "green"
   		  	}else{
   		  		oinp[0].style.border ="1px red solid";
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
<a href="<%=request.getContextPath()%>/Supermanager/show.jsp">主页</a>
<form action="<%=request.getContextPath()%>/EmployeeServer?op=updatepass" method="post" >
<div>新密码：<input type="text"  name="employeePassword"/><span id="hint"></span></div>
<input type="submit" value="修改" id="btn"/>
</form>
</div>
</body>
</html>