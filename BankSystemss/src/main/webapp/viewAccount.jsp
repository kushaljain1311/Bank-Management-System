<%@ page import="com.BS.BankSystemss.Data" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 0;
        }
        header {
            background: #2c3e50;
            color: #ecf0f1;
            padding: 20px;
            border-bottom: 4px solid #3498db;
        }
        header h1 {
            margin: 0;
            font-size: 24px;
        }
        nav {
            float: right;
            margin-top: 10px;
        }
        nav ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        nav ul li {
            display: inline;
            margin-left: 15px;
        }
        nav ul li a {
            color: #ecf0f1;
            text-decoration: none;
            font-size: 16px;
        }
        nav ul li a:hover {
            text-decoration: underline;
        }
        .container {
            width: 90%;
            margin: 20px auto;
            overflow: hidden;
        }
        .account-details {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .account-details h1 {
            margin: 0 0 20px;
            font-size: 22px;
            color: #2c3e50;
        }
        .account-details p {
            font-size: 16px;
            color: #7f8c8d;
            margin: 10px 0;
        }
        footer {
            background: #2c3e50;
            color: #ecf0f1;
            text-align: center;
            padding: 15px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <h1>Bank Management System</h1>
            <nav>
                <ul>
                    <li><a href="dashboard.jsp">Dashboard</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <div class="container">
        <div class="account-details">
            <h1>Account Details</h1>
            <%
                if (session != null && session.getAttribute("user") != null) {
                    Data user = (Data) session.getAttribute("user");
            %>
            <p><strong>First Name:</strong> <%= user.getFname() %></p>
            <p><strong>Last Name:</strong> <%= user.getLname() %></p>
            <p><strong>Email:</strong> <%= user.getEmail() %></p>
            <p><strong>Account Balance:</strong> <%= user.getBalance() %></p>
            <p><strong>Account Number:</strong> <%= user.getAccountNumber() %></p>
            <% 
                } else {
                    response.sendRedirect("login.jsp");
                }
            %>
        </div>
    </div>
    <footer>
        <p>&copy; 2024 Bank Management System. All rights reserved.</p>
    </footer>
</body>
</html>
