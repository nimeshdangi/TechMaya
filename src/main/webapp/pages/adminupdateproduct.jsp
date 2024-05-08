<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="utils.StringUtils" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
	<body>
		<form action="/TechMaya/AdminUpdateProductServlet" method="post" enctype="multipart/form-data">
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