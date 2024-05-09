<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="utils.StringUtils" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
/* General Styles */
body {
    font-family: 'Roboto', sans-serif;
    
    background-image: url('https://img.freepik.com/free-vector/gradient-technology-futuristic-background_23-2149122421.jpg');
    
    background-size: cover; 
    
    background-position: center; 
    
    background-attachment: fixed; 
}

/* Overlay Container Styles */
.overlay-container {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #fff;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    z-index: 9999;
    max-width: 400px;
    width: 90%;
}

/* Form Styles */
form {
    margin: 5px;
    
}

label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

input[type="text"],
input[type="file"],
select {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}

input[type="file"] {
    padding: 8px;
}

select {
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    background-image: url('data:image/svg+xml;utf8,<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z" fill="%23555"/></svg>');
    background-repeat: no-repeat;
    background-position: right 10px center;
    padding-right: 30px;
}

/* Button Styles */
button {
    padding: 10px 20px;
    background-color: #333;
    color: #fff;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #444;
}

h3 {
    text-align: center; /* Center align the text */
  }

</style>

</head>
<body>
	<form action="/TechMaya/AdminProductsServlet" method="post" enctype="multipart/form-data" id="popup-product" class="overlay-container column-flex">
					<h3>Add New Product</h3>
                    <div>
                        <label>Name: </label>
                        <input type="text" id="add-product-name" name="add-product-name" required/>
                        <br>
                    </div>
                    
                    <div>
                        <label>Description: </label>
                        <input type="text" id="add-product-description" name="add-product-description" required/>
                        <br>
                    </div>
                    <div>
                        <label>Price: </label>
                        <input type="text" id="add-product-price" name="add-product-price" required/>
                        <br>
                    </div>
                    <div>
                        <label>Stock: </label>
                        <input type="text" id="add-product-stock" name="add-product-stock" required/>
                        <br>
                    </div>
                    <div>
                        <label>Tag: </label>
                        <select id="add-product-tag" name="add-product-tag" required>
                        <option value="" selected disabled hidden="">Choose a tag</option>
                        	<c:forEach var="tag" items="${StringUtils.PRODUCT_TAGS}">
                        		<option value="${tag}">${tag}</option>
                        	</c:forEach>
                        </select>
                        <br>
                    </div>
                    <div>
                        <label>Image: </label>
                        <input type="file" id="add-product-image" name="add-product-image" accept="image/*" required/>
                        <br>
                    </div>
                    <div style= "margin-top: 10px;">
                        <button>Add</button>
                    </div>
     </form>
</body>
</html>