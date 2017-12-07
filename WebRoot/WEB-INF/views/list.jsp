<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 静态资源加载还是需要配置 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".delete").click(function(){
		 	 var href= $(this).attr("href");
		 	alert(href);
			$("form").attr("action",href).submit();
			return false;
		});

	});
</script>
</head>
<body>
	 <!-- 删除提交的方式是delete，可以转换 -->
	 <!-- 别忘了web.xml中的配置 -->
	<form action="" method="POST">
			<input type="hidden" name="_method" value="DELETE">
	</form>
	 <!-- springmvc没有迭代标签，所以需要jstl标签库迭代标签-->
	 <c:if test="${empty requestScope.emplist }">
	 	没有查询到任何信息
	 </c:if>
	 <c:if test="${!empty requestScope.emplist }">
	 	<center>
	 		<table border="1" width="80%">
	 			<tr>
	 				<th>ID</th>
	 				<th>lastName</th>
	 				<th>Email</th>
	 				<th>Gender</th>
	 				<th>DeptName</th>
	 				<th><a href="#">更新</a></th>
	 				<th><a href="#">删除</a></th>
	 			</tr>
	 			<c:forEach items="${requestScope.emplist}" var="emp">
	 				<tr>
	 					<td>${emp.id }</td>
	 					<td>${emp.lastName }</td>
	 					<td>${emp.email }</td>
	 					<td>${emp.gender==0?"Female":"Male" }</td>
	 					<td>${emp.department.departmentName }</td>
	 					<td><a href="${pageContext.request.contextPath }/emp/${emp.id}">更新</a></td>
	 					<td><a class="delete" href="${pageContext.request.contextPath }/emp/${emp.id}">删除</a></td>
	 				</tr>
	 			</c:forEach>
	 		</table>
	 	</center>
	 </c:if>
	 
	 <a href="${pageContext.request.contextPath }/emp">添加员工</a>
	 <br>
	 
	
</body>

</html>