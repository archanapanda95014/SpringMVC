<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Search Product</title>
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css">
	<style>
		#wrapper {
			padding: 25px;
			height: 650px;
		}
		#top {
			font-size: 22px;
			margin-left: 180px;
		}
		#top a {
			margin-left: 70px;
			display: inline-block;
		}
		#search {
			padding-left: 150px;
		}
		input[type = "text"] {
			width: 500px;
		}
		#main {
			padding-left: 100px;
			padding-top: 40px;
			width: 1200px;
		}
		#item {
			width: 250px;
			display: inline-block;
			vertical-align: top;
		}
		#item a {
			white-space: nowrap;
		}
	</style>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<script>
  $(function() {
    var tags = [
    	"ring", "rings", "diamond", "price", "wedding", "ruby", "sapphire", "engagement","Love","Legend","Beauty","Joy","Style"
    ];
    $("#suggestion").autocomplete({
		source: tags
	})
  } );
  </script>
</head>
<body>
	<div id = "wrapper">
		<div id = "top">
			<a href = "/products">Home</a>
			<a href = "/logout">Logout</a>
		</div>
		
		<hr>
		<div class = "row">
		
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
			<br>
		
 		</div>
		<div id = "main">
			<c:forEach items = "${products}" var = "product">
				<div id = "item">
					<div class = "col-2">
						<img src = "${product.prodImg}">
						<a href = "/showProduct/${product.id}">${product.productName}</a>
						<div> $${product.prodPrice}</div>			
		 			</div>
				</div>
	 		</c:forEach>
		</div>
	</div>
</body>
</html>