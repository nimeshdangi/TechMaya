 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Admin Panel</title>
		
	</head>
	<style>
	/* Reset and General Styles */
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
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

body {
  font-family: Arial, sans-serif;
  background-color: #f5f5f5;
}

/* Header and Footer Styles */
header, footer {
  background-color: #333;
  color: #fff;
  padding: 20px;
  text-align: center;
}
.content {
    padding: 100px;
    margin-left: 100px;
    display: flex;
    flex-direction: column;
}

.order-summary {
    background-color: #f2f2f2;
    padding: 20px;
    display: flex;
    justify-content: space-around;
    margin-bottom: 20px;
}

.summary-item {
    text-align: center;
}

.summary-label {
    font-weight: bold;
}

/* Container Styles */
#container {
  display: flex;
  height: calc(100vh - 120px); /* Adjust height based on header and footer height */
}

/* Navigation Styles */
#navigation {
  background-color: #333;
  color: #fff;
  padding: 20px;
  width: 200px;
}

.nav {
  display: flex;
  align-items: center;
  padding: 10px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.nav:hover {
  background-color: #444;
}

.nav img {
  margin-right: 10px;
  width: 20px;
  height: 20px;
}

/* Main Content Styles */



#main {
  flex-grow: 1;
  padding: 20px;
  display: flex;
  flex-direction: column;
}

#order-section, #content-section {
  flex-grow: 1;
  margin-bottom: 20px;
}

#today-orders, #visit-revenue {
  display: flex;
  justify-content: space-between;
  margin-bottom: 20px;
}

#today-orders div, #site-visits, #revenue, #ratings {
  background-color: #fff;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  padding: 20px;
  width: 30%;
}

/* Responsive Styles */
@media (max-width: 768px) {
  #container {
    flex-direction: column;
    height: auto;
  }

  #navigation {
    width: 100%;
    padding: 10px;
  }

  .nav {
    justify-content: center;
  }

  #today-orders, #visit-revenue {
    flex-direction: column;
  }

  #today-orders div, #site-visits, #revenue, #ratings {
    width: 100%;
    margin-bottom: 20px;
  }
  
    a:hover, a:visited, a:link, a:active
{
    text-decoration: none;
}
  
  
	</style>
	<body>
		<body>
		<header>

		</header>
		<div id="container">
			<div id="navigation" class="column-flex">
				<div id="dashboard" class="nav">
					<img>
					<a href="/TechMaya/AdminDashboardServlet">Dashboard</a>
				</div>
				<div id="products" class="nav">
					<img>
					<a href="/TechMaya/AdminProductsServlet">Products</a>
				</div>
				<div id="orders" class="nav">
					<img>
					<a href="/TechMaya/AdminOrdersServlet">Orders</a>
				</div>
				<a href="/TechMaya/LogoutServlet" class="logout-btn">Logout</a>
			</div>
            
	
	<div class="content">
        <div class="order-summary">
            <div class="summary-item">
                <div class="summary-label">Total Orders:</div>
                <div class="summary-value">${monthlyOrders.totalOrders}</div>
            </div>
            <div class="summary-item">
                <div class="summary-label">Completed Orders:</div>
                <div class="summary-value">${monthlyOrders.completedOrders}</div>
            </div>
            <div class="summary-item">
                <div class="summary-label">Failed Orders:</div>
                <div class="summary-value">${monthlyOrders.failedOrders}</div>
            </div>
            <div class="summary-item">
                <div class="summary-label">Pending Orders:</div>
                <div class="summary-value">${monthlyOrders.pendingOrders}</div>
            </div>
        </div>
        <div class="order-summary">
            
            <div class="summary-item">
                <div class="summary-label">Most item sold:</div>
                <div class="summary-value">Nrs ${mostSoldItem.sum}</div>
            </div>
            <div class="summary-item">
                <div class="summary-label">Item name:</div>
                <div class="summary-value">${mostSoldItem.name}</div>
            </div>
            <div class="summary-item">
                <div class="summary-label">Highest revenue:</div>
                <div class="summary-value">Nrs ${highestRevenue }</div>
            </div>
            <div class="summary-item">
                <div class="summary-label">Revenue:</div>
                <div class="summary-value">Nrs ${revenue }</div>
            </div>
        </div>
    </div>
		</div>
		

		<footer>

		</footer>
	</body>
</html>