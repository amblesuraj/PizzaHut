
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/DealImage" var="dealImage" />
<spring:url value="/resources/PizzaImages" var="pizzaImage" />
<spring:url value="/resources/js" var="js" />
<spring:url value="/resources/images" var="images" />

<!-- Bootstarp cdn -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <!-- Font awesome 5 -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/solid.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/regular.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/brands.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/fontawesome.css">
  <!-- Custome css -->
  <link rel="stylesheet" href="${css}/myCss.css">
  <!-- Glyphicons css -->
  <link rel="stylesheet" href="${css}/glyphicons.css">
  <!-- Custome footer css -->
  <link rel="stylesheet" href="${css}/footer.css">
  <!-- Custom Pizza css -->
  <link rel="stylesheet" href="${css}/pizza.css">
  
  <!-- JQuery File -->
  <script type="application/javascript" src="${js }/jquery-3.3.1.js"></script>
 
 <!-- popper js cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
 
    <!-- bootstrap js cdn -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 
  <!-- JQuery validator -->
  <script type="text/javascript" src="${js}/jquery.validator.js" ></script>
 
  <!-- JQuery Validation additinal method -->
<script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
<script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>
<script src="${js}/jquery-validate.bootstrap-tooltip.js"></script>
<!-- add bootstrap-tooltip.js file -->
<!--  -->
<script src="${js}/remote.js" type="application/javascript"></script>
<!--   Custome js File -->
<script src="${js}/myApp.js" type="application/javascript"></script> 








<%-- <script src="${js}/jquery-ui.js" type="application/javascript"></script> 	 --%>
<!-- <script src="https://www.google.com/recaptcha/api.js" async defer></script>-->



 <!-- Bootstrap tooltip validator -->
<!--    
-->