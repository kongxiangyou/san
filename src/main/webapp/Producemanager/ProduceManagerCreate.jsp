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
		</style>
</head>
	<body>
		<div class="page-content-wrap clearfix">  
					<div class="layui-tab">
						<ul class="layui-tab-title">
							<li class="layui-this">采购商品</li>
						</ul>
						 <form class="layui-form" action="<%=request.getContextPath()%>/procurementServer?op=create"   method="post" >	
						<div class="layui-tab-content">	
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">采购数量</label>
									<div class="layui-input-block">
									<input type="text" name="procurementNum" required lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">	 
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">采购价格</label>
									<div class="layui-input-block">
									<input type="text" name="procurementPrice" required lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">									 
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">供应商</label>
									<div class="layui-input-block">
										<input type="text" name="procurementSuppliers" required lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">									 
									</div>
								</div>
							</div>	 
					<div class="layui-form-item" style="padding-left: 10px;">
						<div class="layui-input-block">
						
						<input type="hidden" value="<c:out value="${ requestScope.produceId}"></c:out>" name="produceId"/>
							
							<input type="submit"  id="sub" value="立即提交"  >
							<button type="reset" class="layui-btn layui-btn-primary">重置</button>
						</div>
					</div>
				</form>
			</div>		
		</div>
		 
		<script src="static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	</body>
<%-- <body>
<div>
<h3>采购</h3>
<form action="<%=request.getContextPath()%>/procurementServer?op=create" method="post">
<div><span>采购的数量：</span><input type="text" name="procurementNum"/></div>
<div><span>采购的价格：</span><input type="text" name="procurementPrice"/></div>
<div><span>采购的供应商：</span><input type="text" name="procurementSuppliers"/></div> 
 
<input type="hidden" value="<c:out value="${ requestScope.produceId}"></c:out>" name="produceId"/>
<input type="submit" value="确定"/>
</form>
</div>
</body> --%>
</html>