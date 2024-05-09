<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search UI</title>
    <link rel="stylesheet" href="styles.css">
</head>
<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
}

.container {
    display: flex;
    height: 100vh;
}

.sidebar {
    background-color: #f7d2d2;
    padding: 20px;
    width: 250px;
    position: sticky;
    top: 0;
    height: 100vh;
    overflow-y: auto;
}

.filter h3,
.filter h4 {
    margin: 10px 0;
}

.tag-item {
    display: flex;
    align-items: center;
    margin-bottom: 5px;
}

.tag-item input[type="checkbox"] {
    margin-right: 10px;
}

.by-price {
    margin-top: 20px;
}

.price-range {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
}

.price-range input[type="range"] {
    flex-grow: 1;
    margin-right: 10px;
}

.main-content {
    flex-grow: 1;
    padding: 20px;
    position: relative;
}

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
<body>
<jsp:include page="header.jsp" />
    <div class="container">
        <div class="sidebar">
            <div class="filter">
                <h3>Filter</h3>
                <div class="by-tags">
                    <h4>By Tags:</h4>
                    <div class="tag-item">
                        <input type="checkbox" id="headphones1">
                        <label for="headphones1">Headphones</label>
                    </div>
                    <div class="tag-item">
                        <input type="checkbox" id="headphones2">
                        <label for="headphones2">Headphones</label>
                    </div>
                    <div class="tag-item">
                        <input type="checkbox" id="headphones3">
                        <label for="headphones3">Headphones</label>
                    </div>
                    <div class="tag-item">
                        <input type="checkbox" id="headphones4">
                        <label for="headphones4">Headphones</label>
                    </div>
                </div>
                <div class="by-price">
                    <h4>By Price:</h4>
                    <div class="price-range">
                        <input type="range" id="min-price" min="0" max="100" value="0">
                        <label for="min-price">Min</label>
                    </div>
                    <div class="price-range">
                        <input type="range" id="max-price" min="0" max="100" value="100">
                        <label for="max-price">Max</label>
                    </div>
                </div>
            </div>
        </div>
        <div class="main-content">
            <div class="search-bar">
                <input type="text" placeholder="Search">
                <span class="search-icon">&#128269;</span>
            </div>
            <div class="search-message">
                <p>Search to get started</p>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>