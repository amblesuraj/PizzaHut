<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Pizza - ${title}</title>
<%@include file="LinkingFiles.jsp"%>




</head>
<body onload="loading()">

<div id="loading">

</div>

	<div id="page-content">

		<header>
			<%@include file="./shared/navbar.jsp"%>
		</header>
		<c:if test="${not empty msg}">
			<div class="alert alert-success alert-dismissible fade show">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				<strong>Success!</strong> ${msg}
			</div>
		</c:if>

		
		<c:if test="${not empty logout}">
			<div class="alert alert-success alert-dismissible fade show">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				<strong>Success!</strong> ${logout}
			
			</div>
			<%@include file="./home/home.jsp"%>
		</c:if>


		<c:if test="${userClickHome == true}">
			<%@include file="./home/home.jsp"%>
		</c:if>

		<c:if test="${userClickWelcome == true}">
			<%@include file="./dashboard/welcome.jsp"%>
		</c:if>


		<c:if test="${userClickShowPizza == true}">
			<%@include file="./pizza/pizza.jsp"%>
		</c:if>
		
		<c:if test="${AdminClickShowDeals == true}">
			<%@include file="./pizza/ShowAllDeals.jsp"%>
		</c:if>
		
		<c:if test="${userClickCheckout == true}">
			<%@include file="./pizza/checkout.jsp"%>
		</c:if>

		<c:if test="${AdminClickHome == true}">
			<%@include file="./home/home.jsp"%>
		</c:if>

		<c:if test="${userClickProfile == true}">
			<%@include file="./user/Profile.jsp"%>
		</c:if>
		<c:if test="${userClickPrivacyPlicy == true}">
			<%@include file="./common/privacy.jsp"%>
		</c:if>

		<c:if test="${userClickTerms == true}">
			<%@include file="./common/terms.jsp"%>
		</c:if>

		<c:if test="${UserClickShowCart == true}">
			<%@include file="./user/cart.jsp"%>
		</c:if>

		<c:if test="${AdminClickMe == true}">
			  	<%@include file="./common/contact.jsp" %>
			</c:if>



	</div>

	<!-- page content end -->
	<security:authorize
		access="!isAuthenticated() or hasAuthority('EMPLOYEE') or hasAuthority('USER')">
		<footer>

			<%@include file="./shared/footer.jsp"%>
		</footer>

	</security:authorize>

	<security:authorize
		access="hasAuthority('SUPERADMIN') or hasAuthority('ADMIN')">
		<footer>

			<%@include file="./admin/footer.jsp"%>
		</footer>

	</security:authorize>




<script>
  var x = document.getElementById("loading");

function loading()
{
    
    x.style.display='none';
}
</script>

</body>
</html>