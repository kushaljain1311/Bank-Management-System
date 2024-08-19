<%@ page import="com.BS.BankSystemss.Data" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Account Information</title>
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
        .update-form {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .update-form h1 {
            margin: 0 0 20px;
            font-size: 22px;
            color: #2c3e50;
        }
        .update-form label {
            display: block;
            font-size: 16px;
            color: #34495e;
            margin: 10px 0 5px;
        }
        .update-form input[type="text"],
        .update-form input[type="email"],
        .update-form input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .update-form input[type="submit"] {
            padding: 15px 20px;
            background: #3498db;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .update-form input[type="submit"]:hover {
            background: #2980b9;
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
        <div class="update-form">
            <h1>Update Personal Information</h1>
            <%
                if (session != null && session.getAttribute("user") != null) {
                    Data user = (Data) session.getAttribute("user");
            %>
            <form action="updateAction.jsp" method="post">
                <label for="fname">First Name</label>
                <input type="text" id="fname" name="fname" value="<%= user.getFname() %>" required>
                
                <label for="lname">Last Name</label>
                <input type="text" id="lname" name="lname" value="<%= user.getLname() %>" required>
                
                <label for="email">Email</label>
                <input type="email" id="email" name="email" value="<%= user.getEmail() %>" required>
                
                <label for="password">Password</label>
                <input type="password" id="password" name="password" value="<%= user.getPassword() %>" required>
                
                <input type="submit" value="Update Information">
            </form>
            <% 
                } else {
                    response.sendRedirect("login.jsp");
                }
            %>
        </div>
    </div>

</body>
</html>
