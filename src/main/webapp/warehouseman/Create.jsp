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
<%-- <%int procurementId =Integer.parseInt(request.getParameter("procurementId") ) ;
	int produceId =Integer.parseInt(request.getParameter("produceId") ) ;
% --%>>
<a href="<%=request.getContextPath()%>/warehouseman/warehousemain.jsp">返回</a>
<form action="<%=request.getContextPath()%>/inventoryServer?op=create" method="post">
<span>入库数量：</span><input type="text" id="inventoryNum" onblur="add()" name="inventoryNum">
<span>入库的位置：</span>
<select name="inventoryPostion">
<c:forEach items="${requestScope.pccList}" var="pcc">
<option><c:out value="${pcc.name}"></c:out></option>
</c:forEach>
</select>
<!-- <input type="text" name="inventoryPostion">	 -->
<!-- <span>入库的剩余量：</span><input type="text" name="inventoryRemain">	  -->
<input type="hidden" name="produceId" value="${produceId }"/>		 
<input type="hidden" name="procurementId" value="${procurementId }"/>
<input type="submit" value="确定">
</form>
<script type="text/javascript">
function add(){	
	 
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
			//console.log(1);
			xmlhttp.open("POST","/Purchase_sell_stock_kongxiangyou/AjonServer",true);
		//	var store ={"produceId":produceId.value,"shopId":shopId.value,"shopStoreId":shopStoreId.value}
		//	var pstatm = JSON.stringify(store);
			 
			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		//	xmlhttp.send("pstatm="+pstatm); 	
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
	}
</script>
</body>
</html>