<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/wangEditor.min.js"></script>
	<!-- 引入JSTL标签库 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
<div id="head"><h3>员工创建</h3></div>
<div>
<div><img alt="" src="/Myimg/${requestScope.fileName}.jpg" width="100px" height="100px"/></div>
<form action="<%=request.getContextPath()%>/EmployeeServer?op=joblist" enctype="multipart/form-data" method="post">
  选择图片： <input type="file" name = "myfile"/>   
   <input type="submit" value="确认提交"/>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
</form>
<form action="<%=request.getContextPath()%>/EmployeeServer?op=create" method="post">
   <!--  <div><img alt="" src="/img/ia_300000001.jpg" width="10%"/></div> -->
   <input type="hidden" name ="pciture" value="/Myimg/${requestScope.fileName}.jpg" />
<div><span>工号：</span><input type="text" name ="employeeCode" /></div>
<div><span>姓名：</span><input type="text" name ="employeeName" /></div>
<div><span>密码：</span><input type="text" name ="employeePassword" /></div>

<div><span>性别：</span>
		<input type="radio" name ="employeeGender" value="男" />男
		<input type="radio" name ="employeeGender" value="女"/>女
</div>

<div><span>电话：</span><input type="text" name ="employeePhone" maxlength="11"/></div>
<div><span>邮件：</span><input type="text" name ="employeeEmail" /></div>
<div><span>出生日期：</span><input type="date" name ="employeeBrithday"  /></div>
<div><span>身份证：</span><input type="text" name ="employeeIdentity" maxlength="18"/></div>

<div>
<span>工作状态：</span>
<select  name ="employeeState" >
	<option>在职</option>
	<option>离职</option>
	<option>休假</option>
	<option>其他</option>
</select>
</div>

<span>简介：</span>
<div id="myEditor" style="width: 600px;margin: 0 auto;">
</div>
<input type="hidden" id="employeeIntroduction" name ="employeeIntroduction" />
<div><span>家庭地址：</span><textarea cols="20" rows="2"  name ="employeeAddress" ></textarea></div>

<div><span>学历：</span>
<select  name ="employeeEducation" >
		<option>小学</option>
		<option>中学</option>
		<option>高中</option>
		<option>中专</option>
		<option>大专</option>
		<option>本科</option>
		<option>硕士</option>
		<option>博士</option>
		</select>
</div>

<div><span>职位：</span>
	<select  name ="employeeJobName" >
		<c:forEach items="${requestScope.employeeJobs}" var="employeeJob">
	
	<option><c:out value="${employeeJob.employeeJobName}"></c:out> </option>
	
	</c:forEach>
	</select>
</div>
<div><span>职位描述：</span><textarea cols="20" rows="5" name ="employeeDescribe" ></textarea></div>

<input type="submit"  value="创建" onclick="showEditorContent()" />
</form>
</div>
<script type="text/javascript">

		
		const E = window.wangEditor;
		const editor = new E('#myEditor');
		// 设置编辑区域高度为 500px
		editor.config.height = 300;
		editor.create();
		var employeeIntroduction = document.getElementById("employeeIntroduction");
		//显示editor的内容
		function showEditorContent(){
			employeeIntroduction.value = editor.txt.text();
			//alert(employeeIntroduction);
		}
		 
	</script>
</body>
</html>