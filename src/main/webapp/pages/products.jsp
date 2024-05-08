<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Our Products</title>
<style>
.Product-display {
  display: flex;
  justify-content: space-around;
  align-items: center;

  margin: 30px 0;

}

.product {
  justify-content: space-around;
  text-align: center;
  width: 360px;
  height: 450px;
  line-height: 25px;
  border-radius: 10px;
  box-shadow: 0 3px 8px 0px;
  text-shadow: 0.5px 0.5px #000000;
  background-color: #FFFFFF;

}

.btn-product {
  text-decoration: none;
  color: white;
  border-radius: 4px;
  padding: 11px 34px;
  border: none;
  box-sizing: border-box;
  background: #3644ad;
  
}

.product button {
  border: none;
  margin-top: 45px;

}

.ratings {
    color: #ffffff;
}

</style>
</head>
<body style="background-color: #f1f5f6">
	<!-- Logic: 
		Outer loop loops a arraylist of arraylist. first item in inner arraylist is used to get title(tag).
	 -->
	 <c:forEach var="productList" items="${productsListList}">
	 	<c:set var="titleSet" value="false"/>
	 	<c:forEach var="product" items="${productList}">
	 		<c:if test="${titleSet==false}">
	 			<h1 id="heading-product-1" style="font-family: Courier New;; text-align:center;">${product.tag}</h1> 
	 			<!-- Setting titleSet to true so titles are not added again -->
	 			<c:set var="titleSet" value="true"/>
	 		</c:if>
	 		<section class="Product-display">
	 			<div class="product">
	 				<img src="/TechMaya/resources/images/products/${product.imageUrlFromPart}" width="200" height="200"/>
	 				<p> ${product.name}</p>
                    <p> ${product.description}</p>
                    <p> Price: $${product.price}</p>
                    <form action="/TechMaya/ProductServlet" method="post">
                    	<input type="hidden" name="product-id" value="${product.uid}"/>
                    	<button>View</button>
                    </form>
        
                    <button class="buy-buttons"><a href="#" class="btn-product">Add to Cart</a></button>
                    
	 			</div>
	 		</section>
	 	</c:forEach>
	 </c:forEach>
</body>
</html>