<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.BS.BankSystemss.DAO" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Withdraw Action</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .message-container {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 80%;
            max-width: 500px;
        }
        .message {
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        .message h3 {
            margin: 0;
            color: #2c3e50;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
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
<body>
    <div class="message-container">
        <%
            String accountNumberStr = request.getParameter("accountNumber");
            String amountStr = request.getParameter("amount");

            try {
                Integer accountNumber = Integer.parseInt(accountNumberStr);
                long amount = Long.parseLong(amountStr);

                DAO.withdraw(accountNumber, amount);
        %>
                <div class="message success">
                    <h3>Withdrawal Successful</h3>
                    <p>Your withdrawal of <%= amount %> from account number <%= accountNumber %> was successful.</p>
                </div>
        <%
            } catch (NumberFormatException e) {
        %>
                <div class="message error">
                    <h3>Invalid Input</h3>
                    <p>Error: Invalid input. Please enter valid numbers.</p>
                </div>
        <%
                e.printStackTrace();
            } catch (RuntimeException e) {
        %>
                <div class="message error">
                    <h3>Error</h3>
                    <p>Error: <%= e.getMessage() %></p>
                </div>
        <%
                e.printStackTrace();
            } catch (Exception e) {
        %>
                <div class="message error">
                    <h3>Error</h3>
                    <p>Error: <%= e.getMessage() %></p>
                </div>
        <%
                e.printStackTrace();
            }
        %>
        <a href="dashboard.jsp">Go to Dashboard</a>
    </div>
</body>
</html>
