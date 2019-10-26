<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SuperAdmin Page</title>
</head>
<body>

	<h3>Super Admin Page</h3>
	
	<h2>Welcome</h2> ${pageContext.request.userPrincipal.name}
	
	
	<br>
	
	<br>
	<br>
	<a href="${pageContext.request.contextPath}/home/index">HOME</a>
			|
			<a href="${pageContext.request.contextPath}/employee">Employee Panel</a>
			|
			<a href="${pageContext.request.contextPath}/admin">Admin Panel</a>
			
			
			
	<br>
	<br>
	<a href="${pageContext.request.contextPath}/dashboard/logout"></a>
			
	
</body>
</html>