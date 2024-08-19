<%@ page import="com.BS.BankSystemss.Data" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Dashboard</title>
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
        .dashboard {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .dashboard h1 {
            margin: 0 0 20px;
            font-size: 22px;
            color: #2c3e50;
        }
        .dashboard h2 {
            margin: 20px 0;
            font-size: 18px;
            color: #34495e;
        }
        .dashboard p {
            font-size: 16px;
            color: #7f8c8d;
        }
        .feature-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 10px;
        }
        .feature-container a {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 15px;
            background: #3498db;
            color: #fff;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            transition: background 0.3s, transform 0.3s;
            width: 200px;
            height: 100px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .feature-container a:hover {
            background: #2980b9;
            transform: translateY(-2px);
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
                    <li><a href="logout.jsp">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <div class="container">
        <div class="dashboard">
            <%
                Data user = (Data) session.getAttribute("user");
                if (user != null) {
            %>
                <h1>Welcome, <%= user.getFname() %> <%= user.getLname() %>!</h1>
                <h2>Account Summary</h2>
                <p>Account Balance: <%= user.getBalance() %></p>
                <div class="feature-container">
                    <a href="viewAccount.jsp">View Account Details</a>
                    <a href="updateAccount.jsp">Update Personal Information</a>
                    <a href="Deposit.jsp">Deposit Money</a>
                    <a href="withdraw.jsp">Withdraw Money</a>
                    <a href="transfer.jsp">Transfer Money</a>
                    <a href="viewTransactions.jsp">View Transaction History</a>
                    <a href="applyLoan.jsp">Apply for Loan</a>
                    <a href="viewLoan.jsp">View Loan Status</a>
                </div>
            <%
                } else {
            %>
                <h1>Error</h1>
                <p>You are not logged in. Please <a href="logout.jsp">log in</a> to access your dashboard.</p>
            <%
                }
            %>
        </div>
    </div>
  
</body>
</html>
