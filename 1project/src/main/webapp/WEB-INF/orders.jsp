<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping cart for ${user.firstName}</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">  
<style>
img{width:100px;}
</style>

</head>
<body>
<!-- Product table  here -->
 <div class="container">
			
            <h3>Order Management System: </h3>  
            <hr>
            <h3><a href="/admin">Go To Product Management system</a> | <a href="/logout">Logout</a> </h3>
            
        <form action = "/orderMgmt/process" method = "post">
        	<select name = "status">
	            <option value = "all">All</option>
				<option value = "Ordered">Ordered</option>
				<option value = "Shipped">Shipped</option>
				<option value = "Canceled">Canceled</option>
				<option value = "Delivered">Delivered</option>
			</select>
			<input type = "submit" value = "Submit">
        </form>
            <hr>
            <table class="table table-striped table-dark">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Name</th>
                  <th>Date</th>
                  <th>OrderedBy</th>
                  <th>Address</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>
               <c:forEach items="${allOrders}" var="order">
		        <tr>
		            <td><c:out value="${order.id}"/></td>
		            <td>${order.orderName}</td>
		            <td>${order.createdAt}</td>
		            <td>${order.orderer.getFirstName()}</td> 
		            <td>${order.orderer.getLocation()},${order.orderer.getState()}</td>
		            <td>${order.orderStatus}</td>
		        </tr>
		        </c:forEach>

              </tbody>
            </table>
          </div>  
</body>
</html>