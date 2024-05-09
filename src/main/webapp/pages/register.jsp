<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Register Page</title>
		<link rel="stylesheet" href="/TechMaya/stylesheets/style.css">
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<div class="login-modal" style="margin-top: 30px; width: 500px;">
		  <h1 style="text-align: center; margin-top: 0px">Register</h1>
		  <%
			String errorMessage = (String) request.getAttribute("errorMessage");
			if(errorMessage != null && !errorMessage.isEmpty()){
			%>
			<p class="error-message"> <%=errorMessage%></p>
			<%
			}
		  %>
		  <form action="/TechMaya/RegisterServlet" method="post" class="two-column-form">
			  <div class="form-row">
			    <div class="form-group">
			      <label for="fname">Enter First Name</label>
			      <input type="text" id="fname" name="first_name" placeholder="First Name" required>
			    </div>
			    <div class="form-group">
			      <label for="lname">Enter Last Name</label>
			      <input type="text" id="lname" name="last_name" placeholder="Last Name" required>
			    </div>
			  </div>
			  <div class="form-row">
			    <div class="form-group">
			      <label for="email">Enter your email</label>
			      <input type="email" id="email" name="email" placeholder="example@email.com" required>
			    </div>
			    <div class="form-group">
			      <label for="phone">Enter Phone Number</label>
			      <input type="text" id="phone" name="phone" placeholder="98xxxxxxxx" required>
			    </div>
			  </div>
			  <div class="form-row">
			    <div class="form-group">
			      <label for="address">Enter Address</label>
			      <input type="text" id="address" name="address" placeholder="Address" required>
			    </div>
			    <div class="form-group">
			      <label for="dob">Date of Birth</label>
			      <input type="date" id="dob" name="dob" placeholder="Date of Birth" required>
			    </div>
			  </div>
			  <div class="form-row">
			    <div class="form-group">
			      <label for="password">Enter your password</label>
			      <input type="password" id="password" name="password" placeholder="Password" required>
			    </div>
			    <div class="form-group">
			      <label for="password2">Re-Enter your password</label>
			      <input type="password" id="password2" name="retypePassword" placeholder="Confirm Password" required>
			    </div>
			  </div>
			  <div class="form-row" style="flex: none; width: 50%; margin: auto; text-align: center;">
			    <div class="form-group">
			      <label for="">Enter Gender</label>
			      <input type="radio" name="gender" value="Male" required> Male
			      <input type="radio" name="gender" value="Female" required> Female
			    </div>
			  </div>
			  <button type="submit" class="login-button">Register</button>
			  <div class="signup-link">
			    Already a member? <a href="pages/login.jsp">Login Now</a>
			  </div>
			</form>
		</div>
	</body>
</html>