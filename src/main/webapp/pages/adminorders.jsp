<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Order Panel</title>
<link rel="stylesheet" href="/TechMaya/stylesheets/admin.css">
<style>
	table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
	
	th, td {
		padding:10px;
	}
	
	table{
		height:200px;
		width:1000px;
	}
</style>
</head>
	<body>
		<div id="container">
			<div id="navigation" class="column-flex">
				<div id="dashboard" class="nav">
					<img>
					Dashboard
				</div>
				<div id="products" class="nav">
					<img>
					Products
				</div>
				<div id="orders" class="nav">
					<img>
					Orders
				</div>
				<div id="feedback" class="nav">
					<img>
					Feedback
				</div>
			</div>
            
	
			<div id="main" class="column-flex" style="height:690px">
                <!--Search-->
				<div id="search-bar">
                    <!-- <input type="text" id="search" onkeyup="search()" placeholder="search..."> -->
                    <input type="text" id="search" placeholder="search...">
                    <img src="/TechMaya/resources/images/icons/search.svg"/>
                </div>
              
                <div id="admin-orders" class="remove-scrollbar">
                	<table>
                	<tr>
                	<th>ID</th>
                	<th>Date</th>
                	<th>User</th>
                	<th>Status</th>
                	</tr>
                	
                    <c:forEach var="order" items="${ordersList}">
                    	<tr>
                    		<td> ${order.id}</td>
                    		<td> ${order.date}</td>
                    		<td> ${order.user}</td>
                    		<td>
                    		<form action="/TechMaya/AdminOrdersServlet" method="post" style="display:flex; justify-content:space-between;">
                    			<select id="status" name="status" required>
									<option value="pending" <c:if test="${order.status.equals('pending')}"> selected </c:if>>Pending</option>
									<option value="delivered" <c:if test="${order.status.equals('delivered')}"> selected </c:if>>Delivered</option>
								</select>
								<input type="hidden" name="id" value="${order.id}" />
								
								<button>Update</button>
							</form>
                    		
                    		</td>
                    	</tr>
                    </c:forEach>
                    </table>
                </div>
            </div>
		</div>
	</body>
</html>