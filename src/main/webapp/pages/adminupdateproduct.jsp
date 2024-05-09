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
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    margin: 0;
    padding: 20px;
    background-image: url('https://img.freepik.com/free-vector/gradient-technology-futuristic-background_23-2149122421.jpg');
    
    background-size: cover; 
    
    background-position: center; 
    
    background-attachment: fixed; 
}

/* Form Container Styles */
form {
    background-color: #fff;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    max-width: 400px;
    width: 100%;
}

h3 {
    text-align: center;
    margin-top: 0;
    color: #333;
}

/* Form Input Styles */
label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
    color: #555;
}

input[type="text"],
input[type="file"],
select {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
    margin-bottom: 15px;
    box-sizing: border-box;
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
    display: block;
    width: 100%;
    padding: 10px;
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
		<form action="/TechMaya/AdminUpdateProductServlet" method="post" enctype="multipart/form-data">
		<h3>Update Product</h3>
			<label>Name: </label>
            <input type="text" id="update-product-name" name="update-product-name" value="${product.name}"/>    
            
            <label>Description: </label>
            <input type="text" id="update-product-desc" name="update-product-desc" value="${product.description}"/>
            
            <label>Price: </label>
            <input type="text" id="update-product-price" name="update-product-price" value="${product.price}"/>
            
            <label>Stock: </label>
            <input type="text" id="update-product-desc" name="update-product-stock" value="${product.stock}"/>
            
            <label>Tag: </label>
            <select id="update-product-tag" name="update-product-tag" required>
                        	<c:forEach var="tag" items="${StringUtils.PRODUCT_TAGS}">
                        		<option value="${tag}" <c:if test="${product.tag.equals(tag)}"> selected </c:if>>${tag}</option>
                        	</c:forEach>
                        </select>
                        
            <label> Image (leave empty if you do not want to update): </label>
            <input type="file" id="update-product-image" name="update-product-image" accept="image/*" required/>
            <input type="hidden" name="update-product-id" value="${product.uid}" />
            <button>Update</button>
            
		</form>
	</body>
</html>