<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Products here</title>
<style>
	
		.ui-autocomplete {
		    max-height: 200px;
		    overflow-y: auto;
		    overflow-x: hidden;
		}
	</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<script>
  $(function() {
    var tags = [
    	"ring", "ruby", "diamond", "price", "wedding", "ruby", "sapphire", "engagement",
    	"emerald", "cheap", "expensive", "jewel", "jewelry", "necklace", "gold", "pearl",
    	"platinum", "carat", "new", "cross", "star", "earring", "beautiful"
    ];
    $("#suggestion").autocomplete({
		source: tags
	})
  } );
  </script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">  
<link rel="stylesheet" href="/css/style.css"></head>
<body>
<!-- Product table  here -->
 <div class="container">
 			<h2>Welcome ${user.firstName}</h2>
 			<a class="rtPos" href="/cart/${user.id}">My cart</a>  |  <a href="/logout">Logout</a>
 			<hr>
 			 			<div id = "search">
				<form action = "/products/search" method = "post">
					Find Products by category: 
					<input type = "text" name = "input" id = "suggestion">
					<input type = "submit" value = "Search">
					<select name = "selection">
						<option value = "productName">Product Name</option>
						<option value = "prodPrice">Product Price (less than the search value)</option>
						<option value = "prodDesc">Product description</option>
					</select>
				</form>
			</div>
 			<div class="row">

 			<c:forEach items="${productAll}" var="product">
 				<div class="col-2">
 					<img src="${product.prodImg}">
 					<h4><a href="/showProduct/${product.id}">${product.productName}</a></h4>
 					<div> ${product.prodDesc}</div>	
 					<div> $${product.prodPrice}</div>			
 				</div>
 				 </c:forEach>				
 			</div>
 			
</body>
</html>