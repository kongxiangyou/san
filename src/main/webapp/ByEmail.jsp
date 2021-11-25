<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script type="text/javascript">
 	window.onload = function (){
 		 

		  var btn = document.getElementById("btn");
		  var hint = document.getElementById("hint");
 		  var email = document.getElementById("email");
 		  var pswre4 =  /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
 		
 		 email.oninput =function(){
 			 pass();
 		 }
 		 
 		 function pass(){
 			email.style.border ="1px black solid";
 		  	
   		  	if(pswre4.test(email.value)){
   		  		
   		  	email.style.border ="1px green solid";
   		  	hint.innerHTML = "√";
   			 hint.style.color = "green"
   		  	}else{
   		  	email.style.border ="1px red solid";
   		  	hint.innerHTML = "×";
   			 hint.style.color = "red"
   		  		return false;
   		  	}
 		 }
 		 btn.onclick = function(){
 		 	 pass();
 		 	 alert("发送成功！")
 		 }
 	}
 </script>
</head>
<body>
<form action="<%=request.getContextPath()%>/es?op=byEmail" method="post">
email <input type="text" id="email" name="toEmail"/> <span id="hint"></span><br>
context <input type="text" name="context"/><br>
<input type="submit" id= "btn">
</form>
</body>
</html>