<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
         <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Password Reset</title>
    <%@include file="../AdminCss.jsp" %>
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
                                    <h1 class="h4 text-gray-900 mb-2">Reset Password?</h1>
                                    <p class="mb-4">Make sure you have entered a strong password to reset your password!</p>
                                </div>
                                
                                <c:if test="${not empty errorMessage}">
											<div class="alert alert-success" role="alert">
												<strong>${errorMessage}</strong>
											</div>
										</c:if>
                                
                                <form class="user" method="post" action="/user/reset">

                                    <div class="form-group">
                                         <input type="password" name="password" class="form-control form-control-user" id="" placeholder="New password..." value=""> 
                                    </div>
                                    

                                    <div class="form-group">
                                         <input type="password" class="form-control form-control-user" name="confirmPassword" id="" placeholder="Confirm Password..."> 
                                    </div>

									<input type="hidden" name="token" value="${resetToken}" />

                                    <input type="submit" value="Reset Password" class="btn btn-primary btn-user btn-block">
                                </form>
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