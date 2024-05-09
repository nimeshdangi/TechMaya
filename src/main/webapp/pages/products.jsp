<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			            	<button class="btn favorite" type="button">
			            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
							  	<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
								</svg>
			            	</button>
			            	
			            	<form action="/TechMaya/AddToCartServlet?id=${product.uid}" method="post">
                    			<input type="hidden" name="product-quantity" value="1"/> <!-- Set default value to 1 if directly adding to cart from products page -->
                    			<button class="btn add-to-cart">ADD TO CART</button>
                    		</form>
			        	</div>
			    	</div>
			    	<div class="product-info">
			        	<h3>${product.name}</h3>
			        	<p class="price"><span class="discounted">Rs. ${product.price}</span></p>
			        	<form action="/TechMaya/ProductServlet?id=${product.uid}" method="post">
                    		<button>View</button>
                    	</form>
			    	</div>
				</div>
	 		</c:if>
	 		</c:forEach>
	 	</div>
	 </c:forEach>
	 <jsp:include page="footer.jsp" />
</body>
</html>