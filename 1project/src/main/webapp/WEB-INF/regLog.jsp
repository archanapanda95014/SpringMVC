<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
<style>.red{color:red;}</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">  
    <meta charset="UTF-8">
    <title>Registration Page</title>
</head>
<body>
	<div class="container">
        <div class="row">
            <div class="col-5"> 
             <h1>Register!</h1>     
	    	<%-- <p><form:errors path="user.*"/></p>  --%>   
	   		<form:form method="POST" action="/registration" modelAttribute="user">
	   			<p class="form-group">
		            <form:label path="firstName">First Name: </form:label>
		            <form:errors path="firstName" class="red"/>
		            <form:input type="text" path="firstName" class="form-control"/>
		        </p>
	   			<p class="form-group">
		            <form:label path="lastName">Last Name: </form:label>
		            <form:errors path="lastName" class="red"/>
		            <form:input type="text" path="lastName" class="form-control"/>
		        </p>
		        <p class="form-group">
		            <form:label path="email">Email: </form:label>
		            <form:errors path="email" class="red"/>
		            <form:input type="email" path="email" class="form-control"/>
		        </p>
		        <p class="form-group">
		            <form:label path="location">Location: </form:label>
		            <form:errors path="location" class="red"/>
		            <form:input type="text" path="location" class="form-control"/>
		            <!-- State abbreviation as option value -->
					<form:select path="state">
						<option value="AL" selected>Alabama</option>
						<option value="AK">Alaska</option>
						<option value="AZ">Arizona</option>
						<option value="AR">Arkansas</option>
						<option value="CA">California</option>
						<option value="CO">Colorado</option>
						<option value="CT">Connecticut</option>
						<option value="DC">District of Columbia</option>
						<option value="DE">Delaware</option>
						<option value="FL">Florida</option>
						<option value="GA">Georgia</option>
						<option value="HI">Hawaii</option>
						<option value="ID">Idaho</option>
						<option value="IL">Illinois</option>
						<option value="IN">Indiana</option>
						<option value="IA">Iowa</option>
						<option value="KS">Kansas</option>
						<option value="KY">Kentucky</option>
						<option value="LA">Louisiana</option>
						<option value="ME">Maine</option>
						<option value="MD">Maryland</option>
						<option value="MA">Massachusetts</option>
						<option value="MI">Michigan</option>
						<option value="MN">Minnesota</option>
						<option value="MS">Mississippi</option>
						<option value="MO">Missouri</option>
						<option value="MT">Montana</option>
						<option value="NE">Nebraska</option>
						<option value="NV">Nevada</option>
						<option value="NH">New Hampshire</option>
						<option value="NJ">New Jersey</option>
						<option value="NM">New Mexico</option>
						<option value="NY">New York</option>
						<option value="NC">North Carolina</option>
						<option value="ND">North Dakota</option>
						<option value="OH">Ohio</option>
						<option value="OK">Oklahoma</option>
						<option value="OR">Oregon</option>
						<option value="PA">Pennsylvania</option>
						<option value="RI">Rhode Island</option>
						<option value="SC">South Carolina</option>
						<option value="SD">South Dakota</option>
						<option value="TN">Tennessee</option>
						<option value="TX">Texas</option>
						<option value="UT">Utah</option>
						<option value="VT">Vermont</option>
						<option value="VA">Virginia</option>
						<option value="WA">Washington</option>
						<option value="WV">West Virginia</option>
						<option value="WI">Wisconsin</option>
						<option value="WY">Wyoming</option>
					</form:select>	            
		        </p>
		        <p class="form-group">
		            <form:label path="password">Password:</form:label>
		            <form:errors path="password" class="red"/>
		            <form:password path="password" class="form-control"/>
		        </p>
		        <p class="form-group">
		            <form:label path="passwordConfirmation">Password Confirmation:</form:label>
		            <form:errors path="passwordConfirmation" class="red"/>
		            <form:password path="passwordConfirmation" class="form-control"/>
		        </p>
		        <button type="submit" class="btn btn-primary" class="form-control">Register !</button>
		    </form:form>
	    	</div>

  		<div class="col-5">   
  		 <h1>Login!</h1>  
		    <p><c:out value="${error}" /></p>
		    <form method="POST" action="/login">
        	<p class="form-group">
	            <label>Email:</label>
	            <input type="email" name="email" class="form-control"/>
       		 </p>
       		<p class="form-group">
            <label for="password">Password:</label>
            <input type="password" name="password" class="form-control"/>
        </p>
        <button type="submit" class="btn btn-primary" class="form-control">login</button>
    </form>
    </div>
   </div>
  </div>  
</body>
</html>