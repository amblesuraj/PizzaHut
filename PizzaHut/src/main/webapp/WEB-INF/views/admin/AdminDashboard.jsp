<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
             <a href="${pageContext.request.contextPath }/admin/pizzaReports" target="_blank" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Pdf</a>
			<a href="${pageContext.request.contextPath }/admin/pizzaExcel" target="_blank" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Excel</a>
          
          </div>


     <c:if test="${not empty msg }">
                    		<div class="alert alert-success alert-dismissible fade show" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                                <span class="sr-only">Close</span>
                            </button>
                            	<a class="btn-circle btn-lg"><i class="fas fa-thumbs-up text-danger"></i></a>
                            <strong>Success!</strong> ${msg}
                        </div>
                    </c:if>


<div class="row">

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Earnings (Monthly)</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Earnings (Annual)</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks</div>
                      <div class="row no-gutters align-items-center">
                        <div class="col-auto">
                          <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                        </div>
                        <div class="col">
                          <div class="progress progress-sm mr-2">
                            <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Pending Requests</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-comments fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          
          
<!-- ******************************Pie chart******************************************************************************************** -->




 <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">All Pizza Details</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive-lg">
<table id="pizzaTable" class="table table-striped table-bordered ">
        <thead>
            <tr class="text-center">
            	<th>Image</th>
                <th>Name</th>
                <th>Category</th>
                <th>Type</th>
                <th>Price</th>
                <th>discount</th>
                <th>Description</th>
                <th>Edit</th>
                <th>Delete</th>
        		                        
            </tr>
        </thead>
        <tbody>
        <c:forEach var="pizza" items="${allPizzas}">
            <tr class="text-center">
                <td><img src="${pizzaImage}/${pizza.pizzaimage}" width="50" height="50"></td>
                <td>${pizza.pName} </td>
                <td> ${pizza.categoryName}</td>
                <td>${pizza.pType}</td>
                <td> ${pizza.pPrice}</td>
                <td> ${pizza.discount}</td>
                <td> ${pizza.pizzaDescription}</td>
                <td ><a class="text-link" href="${pageContext.request.contextPath}/admin/pizza/${pizza.id}/update" >
                	<i class="fas fa-edit text-primary"></i></a>
                  </td>
                <td>
					<a class="dropdown-item" href="javascript:void(0)" data-toggle="modal" data-target="#DeletePizzaModel">
                  		<i class="fas fa-trash text-danger"></i>
                  		
                	</a>
				</td>
                
                
                
            </tr>
				   <div class="modal fade" id="DeletePizzaModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				    <div class="modal-dialog" role="document">
				      <div class="modal-content">
				        <div class="modal-header">
				          <h5 class="modal-title" id="exampleModalLabel">Delete Pizza</h5>
				          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
				            <span aria-hidden="true">×</span>
				          </button>
				        </div>
				        <div class="modal-body">
				        
				        <a class="btn-circle btn-lg btn btn-danger"><i class="fas fa-trash-alt text-white"></i></a>
				        	Do You really want to Delete this<b class="text-primary">${pizza.pName} </b> Pizza?
				        	
				        	</div>
				        <div class="modal-footer">
				          <button class="btn btn-primary" type="button" data-dismiss="modal">Cancel</button>
				          <a class="btn btn-danger" href="${pageContext.request.contextPath}/admin/deletepizza/${pizza.id}">Delete</a>
				        </div>
				      </div>
				    </div>
				  </div>
        </c:forEach>
        </tbody>
        <tfoot>
         <tr class="text-center">
            	<th>Image</th>
                <th>Name</th>
                <th>Category</th>
                <th>Type</th>
                <th>Price</th>
\                <th>discount</th>
                <th>Description</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </tfoot>
        
          
        
    </table>		
		
		</div>
            </div>
          </div>
           
<script>


    $('#pizzaTable').DataTable();


</script>