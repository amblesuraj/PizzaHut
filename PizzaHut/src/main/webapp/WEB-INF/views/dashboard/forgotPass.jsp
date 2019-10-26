<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reset Password</title>
<%@include file="../AdminCss.jsp"%>

</head>
<body class="bg-gradient-primary">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-2">Forgot Your Password?</h1>
										<p class="mb-4">We get it, stuff happens. Just enter your
											email address below and we'll send you a link to reset your
											password!</p>
									</div>



									<form class="user" method="post" action="/user/forgotPassword">
										<div class="form-group">
											<input type="email" id="forgotemail_check"
												class="form-control form-control-user" name="email"
												placeholder="Enter Email Address...">
										</div>

										<!--                     <div class="alert alert-danger" role="alert"> -->
										<!--                       <strong><div id="forgotemail_error"></div></strong> -->
										<!--                     </div> -->


										<c:if test="${not empty successMessage }">
											<div class="alert alert-success" role="alert">
												<strong>${successMessage}</strong>
											</div>
										</c:if>
										<c:if test="${not empty errorMessage}">
											<div class="alert alert-success" role="alert">
												<strong>${errorMessage}</strong>
											</div>
										</c:if>
										
											<input type="submit" class="btn btn-primary btn-user btn-block" value="Send Reset Link"> 
									</form>
									<hr>
									<div class="text-center">
										<a class="small" href="/dashboard/login">Back to login!</a>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>



</body>
</html>