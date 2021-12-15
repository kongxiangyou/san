<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%-- <head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
</head>
<body>
<div id="head">
<h1>进销存系统</h1>
</div>
<ul id="list">
<li><a href="<%=request.getContextPath()%>/routeServer?op=employee">创建员工</a></li>
 <li><a href="<%=request.getContextPath()%>/Supermanager/updatePass.jsp">修改密码</a></li>
<li><a href="<%=request.getContextPath()%>/EmployeeServer?op=select">查看员工信息</a></li>
<li><a href="<%=request.getContextPath()%>/commodityServer?op=judge">商品管理</a></li>
<li><a href="<%=request.getContextPath()%>/routeServer?op=warehouse">仓库管理</a></li>
<li><a href="<%=request.getContextPath()%>/routeServer?op=shop">店铺管理</a></li>
 
<li><a href="<%=request.getContextPath()%>/login.jsp">退出</a></li>
</ul>
</body> --%>
	<head>
		<meta charset="UTF-8">
		<meta name="renderer" content="webkit">
  		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>进销存系统</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/admin/layui/css/layui.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/admin/css/admin.css"/>
	</head>
	<body>
		<div class="main-layout" id='main-layout'>
			<!--侧边栏-->
			<div class="main-layout-side">
				<div class="m-logo">
				</div>
				<ul class="layui-nav layui-nav-tree" lay-filter="leftNav">
				  <li class="layui-nav-item layui-nav-itemed">
				    <a href="javascript:;"><i class="iconfont">&#xe607;</i>员工管理</a>
				    <dl class="layui-nav-child">
				     
				      <dd><a href="javascript:;" data-url="routeServer?op=employee"
				      <%--  href="<%=request.getContextPath()%>/routeServer?op=employee" target="iframe"  --%>
				      data-id='1'   data-text="创建员工"><span class="l-line"></span>创建员工</a></dd>
				       
				      <dd><a  href="javascript:;" data-url="Supermanager/updatePass.jsp"
				     <%--  href="<%=request.getContextPath()%>/Supermanager/updatePass.jsp" target="iframe" --%>
				       data-id='2' data-text="修改密码"><span class="l-line"></span>修改密码</a></dd>
		 
				      <dd><a   href="javascript:;" data-url="EmployeeServer?op=select"
				     <%--  href="<%=request.getContextPath()%>/EmployeeServer?op=select" target="iframe" --%>
				         data-id='7' data-text="查看员工信息"><span class="l-line"></span>查看员工信息</a></dd> 
				    </dl>
				  </li>
				   <li class="layui-nav-item layui-nav-itemed">
				    <a href="javascript:;"><i class="iconfont">&#xe608;</i>商品管理</a>
				    <dl class="layui-nav-child">
				      <dd><a href="javascript:;" data-url="commodityServer?op=judge"
				      <%-- href="<%=request.getContextPath()%>/commodityServer?op=judge" target="iframe"  --%>
				      data-id='3' data-text="创建商品"><span class="l-line"></span>创建商品</a></dd>
				<%--       <dd><a href="<%=request.getContextPath()%>/commodityServer?op=selectAll" target="iframe" data-id='2' data-text="查看商品信息"><span class="l-line"></span>查看商品信息</a></dd> --%>
				   
				      <dd><a href="javascript:;" data-url="commodityServer?op=selectAll"
				     <%--  href="<%=request.getContextPath()%>/commodityServer?op=selectAll" target="iframe"  --%>
				      data-id='9' data-text="采购商品"><span class="l-line"></span>采购商品</a></dd>
				      <dd><a  href="javascript:;" data-url="routeServer?op=produceManager2"
				      <%-- href="<%=request.getContextPath()%>/routeServer?op=produceManager2" target="iframe"  --%>
				      data-id='8' data-text="查看采购信息"><span class="l-line"></span>查看采购信息</a></dd>
				   
				    </dl>
				  </li>
				  <li class="layui-nav-item">
				    <a href="javascript:;"><i class="iconfont">&#xe608;</i>仓库管理</a>
				    <dl class="layui-nav-child">
				      <dd><a  href="javascript:;" data-url="routeServer?op=warehouse"
				     <%--  href="<%=request.getContextPath()%>/routeServer?op=warehouse" target="iframe" --%>
				         data-id='5' data-text="入库"><span class="l-line"></span>入库</a></dd>
				      <dd><a  href="javascript:;" data-url="inventoryServer?op=list"
				      <%--  href="<%=request.getContextPath()%>/inventoryServer?op=list" target="iframe" --%>
				         data-id='6' data-text="出库"><span class="l-line"></span>出库</a></dd>
				    </dl>
				  </li>
				    <li class="layui-nav-item">
				    <a href="javascript:;"><i class="iconfont">&#xe608;</i>商店管理</a>
				    <dl class="layui-nav-child">
				      <dd><a href="javascript:;" data-url="routeServer?op=shop"
				     <%--  href="<%=request.getContextPath()%>/routeServer?op=shop" target="iframe"  --%>
				      data-id='4'  data-text="创建商铺"><span class="l-line"></span>创建商铺</a></dd>
				      <dd><a href="javascript:;" data-url="ShopServer?op=list"
				      <%-- href="<%=request.getContextPath()%>/ShopServer?op=list" target="iframe" --%>
				       data-id='10' data-text="查看商铺信息"><span class="l-line"></span>查看商铺信息</a></dd>
				       <dd><a href="javascript:;" data-url="ShopServer?op=show"
				      <%--   href="<%=request.getContextPath()%>/ShopServer?op=show" target="iframe" --%>
				         data-id='11' data-text="查看商品信息"><span class="l-line"></span>查看商品信息</a></dd>
				        <dd><a href="javascript:;" data-url="SaleServer?op=set"
				         <%-- href="<%=request.getContextPath()%>/SaleServer?op=set" target="iframe" --%>
				          data-id='12' data-text="查看商店库存信息"><span class="l-line"></span>查看商店库存信息</a></dd>
 
				    </dl>
				  </li>
				  
				</ul>
			</div>
			<!--右侧内容-->
			<div class="main-layout-container">
				<!--头部-->
				<div class="main-layout-header">
					<div class="menu-btn" id="hideBtn">
						<a href="javascript:;">
							<span class="iconfont">&#xe60e;</span>
						</a>
					</div>
					<ul class="layui-nav" lay-filter="rightNav">
					
					  <!-- <li class="layui-nav-item"><a href="javascript:;" data-url="email.html" data-id='4' data-text="邮件系统"><i class="iconfont">&#xe603;</i></a></li>
					  <li class="layui-nav-item">
					    <a href="javascript:;" data-url="admin-info.html" data-id='5' data-text="个人信息">超级管理员</a>
					  </li> -->
					  <li class="layui-nav-item"><a href="<%=request.getContextPath()%>/login.jsp">退出</a></li>
					</ul>
				</div>
				<!--主体内容-->
				<div class="main-layout-body">
					<!--tab 切换-->
					<div class="layui-tab layui-tab-brief main-layout-tab" lay-filter="tab" lay-allowClose="true">
					  <ul class="layui-tab-title">
					    <li class="layui-this welcome">后台主页</li>
					  </ul>
					  <div class="layui-tab-content">
					    <div class="layui-tab-item layui-show" style="background: #f5f5f5;">
					    	<!--1-->
					    	<iframe src="${pageContext.request.contextPath}/Supermanager/welcome.jsp" width="100%" height="100%" name="iframe" scrolling="auto" class="iframe" framborder="0"></iframe>
					    	<!--1end-->
					    </div>
					  </div>
					</div>
				</div>
			</div>
			<!--遮罩-->
			<div class="main-mask">
				<!-- static/admin/js/module/ -->
			</div>
		</div>
		<script type="text/javascript">
			var scope={
				link:'${pageContext.request.contextPath}/Supermanager/welcome.jsp'
			}
		</script>
		<script src="${pageContext.request.contextPath}/static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/static/admin/js/common.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/static/admin/js/main.js" type="text/javascript" charset="utf-8"></script>
		
	</body>
</html>