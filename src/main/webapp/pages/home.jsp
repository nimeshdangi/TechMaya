<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home Page</title>
	<link rel="stylesheet" href="/TechMaya/stylesheets/style.css">
	<link rel="stylesheet" href="/TechMaya/stylesheets/home.css">
	<link rel="stylesheet" href="/TechMaya/stylesheets/product2.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<section class="homepage" id="Home">
		<div class="content flex">
			<div class="text">
				<h1>Electronic Accessories</h1>
				<p>Get the best electronic accessories from out e-commerce website in best deals. Just Contact Us for more!!!</p>
			</div>
			<a href="#Product">Our Products</a>
		</div>
	</section>

	<!--Homepage end-->

	<!--Service Start-->
	<section class="services" id="Product">
		<div class="container">
			<div class="section-title">
				<h2>Products</h2>
			</div>
			<div class="product-grid">
	        <div class="product-card">
			    <div class="product-image">
			        <img src="/TechMaya/images/Iphone14.jpg" alt="Iphone14">
			        <div class="overlay">
			            <button class="btn favorite">
			            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
								<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
								<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
							</svg>
			            </button>
			            <button class="btn add-to-cart">ADD TO CART</button>
			        </div>
			    </div>
			    <div class="product-info">
			        <h3>Iphone14</h3>
			        <p class="price"><span class="discounted">Rs. 150,000</span></p>
			    </div>
			</div>
			
			<div class="product-card">
			    <div class="product-image">
			        <img src="/TechMaya/images/SonyHeadphone.jpg" alt="Sony HeadPhones">
			        <div class="overlay">
			            <button class="btn favorite">
			            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
								<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
								<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
							</svg>
			            </button>
			            <button class="btn add-to-cart">ADD TO CART</button>
			        </div>
			    </div>
			    <div class="product-info">
			        <h3>Sony HeadPhones</h3>
			        <p class="price"><span class="discounted">Rs. 60,000</span></p>
			    </div>
			</div>
			
			<div class="product-card">
			    <div class="product-image">
			        <img src="../images/Airpods3.png" alt="Samsungs23 Ultra">
			        <div class="overlay">
			            <button class="btn favorite">
			            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
								<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
								<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
							</svg>
			            </button>
			            <button class="btn add-to-cart">ADD TO CART</button>
			        </div>
			    </div>
			    <div class="product-info">
			        <h3>Samsungs23 Ultra</h3>
			        <p class="price"><span class="discounted">Rs. 85,000</span></p>
			    </div>
			</div>
			
			<div class="product-card">
			    <div class="product-image">
			        <img src="/TechMaya/images/microphoneDPA.jfif" alt="DPA Microphone">
			        <div class="overlay">
			            <button class="btn favorite">
			            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
								<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
								<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
							</svg>
			            </button>
			            <button class="btn add-to-cart">ADD TO CART</button>
			        </div>
			    </div>
			    <div class="product-info">
			        <h3>DPA Microphone</h3>
			        <p class="price"><span class="discounted">Rs. 20,000</span></p>
			    </div>
			</div>
			
			<div class="product-card">
			    <div class="product-image">
			        <img src="/TechMaya/images/charger1.jpg" alt="Charger for Samsung">
			        <div class="overlay">
			            <button class="btn favorite">
			            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
								<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
								<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
							</svg>
			            </button>
			            <button class="btn add-to-cart">ADD TO CART</button>
			        </div>
			    </div>
			    <div class="product-info">
			        <h3>Charger for Samsung</h3>
			        <p class="price"><span class="discounted">Rs. 1000</span></p>
			    </div>
			</div>
			
			<div class="product-card">
			    <div class="product-image">
			        <img src="/TechMaya/images/earphone1.jpg" alt="Earphone">
			        <div class="overlay">
			            <button class="btn favorite">
			            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
								<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
								<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
							</svg>
			            </button>
			            <button class="btn add-to-cart">ADD TO CART</button>
			        </div>
			    </div>
			    <div class="product-info">
			        <h3>Earphone</h3>
			        <p class="price"><span class="discounted">Rs. 3000</span></p>
			    </div>
			</div>
		</div>

			<!-- <ul class="cards flex">
				<li class="card"> 
					<a href="#Product.html"><img src="/TechMaya/images/Iphone14.jpg"></a>
					<h3>Iphone14.jpg</h3> 
					<p>Rs.150,000</p>
				</li>
				<li class="card">
					<a href="#Product.html"><img src="/TechMaya/images/SonyHeadphone.jpg"></a>
					<h3>Sony HeadPhones</h3>
					<p>Rs. 60,000</p>
				</li>
				<li class="card">
					<a href="#Product.html"><img src="/TechMaya/images/samsungs23.jfif"></a>
					<h3>Samsungs23 Ultra</h3>
					<p>Rs. 85,000</p>
				</li>
				<li class="card">
					<a href="#Product.html"><img src="/TechMaya/images/microphoneDPA.jfif"></a>
					<h3>DPA Microphone</h3>
					<p>Rs. 20,000</p>
				</li>
				<li class="card">
					<a href="#Product.html"><img src="/TechMaya/images/charger1.jpg"></a>
					<h3>Charger for Samsung</h3>
					<p>Rs. 1000</p>
				</li>
				<li class="card">
					<a href="#Product.html"><img src="/TechMaya/images/earphone1.jpg"></a>
					<h3>Earphone</h3>
					<p>Rs. 3000</p>
				</li>
			</ul> -->
		</div>
		<div class="seemore">
			<a href="#Product.html">
				<button>
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
						<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
						<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
					</svg>
				</button>
			</a>
		</div>
	</section>
	<!--Service End-->

	<!--Category starts-->
	<section class="Category" id="Category">
		<div class="container">
			<div class="section-title">
				<h2>Category</h2>
				<ul class="cards flex">
					<li class="card">
						<a href="#Product.html"><img src="/TechMaya/images/samsung.jpg"></a>
						<h3>Mobile Phones</h3>
						<p>Best Quality Mobile Phone.</p>
					</li>
					<li class="card">
						<a href="#Product.html"><img src="/TechMaya/images/images.jfif"></a>
						<h3>HeadPhone</h3>
						<p>Best Quality Headphone.</p>
					</li>
					<li class="card">
						<a href="#Product.html"><img src="/TechMaya/images/microphone.jpg"></a>
						<h3>Microphone</h3>
						<p>Best Quality Microphone.</p>
					</li>
					<li class="card">
						<a href="#Product.html"><img src="/TechMaya/images/earphone.jpg"></a>
						<h3>Earphone</h3>
						<p>Best Quality Earphone.</p>
					</li>
					<li class="card">
						<a href="#Product.html"><img src="/TechMaya/images/charger.jpg"></a>
						<h3>Charger</h3>
						<p>Best Quality Charger.</p>
					</li>
					<li class="card">
						<a href="#Product.html"><img src="/TechMaya/images/headset.jfif"></a>
						<h3>Headset</h3>
						<p>Best Quality headset.</p>
					</li>
				</ul>
			</div>
		</div>
		<div class="boo">
			<a href="#Product.html">
				<button>
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
						<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
						<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
					</svg>
				</button>
			</a>
		</div>
	</section>
	<!--Category ends-->
	<jsp:include page="footer.jsp" />
</body>
</html>