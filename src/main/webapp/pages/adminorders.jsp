<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Order Panel</title>

<style>
/* General Styles */
body {
    margin: 0;
    font-family: 'Roboto', sans-serif;
    background-color: #f5f5f5;
}

.logout-btn {
    display: block;
    text-align: center;
    background-color: #e74c3c;
    color: #fff;
    text-decoration: none;
    padding: 10px;
    margin-top: 200px;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

.logout-btn:hover {
    background-color: #c0392b;
}

/* Container Styles */
#container {
    display: flex;
    height: 100vh;
    
}
/* Navigation Styles */
#navigation {
    background-color: #333;
    color: #fff;
    padding: 20px;
    width: 250px;
    box-shadow: 5px 0 10px rgba(0, 0, 0, 0.1);
}

.nav {
    display: flex;
    align-items: center;
    padding: 15px 10px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.nav:hover {
    background-color: #444;
}

.nav img {
    margin-right: 15px;
    width: 25px;
    height: 25px;
}

/* Main Content Styles */
#main {
    flex-grow: 1;
    padding: 20px;
    background-color: #f5f5f5;
}

/* Search Bar Styles */
#search-bar {
    display: flex;
    align-items: center;
    background-color: #fff;
    border-radius: 20px;
    padding: 5px 15px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    margin-bottom: 30px;
}

#search-bar input[type="text"] {
    border: none;
    outline: none;
    flex-grow: 1;
    font-size: 16px;
    padding: 5px;
}

#search-bar img {
    width: 20px;
    height: 20px;
    cursor: pointer;
}

/* Table Styles */
#admin-orders {
    max-height: 600px;
    overflow-y: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
    background-color: #fff;
}

th, td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #f2f2f2;
}

/* Form Styles */
form {
    align-items: center;
}

select, button {
    padding: 5px 10px;
    border-radius: 4px;
    border: 1px solid #ccc;
    font-size: 14px;
}

button {
    background-color: #333;
    color: #fff;
    cursor: pointer;
}

/* Utility Classes */
.column-flex {
    display: flex;
    flex-direction: column;
}

.remove-scrollbar {
    scrollbar-width: none;
    -ms-overflow-style: none;
}

.remove-scrollbar::-webkit-scrollbar {
    display: none;
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
				<a href="#" class="logout-btn">Logout</a>
				
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
									<option value="pending" <c:if test="${order.status.equals('Pending')}"> selected </c:if>>Pending</option>
									<option value="delivered" <c:if test="${order.status.equals('Delivered')}"> selected </c:if>>Delivered</option>
									<option value="failed" <c:if test="${order.status.equals('Failed')}"> selected </c:if>>Failed</option>
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