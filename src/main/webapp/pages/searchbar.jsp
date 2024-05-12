<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.search-bar {
    display: flex;
    align-items: center;
    background-color: #f2f2f2;
    padding: 10px;
    border-radius: 20px;
    position: sticky;
    top: 0;
    z-index: 1;
}

.search-bar input[type="text"] {
    flex-grow: 1;
    border: none;
    background-color: transparent;
    outline: none;
    padding: 5px;
    font-size: 16px;
}

.search-icon {
    font-size: 20px;
    cursor: pointer;
}

.search-message {
    margin-top: 50px;
    text-align: center;
    color: #888;
}
</style>
<form method="post" action="/TechMaya/SearchServlet">
            <div class="search-bar">
                <input type="text" name="searchQuery" placeholder="Search">
                <button><span class="search-icon">&#128269;</span></button>
                <input type = "hidden" name="minPrice" value = "0"/>
                <input type = "hidden" name="maxPrice" value = "999999"/>
            </div>
           </form>