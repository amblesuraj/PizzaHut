<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${title}</title>
<%@include file="../AdminCss.jsp" %>
</head>


<body id="page-top">

	
  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    
    	<%@include file="sidebar.jsp" %>
    
	<!-- End of Side bar -->
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
			


        <!-- Topbar -->
        		
        		<%@include file="topbar.jsp" %>
        
        <!-- End of Topbar -->




      <!-- Main Content -->
<div id="content">				      
        <!-- Dashboard Content -->
        <div class="container-fluid">
			
			<c:if test="${AdminClickDashboard == true}">
			  	<%@include file="AdminDashboard.jsp" %>
			</c:if>
		
		
			<c:if test="${AdminClickHome == true}">
		  		<%@include file="../home/home.jsp" %>
			</c:if>
				
			<c:if test="${AdminClickpizzaInsert == true}">
		  		<%@include file="../pizza/Addpizza.jsp" %>
			</c:if>
			
			<c:if test="${AdminClickShowAllUser == true}">
					<%@include file="../user/allUsers.jsp" %>
			</c:if>
		
	
		
		<c:if test="${	AdminClickShowAllPizza== true}">
					<%@include file="../pizza/pizzaList.jsp" %>
			</c:if>
		
			<c:if test="${AdminClickShowAllCategories== true}">
					<%@include file="../pizza/category.jsp" %>
			</c:if>
			<c:if test="${AdminClickAddDeals== true}">
					<%@include file="../pizza/AddDeals.jsp" %>
			</c:if>
			
			<c:if test="${userClickShowDeals== true}">
					<%@include file="../pizza/AddDeals.jsp" %>
			</c:if>
			
			
			<c:if test="${AdminClickPieChart == true}">
					<%@include file="PieChart.jsp" %>
			</c:if>
			
			
		
		</div>

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      
      		<%@include file="footer.jsp" %>
      	
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->


  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>



</body>


</html>