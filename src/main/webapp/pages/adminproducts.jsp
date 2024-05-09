<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Products Panel</title>
<link rel="stylesheet" href="/TechMaya/stylesheets/admin.css">
	<style>
        .overlay-container{
            display: none; 
            position: fixed; 
            top: 0; 
            left: 0; 
            width: 100%; 
            height: 100%; 
            background: rgba(0, 0, 0, 0.6); 
            justify-content: center; 
            align-items: center; 
            opacity: 0; 
        }
        .overlay-container.show { 
            display: flex; 
            opacity: 1; 
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
                    <input type="text" id="search" onkeyup="search()" placeholder="search...">
                    <img src="/TechMaya/resources/images/icons/search.svg"/>
                </div>
                
                <!-- Products-->
                <div id="admin-products" class="remove-scrollbar">
                    <div style="display: flex;justify-content: center;align-items: center;">
                        <button type="button"><a href="pages/adminproductadd.jsp">Add</a></button>
                    </div>
                    
                    <c:forEach var="product" items="${productsList}">
                    	<div class="admin-product">
                    		<img src="/TechMaya/resources/images/products/${product.imageUrlFromPart}"/>
                    		<p class="product-title"> ${product.name}</p>
                    		<p class="product-description"> ${product.description}</p>
                    		<p class="product-description"> Price: ${product.price}</p>
                    		<p class="product-description"> Stock: ${product.stock}</p>
                    		<p class="product-description"> Tag: ${product.tag}</p>
                    		<div style="display:flex;justify-content: space-evenly; height:40px; width:100%;">
                    			<form method="post" action="${pageContext.request.contextPath}/AdminModifyProductsServlet">
                    				<input type="hidden" name="updateId" value="${product.uid}" />
									<button type="submit" style="width:50px; height:20px;"	>Update</button>
                    			</form>
                    			<form id="deleteForm-${product.name}" method="post" action="${pageContext.request.contextPath}/AdminModifyProductsServlet">
                    				<input type="hidden" name="deleteId" value="${product.uid}" /> <!-- Try formactoin -->
									<button type="button" onclick="confirmDelete('${product.name}')">Delete</button>
                    			</form>
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