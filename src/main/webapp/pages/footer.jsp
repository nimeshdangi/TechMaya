<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>

<%
    // Get the session and request objects
    HttpSession userSession = request.getSession();
    String currentUser = (String) userSession.getAttribute("username");
    String contextPath = request.getContextPath();
%>


<link rel="stylesheet" type="text/css"
	href="/TechMaya/stylesheets/footer.css" />
<div class="footer-section">
	<section class="contact" id="contact">
		<div class="container">
		<div class="row flex">
			<div class="col information">
				<div class="contact-details">
					<h3>Contact Us:</h3>
					<p><i class="fa-solid fa-location-dot"></i>KamalPokhari,Kathmandu, Nepal</p>
					<p><i class="fas fa-envelope"><a href="mailto:techmayaecom@gmail.com"></i>Techmaya@gmail.com</a></p>
					<p><i class="fas fa-phone"></i>+977-9841123456</p>
					<p><i class="fas fa-clock"></i>Monday - Friday: 10:00 AM - 4:00 PM</p>
					<p><i class="fas fa-clock"></i>Saturday - Sunday: Closed</p>
					<p><i class="fas fa-globe"><a href="https://techmaya.spacewolf.uk"></i>techmaya.spacewolf.uk</a></p>

				</div>
			</div>

			<div class="col form">
			    <form action="https://api.web3forms.com/submit" method="POST">
			        <input type="hidden" name="access_key" value="04fea0d6-c5b0-4554-a6d3-d1cbce49d6a1">
			        <input type="text" name="name" placeholder="Name" required>
			        <input type="email" name="email" placeholder="Email" required>
			        <textarea name="message" placeholder="Message*" required></textarea>
			        <button id="submit" type="submit">Send Message</button>
			    </form>
			</div>

		</div>
		</div>
	</section>

	<!--Contact Ends-->

 	<!--Footer Starts-->
	<footer class="footer">
		<div class="container">
			<span>Copyright © 2024 All Rights Reserved Home Contact</span>
		</div>
	</footer>
	<!-- Footer Ends-->
</div>