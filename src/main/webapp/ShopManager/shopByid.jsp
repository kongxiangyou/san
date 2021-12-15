<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
							<li class="layui-this">修改商店信息</li>
						</ul>
						 <form class="layui-form" action="<%=request.getContextPath()%>/ShopServer?op=update"   method="post" >
						
						<div class="layui-tab-content">		
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">商店名：</label>
									<div class="layui-input-block">
									<input type="text" name="shopName" value="${requestScope.shop.shopName }"
									 required lay-verify="required" placeholder="请输入商店名" autocomplete="off" class="layui-input"> 
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">地址：</label>
									<div class="layui-input-block">
									<input type="text" name="shopAddress" value="${requestScope.shop.shopAddress }"
									 required lay-verify="required" placeholder="请输入地址" autocomplete="off" class="layui-input"> 
									</div>
								</div>
								 <div class="layui-form-item layui-form-text">
									<label class="layui-form-label">电话：</label>
									<div class="layui-input-block">
									<input type="text" name="shopPhone" value="${requestScope.shop.shopPhone }"
									 required lay-verify="required" placeholder="请输入电话" autocomplete="off" class="layui-input"> 
									</div>
								</div>
							</div>
					<div class="layui-form-item" style="padding-left: 10px;">
						<div class="layui-input-block">
						 <input type="hidden" value="${requestScope.shop.shopId  }" name="shopId"/>
							<input type="submit"  id="sub" value="修改"  >
						</div>
					</div>
				</form>
			</div>		
		</div>
		 
		<script src="static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		 
	</body>
<%-- <body>
<div>
<a href="<%=request.getContextPath()%>/Supermanager/show.jsp">首页</a>
<a href="<%=request.getContextPath()%>/ShopServer?op=list">返回</a>
<form action="<%=request.getContextPath()%>/ShopServer?op=update" method="post">
 <input type="hidden" value="${requestScope.shop.shopId  }" name="shopId"/>
<span>商店名字: </span><input type="text" name="shopName" value="${requestScope.shop.shopName }"/> 
<span>商店地址:</span><input type="text" name="shopAddress" value="${ requestScope.shop.shopAddress}"/> 
<span>商店电话: </span><input type="text" name="shopPhone" value="${requestScope.shop.shopPhone }"/> 

<input type="submit" value="确定修改"/> 
</form>
</div>
</body> --%>
</html>