<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Login Modal</title>
		<link rel="stylesheet" href="/TechMaya/stylesheets/style.css">
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<div class="login-modal">
		  <h1 style="text-align: center; margin-top: 0px">Login</h1>
		  <%
			String errorMessage = (String) request.getAttribute("errorMessage");
			if(errorMessage != null && !errorMessage.isEmpty()){
			
			%>
			
			<p class="error-message"> <%=errorMessage%></p>
			<%
			}
		  %>
		  <form action="/TechMaya/LoginServlet" method="post">
		    <div class="form-group">
		      <label for="email">Enter your email</label>
		      <input type="email" id="email" name="email" placeholder="Enter Email" required>
		    </div>
		    <div class="form-group">
		      <label for="password">Enter your password</label>
		      <input type="password" id="password" name="password" placeholder="Enter Password" required>
		    </div>
		    <div class="form-group form-remember">
		      <div style="display: flex; align-items: center">
			      <input type="checkbox" id="remember-me" name="remember-me">
			      <label for="remember-me" style="margin-bottom: 0px">Remember me</label>
		      </div>
		      <a href="#" class="forgot-password">Forgot password?</a>
		    </div>
		    <button type="submit" class="login-button">Login Now</button>
		    <div class="signup-link">
		      Not a member? <a href="register.jsp">Register Now</a>
		    </div>
		  </form>
		</div>
	</body>
</html>