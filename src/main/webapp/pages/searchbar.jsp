<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="search-bar">
	<input type="text" id="search" placeholder="search..." value = <c:if test="true"> Henlo </c:if>>
	
	<img src="/TechMaya/resources/images/icons/search.svg"/>
</div>