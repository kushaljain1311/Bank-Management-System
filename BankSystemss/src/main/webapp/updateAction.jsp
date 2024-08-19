<%@ page import="com.BS.BankSystemss.DAO" %>
<%@ page import="com.BS.BankSystemss.Data" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Deposit Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 0;
        }
        .message {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 80%;
            margin: 50px auto;
        }
        .message h1 {
            color: #2c3e50;
        }
        .message p {
            color: #7f8c8d;
            font-size: 16px;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background: #3498db;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background 0.3s, transform 0.3s;
        }
        a:hover {
            background: #2980b9;
            transform: translateY(-2px);
        }
    </style>
</head>
<center>
<body>

    <div class="message">
        <%
            String accountNumberStr = request.getParameter("accountNumber");
            String amountStr = request.getParameter("amount");

            try {
                Integer accountNumber = Integer.parseInt(accountNumberStr);
                long amount = Long.parseLong(amountStr);

                DAO.deposit(accountNumber, amount);
        %>
                <h1>Deposit Successful</h1>
                <p>Your deposit of <%= amount %> to account number <%= accountNumber %> was successful.</p>
        <%
            } catch (NumberFormatException e) {
        %>
                <h1>Invalid Input</h1>
                <p>Error: Invalid input. Please enter valid numbers.</p>
        <%
                e.printStackTrace();
            } catch (Exception e) {
        %>
                <h1>Error</h1>
                <p>Error: <%= e.getMessage() %></p>
        <%
                e.printStackTrace();
            }
        %>
        <a href="dashboard.jsp">Go to Dashboard</a>
    </div>
</center>    
</body>
</html>
