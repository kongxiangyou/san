<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html>
<html>

<!-- <head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style type="text/css">
 	*{
 		margin: 0;
 		padding:0;
 	}
 	#login{
 		position: fixed;
 		top: 50%;
 		left: 50%;
 		margin-left: -125px;
 		margin-top: -125px;
 		width: 250px;
 		height: 250px;
 		border: 1px solid black;
 		border-radius:10px;
 		text-align: center;
 	}
 	h3{
 		margin: 10px;
 	}
 	.form{
 		height: 120px;
 		margin-top: 50px;
 	 
 	}
 	.form > div{
 		height: 30px;
 	 
 	}
 	input{
 		outline: medium; /* 去除轮廓*/
		border-radius: 5px;
 	}
 	#btn{
 		margin-top: 10px;
 		width: 50px;
 		height: 30px;
 		background: blue;
 		color: white;
 		border: none;
 		cursor: pointer;
 	}
 </style>
 <script type="text/javascript">
 	window.onload = function (){
 		 
 		  var btn = document.getElementById("btn");
 		  var hint = document.getElementById("hint");
 		  var reminder = document.getElementById("reminder");
 		  var oinp = document.querySelectorAll("input");
 		  var pswre4 = /^[0-9a-zA-Z]{4,20}$/;
 		  var re2 = /^[0-9A-Za-z]{3,19}$/;
 		 
 		 
 		  function userName(){
 		  	oinp[0].style.border ="1px black solid";
 		  	
   		  	if(re2.test(oinp[0].value)){
   		 // 		console.log(1)
   		  		oinp[0].style.border ="1px green solid";
   		  		hint.innerHTML = "√";
   		  		hint.style.color = "green"
   		  	}else{
   		  		oinp[0].style.border ="1px red solid";
   		  //		console.log(2)
   		 		hint.innerHTML = "×";
   				hint.style.color = "red"
   		  		return false;
   		  	}
 		  };
 		 oinp[0].oninput = function(){
				userName();
			}
 		 
 		 function pass(){
 		 	oinp[1].style.border ="1px black solid";
 		  	
   		  	if(pswre4.test(oinp[1].value)){
   		 // 	console.log(3)
   		  		oinp[1].style.border ="1px green solid";
   		  	reminder.innerHTML = "√";
   		 reminder.style.color = "green"
   		  	}else{
   		  //	console.log(4)
   		  		oinp[1].style.border ="1px red solid";
   		  	reminder.innerHTML = "×";
   			 reminder.style.color = "red"
   		  		return false;
   		  	}
 		 }
 		 oinp[1].oninput = function(){
			  pass();
		 }
			
 		 btn.onclick = function(){
 		 	 userName();
 		 	 pass();
 		 	 alert("登录成功！")
 		 }
 	}
 </script>
</head> -->
<%-- <body>
<div id ="login">
<h3>进销存系统的登录</h3>
<form class="form" action="<%=request.getContextPath()%>/EmployeeServer?op=login"  method="post">
<div><span>工号：</span><input type="text" name ="employeeCode" maxlength="10" placeholder="请输入工号" /><span id="hint"></span></div>
<div><span>密码：</span><input type="text" name ="employeePassword" maxlength="10" placeholder="请输入密码"/><span id="reminder"></span></div>
<input type="submit" id="btn"  value="登录" />
</form>
<a href="<%=request.getContextPath()%>/ByEmail.jsp">找回密码</a>
</div>
</body> --%>
 <head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>进销存系统登录</title>
<!--  /static/admin/layui/css/layui.css     <%-- <%=request.getContextPath()%> --%>/static/admin/css/login.css -->
				<link rel="stylesheet" type="text/css" href="js/login.css" />
		<link rel="stylesheet" type="text/css" href="js/layui.css" />

	</head>

	<body>
		<div class="m-login-bg">
			<div class="m-login">
				<h3>进销存系统登录</h3>
				<div class="m-login-warp">
					<form class="layui-form" action="<%=request.getContextPath()%>/EmployeeServer?op=login"  method="post">
						<div class="layui-form-item">
							<input type="text" name="employeeCode" required lay-verify="required" placeholder="用户名" autocomplete="off" class="layui-input">
						</div>
						<div class="layui-form-item">
							<input type="text" name="employeePassword" required lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input">
						</div>
					 
						<div class="layui-form-item m-login-btn">
							<div class="layui-inline">
								<input class="layui-btn layui-btn-normal" type="submit" value="login">
							</div>
							<div class="layui-inline">
								<a href="<%=request.getContextPath()%>/ByEmail.jsp">找回密码</a>
							</div>
							 
						</div>
					</form>
				</div>
				<p class="copyright">copyright 2021-2022 </p>
			</div>
		</div>
		
	</body>
	<script src="<%=request.getContextPath()%>/static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script>
			layui.use(['form', 'layedit', 'laydate'], function() {
				var form = layui.form(),
					layer = layui.layer;


				//自定义验证规则
				form.verify({
					title: function(value) {
						if(value.length < 5) {
							return '标题至少得5个字符啊';
						}
					},
					password: [/(.+){6,12}$/, '密码必须6到12位'],
					verity: [/(.+){6}$/, '验证码必须是6位'],
					
				});
			});
		</script>
</html>