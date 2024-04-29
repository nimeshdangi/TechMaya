<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
	<body>
		<form action="/TechMaya/AdminUpdateProductServlet" method="post">
			<label>Name: </label>
            <input type="text" id="update-product-name" name="update-product-name" value="${product.name}"/>
            
            
            <label>Description: </label>
            <input type="text" id="update-product-desc" name="update-product-desc" value="${product.description}"/>
            
            <input type="hidden" name="update-product-id" value="${product.id}" />
            <button>Update</button>
            
		</form>
	</body>
</html>