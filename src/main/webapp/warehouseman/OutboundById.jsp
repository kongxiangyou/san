<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta charset="UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>网站后台管理模版</title>
		 
			<!-- 引入JSTL标签库 -->
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<link rel="stylesheet" type="text/css" href="static/admin/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="static/admin/css/admin.css" />
		<style type="text/css">
		#sub{
			    display: inline-block;
			    height: 38px;
			    line-height: 38px;
			    padding: 0 18px;
			    background-color: #009688;
			    color: #fff;
			    white-space: nowrap;
			    text-align: center;
			    font-size: 14px;
			    border: none;
			    border-radius: 2px;
			    cursor: pointer;
			    opacity: .9;
		}
		</style>
	</head>

	<body>
		<div class="page-content-wrap clearfix">			  
					<div class="layui-tab">
						<ul class="layui-tab-title">
							<li class="layui-this">出库详情</li>
						</ul>
						<div class="layui-tab-content">		
								 
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">商品：</label>
									<div class="layui-input-block">
									<input type="text" name="produceISBN" value="${outbound.produceName }"
									 disabled="disabled" autocomplete="off" class="layui-input"> 
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">出库数量：</label>
									<div class="layui-input-block">
									<input type="text" name="produceISBN" value="${outbound.outboundNum  }"
									 	disabled="disabled" autocomplete="off" class="layui-input"> 
									 </div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">出库时间：</label>
									<div class="layui-input-block">
									<input type="text" name="produceISBN" value="${outbound.outboundTime }"
									 disabled="disabled" autocomplete="off" class="layui-input"> 
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">员工：</label>
									<div class="layui-input-block">
									<input type="text" name="produceISBN" value="${outbound.employeeName}"
									 disabled="disabled" autocomplete="off" class="layui-input"> 
									</div>
								</div>
							</div>
					 
			
			</div>		
		</div>
		 
		<script src="static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		 
	</body>
<%-- <body>
<a href="<%=request.getContextPath()%>/warehouseman/warehousemain.jsp">返回</a>
<a href="<%=request.getContextPath()%>/Supermanager/show.jsp">主页</a>
<div>
<span>出库数量: </span><c:out value="${outbound.outboundNum }"></c:out>
 
<span> 出库时间: </span><c:out value="${outbound.outboundTime }"></c:out>
 
<span> 商品: </span><c:out value="${outbound.produceName }"></c:out>
 
<span> 员工: </span><c:out value="${outbound.employeeName }"></c:out>	  
 <span> 入库Id: </span><c:out value="${outbound.inventoryId }"></c:out>
</div>
</body> --%>
</html>