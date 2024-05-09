<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">

<title>Shopping Cart</title>
<link rel="stylesheet" type="text/css" href="/TechMaya/stylesheets/user_cart.css"/>
<style type="text/css">
$delete-red: red;

body {
  margin: 32px;
}

.btn {
  display: flex;
  align-items: center;
  background: none;
  border: 1px solid lighten(gray, 24%);
  height: 48px;
  padding: 0 24px 0 16px;
  letter-spacing: 0.25px;
  border-radius: 24px;
  cursor: pointer;

  &:focus {
    outline: none;
  }

  .mdi {
    margin-right: 8px;
  }
}

.btn-delete {
  font-size: 16px;
  color: red;

  > .mdi-delete-empty {
    display: none;
  }

  &:hover {
    background-color: lighten(red, 48%);

    > .mdi-delete-empty {
      display: block;
    }

    > .mdi-delete {
      display: none;
    }
  }

  &:focus {
    box-shadow: 0 0 0 4px lighten(red, 40%);
  }
}
</style>

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
    	<!-- <td><button type = 'button'>-</button>${cartProduct.quantity}<button type = 'button'>+</button></td> -->
    	<td><button type='number'>-</button> ${cartProduct.quantity}<button type='number'>+</button></td>
    	<c:set var="total" value="${total + cartProduct.price *cartProduct.quantity }"/>
    	<td><button class="btn btn-delete">
  		<span>Delete</span>
		</button></td>
    </tr>
    </c:forEach>
  </table>
  <button>Update Cart</button>
  

  <form class="cart-summary" method="post" action="/TechMaya/CheckoutServlet">
    <h3>Summary</h3>
    <p>Subtotal: NPR ${total}</p>
    <p>Shipping Cost: N/A</p>
    <p>Grand Total: NPR ${total}</p>
    <input type="hidden" name="product-total" value="${total}"/>
    <strong> NOTE: We only support cash on delivery.</strong>
    <button class="checkout-btn">Proceed to Checkout</button>
  </form>
</div>

</body>


</html>