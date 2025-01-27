<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Products Panel</title>

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
    padding: 30px;
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

/* Products Styles */
#admin-products {
    max-height: 600px;
    overflow-y: auto;
}

.admin-product {
    background-color: #fff;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    border-radius: 5px;
    padding: 20px;
    margin-bottom: 20px;
}

.admin-product img {
    max-width: 100%;
    height: auto;
    margin-bottom: 10px;
}

.product-title {
    font-size: 18px;
    font-weight: bold;
    margin: 0;
}

.product-description {
    margin: 5px 0;
    color: #666;
}

/* Button Styles */
button {
    padding: 8px 15px;
    border-radius: 20px;
    border: none;
    font-size: 14px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    background-color: #333;
    color: #fff;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #444;
}

a {
    color: #fff;
    text-decoration: none;
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

.product-section {
    margin-top: 30px;
}

.product-row {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}

a:hover, a:visited, a:link, a:active
{
    text-decoration: none;
}


    	
</style>
</head>
	<body>
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
            
	
			<div id="main" class="column-flex" style="height:690px">
                <!--Search-->
				<div id="search-bar">
                    <input type="text" id="search" onkeyup="search()" placeholder="search...">
                    <img src="/TechMaya/resources/images/icons/search.svg"/>
                </div>
                
                <!-- Products-->
                <div id="admin-products" class="remove-scrollbar">
                    <div style="display: flex;justify-content: center;align-items: center;">
                        <button type="button"><a href="pages/adminproductadd.jsp">Add</a></button>
                    </div>
                    <h2>Recently Added Products</h2>
                    <c:forEach var="product" items="${productsList}">
                    <div class="product-section" >
                    
                    <div class="product-row">
                    	<div class="admin-product">
                    	<div style="height: 150px; width: 150px;">
                    		<img src="/TechMaya/resources/images/products/${product.uid}.png"/>
                    	</div>
                    		<p class="product-title"> ${product.name}</p>
                    		<p class="product-description"> ${product.description}</p>
                    		<p class="product-description"> Price: ${product.price}</p>
                    		<p class="product-description"> Stock: ${product.stock}</p>
                    		<p class="product-description"> Tag: ${product.tag}</p>
                    		<div style="display:flex;justify-content: space-evenly; height:40px; width:100%;">
                    			<form method="post" action="${pageContext.request.contextPath}/AdminModifyProductsServlet">
                    				<input type="hidden" name="updateId" value="${product.uid}" />
									<button type="submit" 	>Update</button>
                    			</form>
                    			<form id="deleteForm-${product.name}" method="post" action="${pageContext.request.contextPath}/AdminModifyProductsServlet">
                    				<input type="hidden" name="deleteId" value="${product.uid}" /> <!-- Try formactoin -->
									<button type="button" onclick="confirmDelete('${product.name}')">Delete</button>
                    			</form>
							</div>             			
                    	</div>
                    </div>
                    </div>
                    </c:forEach>
                        
                </div>
            </div>
		</div>
	</body>
	
	<script>
	//do backend. not frontend
	const adminProduct = document.getElementById("admin-products");
    const list = adminProduct.querySelectorAll(".admin-product");

    function search(){
        var input = document.getElementById("search").value.toUpperCase();
        for(let i = 0; i < list.length; i++){
            //let temp = list[i].firstChild.nodeValue.toUpperCase();
            let temp = list[i].getElementsByClassName("product-title")[0].textContent.toUpperCase();
            if (temp.indexOf(input) > -1){
                list[i].setAttribute("style","display:block");
            } else{
                list[i].setAttribute("style","display:none");
            }
        }
    }
    
    function confirmDelete(name){
		if( confirm("Are you sure you wnat to delete this user: "+name+"?")){
			document.getElementById("deleteForm-" + name).submit();
		}
	}
	</script>
</html>