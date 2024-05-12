<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
  <link rel="stylesheet" href="styles.css">
</head>
<style>
body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 20px;
  background-color: #f4f4f4;
}

.container {
  max-width: 600px;
  margin: 0 auto;
  background-color: #ffffff;
  padding: 40px;
  border-radius: 15px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
  text-align: center;
  margin-top: 0;
}

.form-group {
  margin-bottom: 20px;
}

label {
  display: block;
  font-weight: bold;
  margin-bottom: 5px;
}

input[type="text"],
input[type="email"],
input[type="tel"],
textarea {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  font-size: 16px;
}

textarea {
  height: 40px;
}



button[type="submit"] {
  display: block;
  width: 100%;
  padding: 10px;
  background-color: #4CAF50;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 16px;
  transition: background-color 0.3s ease;
}

button[type="submit"]:hover {
  background-color: #45a049;
}
</style>
<body>
  <div class="container">
    <h1>Edit Profile</h1>
    <form method="post" action="/TechMaya/UpdateProfileServlet" enctype="multipart/form-data">
      <div class="form-group">
        <label for="firstName">First Name:</label>
        <input type="text" id="firstName" name="firstName" value="${ user.firstName}">
      </div>
      <div class="form-group">
        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" name="lastName" value="${ user.lastName}">
      </div>
      <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="${ user.email}">
      </div>
      <div class="form-group">
        <label for="address">Address:</label>
        <textarea id="address" name="address">${ user.address}</textarea>
      </div>
      <div class="form-group">
        <label for="phoneNumber">Phone Number:</label>
        <input type="tel" id="phoneNumber" name="phoneNumber" value="${ user.phoneNumber}">
      </div>
      <div class="form-group">
        <label for="profilePhoto">Profile Photo:</label>
        <div class="photo-container">
          <img src="/TechMaya/resources/images/users/${user.uid}.png" alt="Profile Photo" id="profilePhoto">
          <label class="photo-upload">
            <i class="fa fa-camera"></i> Upload Photo
          </label>
          <input type="file" id="photoUpload" name="photoUpload" accept="image/*"/>
        </div>
      </div>
      <button>Save Changes</button>
    </form>
  </div>
</body>
</html>