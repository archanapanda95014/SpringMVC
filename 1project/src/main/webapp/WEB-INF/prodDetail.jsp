<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">  
</head>
<meta charset="UTF-8">
<title>Display Product detail here !</title>
</head>
<body>
<div class="container">
   <div class="row">
       <div class="col-5"> 
       <img src="${product.prodImg}">
        <h1>${product.productName}!</h1> 
        <div>Price:${product.prodPrice}</div>
        <div>ID:${product.id}</div>
        <form method="post" action="/addToCart/${product.id}">
        	<button type="submit" class="form-control btn btn-primary">Add to cart</button>
        </form>

        <%-- <h3>People who bought this product are:</h3>
        <table class="table table-striped table-dark">
              <thead>
                <tr>
                  <th>Name</th>
                  <th>Buyers</th>
                </tr>
              </thead>
              <tbody>
        			<c:forEach items="${buyers}" var="buyer">
        			<tr>
        			<td><c:out value="${buyer.id}"/></td>
        			<td><c:out value="${buyer.firstName}"/></td>
        			</tr>
        			</c:forEach>         		
        	</tbody>
        	</table> --%>
        </div>    

    </div>
     <a href="/products">Go back  |</a>
    <a href="/logout">Logout</a>
 </div>
 
   
   	
</body>
</html>
