<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid navbarGradient mb-1">

	<div class="container">

		<nav class="navbar navbar-expand-lg navbar-light h-100">

			<a class="navbar-brand text-white active" href="${pageContext.request.contextPath}/home">Pizzahut</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#collapsibleNavId" aria-controls="collapsibleNavId"
				aria-expanded="false" aria-label="Toggle navigation">
				<img src="${images}/icons8-menu-48.png" width="20" />
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavId">
				<ul class="navbar-nav m-auto mt-2 mt-lg-0 text-center MyNavbar">
					<security:authorize access="!isAuthenticated() or hasAuthority('USER') or hasAuthority('EMPLOYEE')">
					<li class="nav-item">
						<div class="form-group m-auto example">
							<input type="text" class="form-control searchBox" size="60"
								name="inputName" id="inputName" placeholder="Search...">
						</div>
					</li>
					
					<li class="nav-item">
						<button type="button" class="btn btn-default bg-white">
							<i class="fa fa-search text-primary" id="searchBtn"
								aria-hidden="true"></i>
						</button>
					</li>
					
					</security:authorize>
					
					<security:authorize access="hasAuthority('SUPERADMIN') or hasAuthority('ADMIN')">
						<li class="nav-item">
							<a class="nav-link text-white" href="${pageContext.request.contextPath}/admin" > 
									Dashboard
							 </a>
						</li>
						<li class="nav-item">
							<a class="nav-link text-white ml-5" href="${pageContext.request.contextPath}/admin/AddPizza" > 
									Add Pizza
							 </a>
						</li>
						<li class="nav-item">
							<a class="nav-link text-white ml-5" href="${pageContext.request.contextPath}/admin/AddDeals" > 
									Add Deals
							 </a>
						</li>
						<li class="nav-item ml-5">
					<div class=" dropdown">	
					
					
						<a href="javascript:void(0)" class="nav-link text-white dropdown-toggle" id="dropdownDispay" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Display Lists <i class="fa fa-caret-down" aria-hidden="true">
							</i>
						</a>
					
						 <div class="dropdown-menu" aria-labelledby="dropdownDispay">
						 		<div class="dropdown-header">List</div>
							    <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/showAllUsers">Display User Details</a>
							    <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/showPizza">Pizza List</a>
							    <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/showAllDeals">Deals List</a>
  						</div>
					
						</div>	
					</li>
					
					</security:authorize>
					
					
				</ul>
				
				<ul class="navbar-nav MyNavbar text-center m-auto ">
				<security:authorize access="!isAuthenticated()">
					
					
					<li class="nav-item ml-3 "><a class="nav-link text-white"
						href="${pageContext.request.contextPath}/dashboard/login"
						aria-haspopup="true" aria-expanded="false"> Login &amp; Sign Up </a></li>
						
				</security:authorize>
					
					
				
						<security:authorize access="hasAuthority('EMPLOYEE') or hasAuthority('USER')" >
						
						<li class="nav-item ml-3">
					
					
						<a href="${pageContext.request.contextPath}/cart/show" class="nav-link text-white ">
						
							<i class="fa fa-shopping-cart"></i> Cart
						</a>
					
	
					</li>
						
						</security:authorize>
						<security:authorize access="isAuthenticated()">
						  <li class="nav-item ml-3 ">
						  <div class=" dropdown">	
					
							<a href="javascript:void(0)" class="nav-link text-white dropdown-toggle" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Welcome, ${userModel.fname} 
							</i>
						</a>
					
						 <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						 <security:authorize access="hasAuthority('ADMIN')">
							    <a class="dropdown-item" href="${pageContext.request.contextPath}/admin">Admin Dashboard</a>
						</security:authorize>
						<security:authorize access="hasAuthority('EMPLOYEE') or hasAuthority('USER')" >
							    <a class="dropdown-item" href="/user/profile?id=${userModel.id}">Profile</a>
						</security:authorize>
							<div class="dropdown-divider"></div>
							    <a class="dropdown-item" href="${pageContext.request.contextPath}/dashboard/logout">Logout</a>
  						</div>
					
						</div>
						
						</li>
						
								
							
						</security:authorize>
				</ul>
				</div>
		</nav>
		
	</div>
</div>


<!-- Popover Dropdown List-->
