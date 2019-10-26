<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Access Denied Page</title>



<%@include file="../AdminCss.jsp" %>
</style>

</head>
<body class="page-top">

	
		<br><br><br>
			<div class="text-center">
				<p>
    		<h5 class="text-dark font-weight-bold">	Hello ,</h5><h4 class="text-danger font-weight-bold">Mr./Mrs ${pageContext.request.userPrincipal.name}</h4>
    		</p>
			</div>
    		
        <div class="text-center">
            <div class="error mx-auto" data-text="404">404</div>
            <p class="lead text-gray-800 mb-5">Page Not Found</p>
            <p class="text-gray-500 mb-0"> You do not have permission to this page.</p>
            <br>
            <a href="${pageContext.request.contextPath}/dashboard/index" class="btn btn-primary btn-rounded">&larr; Back to Dashboard</a>
          </div>
		
		
	
	
</body>
</html>