<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%
    // Get the session and request objects
    HttpSession userSession = request.getSession();
    String currentUser = (String) userSession.getAttribute("name");
    String contextPath = request.getContextPath();
%>

<link rel="stylesheet" type="text/css"
	href="/TechMaya/stylesheets/header.css" />

<div id="header">
    <div class="navbar">
        <div class="navbar-container">
            <div class="logo">TechMaya</div>
            <div class="navbar-links">
                <a href="home.jsp">Home</a>
                <a href="product.jsp">Product</a>
                <a href="aboutus.jsp">About Us</a>
                <a href="contact.jsp">Contact</a>
            </div>
            <div>
            	<%
            		if (currentUser == null) {
            			%>
		            	<a href="login.jsp" class="login-btn">Login</a>
		            	<a href="register.jsp" class="login-btn">Register</a>
		            	<%
            		} else {
            			%>
            			<a href="profile-page.jsp" class="login-btn">
            				My Profile
            			</a>
            			<%
            		}
            	 %>
            </div>
        </div>
    </div>
</div>