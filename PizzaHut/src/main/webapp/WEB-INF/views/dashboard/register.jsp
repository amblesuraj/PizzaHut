

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Pizzahut - Register</title>
<%@include file="../LinkingFiles.jsp"%>
</head>

<body class="bg-backGradient">

	<div class="container ">

		<div class="card o-hidden border-0 bg-login shadow-lg my-5 ">
			<div class="card-body p-0 ">
				<!-- Nested Row within Card Body -->
				<div class="row  bg-image shadow">
					<div class="col-lg-6 d-none d-lg-block"></div>
					<div class="col-lg-6 bg-light bg-login">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
							</div>

							<c:if test="${not empty msg}">
								<div class="alert alert-success alert-dismissible fade show">
									<button type="button" class="close" data-dismiss="alert">&times;</button>
									<strong>Success!</strong> ${msg}
								</div>
							</c:if>
							<c:if test="${not empty error}">
								<div class="alert alert-danger alert-dismissible fade show">
									<button type="button" class="close" data-dismiss="alert">&times;</button>
									<strong>Error!</strong> ${error}
								</div>
							</c:if>



<form:form method="post" class="myForm" action="${pageContext.request.contextPath}/dashboard/register" modelAttribute="user"
 id="RegisterForm">
	 
	 <div class="form-group row">
			<div class="col-sm-6 mb-3 mb-sm-0">
					<form:input path="fname" type="text" class="form-control form-user" id="exampleFirstName" placeholder="First Name" />
						<form:errors path="fname" cssClass="text-danger" /> 
			</div>
			<div class="col-sm-6">
					<form:input path="lname" type="text" class="form-control form-user" id="exampleLastName" placeholder="Last Name" />
										 <form:errors path="lname" cssClass="text-danger" /> 
			</div>

	</div>
	<div class="form-group">
			<form:input path="username" type="text" class="form-control form-user" id="username_check" placeholder="Username" />
					<form:errors path="username" id="username_error" cssClass="text-danger" /> 
	</div>
	<div class="form-group">
			<form:input path="email" type="email" class="form-control form-user" id="email_check" placeholder="Email Address" />
					<form:errors path="email" cssClass="text-danger" /> 
					
	</div>
	<div class="form-group row">
			<div class="col-sm-6 mb-3 mb-sm-0">
					<form:password path="password" class="form-control form-user" id="rPassword" placeholder="Password" />
						<form:errors path="password" cssClass="text-danger" /> 
			</div>
			<div class="col-sm-6">
					<i class="fa fa-eye-slash register-eye" aria-hidden="true"></i>
					<form:password path="confirmPassword" class="form-control form-user" id="cPassword" placeholder="Confirm Password" />
					 <form:errors path="confirmPassword" cssClass="text-danger" /> 

			</div>
	</div>
	<div>
			<div class=" justify-content-center align-items-center">
					<input type="submit" class="btn btn-primary user regBtn btn-block" value="REGISTER ACCOUNT">

			</div>
	</div>
</form:form>
							<hr>

							<div class="text-center mt-2">
								<a class="small" href="/dashboard/login">Already have an
									account? Login!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>


</body>
</html>







