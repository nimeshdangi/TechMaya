<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>
<link rel="stylesheet" type="text/css" href="/TechMaya/stylesheets/user_profile.css"/>

</head>
<body>
<jsp:include page="header.jsp" />
<div class="profile-container">
  <div class="menu">
    <div class="menu-item"><i class="icon-personal-info"></i>Personal Info</div>
    <div class="menu-item"><i class="icon-change-password"></i>Change Password</div>
    <div class="menu-item"><i class="icon-my-orders"></i><a href="/TechMaya/ProfileOrdersServlet">My Orders</a></div>
  </div>
  <div class="user-info">
    <div class="profile-picture">
      <!-- Replace 'profile.jpg' with the path to your profile image -->
      <img src="/TechMaya/resources/images/users/${user.uid}.png" alt="Profile Picture">
    </div>
    <h2>User Information</h2>
    <p><strong>First Name:</strong> ${user.firstName}</p>
    <p><strong>Last Name:</strong> ${user.lastName}</p>
    <p><strong>Email:</strong> ${user.email}</p>
    <p><strong>Address:</strong> ${user.address}</p>
    <p><strong>Phone number:</strong> ${user.phoneNumber}</p>
    <form action="/TechMaya/UpdateProfileServlet">
    <button class="edit-button">Edit Profile</button>
    </form>
  </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
