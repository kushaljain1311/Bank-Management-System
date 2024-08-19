<%@ page import="com.BS.BankSystemss.DAO" %>
<%@ page import="com.BS.BankSystemss.Data" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transfer Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #2c3e50;
        }
        p {
            color: #7f8c8d;
        }
        a, button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            transition: background 0.3s, transform 0.3s;
        }
        a {
            background: #3498db;
            color: #fff;
        }
        a:hover {
            background: #2980b9;
            transform: translateY(-2px);
        }
        button {
            background: #e74c3c;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background: #c0392b;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            String senderAccountNumberStr = request.getParameter("senderAccountNumber");
            String receiverAccountNumberStr = request.getParameter("receiverAccountNumber");
            String amountStr = request.getParameter("amount");

            boolean transferSuccessful = false;

            try {
                // Parse parameters
                Integer senderAccountNumber = Integer.parseInt(senderAccountNumberStr);
                Integer receiverAccountNumber = Integer.parseInt(receiverAccountNumberStr);
                long amount = Long.parseLong(amountStr);

                // Perform the transfer
                DAO.transfer(senderAccountNumber, receiverAccountNumber, amount);
                transferSuccessful = true;
        %>
                <h1><%= transferSuccessful ? "Transfer Successful" : "Transfer Failed" %></h1>
                <p><%= transferSuccessful ? 
                    "Your transfer of " + amount + " from account number " + senderAccountNumber + " to account number " + receiverAccountNumber + " was successful." : 
                    "Transfer failed. Please check the details and try again." %></p>
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
        <button onclick="window.history.back()">Go Back</button>
        <a href="dashboard.jsp">Go to Dashboard</a>
    </div>
</body>
</html>
