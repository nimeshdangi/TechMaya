<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="utils.StringUtils" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/TechMaya/stylesheets/admin.css">
</head>
<body>
	<form action="/TechMaya/AdminProductsServlet" method="post" enctype="multipart/form-data" id="popup-product" class="overlay-container column-flex">
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
                    <div>
                        <button>Add</button>
                    </div>
                </form>
</body>
</html>