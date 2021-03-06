<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>网站后台管理模版</title>
		 
			<!-- 引入JSTL标签库 -->
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<link rel="stylesheet" type="text/css" href="static/admin/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="static/admin/css/admin.css" />
	</head>
	<body>
		<div class="page-content-wrap clearfix">			  
					<div class="layui-tab">
						<ul class="layui-tab-title">
							<li class="layui-this">仓库详情</li>
						</ul>
						<div class="layui-tab-content">		
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">商品ID：</label>
									<div class="layui-input-block">
									<input type="text" name="produceISBN" value="${requestScope.inventory.produceId }"
									 disabled="disabled" autocomplete="off" class="layui-input"> 
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">商品：</label>
									<div class="layui-input-block">
									<input type="text" name="produceISBN" value="${requestScope.inventory.inventoryPostion }"
									 disabled="disabled" autocomplete="off" class="layui-input"> 
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">入库数量：</label>
									<div class="layui-input-block">
									<input type="text" name="produceISBN" value="${requestScope.inventory.inventoryNum }"
									 	disabled="disabled" autocomplete="off" class="layui-input"> 
									 </div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">入库位置：</label>
									<div class="layui-input-block">
									<input type="text" name="produceISBN" value="${requestScope.inventory.inventoryPostion }"
									 disabled="disabled" autocomplete="off" class="layui-input"> 
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">入库时间：</label>
									<div class="layui-input-block">
									<input type="text" name="produceISBN" value="${requestScope.inventory.inventoryTime }"
									 disabled="disabled" autocomplete="off" class="layui-input"> 
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">可入库数：</label>
									<div class="layui-input-block">
									<input type="text" name="produceISBN" value="${requestScope.inventory.inventoryRemain }"
									 disabled="disabled" autocomplete="off" class="layui-input"> 
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">商品库存：</label>
									<div class="layui-input-block">
									<input type="text" name="produceISBN" value="${requestScope.inventory.produceNum }"
									 disabled="disabled" autocomplete="off" class="layui-input"> 
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">记录数：</label>
									<div class="layui-input-block">
									<input type="text" name="produceISBN" value="${requestScope.inventory.allNum }"
									 disabled="disabled" autocomplete="off" class="layui-input"> 
									</div>
								</div>
							</div>
			</div>		
		</div>
		 
		<script src="static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		 
	</body>
<%-- <a href="<%=request.getContextPath()%>/warehouseman/warehouseShow.jsp">返回</a>
<a href="<%=request.getContextPath()%>/Supermanager/show.jsp">主页</a>
<div>
<ul>
<li><span>入库数量: </span> ${requestScope.inventory.inventoryNum }</li>
 <li><span>入库的位置:</span> ${requestScope.inventory.inventoryPostion }</li>
 <li><span> 入库时间: </span> ${requestScope.inventory.inventoryTime }</li>
 <li><span> 该商品还可以入库的数量: </span>${requestScope.inventory.inventoryRemain }</li>
 <li><span> 商品ID: </span>${requestScope.inventory.produceId }</li>
 <li><span> 商品: </span>${requestScope.inventory.produceName }</li>
 <li><span> 员工Id: </span>${requestScope.inventory.employeeId }</li>
 <li><span> 采购单Id: </span>${ requestScope.inventory.procurementId  }</li>
 <li> <span> 该商品的库存: </span>${ requestScope.inventory.produceNum }</li>
 <li><span> 该商品曾入库: </span>${ requestScope.inventory.allNum  }</li>
</ul>
</div>
</body> --%>
</html>