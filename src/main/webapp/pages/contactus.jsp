<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
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


/* Contact Hero Section Styles */
.contact-hero {
    background-image: url('https://source.unsplash.com/random/1200x600');
    background-size: cover;
    background-position: center;
    height: 400px;
    display: flex;
    justify-content: center;
    align-items: center;
    color: #fff;
    text-align: center;
}

.contact-content h1 {
    font-size: 36px;
    margin-bottom: 20px;
}

/* Contact Form Section Styles */
.contact-form {
    padding: 40px;
}

.form-container {
    max-width: 600px;
    margin: 0 auto;
}

.form-group {
    margin-bottom: 20px;
}

label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

input,
textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

textarea{
	height: 100px;
}

button {
    background-color: #333;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #555;
}
</style>

<body>
<jsp:include page="header.jsp" />
	<jsp:include page="searchbar.jsp" />
    <main>
    
        <section class="contact-hero">
            <div class="contact-content">
                <h1>Get in Touch</h1>
                <p>Have a question or need assistance? Our friendly team is here to help.</p>
            </div>
        </section>

        <section class="contact-form">
            <div class="form-container">
                <h2>Contact Us</h2>
                <form action="/TechMaya/ContactUsServlet" method="post">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" id="name" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="message">Message</label>
                        <textarea id="message" name="message" required></textarea>
                    </div>
                    <button type="submit">Send Message</button>
                </form>
            </div>
        </section>
    </main>
</body>
</html>