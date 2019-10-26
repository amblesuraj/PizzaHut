<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid">
        <div class="container">
            <div class="row bg-light">
                <div class="col-12">
                        

                    <!--Alert class-->
                    <c:if test="${not empty msg }">
                    		<div class="alert alert-success alert-dismissible fade show" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                                <span class="sr-only">Close</span>
                            </button>
                            <strong>Success!</strong> ${msg}
                        </div>
                    </c:if>
                       
<div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Add Pizza</h6>
            </div>
            <div class="card-body">
					<div class="offset-3 col-6 offset-3">

                    <form:form action="${pageContext.request.contextPath}/admin/savePizza" modelAttribute="pizza" enctype="multipart/form-data">
                        <div class="form-group row">
                            <label for="" class="col-form-label font-weight-bold">
                                Name</label>
                            <form:input type="text" class="form-control" path="pName" id="p_Name" aria-describedby="helpId"
                                placeholder="Enter Pizza Name..." />
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-form-label font-weight-bold">
                                Type</label>

								<form:select path="pType" class="form-control">
                                	<form:option value="supreme">Supreme</form:option>
                                	<form:option value="classic">Classic</form:option>
                                	<form:option value="signature">Signature</form:option>
                                	<form:option value="favourite">Favourite</form:option>
                                	
                                </form:select>
                        </div>
                        <div class="form-group row">
                          <label for="fileupload" class="col-form-label font-weight-bold">Upload Image</label>
                          <form:input type="file" class="form-control-file" path="pizzaimage" id="imageFile" aria-describedby="fileHelpId" />
                          
                        </div>

                        <div class="form-group row">
                            <label for="" class="col-form-label font-weight-bold">
                                Price</label>
                            <form:input type="number"  class="form-control prc" path="pPrice"  id="price" aria-describedby="helpId"
                                placeholder="Enter Price..." />
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-form-label font-weight-bold">
                                Quantity</label>
                            <form:input type="number"  class="form-control prc" value="1"  path="quantity" id="quantity" aria-describedby="helpId"
                              placeholder="Enter Quantity..." /> 
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-form-label font-weight-bold">
                                Total</label>
                            <form:input type="text"  class="form-control prc" path="total" id="total" aria-describedby="helpId" placeholder="Total..."/>
                        </div>
                        
                        <b>Service tax</b><br>
                            <div class="form-group row mt-4">

                                    
                                <div class="col-4">
                                        
                                    <label for="" class="font-weight-bold">C-GST</label>
                              <form:input type="text" class="form-control" path="cGst" id="cGstVal" aria-describedby="helpId" placeholder="" />
                                </div>
                                <div class="col-4">
                                    <label for="" class="font-weight-bold">S-GST</label>
                                    <form:input type="text" class="form-control" path="sGst" id="sGstVal" aria-describedby="helpId" placeholder="" />
                                </div>
                                <div class="col-4">
                                        <label for="" class="font-weight-bold">Total GST</label>
                                        <form:input type="text" class="form-control" path="totalGst" id="totalGst" aria-describedby="helpId" placeholder="" />
                                    </div>
                            </div>

                        
                         <div class="form-group row">
                            <label for="" class="col-form-label font-weight-bold">
                              Discount</label>
                            <form:input type="number" class="form-control" path="discount" id="discount" aria-describedby="helpId"
                                placeholder="Grand Discount..." />
                        </div>
 

                        <div class="form-group row">
                            <label for="" class="col-form-label font-weight-bold">
                              Grand  Total</label>
                            <form:input type="text" class="form-control" path="grandTotal" id="grandTotal" aria-describedby="helpId"
                                placeholder="Grand Total..." />
                        </div>


                        <div class="form-group row">
                                <label for="" class="col-form-label font-weight-bold">Select Category</label>
                                
                        
                                <form:select path="categoryName" items="${categories}" itemLabel="name" itemValue="name" class="form-control"/>
                         </div>
                        <div class="form-group row">
                            <label for="" class="col-form-label font-weight-bold">
                                Discription</label>
                            <form:textarea class="form-control" path="pizzaDescription" id="" rows="3" placeholder="Enter Pizza Description...."></form:textarea>
                        </div>


                        <div class="text-right mb-3">

                            <a class="btn btn-warning btn-sm font-weight-bold  text-dark dealBtn" href="javasript:void(0)" id="categoryModelLink" data-toggle="modal"
                                data-target="#categoryModal" aria-haspopup="true" aria-expanded="false">
                                Add Category
                            </a>
                        </div>

                        <div class="row mb-2">
                            <div class="col-6">
                                <button type="reset" id="" class="btn btn-primary font-weight-bold btn-block dealBtn">Reset</button>
                            </div>

                            <div class="col-6">
                                <button type="submit" id="" class="btn btn-success font-weight-bold btn-block dealBtn">Submit</button>
                            </div>

                        </div>
                        
                        <form:hidden path="id"/>
                        
                    </form:form>
					</div>
					</div>
					
                </div>
            				</div>
					</div>
					
                </div>
</div>





    <div class="modal fade" id="categoryModal" tabindex="-1" role="dialog" data-backdrop="static" keyboard="false"
        aria-labelledby="modelTitleId" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">

            <div class="modal-content ">

                <div class="modal-body category-bg">
                    <div class="container-fluid">
                        <div class="row">

                            <div class="col-lg-6 ">

                            </div>
                            <div class="col-lg-6 bg-light bg-login">
                                <button type="button" class="close close-login" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">
                                        <img src="${images }/close.png"
                                            class="img-fluid"
                                            alt="close">
                                    </span>
                                </button>
                                <div class="pt-5 pl-2 pr-2">
                                    <form:form action="${pageContext.request.contextPath}/admin/saveCategory" method="POST" modelAttribute="category">

                                        <div class="text-center">
                                                <h5 class="text-white bg-backGradient1 dealBtn" style="line-height:35px;">Category</h5>
                                        </div>
                                        <div class="form-group row">
                                            <label for="" class="col-form-label font-weight-bold">
                                                Name</label>
                                            <form:input type="text" class="form-control form-category" path="name" id="cat_name"
                                                aria-describedby="helpId" placeholder="Enter Pizza Category..." />
                                        </div>
                                       

                         
                                        <div class="form-group row">
                                            <label for="" class="col-form-label font-weight-bold"> Discription</label>
                                            <form:textarea class="form-control form-category" path="description" id="description"
                                                rows="9" placeholder="Enter Pizza Description ...."></form:textarea>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-6">
                                                <button type="reset" id="resetBtn"
                                                    class="btn btn-warning btn-block font-weight-bold dealBtn">Reset</button>
                                            </div>

                                            <div class="col-6">
                                                <button type="submit" id="submitBtn"
                                                    class="btn btn-success btn-block font-weight-bold dealBtn">Add Category</button>
                                            </div>

                                        </div>
                                    </form:form>




                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <!-- 
    		
     -->