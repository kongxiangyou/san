<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		 
		<link rel="stylesheet" type="text/css" href="static/admin/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="static/admin/css/admin.css" />
		<style type="text/css">
		#sub{
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
		#route{
			 display: inline-block;
			    height: 38px;
			    line-height: 38px;
			    padding: 0 10px;
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
							<li class="layui-this">修改采购信息</li>
						</ul>
						 <form class="layui-form" action="<%=request.getContextPath()%>/procurementServer?op=update"  method="post" >	
						<div class="layui-tab-content">	
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">采购Id</label>
									<div class="layui-input-block">
									<input type="text" name="procurementId" value="<c:out value="${procurement.procurementId}"></c:out>"
									 disabled="disabled" required lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">	 
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">采购数量</label>
									<div class="layui-input-block">
									<input type="text" name="procurementNum" value="<c:out value="${procurement.procurementNum}"></c:out>"
									 required lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">	 
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">采购价格</label>
									<div class="layui-input-block">
									<input type="text" name="procurementPrice" value="<c:out value="${procurement.procurementPrice}"></c:out>"
									required lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">									 
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">采购时间</label>
									<div class="layui-input-block">
									<input type="text" name="procurementTime" value="<c:out value="${procurement.procurementTime}"></c:out>"
									required lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">									 
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">供应商</label>
									<div class="layui-input-block">
										<input type="text" name="procurementSuppliers"  value="<c:out value="${procurement.procurementSuppliers}"></c:out>"
										required lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">									 
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">采购商品</label>
									<div class="layui-input-block">
									<input type="text" name="produceName" value="<c:out value="${procurement.produceName}"></c:out>"
									required lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">									 
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">采购员</label>
									<div class="layui-input-block">
									<input type="text" name="employeeName" value="<c:out value="${procurement.employeeName}"></c:out>"
									required lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">									 
									</div>
								</div>
						</div>	 
					<div class="layui-form-item" style="padding-left: 10px;">
						<div class="layui-input-block">
						<input type="hidden" value="<c:out value="${ requestScope.procurement.procurementId}"></c:out>" name="procurementId"/>
						<input type="hidden" value="<c:out value="${ requestScope.produceId}"></c:out>" name="produceId"/>
							
							<input type="submit"  id="sub" value="立即提交"  >
							<a id="route" href="<%=request.getContextPath()%>/procurementServer?op=delete&procurementId=${procurement.procurementId }">删除</a>
						</div>
					</div>
				</form>
			</div>		
		</div> 
		<script src="static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
</body>
<%-- </head>
<body>
<a href="<%=request.getContextPath()%>/procurementServer?op=select">返回</a>
<form action="<%=request.getContextPath()%>/procurementServer?op=update" method="post">

<span>采购id</span><c:out value="${requestScope.procurement.procurementId }"></c:out>
<input type="hidden" value="<c:out value="${ requestScope.procurement.procurementId}"></c:out>" name="procurementId"/>

<span>采购数量</span>
<input type="text" value="<c:out value="${ requestScope.procurement.procurementNum}">
</c:out>" name="procurementNum"/> 

<span>采购的价格</span>
<input type="text" value="<c:out value="${ requestScope.procurement.procurementPrice}">
</c:out>" name="procurementPrice"/> 
 
<span>采购时间</span>
<input type="text" value="<c:out value="${ requestScope.procurement.procurementTime}">
</c:out>" name="procurementTime"/> 

<span>采购的供应商</span>
<input type="text" value="<c:out value="${ requestScope.procurement.procurementSuppliers}">
</c:out>" name="procurementSuppliers"/> 
	
	<span>采购的商品</span>
<input type="text" value="<c:out value="${ requestScope.procurement.produceName}">
</c:out>" name="produceName"/> 

<span>采购的员工</span>
<input type="text" value="<c:out value="${ requestScope.procurement.employeeName}">
</c:out>" name="employeeName"/> 		 

<input type="submit" value="修改"/> 
<a href="<%=request.getContextPath()%>/procurementServer?op=delete&procurementId=${procurement.procurementId }">删除</a>
</form>
</body> --%>
</html>