<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
</head>
<body>

		<h3>Home Page</h3>
		
		
		<a href="${pageContext.request.contextPath}/home/index">HOME</a>
			|
			<a href="${pageContext.request.contextPath}/employee">Employee Panel</a>
			|
			<a href="${pageContext.request.contextPath}/admin">Admin Panel</a>
			|
			<a href="${pageContext.request.contextPath}/superadmin">Superadmin Panel</a>
			<br>
			<br>
			<h2><a href="${pageContext.request.contextPath}/dashboard/welcome">
			
			Welcome page
			</a></h2>
			<br>
</body>
</html>