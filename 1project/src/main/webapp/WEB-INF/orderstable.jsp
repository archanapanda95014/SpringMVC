<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Order Management System</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css">  
	<style>
		img{
			width: 100px;
		}
	</style>
</head>
<body>
	<div class = "container">
		<h3>Order status: ${process} </h3>  
        <hr>
        <h3><a href = "/admin">Back to Admin Dashboard</a> | <a href = "/logout">Logout</a> </h3>
        
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
            <table class = "table table-striped table-dark">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Product Name</th>
                  <th>Date</th>
                  <th>Ordered By</th>
                  <th>Address</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>
               <c:forEach items = "${selectedOrders}" var = "order">
		        <tr>
		            <td><c:out value="${order.id}"/></td>
		            <td>${order.orderName}</td>
		            <td>${order.createdAt}</td>
		            <td>${order.orderer.firstName}</td>
		            <td>${order.orderer.location}, ${order.orderer.getState()}</td>
		            <td>${order.orderStatus}</td>
		        </tr>
		        </c:forEach>

              </tbody>
            </table>
	</div>  
</body>
</html>