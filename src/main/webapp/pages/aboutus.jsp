<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
title>About Us</title>
    <link rel="stylesheet" href="styles.css">
</head>
<style>
/* Reset and General Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
}

/* Header Styles */
header {
    background-color: #333;
    color: #fff;
    padding: 20px;
}

nav {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo a {
    color: #fff;
    text-decoration: none;
    font-size: 24px;
    font-weight: bold;
}

nav ul {
    list-style: none;
    display: flex;
}

nav ul li {
    margin-left: 20px;
}

nav ul li a {
    color: #fff;
    text-decoration: none;
    transition: color 0.3s ease;
}

nav ul li a:hover,
nav ul li a.active {
    color: #ffc107;
}

/* Hero Section Styles */
.hero {
    background-image: url('https://www.shutterstock.com/image-photo/website-page-contact-us-email-600nw-1958537320.jpg');
    background-size: cover;
    background-position: center;
    height: 400px;
    display: flex;
    justify-content: center;
    align-items: center;
    color: #fff;
    text-align: center;
}

.hero-content h1 {
    font-size: 36px;
    margin-bottom: 20px;
}

/* About Content Section Styles */
.about-content {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 40px;
}

.about-text {
    flex: 1;
    margin-right: 40px;
}

.about-image img {
    max-width: 50%;
    height: auto;
}

/* Mission and Vision Section Styles */
.mission-vision {
    display: flex;
    justify-content: space-around;
    padding: 40px;
    background-color: #f4f4f4;
}

.mission,
.vision {
    text-align: center;
    max-width: 300px;
}

/* Footer Styles */
footer {
    background-color: #333;
    color: #fff;
    padding: 20px;
    text-align: center;
}
</style>

<body>

    <main>
        <section class="hero">
        	
            <div class="hero-content">
                <h1>About Our Company</h1>
                <p>We are dedicated to providing innovative solutions and exceptional service.</p>
            </div>
        </section>

        <section class="about-content">
            <div class="about-text">
                <h2>Our Story</h2>
                <p>At TechMaya, we're passionate about bringing you the latest and greatest in electronic accessories. Our mission is to enhance your digital life with innovative, high-quality products that are both stylish and functional.</p>
				<p>Founded in 2018, TechMaya has quickly become a trusted name in the world of tech accessories. We scour the globe for the best gadgets, gizmos, and gear, curating a collection that caters to the needs of modern tech enthusiasts.</p><br>
				<p>From sleek cases and protective covers to cutting-edge chargers and power banks, our selection is meticulously crafted to complement your devices and elevate your overall user experience. Whether you're an avid gamer, a music lover, or a professional on-the-go, TechMaya has the perfect accessory to suit your lifestyle.</p>
				<p>But we're more than just a retailer – we're a community of tech-savvy individuals who share a love for all things digital. Our team of experts stays ahead of the curve, ensuring that we offer the latest trends and cutting-edge technologies to keep you connected and equipped for any adventure.</p><br>
				<p>Join the TechMaya family and discover a world of innovative accessories that seamlessly blend form and function. Explore our collection and unlock the full potential of your devices today!</p>
            </div>
            
        </section>

        <section class="mission-vision">
            <div class="mission">
                <h3>Our Mission</h3>
                <p>To empower people and businesses with innovative solutions that revolutionize industries and create lasting value.</p>
            </div>
            <div class="vision">
                <h3>Our Vision</h3>
                <p>To be a global leader in technological advancement, setting new standards and shaping the future.</p>
            </div>
        </section>
    </main>

</body>

</html>