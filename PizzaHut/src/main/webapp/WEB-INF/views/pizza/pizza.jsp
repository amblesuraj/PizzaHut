


<%@taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <div class="container-fluid">
                <div class="container">
                <div class="bg-light dealBtn mt-3" >
              <h3 class="text-center text-danger" style="line-height:40px;">Supreme</h3>
                </div>
                     <div class="row Pizza mt-5">
                           <c:forEach items="${Pizzas}" var="pizza"> 
                            <div class="col-lg-3">
                                <div class="card">
                                
                              <img class="card-img-top " src="${pizzaImage}/${pizza.pizzaimage}" alt="" width="225" height="168" >
                              
                              
                              <div class="card-body ">
                                <h6 class="card-title font-weight-bold medium text-center " style="font-size:16px;">${pizza.pName}</h6>
                                <br>
                                <h6 class="font-weight-bold medium text-center" style="font-size:16px;">
                                    <i class="fas fa-rupee-sign"></i>${pizza.pPrice}
                                </h6>
                                <br>
                                <p class="card-text text-muted text-justify">
                                 ${pizza.pizzaDescription}
                                 </p>
                                 
                                 <hr> 
                                 <h6 class="text-center font-weight-bold medium text-primary">Medium | Pan</h6>
                                   <br><br>
                                   <div class="text-center">
	                                   <security:authorize access=" !isAuthenticated() or hasAuthority('USER') or hasAuthority('EMPLOYEE')">
	                                   	<a name="" id="checkActiveUser" class="btn btn-outline-success dealBtn font-weight-bold btn-block" href="${pageContext.request.contextPath}/cart/${pizza.id }/add" role="button">Add </a>
	                                   </security:authorize>
	                                    <security:authorize access="hasAuthority('ADMIN') or hasAuthority('SUPERADMIN')">
	                                        <a name="" id="" class="btn btn-outline-success dealBtn font-weight-bold btn-block" href="${pageContext.request.contextPath}/admin/pizza/${pizza.id}/update" role="button">Modify</a>
	                                   </security:authorize>
                                   </div>
                                        
                                </div>
                                
                              
                            </div>
                        
                            </div>
                            </c:forEach>            
                     </div>


                     
                </div>
            </div>
            
            
            
            
              <div class="container-fluid">
                <div class="container">
                
                 
                <div class="bg-light dealBtn mt-3" >
              <h3 class="text-center text-danger" style="line-height:40px;">Favourite</h3>
                </div>
                
                
                     <div class="row Pizza mt-5">
                           <c:forEach items="${FavouritePizzas}" var="fpizza"> 
                            <div class="col-lg-3">
                                <div class="card">
                                
                              <img class="card-img-top " src="${pizzaImage}/${fpizza.pizzaimage}" alt="" width="225" height="168" >
                              
                              
                              <div class="card-body ">
                                <h6 class="card-title font-weight-bold medium text-center " style="font-size:16px;">${fpizza.pName}</h6>
                                <br>
                                <h6 class="font-weight-bold medium text-center" style="font-size:16px;">
                                    <i class="fas fa-rupee-sign"></i>${fpizza.pPrice}
                                </h6>
                                <br>
                                <p class="card-text text-muted text-justify">
<!--                                  Paneer, Masala Soya Chunk, Green Capsicum, Onion, Red paprika -->
                                 ${fpizza.pizzaDescription}
                                 </p>
                                 
                                 <hr> 
                                 <h6 class="text-center font-weight-bold medium text-primary">Medium | Pan</h6>
<!--                                  <a name="" id="" class="float-right font-weight-bold medium" href="#" > -->
<!--                                      <h6>Customize</h6></a> -->
                                   <br><br>
                                   <div class="text-center">
	                                   <security:authorize access=" !isAuthenticated() or hasAuthority('USER') or hasAuthority('EMPLOYEE')">
	                                   	<a name="" id="checkActiveUser" class="btn btn-outline-success dealBtn font-weight-bold btn-block" href="${pageContext.request.contextPath}/cart/${fpizza.id }/add" role="button">Add </a>
	                                   </security:authorize>
	                                    <security:authorize access="hasAuthority('ADMIN') or hasAuthority('SUPERADMIN')">
	                                        <a name="" id="" class="btn btn-outline-success dealBtn font-weight-bold btn-block" href="${pageContext.request.contextPath}/admin/pizza/${fpizza.id}/update" role="button">Modify</a>
	                                   </security:authorize>
                                   </div>
                                        
                                </div>
                                
                              
                            </div>
                        
                            </div>
                            </c:forEach>            
                     </div>


                     
                </div>
            </div>
            
 
 
 <!--  Signature Pizza -->
 
 
               <div class="container-fluid">
                <div class="container">
                

				 <div class="bg-light dealBtn mt-3" >
              <h3 class="text-center text-danger" style="line-height:40px;">Signature</h3>
                </div>
                
                     <div class="row Pizza mt-5">
                           <c:forEach items="${SignaturePizzas}" var="spizza"> 
                            <div class="col-lg-3">
                                <div class="card">
                                
                              <img class="card-img-top " src="${pizzaImage}/${spizza.pizzaimage}" alt="" width="225" height="168" >
                              
                              
                              <div class="card-body ">
                                <h6 class="card-title font-weight-bold medium text-center " style="font-size:16px;">${spizza.pName}</h6>
                                <br>
                                <h6 class="font-weight-bold medium text-center" style="font-size:16px;">
                                    <i class="fas fa-rupee-sign"></i>${spizza.pPrice}
                                </h6>
                                <br>
                                <p class="card-text text-muted text-justify">
