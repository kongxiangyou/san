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
		#inventoryNum{
		    padding: 9px 15px;
		    min-height: 20px;
		    line-height: 20px;
		    border: 1px solid #e2e2e2;
		    font-size: 14px;
		} 
	 .select{
			 display: inline-block;
			    height: 38px;
			    line-height: 38px;
		}
		.select select{
			    font-size: 16px; 
			    border: none;
			    border-radius: 5px;
			    cursor: pointer;
		}
 </style>
</head>
<body>
 <div class="layui-tab">
						<ul class="layui-tab-title">
							<li class="layui-this">入库</li>
						</ul>
<div class="layui-tab-content">
<form action="<%=request.getContextPath()%>/inventoryServer?op=create" method="post">
<span>入库数量：</span><input type="text" id="inventoryNum" placeholder="请输入数量" onblur="add()" name="inventoryNum">
<span>入库的位置：</span>
<div class="select">
<select name="inventoryPostion">
<c:forEach items="${requestScope.pccList}" var="pcc">
<option><c:out value="${pcc.name}"></c:out></option>
</c:forEach>
</select>
 </div>
<input type="hidden" id="produceId" name="produceId" value="${produceId }"/>		 
<input type="hidden" id="procurementId" name="procurementId" value="${procurementId }"/>
<input id="btn" type="submit" value="确定">
</form>
</div>
</div>
<script type="text/javascript">
/* var inventoryNum = document.getElementById("inventoryNum");
	 console.log(inventoryNum.value+"----");
	 var procurementId = document.getElementById("procurementId");
	 console.log(procurementId.value+"++++++"); */
/* function add(){	
	var xmlhttp; 
	function xmlCreate(){
		if(window.XMLHttpRequest){
			xmlhttp = new XMLHttpRequest();
		}else{
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		} 
	} 
	function ex(){
		xmlCreate();
			xmlhttp.onreadystatechange =op;
			xmlhttp.open("POST","/Purchase_sell_stock_kongxiangyou/AjonServer",true);
			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			 xmlhttp.send("op=set"+"&procurementId"+procurementId.value);  	
		}	 
	function op(){
		if(xmlhttp.readyState == 4 && xmlhttp.status ==200){ 
			//字符串 不是 json格式的数据
			var object = xmlhttp.responseText;
			//需要转换
			var shopstore = JSON.parse(object);
			
		}
	}	 
		 ex();
	} */
</script>
</body>
</html>