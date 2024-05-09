<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Product Page</title>
		<link rel="stylesheet" href="/TechMaya/stylesheets/style.css">
		<link rel="stylesheet" href="/TechMaya/stylesheets/product2.css">
	</head>
	<body>
		<script>
			function openProductSpecificDetailPage() {
				window.location.href = "/TechMaya/pages/productspecificdetails.jsp";
			}
		</script>
		<jsp:include page="header.jsp" />
		<h1>Earpods</h1>
		<div class="product-grid">
	        <div class="product-card" onclick="openProductSpecificDetailPage()" onclick="openProductSpecificDetailPage()">
			    <div class="product-image">
			        <img src="/TechMaya/images/Airpods1.png" alt="Wired Lightning Headphones">
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
			        <h3>Wired Lightning Headphones</h3>
			        <p class="price"><span class="discounted">Rs. 6999</span></p>
			    </div>
			</div>
			
			<div class="product-card" onclick="openProductSpecificDetailPage()">
			    <div class="product-image">
			        <img src="../images/Airpods2.png" alt="Samsung Galaxy Buds2 Pro">
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
			        <h3>Samsung Galaxy Buds2 Pro</h3>
			        <p class="price"><span class="discounted">Rs. 5000</span></p>
			    </div>
			</div>
			
			<div class="product-card" onclick="openProductSpecificDetailPage()">
			    <div class="product-image">
			        <img src="../images/Airpods3.png" alt="Beats Fit Pro">
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
			        <h3>Beats Fit Pro</h3>
			        <p class="price"><span class="discounted">Rs. 19900</span></p>
			    </div>
			</div>
			
			<div class="product-card" onclick="openProductSpecificDetailPage()">
			    <div class="product-image">
			        <img src="../images/Airpods6.png" alt="AirPods Pro (2nd Gen)">
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
			        <h3>AirPods Pro (2nd Gen)</h3>
			        <p class="price"><span class="discounted">Rs. 16500</span></p>
			    </div>
			</div>
	        <div class="product-card" onclick="openProductSpecificDetailPage()">
			    <div class="product-image">
			        <img src="/TechMaya/images/Airpods1.png" alt="Wired Lightning Headphones">
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
			        <h3>Lightning Headphones</h3>
			        <p class="price"><span class="discounted">Rs. 2999</span></p>
			    </div>
			</div>
		</div>
		
		<h1>Speakers</h1>
		<div class="product-grid">	
			<div class="product-card" onclick="openProductSpecificDetailPage()">
			    <div class="product-image">
			        <img src="../images/Speaker1.png" alt="Rapoo A200 Bluetooth Mini Speaker">
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
			        <h3>Rapoo A200 Bluetooth Mini Speaker</h3>
			        <p class="price"><span class="discounted">Rs. 6990</span></p>
			    </div>
			</div>
			
			<div class="product-card" onclick="openProductSpecificDetailPage()">
			    <div class="product-image">
			        <img src="../images/Speaker2.png" alt="HAVIT SK210 PRO USB 2.0 RGB Speaker">
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
			        <h3>HAVIT SK210 PRO USB 2.0 RGB Speaker</h3>
			        <p class="price"><span class="discounted">Rs. 2500</span></p>
			    </div>
			</div>
			
			<div class="product-card" onclick="openProductSpecificDetailPage()">
			    <div class="product-image">
			        <img src="../images/Speaker3.png" alt="Havit HV-SK473 USB Speaker">
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
			        <h3>Havit HV-SK473 USB Speaker</h3>
			        <p class="price"><span class="discounted">Rs. 1300</span></p>
			    </div>
			</div>
			
			<div class="product-card" onclick="openProductSpecificDetailPage()">
			    <div class="product-image">
			        <img src="../images/Speaker4.png" alt="HAVIT Wireless Portable Speaker HV-SK800BT">
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
			        <h3>HAVIT Wireless Portable Speaker HV-SK800BT</h3>
			        <p class="price"><span the "discounted">Rs. 3999</span></p>
			    </div>
			</div>
			<div class="product-card" onclick="openProductSpecificDetailPage()">
			    <div class="product-image">
			        <img src="../images/Speaker2.png" alt="HAVIT SK210 PRO USB 2.0 RGB Speaker">
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
			        <h3>JBL PRO Speaker</h3>
			        <p class="price"><span class="discounted">Rs. 8500</span></p>
			    </div>
			</div>
		</div>
			
		<h1>Headphones</h1>
		<div class="product-grid">
			<div class="product-card" onclick="openProductSpecificDetailPage()">
			    <div class="product-image">
			        <img src="../images/Headphone1.png" alt="Havit HV-H2116D Wired Headphone">
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
			        <h3>Havit HV-H2116D Wired Headphone</h3>
			        <p class="price"><span class="discounted">Rs. 3000</span></p>
			    </div>
			</div>
			
			<div class="product-card" onclick="openProductSpecificDetailPage()">
			    <div class="product-image">
			        <img src="../images/Headphone2.png" alt="HAVIT H2590BT PRO Wireless Headphone">
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
			        <h3>HAVIT H2590BT PRO Wireless Headphone</h3>
			        <p class="price"><span class="discounted">Rs. 3500</span></p>
			    </div>
			</div>
			
			<div class="product-card" onclick="openProductSpecificDetailPage()">
			    <div class="product-image">
			        <img src="../images/Headphone5.png" alt="Rapoo VH700 Gaming Headphones">
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
			        <h3>Rapoo VH700 Gaming Headphones</h3>
			        <p class="price"><span class="discounted">Rs. 5900</span></p>
			    </div>
			</div>
			
			<div class="product-card" onclick="openProductSpecificDetailPage()">
			    <div class="product-image">
			        <img src="../images/Headphone4.png" alt="Rapoo H120 USB Headset">
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
			        <h3>Rapoo H120 USB Headset</h3>
			        <p class="price"><span class="discounted">Rs. 2010</span></p>
			    </div>
			</div>
			<div class="product-card" onclick="openProductSpecificDetailPage()">
			    <div class="product-image">
			        <img src="../images/Headphone5.png" alt="Rapoo VH700 Gaming Headphones">
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
			        <h3>Fantech Gaming Headphones</h3>
			        <p class="price"><span class="discounted">Rs. 3900</span></p>
			    </div>
			</div>
		</div>
		
		<h1>Gamepad</h1>
		<div class="product-grid">	
			<div class="product-card" onclick="openProductSpecificDetailPage()">
			    <div class="product-image">
			        <img src="../images/Gaming1.png" alt="Logitech F710 Wireless Gamepad">
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
			        <h3>Logitech F710 Wireless Gamepad</h3>
			        <p class="price"><span class="discounted">Rs. 9000</span></p>
			    </div>
			</div>
			
			<div class="product-card" onclick="openProductSpecificDetailPage()">
			    <div class="product-image">
			        <img src="../images/Gaming2.png" alt="Rapoo V600 Ergonomic Gamepad">
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
			        <h3>Rapoo V600 Ergonomic Gamepad</h3>
			        <p class="price"><span class="discounted">Rs. 4999</span></p>
			    </div>
			</div>
			
			<div class="product-card" onclick="openProductSpecificDetailPage()">
			    <div class="product-image">
			        <img src="../images/Gaming6.png" alt="Logitech F310 Gamepad">
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
			        <h3>Logitech F310 Gamepad</h3>
			        <p class="price"><span class="discounted">Rs. 5500</span></p>
			    </div>
			</div>
			
			<div class="product-card" onclick="openProductSpecificDetailPage()">
			    <div class="product-image">
			        <img src="../images/Gaming7.png" alt="Rapoo V600S Wireless Game Controller">
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
			        <h3>Rapoo V600S Wireless Game Controller</h3>
			        <p class="price"><span class="discounted">Rs. 5950</span> <span class="original">Rs. 6500</span></p>
			    </div>
			</div>	
			<div class="product-card" onclick="openProductSpecificDetailPage()">
			    <div class="product-image">
			        <img src="../images/Gaming1.png" alt="Logitech F710 Wireless Gamepad">
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
			        <h3>Fantech WG13 Wireless Gamepad</h3>
			        <p class="price"><span class="discounted">Rs. 5000</span></p>
			    </div>
			</div>
	    </div>
		<jsp:include page="footer.jsp" />
	    <div class="footer-section">
	    </div>
	</body>
</html>