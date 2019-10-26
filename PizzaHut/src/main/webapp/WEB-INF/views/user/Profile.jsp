<!doctype html>
<html lang="en">
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<head>
<title>Title</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<%@include file="../AdminCss.jsp"%>

<style type="text/css">
</style>
</head>

<body>
	<security:authorize
		access="hasAuthority('ADMIN') or hasAuthority('SUPERADMIN')">
		<div id="content">

			<!-- Topbar -->

			<%@include file="../admin/topbar.jsp"%>

			<!-- End of Topbar -->
		</div>
	</security:authorize>
	<security:authorize
		access="hasAuthority('EMPLOYEE') or hasAuthority('USER')">
		<div id="content">

			<!-- Topbar -->

			<%@include file="../shared/navbar.jsp"%>

			<!-- End of Topbar -->
		</div>
	</security:authorize>
	<!--User profile-->




	<div class="container-fluid">
		<div class="row ml-1 mr-1">
			<div
				class="col-12 col-sm-12 col-md-12 col-lg-3 bg-light text-white text-center userSideBar">
				<div class="mt-3">
					<div class="text-center">
						<input type="image"
							src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png"
							class="profileImage rounded-circle img-thumbnail" /> <input
							type="file" id="my_file" style="display: none;" />

					</div>
					<br>
				</div>
				<div class="card bg-light userTitleProfile">

					<div class="card-body ">
						<h4 class="card-title bg-dark">${userModel.fname}</h4>
						<p class="card-text small font-weight-bold text-primary">${userModel.email }</p>
						<ul class=" list-unstyled text-left">
							<li class="nav-item"><a href="">
									<h5 class="font-weight-bold text-secondary">
										<i class="fab fa-first-order text-primary"></i> &nbsp;My
										Orders
									</h5>
							</a></li>

							<li class="nav-item mt-3">
								<div id="accordianAccountSettings" role="tablist"
									aria-multiselectable="true">
									<div>
										<a data-toggle="collapse"
											data-parent="#accordianAccountSettings"
											href="#accountSetting" aria-expanded="true"
											aria-controls="accounSettingControl">

											<h5 class="font-weight-bold text-secondary">
												<i class="fas fa-user-alt text-primary"></i> &nbsp;Account
												Settings
											</h5>

										</a>
									</div>
									<ul class="list-unstyled collapse show" id="accountSetting"
										role="tabpanel" aria-labelledby="accounSettingControl">
										<li class="nav-item"><a href="#"
											class="nav-link text-left"> <i class="fas fa-user-circle"></i>&nbsp;&nbsp;Profile
												Information
										</a></li>
										<li class="nav-item"><a href="#"
											class="nav-link text-left"> <i
												class="fas fa-address-card text-primary "></i> &nbsp;
												&nbsp;Manage Addresses
										</a></li>

									</ul>

								</div>


							</li>



							<li class="nav-item mt-3">
								<div id="accordianPayment" role="tablist"
									aria-multiselectable="true">
									<div>
										<a data-toggle="collapse" data-parent="#accordianPayment"
											href="#Accountpayment" aria-expanded="true"
											aria-controls="AccountPaymentControl">

											<h5 class="font-weight-bold text-secondary">
												<i class="fas fa-user-alt text-primary"></i> &nbsp;Payment
											</h5>

										</a>
									</div>
									<ul class="list-unstyled collapse show" id="Accountpayment"
										role="tabpanel" aria-labelledby="AccountPaymentControl">
										<li class="nav-item"><a href="#"
											class="nav-link text-left"> <i class="fas fa-wallet    "></i>
												&nbsp;&nbsp; My wallet
												<div class="float-right text-dark">
													<i class="fas fa-rupee-sign"></i> 1000000
												</div>

										</a></li>
									</ul>

								</div>


							</li>
							<li class="nav-item mt-3"><a
								href="${pageContext.request.contextPath }/dashboard/logout">
									<h5 class="font-weight-bold text-secondary">
										<i class="fas fa-power-off text-primary "></i> &nbsp; Logout
									</h5>
							</a></li>

						</ul>

					</div>
				</div>


			</div>
			<div class="col-12 col-sm-12 col-md-12 col-lg-9">
				<div class="row ml-1 userSideBar">
					<!--Profile information form-->
					<div class="col-lg-12">
						<div class="mt-3">
							<h5 class="font-weight-bold ">Profile Information</h5>

						</div>

						<form class="form-horizontal" action="/user/update" method="POST" enctype="application/x-www-form-urlencoded">
							<div class="row ">

								<div class="col-4">
									<div>
										<input type="hidden" name="id" value="${user.id }" >
										<input type="hidden" name="username" value="${user.username }" >
												
									</div>
								
								
									<div class="form-group">
										<label for=""></label> <input type="text" name="fname"
											id="FirstNameEdit" class="form-control" disabled
											placeholder="First Name" aria-describedby="helpId"
											value="${user.fname }">
									</div>
								</div>
								<div class="col-4">
									<div class="form-group">
										<label for=""></label> <input type="text" name="lname"
											id="LastNameEdit" class="form-control" disabled
											placeholder="First Name" aria-describedby="helpId"
											value="${user.lname}">
									</div>
								</div>
								<div class="offset-2 col-2 mt-4">
									<div class="form-group">
										<label for=""></label>
										<a type="button" href="javascript:void(0)" id="Edit"
											class="btn btn-primary btn-rounded btn-sm text-white">Edit</a>
									</div>
								</div>

							</div>
							<div class="row ">
								<div class="col-4">
									<div class="form-group">
										<label for=""></label> <input type="email" name="email"
											id="emailEdit" class="form-control" disabled
											placeholder="Email here..." aria-describedby="helpId"
											value="${user.email }">
									</div>
								</div>
							</div>
							
								<div class="row">
									<div class="col-4 mt-2">
										<div class="form-group">
											<label for="" class="font-weight-bold">Phone number</label> <input
												type="number" name="phone" id="PhoneEdit" class="form-control"
												disabled placeholder="Phone Number"
												aria-describedby="helpId" value="${user.phone}"
												required>
										</div>
									</div>
								</div>
							
							<div class="mt-3">
								<button type="reset"
									class="btn btn-primary font-weight-bold btn-rounded"
									id="editCancelButton">Cancel</button>
								<input type="submit"
									class="btn btn-primary font-weight-bold btn-rounded"
									id="editSubmitButton" value="Submit">
							</div>

						</form>




						<br> <br>
						<br>
						<!--Profile information form end-->


						<!--Address Manage form-->
						<div class="col-lg-12 mt-3">
							<div id="accordianManageAddress" role="tablist"
								aria-multiselectable="true">
								<div>
									<a class="text-dark" id="AddNewAddress" data-toggle="collapse"
										data-parent="#accordianManageAddress"
										href="#AddressManageSetting" aria-expanded="true"
										aria-controls="ManageAddressControl"> <strong>Add
											New Addresses</strong>

									</a>
								</div>
								<ul class="list-unstyled collapse mt-2"
									id="AddressManageSetting" role="tabpanel"
									aria-labelledby="ManageAddressControl">


									<form>
										<div class="form-group row">
											<label for="inputName" class="col-sm-1-12 col-form-label"></label>
											<div class="col-4">
												<input type="text" class="form-control" name="inputName"
													id="inputName" placeholder="">
											</div>
											<div class="col-4">
												<input type="text" class="form-control" name="inputName"
													id="inputName" placeholder="">
											</div>
										</div>

										<div class="form-group row">
											<div class="col-6">
												<button type="submit" class="btn btn-primary">Action</button>
											</div>
										</div>
									</form>


								</ul>

							</div>


						</div>
						<div class="MyAddress col-lg-12">
							<table class="table table-hover table-inverse table-responsive">
								<thead class="thead-inverse">
									<tr>
										<th>Address</th>
										<th>Delete</th>

									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<address>
												Address Line 1 At Post Kuruli<br> Address Line 2 Tal
												Khed Dist Pune<br> Pin-410501

											</address>



										</td>
										<td><a name="" id="" class="btn btn-primary" href="#">
												<i class="fas fa-trash    "></i>
										</a></td>
										<td></td>
									</tr>
									<tr>
										<td scope="row"></td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!--Address manage Form end-->
					</div>
				</div>



			</div>

		</div>

	</div>




	<footer>

		<%@include file="../shared/footer.jsp"%>

	</footer>
</body>

</html>