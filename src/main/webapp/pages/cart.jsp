<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">

<title>Shopping Cart</title>
<link rel="stylesheet" type="text/css" href="/TechMaya/stylesheets/user_cart.css"/>
</head>
<body>

<div class="shopping-cart">
  <h2 class="title">SHOPPING CART</h2>
  <table class="cart-items">
    <tr>
    	<th>Image</th>
      <th>Name</th>
      <th>Price</th>
      <th>Quantity</th>
      <th>Remove</th>
    </tr>
    <c:set var="total" value="0"/>
    <c:forEach var="cartProduct" items="${cartProducts}">
    <tr>
    	<td><img src = "/TechMaya/resources/images/products/${cartProduct.uid}.png" style="width:50px;height:50px;"></td>
    	<td>${cartProduct.name}</td>
    	<td>NPR ${cartProduct.price}</td>
    	<td>${cartProduct.quantity}</td>
    	<c:set var="total" value="${total + cartProduct.price *cartProduct.quantity }"/>
    	<td><button>-</button> <button>+</button></td>
    	</tr>
    </c:forEach>
  </table>
  <button>Update Cart</button>
  

  <div class="cart-summary">
    <h3>Summary</h3>
    <p>Subtotal: NPR ${total}</p>
    <p>Shipping Cost: N/A</p>
    <p>Grand Total: NPR ${total}</p>
    <a href="#" class="checkout-btn">Proceed to Checkout</a>
  </div>
</div>

</body>
</html>