<!--                                  Paneer, Masala Soya Chunk, Green Capsicum, Onion, Red paprika -->
                                 ${spizza.pizzaDescription}
                                 </p>
                                 
                                 <hr> 
                                 <h6 class="text-center font-weight-bold medium text-primary">Medium | Pan</h6>
<!--                                  <a name="" id="" class="float-right font-weight-bold medium" href="#" > -->
<!--                                      <h6>Customize</h6></a> -->
                                   <br><br>
                                   <div class="text-center">
	                                   <security:authorize access=" !isAuthenticated() or hasAuthority('USER') or hasAuthority('EMPLOYEE')">
	                                   	<a name="" id="checkActiveUser" class="btn btn-outline-success dealBtn font-weight-bold btn-block" href="${pageContext.request.contextPath}/cart/${spizza.id }/add" role="button">Add </a>
	                                   </security:authorize>
	                                    <security:authorize access="hasAuthority('ADMIN') or hasAuthority('SUPERADMIN')">
	                                        <a name="" id="" class="btn btn-outline-success dealBtn font-weight-bold btn-block" href="${pageContext.request.contextPath}/admin/pizza/${spizza.id}/update" role="button">Modify</a>
	                                   </security:authorize>
                                   </div>
                                        
                                </div>
                                
                              
                            </div>
                        
                            </div>
                            </c:forEach>            
                     </div>


                     
                </div>
            </div>
                     
                     
   <!-- classic pizza -->                   
            
            
                           <div class="container-fluid">
                <div class="container">
                
            				 <div class="bg-light dealBtn mt-3" >
              <h3 class="text-center text-danger" style="line-height:40px;">Classic</h3>
                </div>
            
                
                     <div class="row Pizza mt-5">
                           <c:forEach items="${ClassicPizzas}" var="cpizza"> 
                            <div class="col-lg-3">
                                <div class="card">
                                
                              <img class="card-img-top " src="${pizzaImage}/${cpizza.pizzaimage}" alt="" width="225" height="168" >
                              
                              
                              <div class="card-body ">
                                <h6 class="card-title font-weight-bold medium text-center " style="font-size:16px;">${cpizza.pName}</h6>
                                <br>
                                <h6 class="font-weight-bold medium text-center" style="font-size:16px;">
                                    <i class="fas fa-rupee-sign"></i>${cpizza.pPrice}
                                </h6>
                                <br>
                                <p class="card-text text-muted text-justify">
<!--                                  Paneer, Masala Soya Chunk, Green Capsicum, Onion, Red paprika -->
                                 ${cpizza.pizzaDescription}
                                 </p>
                                 
                                 <hr> 
                                 <h6 class="text-center font-weight-bold medium text-primary">Medium | Pan</h6>
<!--                                  <a name="" id="" class="float-right font-weight-bold medium" href="#" > -->
<!--                                      <h6>Customize</h6></a> -->
                                   <br><br>
                                   <div class="text-center">
	                                   <security:authorize access=" !isAuthenticated() or hasAuthority('USER') or hasAuthority('EMPLOYEE')">
	                                   	<a name="" id="checkActiveUser" class="btn btn-outline-success dealBtn font-weight-bold btn-block" href="${pageContext.request.contextPath}/cart/${cpizza.id }/add" role="button">Add </a>
	                                   </security:authorize>
	                                    <security:authorize access="hasAuthority('ADMIN') or hasAuthority('SUPERADMIN')">
	                                        <a name="" id="" class="btn btn-outline-success dealBtn font-weight-bold btn-block" href="${pageContext.request.contextPath}/admin/pizza/${cpizza.id}/update" role="button">Modify</a>
	                                   </security:authorize>
                                   </div>
                                        
                                </div>
                                
                              
                            </div>
                        
                            </div>
                            </c:forEach>            
                     </div>


                     
                </div>
            </div>
                     
            
            