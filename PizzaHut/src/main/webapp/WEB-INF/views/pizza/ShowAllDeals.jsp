<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<div class="container-fluid">
	<div class="container">
	
	<h1>My deals</h1>
	
		<div class="row mt-3 ">
	<c:forEach var="deal" items="${Deals}">	
			<div class="col-6 mt-5 text-center">
				<a href="#"> <img src="${dealImage}/${deal.dealsImage}"
					class="img-fluid pizzaBorder" alt="${deal.d_Name}">
				</a> 
			</div>
		</c:forEach>
	</div>
		

	</div>
</div>