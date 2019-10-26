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
              <h6 class="m-0 font-weight-bold text-primary">Make Payment</h6>
            </div>
            <div class="card-body">
					<div class="offset-3 col-6 offset-3">

                    <form:form action="${pageContext.request.contextPath}/user/checkoutPayment" id="CheckoutForm" modelAttribute="checkout" enctype="multipart/form-data">
                        <div class="form-group row">
                            <label for="" class="col-form-label font-weight-bold">
                                Name</label>
                            <form:input type="text" class="form-control" path="fullname" id="p_Name" aria-describedby="helpId"
                                placeholder="First Name is fine" />
                        </div>
                        
                        <div class="form-group row">
                            <label for="" class="col-form-label font-weight-bold">
                                Email</label>
                            <form:input type="email" class="form-control" path="email" id="p_Name" aria-describedby="helpId"
                                placeholder="can send you confirmation" />
                        </div>
                        
                        <div class="form-group row">
                            <label for="" class="col-form-label font-weight-bold">
                                Phone </label>
                            <form:input type="text" class="form-control" path="phone" id="phone" aria-describedby="helpId"
                                placeholder="so We can contact you" />
                        </div>

                        <div class="form-group row">
                            <label for="" class="col-form-label font-weight-bold">
                                Delievery Address</label>
                            <form:textarea class="form-control" path="address" id="" rows="3" placeholder="Enter Delievery Address..."></form:textarea>
                        </div>
                        
                        <div class="form-group row">
                            <label for="" class="col-form-label font-weight-bold">
                                LandMark</label>
                            <form:input type="text" class="form-control" path="landmark" id="p_Name" aria-describedby="helpId"
                                placeholder="" />
                        </div>
						
						<div class="form-group row">
                            <label for="" class="col-form-label font-weight-bold">
                                Pin Code </label>
                            <form:input type="text" class="form-control" path="pincode" id="phone" aria-describedby="helpId"
                                placeholder="can get to your location quickly..." />
                        </div>
						                        
                        
                        <div class="bg-light">
    <ul class=" list-unstyled text-left">                    
                        <li class="nav-item mt-3">
								<div id="accordianMakePayment" role="tablist"
									aria-multiselectable="true">
									<div style="line-height:50px;">
										<a data-toggle="collapse"
											data-parent="#accordianMakePayment"
											href="#accountSetting" aria-expanded="true"
											aria-controls="accounSettingControl">

											<b class="font-weight-bold text-secondary">
												<i class=" text-primary"></i> &nbsp;
												Bill Total <i class="fas fa-rupee-sign"></i>4500							
											</b>
											
											<b class="float-right mr-3"><i class="fas fa-arrow-down"></i></b>

										</a>
									</div>
									<ul class="list-unstyled collapse" id="accountSetting"
										role="tabpanel" aria-labelledby="accounSettingControl">
										<li class="nav-item"><a href="#"
											class="nav-link text-left"> <i
												class="text-primary float-left"></i> &nbsp;
												&nbsp;Item Total
												
												<b class="float-right"><i class="fas fa-rupee-sign"></i> 425.26</b>
										</a></li>
										<li class="nav-item"><a href="#"
											class="nav-link text-left"> <i
												class="text-primary float-left"></i> &nbsp;
												&nbsp;C-GST
												
												<b class="float-right"><i class="fas fa-rupee-sign"></i> 13.26</b>
										</a></li>
										<li class="nav-item"><a href="#"
											class="nav-link text-left"> <i
												class="text-primary float-left"></i> &nbsp;
												&nbsp;S-GST
												
												<b class="float-right"><i class="fas fa-rupee-sign"></i> 13.26</b>
										</a></li>
										<hr>
										<li class="nav-item"><a href="#"
											class="nav-link text-left"> <i
												class="fas fa-address-card text-primary float-left"></i> &nbsp;
												&nbsp;You Pay
												
												<b class="float-right"><i class="fas fa-rupee-sign"></i> 4500</b>
										</a></li>
										
									</ul>

								</div>


							</li>
   </ul>
                        
                        </div>
                        
                        
                        
                        
                        
                        

                        <div class="row mb-2 mt-3">
                            <div class="col-12">
                                <button type="submit" id="" class="btn btn-success font-weight-bold btn-block dealBtn">
                                	Make Payment of <i class="fas fa-rupee-sign"></i>4500
                                </button>
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