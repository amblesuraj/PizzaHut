<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


    <!--Alert class-->
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


 <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">All User Details</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive-lg">
<table id="categoryTable" class="table table-striped table-bordered ">
        <thead>
            <tr>
            	<th>Id</th>
                <th>Name</th>
                <th>Description</th>
                <th>Delete</th>
                                
            </tr>
        </thead>
        <tbody>
        <c:forEach var="pizzaCategory" items="${PizzaCategories}">
            <tr>
                <td>${pizzaCategory.id }</td>
                <td>${pizzaCategory.name} </td>
                <td> ${pizzaCategory.description}</td>
                <td>
					<a class="nav-link" href="${pageContext.request.contextPath}/admin/deleteCategory/${pizzaCategory.id}">
                  		<i class="fas fa-trash text-danger"></i>
                  		
                	</a>
				</td>
                
                
                
            </tr>
				   <div class="modal fade" id="DeleteCategoryModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				    <div class="modal-dialog" role="document">
				      <div class="modal-content">
				        <div class="modal-header">
				          <h5 class="modal-title" id="exampleModalLabel">Delete Category</h5>
				          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
				            <span aria-hidden="true">×</span>
				          </button>
				        </div>
				        <div class="modal-body">
				        
				        <a class="btn-circle btn-lg btn btn-danger"><i class="fas fa-trash-alt text-white"></i></a>
				        	Do You really want to Delete <b class="text-primary">
				        	
				        	${pizzaCategory.name} </b> Category ?
				        	
				        	</div>
				        <div class="modal-footer">
				          <button class="btn btn-primary" type="button" data-dismiss="modal">Cancel</button>
				          <a class="btn btn-danger" href="${pageContext.request.contextPath}/admin/deleteCategory/${pizzaCategory.id}">Delete</a>
				        </div>
				      </div>
				    </div>
				  </div>
        </c:forEach>
        </tbody>
        <tfoot>
         <tr>
            	<tr>
            	<th>Id</th>
                <th>Name</th>
                <th>Description</th>
                <th>Delete</th>
                                
            </tr>
            </tr>
        </tfoot>
        
          
        
    </table>		
		
		</div>
            </div>
          </div>
          
          
          
          
          
          
        
          
          
          
          
          
<script>


    $('#categoryTable').DataTable();


</script>