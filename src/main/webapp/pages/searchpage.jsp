<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search UI</title>
    <link rel="stylesheet" href="/TechMaya/stylesheets/styles.css">
    <link rel="stylesheet" href="/TechMaya/stylesheets/products.css">
</head>
<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
}

.container {
    display: flex;
    height: 100vh;
}

.sidebar {
    background-color: #f7d2d2;
    padding: 20px;
    width: 250px;
    position: sticky;
    top: 0;
    height: 100vh;
    overflow-y: auto;
}

.filter h3,
.filter h4 {
    margin: 10px 0;
}

.tag-item {
    display: flex;
    align-items: center;
    margin-bottom: 5px;
}

.tag-item input[type="checkbox"] {
    margin-right: 10px;
}

.by-price {
    margin-top: 20px;
}

.price-range {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
}

.price-range input[type="range"] {
    flex-grow: 1;
    margin-right: 10px;
}

.main-content {
    flex-grow: 1;
    padding: 20px;
    position: relative;
}

.search-bar {
    display: flex;
    align-items: center;
    background-color: #f2f2f2;
    padding: 10px;
    border-radius: 20px;
    position: sticky;
    top: 0;
    z-index: 1;
}

.search-bar input[type="text"] {
    flex-grow: 1;
    border: none;
    background-color: transparent;
    outline: none;
    padding: 5px;
    font-size: 16px;
}

.search-icon {
    font-size: 20px;
    cursor: pointer;
}

.search-message {
    margin-top: 50px;
    text-align: center;
    color: #888;
}
</style>
<body>
<jsp:include page="header.jsp" />
    <div class="container">
        <div class="main-content">
            <form method="post" action="/TechMaya/SearchServlet">
            <div class="search-bar">
                <input type="text" name="searchQuery" placeholder="Search">
                <button><span class="search-icon">&#128269;</span></button>
            </div>
            <div>
            	<div class="price-range">
            		<label>Min:</label><input type = "number" name="minPrice" min = "0" value = "0"/>
            	</div>
            	<div class="price-range">
            		<label>Max:</label><input type = "number" name="maxPrice" min = "0" value = "999999"/>
            	</div>
            </div>
            </form>
            <div class="search-message">
                <p>Search to get started</p>
            </div>
            
            <c:forEach var="product" items="${products}">
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
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>