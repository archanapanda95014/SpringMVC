<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">  
<style>
img{width:100px;}
</style>

</head>
<body>
<!-- Product table  here -->
 <div class="container">
 			<h2>Welcome ${user.firstName} to Product Management System</h2>
 			
            <a href="logout">Logout</a> | <a href="/products">Review site</a>
 			<hr>
 			<h3><a href="/prodNew">Create a new Product </a> | <a href="/orderMgmt"> Go To Order Management system</a></h3>
 
			<form action = '/admin/jewels' method = 'post' class = 'ajax_form'>
 				<h3>All available categories: </h3>   
	            <select name = "selectJewels" id = "selectJewels">
	            	<option value = "all">All</option>
	            	<option value = "diamond">Diamond</option>
				  	<option value = "gold">Gold</option>
				  	<option value = "contemporary">Contemporary</option>
				  	<option value = "semi-precious">Semi-Precious</option>
				  	<option value = "designer">Designer</option>
				</select>
				<input type = "submit" value = "Submit">
 			</form>
			<hr>    

            <table class="table table-striped table-dark">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Image</th>
                  <th>Products</th>
                  <th>Desc</th>
                  <th>Price</th>
                  <th>Quantity Sold</th>
                  <th>Quantity in Stock</th>
                  <th>Category</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
               <c:forEach items="${productAll}" var="product">
		        <tr>
		            <td><c:out value="${product.id}"/></td>
		            <td><img src="${product.prodImg}"></td>
		            <td>${product.productName}</td>  
		            <td>${product.prodDesc}</td>
		            <td>${product.prodPrice}</td>  
		            <td>${product.prodQtySold}</td> 
		            <td>${product.prodQtyInStock}</td> 
		            <td>${product.prodCategory}</td>
		            <td><a href="/editProduct/${product.id}">Edit  | </a><a href="/delete/${product.id}">Delete</a></td>
		        </tr>
		        </c:forEach>
              </tbody>
            </table>
           
          </div>  
</body>
</html>