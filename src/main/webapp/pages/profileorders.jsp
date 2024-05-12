<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="utils.StringUtils" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders</title>
<style>
        /* Existing CSS */
        body {
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 0;
        }

        .profile-container {
            display: flex;
            max-width: 1100px;
            margin: 50px auto;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            height: 500px;
        }

        .menu {
            width: 250px;
            border-right: 1px solid #e7e7e7;
        }

        .menu-item {
            display: flex;
            align-items: center;
            padding: 10px 20px;
            color: #333;
            text-decoration: none;
            border-bottom: 1px solid #e7e7e7;
        }

        .menu-item:hover,
        .menu-item.active {
            background-color: #007bff;
            color: #fff;
        }

        .menu-item i {
            margin-right: 10px;
        }
        
        .content {
    	padding: 20px;
    	flex-grow: 1;
		}

        /* New CSS for order table */
        .order-table {
            width: 100%;
            border-collapse: collapse;
        }

        .order-table th,
        .order-table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .order-table th {
            background-color: #f2f2f2;
        }

        .order-table img {
            max-width: 50px;
            max-height: 50px;
        }
        
        
    </style>
</head>
<body>
    <div class="profile-container">
        <div class="menu">
            <div class="menu-item"><i class="icon-personal-info"></i><a href="/TechMaya/ProfileServlet">Personal Info</a></div>
            <div class="menu-item"><i class="icon-change-password"></i>Change Password</div>
            <div class="menu-item active"><i class="icon-my-orders"></i>My Orders</div>
        </div>
        <div class="content">
        	<c:forEach var="order" items="${orders}">
        		<div>
        		ID: ${order.uid}        Date: ${order.date}        Status: ${order.status}
        		</div>
        		<table class="order-table">
                <thead>
                    <tr>
                        <th>Product Name</th>
                        <th>Image</th>
                        <th>Quantity</th>
                        <th>Total</th>

                    </tr>
                </thead>
                <tbody>
                <c:forEach var="orderProduct" items="${order.orderProducts}">
                	<tr>
                        <td>${orderProduct.name }</td>
                        <td><img src="/TechMaya/resources/images/products/${orderProduct.uid}.png"/></td>
                        <td>${orderProduct.quantity}</td>
                        <td>${orderProduct.total}</td>

                    </tr>
                </c:forEach>
                <tr>
                	<td>Grand Total </td>
                	<td>${order.grandTotal }
                </tr>
                </tbody>
                </table>
        	</c:forEach>
        </div>
    </div>
</body>
</html>