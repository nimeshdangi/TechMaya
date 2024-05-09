<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Details Page</title>
<link rel="stylesheet" type="text/css" href="/TechMaya/stylesheets/productspecificdetail.css"/>
</head>
    <body>
		<jsp:include page="header.jsp" />
        <div class = "card-wrapper">
            <div class = "card">
                <!-- card left -->
                <div class = "product-imgs">
                <div class = "img-display">
                    <div class = "img-showcase">
                    <img src = "../images/Headphone1.png" alt = "headphone image">
                    </div> 
                </div>
                </div>

                <!-- card right -->

                <div class = "product-content">
                <h2 class = "product-title">Head Phones</h2>
                <a href = "#" class = "product-link">Visit TechMaya Store</a>
                <div class = "product-rating"> </div>
                <div class = "product-price">
                    <p class = "last-price">Price: <span>NPR 2570</span></p>
                </div>
                <div class = "product-detail">
                    <h2>about this item: </h2>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Illo eveniet veniam tempora fuga tenetur placeat sapiente architecto illum soluta consequuntur, aspernatur quidem at sequi ipsa!</p>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur, perferendis eius. Dignissimos, labore suscipit. Unde.</p>
                    <ul>
                    <li>Available: <span>in stock</span></li>
                    <li>Category: <span>HeadPhone</span></li>
                    <li>Shipping Area: <span>All over the Nepal</span></li>
                    <li>Shipping Fee: <span>Free</span></li>
                    </ul>
                </div>
                <div class = "purchase-info">
                    <input type = "number" min = "0" value = "1">
                    <button type = "button" class = "btn">
                    Add to Cart <i class = "fas fa-shopping-cart"></i>
                    </button>
                </div>
                </div>
            </div>
        </div>
        <div class="review-container">
            <div class="rating-overall">
                <span class="stars">★★★★★</span> 5/5 (1 review)
            </div>
            <h2>Reviews By Customer</h2>
            <div class="review">
                <div class="review-content">
                    <img src="/TechMaya/images/cv pic.jpg" alt="Customer Photo" class="customer-photo">
                    <div>
                        <p>Good headphones. Absolutely loved it</p>
                        <p class="review-author">Nimesh Dangi</p>
                    </div>
                </div>
                <div class="rating">
                    <span class="stars">★★★★★</span>
                </div>
            </div>
        </div>
        <h2 class = "similar-products">Similar Products</h2>
        <div class = "img-select">
            <div class = "img-item">
            <a href = "#" data-id = "1">
                <img src = "../images/Headphone5.png" alt = "HeadPhone image">
            </a>
            </div>

            <div class = "img-item">
            <a href = "#" data-id = "2">
                <img src = "../images/Headphone3.png" alt = "HeadPhone image">
            </a>
            </div>

            <div class = "img-item">
            <a href = "#" data-id = "3">
                <img src = "../images/Headphone8.png" alt = "HeadPhone image">
            </a>
            </div>

            <div class = "img-item">
            <a href = "#" data-id = "4">
                <img src = "../images/Headphone4.png" alt = "HeadPhone image">
            </a>
            </div>
        </div>
		<jsp:include page="footer.jsp" />
    </body>
</html>