<!-- Sidebar -->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="${pageContext.request.contextPath}/admin/me">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">
			Admin <sup>2</sup>
		</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<li class="nav-item active">
			<a class="nav-link" href="${pageContext.request.contextPath}/admin">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
			</a>
	</li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">Admin </div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true"
		aria-controls="collapseTwo"> <i class="fas fa-fw fa-cog"></i> <span>Pizza Details</span>
	</a>
		<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">Custom Components:</h6>
				<a class="collapse-item" href="${pageContext.request.contextPath}/admin/AddDeals">Add Deals</a>
				<a class="collapse-item" href="${pageContext.request.contextPath}/admin/AddPizza">Add Pizza</a> 
			</div>
		</div></li>

	<!-- Nav Item - Utilities Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseUtilities"
		aria-expanded="true" aria-controls="collapseUtilities"> <i
			class="fas fa-fw fa-wrench"></i> <span>Display List :</span>
	</a>
		<div id="collapseUtilities" class="collapse"
			aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">Display Utilities:</h6>
				<a class="collapse-item" href="utilities-color.html"></a> <a
					class="collapse-item" href="${pageContext.request.contextPath}/admin/home">User Dashboard</a> <a
					class="collapse-item" href="${pageContext.request.contextPath}/admin/showAllUsers">User Details</a>
				
				<a class="collapse-item" href="${pageContext.request.contextPath}/admin/showAllCategories">Display Categories</a>
				
			</div>
		</div></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">Addons</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapsePages"
		aria-expanded="true" aria-controls="collapsePages"> <i
			class="fas fa-fw fa-folder"></i> <span>Utilities :</span>
	</a>
		<div id="collapsePages" class="collapse"
			aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">Pizza Lists</h6>
				<a class="collapse-item" href="${pageContext.request.contextPath}/admin/showPizza">Display Pizza details</a>
				<a class="collapse-item" href="${pageContext.request.contextPath}/admin/showAllDeals">Display Deals</a> 
				<div class="collapse-divider"></div>
				<h6 class="collapse-header">Other Pages:</h6>
					<a class="collapse-item" href="404.html">404 Page</a> <a
					class="collapse-item" href="blank.html">Blank Page</a>
			</div>
		</div></li>

	<!-- Nav Item - Charts -->
	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/pieChart"> <i
			class="fas fa-fw fa-chart-area"></i> <span>Charts</span></a></li>

	

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>

</ul>
<!-- End of Sidebar -->



<!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>