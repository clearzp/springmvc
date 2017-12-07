<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'index.jsp' starting page</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#testJSON").click(function(){
				var url=this.href;
				var data={};
				var callback=function(result){
					alert(result);
				};
				$.post(url,data,callback);
				return false;
			});
		});
		
	</script>
  </head>
  
  <body>
    <a href="${pageContext.request.contextPath }/helloWorld">第一次玩springmvc</a><br/>
    <a href="${pageContext.request.contextPath }/testRequestParam?username=zhangsan&age=10">Test RequestParam</a><br/>
    <!--测试映射URL的占位符 -->
	<a href="${pageContext.request.contextPath }/testPathVariable/10">Test PathVariable</a>
	<br/>
	<a href="${pageContext.request.contextPath }/emps">查找所有的Employees</a>
	<br>
	 <a id="testJSON" href="${pageContext.request.contextPath }/testJSON">Test JSON</a>
  </body>
</html>
