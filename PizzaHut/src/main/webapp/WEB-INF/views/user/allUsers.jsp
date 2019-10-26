<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">User Details</h1>
            <a href="${pageContext.request.contextPath }/admin/userPdf" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" target="_blank"><i class="fas fa-download fa-sm text-white-50"></i> Generate Pdf</a>
            <a href="${pageContext.request.contextPath }/admin/userXls" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" target="_blank"><i class="fas fa-download fa-sm text-white-50"></i> Generate Excel</a>
</div>
																																							

 <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary float-left">All User Details</h6>
              
<%--  				            <a href="${pageContext.request.contextPath }/admin/userReports" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>              --%>
            </div>
            <div class="card-body">
              <div class="table-responsive-xl">
              <div class="container-fluid">
<table id="example" class="table table-striped">
        <thead>
            <tr>
            	<th>Id</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Username</th>
                <th>Status</th>
                
            </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${users }">
            <tr>
                <td>${user.id }</td>
                <td>${user.fname} </td>
                <td> ${user.lname}</td>
                <td>${user.email }</td>
                <td>${user.username}</td>
                <td>${ user.active}</td>
                
            </tr>
        </c:forEach>
        </tbody>
        <tfoot>
         <tr>
            	<th>Id</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Username</th>
                <th>Status</th>
                
            </tr>
        </tfoot>
    </table>		
		
		</div>
            </div>
          </div>
          
</div>
<script>


 
</script>