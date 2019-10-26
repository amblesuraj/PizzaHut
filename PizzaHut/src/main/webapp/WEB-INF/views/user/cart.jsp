<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">

		<c:if test="${not empty msg}">
			<div class="alert alert-success alert-dismissible fade show">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				<strong>Success!</strong> ${msg}
			</div>
		</c:if>

		        <table id="cart" class="table table-hover table-condensed">
                                <thead>
                                    <tr class="text-center">
                                        <th style="width:30%">Product</th>
                                        <th style="width:8%">Price</th>
                                        <th style="width:6%">Quantity</th>
                                        <th style="width:8%">Discount</th>
                                        <th style="width:10%">Service Tax</th>
                                        <th style="width:10%" class="text-center">Subtotal</th>
                                        <th style="width:10%"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                    <tr>
                                        <td data-th="Product">
                                            <div class="row">
                                                <div class="col-sm-4 hidden-xs"><img src="http://placehold.it/100x100" alt="..." class="img-responsive"/></div>
                                                <div class="col-sm-6">
                                                    <h4 class="nomargin">${cartLine.product.name}</h4>
                                                   		<c:if test="${cartLine.available == false}">
															<strong style="color:red">(Not Available)</strong> 
														</c:if>
                                                    <p>
                                                   		Description : 
                                                    	${cartLine.product.description}
                                                    	
                                                    </p>
                                                </div>
                                            </div>
                                        </td>
                                        <td data-th="Price" class="text-center mt-5" id="cartPrice">
                                            <p class="mt-5">
                                            			
                                            	<i class="fas fa-rupee"></i>		${cartLine.buyingPrice }
                                            
                                            </p>
                                        </td>
                                        <td data-th="Quantity">
                                            <input type="number" min="1" id="cartQty_${cartLine.id }" class="form-control text-center mt-5" value="${cartLine.productCount }">
                                        </td>
                                       
<!--                                         <td data-th="Discount" class="text-center" id=""> -->
<!--                                         <p class="mt-5">10%</p> -->
<!--                                         </td> -->
<!--                                         <td data-th="Service Tax" class="text-center"> -->
<!--                                         <p class="mt-5">5%</p> -->
<!--                                         </td> -->
                                        <td data-th="Subtotal" class="text-center mt-5">
                                        <p class="mt-5">${cartLine.Total}</p>
                                        </td>
                                        <td class="actions text-center mt-5" data-th="">
                                           
                                           <c:if test="${cartLine.available == true}">
	                                       
	                                            <button class="btn btn-info btn-sm mt-5" name="refreshCart" value="${cartLine.id}">
	                                            	<i class="fas fa-sync"></i>
	                                            </button>
                                           
                                           
                                            </c:if>
                                           
                                            <a class="btn btn-danger btn-sm mt-5" href="/delete/${cartLine.id }"><i class="fas fa-trash"></i></a>								
                                        </td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                   
                                    <tr>
                                        <td><a href="#" class="btn btn-warning font-weight-bold"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
                                        <td colspan="2" class="hidden-xs"></td>
                                        <td colspan="2" class="hidden-xs"></td>
                                        
                                        <td class="hidden-xs text-center"><strong>${userModel.cart.grandTotal }</strong></td>
                                        <td><a href="${pageContext.request.contextPath }/user/checkout" class="btn btn-success btn-block font-weight-bold">Checkout <i class="fa fa-angle-right"></i></a></td>
                                    </tr>
                                </tfoot>
                            </table>
     	
     		<div class="jumbotron">
				
				<h3 class="text-center">Your Cart is Empty!</h3>
			
			</div>
     	
            </div>