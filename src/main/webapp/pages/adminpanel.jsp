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
  
  
  
	</style>
	<body>
		<body>
		<header>

		</header>
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
            
	
			<div id="main">
				<div id="order-section" class="column-flex">
					<div id="today-orders" class="column-flex">
						<div>
							
						</div>
						<div>
							
						</div>
						<div>
	
						</div>
					</div>

					<div id="monthly-orders">
	
					</div>
				</div>
				
				<div id="content-section" class="column-flex">
					<div id="visit-revenue" style="display: flex;">
						<div id="site-visits" class="column-flex">
	
						</div>
						<div id="revenue">
			
						</div>
						
					</div>
					
					<div id="ratings">

					</div>
				</div>
			</div>
		</div>
		

		<footer>

		</footer>
	</body>
</html>