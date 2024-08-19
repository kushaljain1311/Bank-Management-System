<%@ page import="com.BS.BankSystemss.DAO" %>
<%@ page import="com.BS.BankSystemss.LoanApplication" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Loan Application Result</title>
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
        .message {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 80%;
            max-width: 500px;
        }
        .message h1 {
            color: #2c3e50;
        }
        .message p {
            color: #7f8c8d;
            font-size: 16px;
        }
        .error {
            background-color: #f2dede;
            color: #a94442;
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
    <div class="message">
        <%
            String accountNumberStr = request.getParameter("accountNumber");
            String loanAmountStr = request.getParameter("loanAmount");
            String loanType = request.getParameter("loanType");
            String description = request.getParameter("description");

            try {
                int accountNumber = Integer.parseInt(accountNumberStr);
                double loanAmount = Double.parseDouble(loanAmountStr);

                // Create a new LoanApplication object
                LoanApplication loanApplication = new LoanApplication(accountNumber, loanAmount, loanType, description, "Pending");

                // Save the loan application using DAO
                DAO.saveLoanApplication(loanApplication);
        %>
                <h1>Loan Application Submitted Successfully</h1>
                <p>Your loan application for <%= loanAmount %> with account number <%= accountNumber %> has been submitted successfully. The status of your application is <strong>Pending</strong>.</p>
        <%
            } catch (NumberFormatException e) {
        %>
                <div class="error">
                    <h1>Invalid Input</h1>
                    <p>Error: Invalid input. Please enter valid numbers for loan amount and account number.</p>
                </div>
        <%
                e.printStackTrace();
            } catch (NullPointerException e) {
        %>
                <div class="error">
                    <h1>Missing Information</h1>
                    <p>Error: Required form parameters are missing. Please try again.</p>
                </div>
        <%
                e.printStackTrace();
            } catch (Exception e) {
        %>
                <div class="error">
                    <h1>Error</h1>
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
