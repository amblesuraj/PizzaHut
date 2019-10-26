<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${title}</title>
<%@include file="../LinkingFiles.jsp"%>
<style type="text/css">
footer
{
margin-top:12% !important;
}

</style>
</head>
<body>
	<header>
			
	
	</header>
	<section>
	<div class="container">
		<div class="jumbotron">
	<h1>${ errorTitle}</h1>
  <h4 class="display-4">Hello,<security:authentication property="name"/> !</h4>
  
  <p class="lead">${errorDescription}</p>
  
  <hr class="my-4">
  <c:if test="${NoHandlerFound == true}">
  		<p>The Url you have entered is wrong. There is no such mapping found for the <strong class="text-danger">${url }</strong></p>		
  	
  </c:if>
  		
  <p>
  
  			${errorMessage}
  
  </p>
  
  <p class="lead">
    <a class="btn btn-primary btn-rounded btn-lg" href="${pageContext.request.contextPath}/home" role="button">Go Home</a>
  </p>
</div>
	</div>
	
	
	</section>
	<footer>

		<%@include file="../admin/footer.jsp"%>
	</footer>


</body>
</html>