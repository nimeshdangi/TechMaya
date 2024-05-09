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
<meta charset="ISO-8859-1">
<title>Our Products</title>
<link rel="stylesheet" href="/TechMaya/stylesheets/style.css">
<link rel="stylesheet" href="/TechMaya/stylesheets/products.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<!-- Logic: 
		Outer loop loops a arraylist of arraylist. first item in inner arraylist is used to get title(tag).
	 -->
	 <c:forEach var="productList" items="${productsListList}">
	 	<h1 style="font-family: Courier New;; text-align:center;">${productList[0].tag}</h1> <!-- Gets the tag for the first product in internal product list--> 
	 	<div class="product-grid">
	 		<c:forEach var="product" items="${productList}">	 
	 		<c:if test="${product.stock > 0 }">			 			
	        	<div class="product-card">
			    	<div class="product-image">
			        	<img src="/TechMaya/resources/images/products/${product.uid}.png">
			        	<div class="overlay">
			        	<form action="/TechMaya/ProductServlet?id=${product.uid}" method="post">
			            	<button class="btn favorite">
			            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
								<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
								<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
							</svg>
			            	</button>
			            </form>
			            	<c:if test="${userId!=null}">
			            	<form action="/TechMaya/AddToCartServlet?id=${product.uid}" method="post">
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
			        	<h3>${product.name}</h3>
			        	<p class="price"><span class="discounted">Rs. ${product.price}</span></p>

			    	</div>
				</div>
	 		</c:if>
	 		</c:forEach>
	 	</div>
	 </c:forEach>
	 <jsp:include page="footer.jsp" />
</body>
</html>