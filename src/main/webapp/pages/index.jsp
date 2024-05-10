<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%
    // Get the session and request objects
    HttpSession userSession = request.getSession();
    String userId = (String) userSession.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>TechMaya</title>
	<link rel="stylesheet" href="/TechMaya/stylesheets/style.css">
	<link rel="stylesheet" href="/TechMaya/stylesheets/home.css">
	<link rel="stylesheet" href="/TechMaya/stylesheets/products.css">
</head>
	<body>
		<jsp:include page="header.jsp" />
		<jsp:include page="searchbar.jsp" />
	<section class="homepage" id="Home">
		<div class="content flex">
			<div class="text">
				<h1>Electronic Accessories</h1>
				<p>Get the best electronic accessories from out e-commerce website in best deals. Just Contact Us for more!!!</p>
			</div>
			<a href="#Product">Our Products</a>
		</div>
	</section>

	<!--Homepage end-->

	<!--Service Start-->
	<section class="services" id="Product">
		<div class="container">
			<div class="section-title">
				<h2>Products</h2>
			</div>
			<div class="product-grid">
			<c:forEach var="productList" items="${productsListList}">
	        <div class="product-card">
			    <div class="product-image">
			        <img src="/TechMaya/resources/images/products/${productList[0].uid}.png">
			        <div class="overlay">
			            <form action="/TechMaya/ProductServlet?id=${productList[0].uid}" method="post">
			            	<button class="btn favorite">
			            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
								<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
								<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
							</svg>
			            	</button>
			            </form>
			            	<c:if test="${userId!=null}">
			            	<form action="/TechMaya/AddToCartServlet?id=${productList[0].uid}" method="post">
                    			<input type="hidden" name="product-quantity" value="1"/> <!-- Set default value to 1 if directly adding to cart from products page -->
                    			<button class="btn add-to-cart">ADD TO CART</button>
                    		</form>
                    		</c:if>
                    		<c:if test="${userId==null}"> <!-- If user is not logged in -->
			            	<form action="/TechMaya/LoginServlet">
                    			<button class="btn add-to-cart">ADD TO CART</button>
                    		</form>
                    		</c:if>
			        </div>
			    </div>
			    <div class="product-info">
			        <h3>${productList[0].name}</h3>
			        <p class="price"><span class="discounted">Rs. ${productList[0].price}</span></p>
			    </div>
			</div>
			</c:forEach>
			
		</div>
		</div>
	</section>

	</body>
</html>