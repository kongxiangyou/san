<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="<%=request.getContextPath()%>/ShopManager/ShopMain.jsp">首页</a>
<a href="<%=request.getContextPath()%>/SaleServer?op=set">返回</a>
<%-- <% int shopId = Integer.parseInt(request.getParameter("shopId")) ;
int produceId = Integer.parseInt(request.getParameter("produceId"));
int shopstoreId = Integer.parseInt(request.getParameter("shopStoreId"));
%> --%>
<form action="<%=request.getContextPath()%>/SaleServer?op=create" method="post">
<%-- <input type="hidden" id="shopStoreId" value="<%=shopstoreId%>" name="shopStoreId"/> --%>
<input type="hidden" id="shopStoreId" value="${requestScope.shopstoreId }" name="shopStoreId"/>
 <span>销售价格: </span> <input id="salePrice" type="text" name="salePrice"/>
 
<%-- <input  type="hidden" id="shopId" value="<%=shopId%>" name="shopId"/> --%>
<input  type="hidden" id="shopId" value="${requestScope.shopId }" name="shopId"/>
<span>数量: </span>  <input id="saleNum" type="text" name="saleNum" onblur="add()"/><span id="num"></span> 
<%-- <input type="hidden" id="produceId" value="<%=produceId%>" name="produceId"/> --%>
 <input type="hidden" id="produceId" value="${requestScope.produceId }" name="produceId"/>
<input type="submit" value="确定" id ="btn" /> 
 
</form>
<script type="text/javascript">
var saleNum = document.getElementById("saleNum");
var salePrice = document.getElementById("salePrice");
var produceId = document.getElementById("produceId");
var shopId = document.getElementById("shopId");
var shopStoreId = document.getElementById("shopStoreId");
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
		console.log(1);
		xmlhttp.open("POST","/Purchase_sell_stock_kongxiangyou/AjonServer",true);
		var store ={"produceId":produceId.value,"shopId":shopId.value,"shopStoreId":shopStoreId.value}
		var pstatm = JSON.stringify(store);
		 
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("pstatm="+pstatm); 	
	}
	 
function op(){
	if(xmlhttp.readyState == 4 && xmlhttp.status ==200){ 
		//字符串 不是 json格式的数据
		var object = xmlhttp.responseText;
		//需要转换
		var shopstore = JSON.parse(object);
		if(saleNum.value>=shopstore.shopStoreNum){
			saleNum.value = shopstore.shopStoreNum;
			document.all.num.innerHTML =  "最大值为："+shopstore.shopStoreNum;
		}else if(saleNum.value<=0){
			saleNum.value ='';
			document.all.num.innerHTML =  "请输入大于零的数!";
		} 
		shopId.value = shopstore.shopId;
		produceId.value = shopstore.produceId;
		shopStoreId.value = shopstore.shopStoreId;
		
	}
}	 
	
	 ex();
}
   
var btn = document.getElementById("btn");
 btn.onclick = function (){
	if(saleNum.value == "" && salePrice.value ==""&& saleNum.value<=0 &&salePrice.value<=0){
		alert("请输入大于零的数!");
		return false;
	}
	
}

</script>
</body>
</html>