<%@ page import="com.BS.BankSystemss.DAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Apply for Loan</title>
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
        label {
            display: block;
            margin: 10px 0 5px;
        }
        input, select, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        button {
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Apply for Loan</h1>
        <form action="applyLoanAction.jsp" method="post">
            <label for="accountNumber">Account Number:</label>
            <input type="number" id="accountNumber" name="accountNumber" required min="1">
            
            <label for="loanAmount">Loan Amount:</label>
            <input type="number" id="loanAmount" name="loanAmount" required min="1">
            
            <label for="loanType">Loan Type:</label>
            <select id="loanType" name="loanType" required>
                <option value="">Select Loan Type</option>
                <option value="Personal">Personal</option>
                <option value="Home">Home</option>
                <option value="Auto">Auto</option>
            </select>
            
            <label for="description">Description:</label>
            <textarea id="description" name="description" rows="4" required></textarea>
            
            <button type="submit">Apply</button>
        </form>
    </div>
</body>
</html>
