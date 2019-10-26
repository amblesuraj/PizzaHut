<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


    <!--Alert class-->
                    <c:if test="${not empty msg }">
                    		<div class="alert alert-success alert-dismissible fade show" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                                <span class="sr-only">Close</span>
                            </button>
                            	<a class="btn-circle btn-lg btn btn-danger"><i class="fas fa-thumbs-up text-white"></i></a>
                            	
                            <strong>Success!</strong> ${msg}
                        </div>
                    </c:if>


 <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">All User Details</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive-lg">
<table id="pizzaTable" class="table table-striped table-bordered ">
        <thead>
            <tr>
            	<th>Id</th>
                <th>Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>discount</th>
                <th>Description</th>
                
                                
            </tr>
        </thead>
        <tbody>
        <c:forEach var="pizza" items="${allPizzas}">
<%--         <c:if test="${pizza.pType = 'supreme' }"> --%>
        		
        		<td>${pizza.id }</td>
                <td>${pizza.pName} </td>
                <td> ${pizza.categoryName}</td>
                <td> ${pizza.pPrice}</td>
                <td> ${pizza.discount}</td>
                <td> ${pizza.pizzaDescription}</td>
                
                
                
<%--         </c:if> --%>
        
<%--         <c:if test="${pizza.pType = 'signature' }"> --%>
<%--         		<td>${pizza.id }</td> --%>
<%--                 <td>${pizza.pName} </td> --%>
<%--                 <td> ${pizza.categoryName}</td> --%>
<%--                 <td> ${pizza.pPrice}</td> --%>
<%--                 <td> ${pizza.discount}</td> --%>
<%--                 <td> ${pizza.pizzaDescription}</td> --%>
                
<%--         </c:if> --%>
        
<%--         <c:if test="${pizza.pType = 'favourite' }"> --%>
        		
<%--         		<td>${pizza.id }</td> --%>
<%--                 <td>${pizza.pName} </td> --%>
<%--                 <td> ${pizza.categoryName}</td> --%>
<%--                 <td> ${pizza.pPrice}</td> --%>
<%--                 <td> ${pizza.discount}</td> --%>
<%--                 <td> ${pizza.pizzaDescription}</td> --%>
                
<%--         </c:if> --%>
        
<%--         <c:if test="${pizza.pType = 'classic' }"> --%>
        		
<%--         		<td>${pizza.id }</td> --%>
<%--                 <td>${pizza.pName} </td> --%>
<%--                 <td> ${pizza.categoryName}</td> --%>
<%--                 <td> ${pizza.pPrice}</td> --%>
<%--                 <td> ${pizza.discount}</td> --%>
<%--                 <td> ${pizza.pizzaDescription}</td> --%>
                
<%--         </c:if> --%>
            <tr>
                
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
				          <h5 class="modal-title" id="exampleModalLabel">Delete Category</h5>
				          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
				            <span aria-hidden="true">×</span>
				          </button>
				        </div>
				        <div class="modal-body">
				        
				        <a class="btn-circle btn-lg btn btn-danger"><i class="fas fa-trash-alt text-white"></i></a>
				        	Do You really want to Delete <b class="text-primary"> ${pizza.pName} </b> Category ?
				        	
				        	</div>
				        <div class="modal-footer">
				          <button class="btn btn-primary" type="button" data-dismiss="modal">Cancel</button>
				          <a class="btn btn-danger" href="${pageContext.request.contextPath}/admin/deleteCategory/${pizza.id}">Delete</a>
				        </div>
				      </div>
				    </div>
				  </div>  
                   
        </c:forEach>
        </tbody>
        <tfoot>
         <tr>
            	<th>Id</th>
                <th>Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>discount</th>
                <th>Description</th>
                
            </tr>
        </tfoot>
        
          
        
    </table>		
		
		</div>
            </div>
          </div>
          
          
          
          
          
          
        
          
          
          
          
          
<script>


    $('#pizzaTable').DataTable();


</script>