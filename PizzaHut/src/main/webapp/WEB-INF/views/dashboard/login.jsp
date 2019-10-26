<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Pizzahut - Login</title>
<%@include file="../LinkingFiles.jsp"%>
</head>

<body class="bg-backGradient">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 bg-login shadow-lg mt-5">
					<div class="card-body p-0 ">
						<!-- Nested Row within Card Body -->
						<div class="row modal-bg">
							<div class="col-lg-6 d-none d-lg-block "></div>
							<div class="col-lg-6 bg-light bg-login">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4 text-danger">Welcome
											Pizzahut!</h1>
									</div>
									<form
										action="${pageContext.request.contextPath}/dashboard/process-login"
										id="loginForm" method="post">
										<div class="form-group">
											<div class="text-center">
												<h1 class="h4 mb-4 account text-success">Login !</h1>
											</div>

											<c:if test="${param.error != null}">
												<div class="alert alert-danger alert-dismissible fade show">
													<button type="button" class="close" data-dismiss="alert">&times;</button>
													<strong>Error!</strong> ${error}
												</div>
											
											</c:if>

											<c:if test="${not empty msg}">
												<div class="alert alert-success alert-dismissible fade show">
													<button type="button" class="close" data-dismiss="alert">&times;</button>
													<strong>Success!</strong> ${msg}
												</div>
											
											</c:if>

											<c:if test="${param.logout != null}">
												<div class="alert alert-success alert-dismissible fade show">
													<button type="button" class="close" data-dismiss="alert">&times;</button>
													<strong>Success!</strong> ${logout}
												</div>
											
											</c:if>
											
											<input type="text" name="username"
												class="form-control form-user" id="username"
												aria-describedby="helpId" placeholder="Enter username" /> <small
												id="LoginUsernameError" class="form-text text-danger"></small>
										</div>

										<div class="form-group ">
<!-- 											<i class="fa fa-eye-slash login-eye" aria-hidden="true"></i> -->
											<input type="password" name="password"
												class="form-control form-user" id="password" placeholder="Enter your password" />
<!-- 												 <small id="helpId" -->
<!-- 												class="form-text text-muted">Password must not be -->
<!-- 												less than 6</small> -->
										</div>

										<div class=" form-group custom-control custom-checkbox">
											<input type="checkbox" name="remember-me" id="RememberMe"
												value="checkedValue" class="custom-control-input"> <label
												class="custom-control-label text-dark" for="RememberMe">Remember
												Me</label>
										</div>
										<div class="form-group">

											<input type="submit"
												class="fab btn btn-primary btn-login btn-lg btn-block user"
												id="login" name="Login" value="Login">

										</div>
									</form>

									<hr>
									<div class="text-center mt-2">
										<a class="small" href="${pageContext.request.contextPath}/user/forgotpass">Forgot
											Password?</a>
									</div>
									<div class="text-center mt-3">
										<a class="small"
											href="${pageContext.request.contextPath}/dashboard/register">Create
											an Account!</a>
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



