<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- springmvc用于表单提交的标签 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- springmvc标签有自动回显功能 -->
	<!-- 利用SpringMVC框架提供的标签库完成表单页面开发
		好处：自动回显
		
		表单回显时需要获取一个模型对象名称为: "command"对应的实体对象的属性值；如果没有这个实体对象就会抱错：
			java.lang.IllegalStateException: Neither BindingResult nor plain target object for bean name 'command' available as request attribute
	 
	 	只需要在控制器方法的map中绑定一个  map.put("command",obj); //obj中只要提供表单上所有path属性对应属性名称就可以
	 	
	 	如果希望map中的key不为command;可以在表单上使用modelAttribute来指定map中的key,从key所对应的对象中查找与path名称一致的属性
	 -->
	<form:form action="${pageContext.request.contextPath }/emp" method="POST">
		<!-- 获取隐含参数 ,便于以后查询-->
		<form:hidden path="id"/>
		<!--  -->
		<input type="hidden" name="_method" value="PUT">
		<%-- LastName:<form:input path="lastName"/><br> --%> 
		Email&nbsp;&nbsp;&nbsp;:<form:input path="email"/><br>
		<%
			Map<String,String> genders=new HashMap<String,String>();
			genders.put("0", "female");
			genders.put("1","male");
			request.setAttribute("genders", genders);
		%>
		Gender:<form:radiobuttons path="gender" items="${requestScope.genders}"/><br>
		<!--itemLabel是下拉中的选择
			itemValue是选择提交的值
		 -->
		deptName:<form:select path="department.id" items="${requestScope.deplist }" itemLabel="departmentName" itemValue="id"><br>
				</form:select>
				
		<input type="submit" value="修改"><br>
	</form:form>
	
</body>
</html>