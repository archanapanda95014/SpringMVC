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
 			<h2>Welcome ${user.firstName}</h2>
 			<hr>
            <h3>All Products</h3>        
            <table class="table table-striped table-dark">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Image</th>
                  <th>Products</th>
                  <th>Quantity</th>
                  <th>Unit Price</th>
                  <th>Total Price</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
               <c:forEach items="${selectList}" var="product">
		        <tr>
		            <td><c:out value="${product.id}"/></td>
		            <td><img src="${product.prodImg}"></td>
		            <td>${product.productName}</td>  
		            <td><select>
						  <option value="1">1</option>
						  <option value="2">2</option>
						  <option value="3">3</option>
						  <option value="4">4</option>
						</select></td>
		            <td>$ ${product.prodPrice}</td>  
		            <td>$ ${product.prodPrice}</td>
		            <td><a href="/removeFromCart/${product.id}">Remove</a></td>
		            <td></td>  
		        </tr>
		        </c:forEach>
		        <tr>
		        	<td></td>
		        	<td></td>
		        	<td></td>
		        	<td></td>
		        	<td></td>
		        	<td>Total=</td>
		        	<td>$ ${sumTotal}</td>
		        </tr>
              </tbody>
            </table>
            <a href="/checkout">PURCHASE</a> | <a href="/products">SHOP MORE</a>
          </div>  
</body>
</html>