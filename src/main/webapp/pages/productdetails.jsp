<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${product.name}</title>
<link rel="stylesheet" type="text/css" href="/TechMaya/stylesheets/productdetail.css"/>
</head>
<body>
	<div class = "card-wrapper">
  <div class = "card">
    <!-- card left -->
    <div class = "product-imgs">
     <div class = "img-display">
         <div class = "img-showcase">
          <img src = "/TechMaya/resources/images/products/${product.imageUrlFromPart}">
        </div> 
      </div>
      
    </div>
    <!-- card right -->
    <div class = "product-content">
      <h2 class = "product-title">${product.name }</h2>
      <a href = "#" class = "product-link">Visit TechMaya Store</a>
      <div class = "product-rating"> </div>

      <div class = "product-price">
        <p class = "last-price">Price: <span>NPR ${product.price }</span></p>
      </div>

      <div class = "product-detail">
        <h2>about this item: </h2>
        <p>${product.description }</p>
        <ul>
         
          <li>Available: <span>in stock</span></li>
          <li>Category: <span>${product.tag }</span></li>
          <li>Shipping Area: <span>All over the Nepal</span></li>
          <li>Shipping Fee: <span>Free</span></li>
        </ul>
      </div>

      <form class = "purchase-info" action="/TechMaya/AddToCartServlet?id=${product.uid}" method="post">
        <input type = "number" name="product-quantity" min = "1" value = "1" max="${product.stock }">
        <button class = "btn">
          Add to Cart <i class = "fas fa-shopping-cart"></i>
        </button>
      </form>
      
      <form class = "purchase-info" action="/TechMaya/AddToCartServlet">
        <button class = "btn">
          Go to Cart <i class = "fas fa-shopping-cart"></i>
        </button>
      </form>
     
     <h2 class = "similar-products">Similar Products</h2>
  	<div class = "img-select">
  		<c:forEach var="product" items="${similarProducts}">
  			<div class = "img-item">
          		<a href = "#">
            		<img src = "/TechMaya/resources/images/products/${product.imageUrlFromPart}">            
        		</a>
          		<p>${product.name }</p>
        	</div>
  		</c:forEach>
      
    </div>
  </div>
</div>
</div>	
</body>
</html>