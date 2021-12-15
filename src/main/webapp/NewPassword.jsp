<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/admin/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/admin/css/admin.css" />
 <style type="text/css">
 	#btn{
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
		#password{
		    padding: 9px 15px;
		    min-height: 20px;
		    line-height: 20px;
		    border: 1px solid #e2e2e2;
		    font-size: 14px;
		} 
		#hint{
			display: inline-block;
			    height: 38px;
			    line-height: 38px;
			    padding: 0 20px;
		}
		</style>
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
   		 hint.style.fontSize ="20px";
   		  	hint.innerHTML = "√";
   			 hint.style.color = "green"
   		  	}else{
   		  	password.style.border ="1px red solid";
   		 hint.style.fontSize ="20px";
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
<div class="layui-tab">
						<ul class="layui-tab-title">
							<li class="layui-this">修改密码</li>
						</ul>
<div class="layui-tab-content">
<form action="<%=request.getContextPath()%>/es?op=update" method="post" >
<input type="hidden" name="employeeCode" value="<c:out value="${requestScope.employeeCode }"></c:out>"/>
新密码：<input type="text" id="password" name="employeePassword"/><span id="hint"></span>
<input type="submit" value="修改" id="btn"/>
</form>
</div>
</div>
</body>  
</html>