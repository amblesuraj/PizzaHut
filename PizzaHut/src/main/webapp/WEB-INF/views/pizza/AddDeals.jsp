<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container-fluid">
	<div class="container">
		<div class="row bg-light">
			<div class="col-12">


				<!--Alert class-->
				<c:if test="${not empty msg }">
					<div class="alert alert-success alert-dismissible fade show"
						role="alert">
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
						</button>
						<strong>Success!</strong> ${msg}
					</div>
				</c:if>

				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">Add Deals</h6>
					</div>
					<div class="card-body">
						<div class="offset-3 col-6 offset-3">

							<form:form id="dealsForm"
								action="${pageContext.request.contextPath}/admin/saveDeals"
								modelAttribute="deal" enctype="multipart/form-data">
								<div class="form-group row">
									<label for="" class="col-form-label font-weight-bold">
										Name</label>
									<form:input type="text" class="form-control" path="d_Name"
										id="d_Name" aria-describedby="helpId"
										placeholder="Enter Deal for..." />
								</div>

								<div class="form-group row">
									<label for="fileupload" class="col-form-label font-weight-bold">Upload
										Image</label>
									<form:input type="file" class="form-control-file"
										path="dealsImage" id="dealsImage" aria-describedby="fileHelpId" />
																	
								</div>

								<div class="row mb-2 mt-2">
									<div class="col-6">
										<button type="reset" id=""
											class="btn btn-primary font-weight-bold btn-block dealBtn">Reset</button>
									</div>

									<div class="col-6">
										<button type="submit" id=""
											class="btn btn-success font-weight-bold btn-block dealBtn">Submit</button>
									</div>

								</div>

								<form:hidden path="id" />

							</form:form>
						</div>
					</div>

				</div>
			</div>
		</div>

	</div>
</div>