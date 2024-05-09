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
                <a href="/TechMaya/HomeServlet">Home</a>
                <a href="/TechMaya/ProductsServlet">Product</a>
                <a href="aboutus.jsp">About Us</a>
                <a href="contact.jsp">Contact</a>
            </div>
            <div style="display:flex; gap:50px;">
            	<%
            		if (currentUser == null) {
            			%>
                            <a href="/TechMaya/LoginServlet" class="login-btn">Login</a>
                            <a href="/TechMaya/RegisterServlet" class="login-btn">Register</a>
		            	<%
            		} else {
            			%>
                            <a href="/TechMaya/ProfileServlet" class="login-btn">
                                My Profile
                            </a>
                            <form action="/TechMaya/LogoutServlet" method="post">
                            	<button class="login-btn">Logout</button>
                            </form>
            			<%
            		}
            	 %>
            </div>
        </div>
    </div>
</div>