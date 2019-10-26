<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  <%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Page</title>
</head>
<body>

	<h3>Employee Page</h3>
	
	<h2>Welcome</h2> ${pageContext.request.userPrincipal.name}
	
	<br>
	
	<br>
	<br>
			<a href="${pageContext.request.contextPath}/home/index">HOME</a>
			|
			
			<security:authorize access="hasAuthority('ADMIN') or hasAuthority('SUPERADMIN')">
			
				<a href="${pageContext.request.contextPath}/admin/">Admin Panel</a>
				|
			</security:authorize>
			
			
			<security:authorize access="hasAuthority('SUPERADMIN')">
			
				<a href="${pageContext.request.contextPath}/superadmin/">SuperAdmin Panel</a>
			
			</security:authorize>
			
	<br><br>
	
	<a href="${pageContext.request.contextPath}/dashboard/logout"></a>
	
</body>
</html>